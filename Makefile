VERILOG = iverilog
SIM = vvp
WAVE = gtkwave

YOSYS = yosys
NEXTPNR = nextpnr-ice40
ICEPACK = icepack

PROJ = mips_processor
DEVICE = up5k
PACKAGE = sg48
FREQ = 12

SIM_SRCS = rtl/*.v testbench/tb_mips.v
SYNTH_SRCS = rtl/*.v rtl/fpga_top.v

ICELINK_DIR=$(shell df | grep iCELink | awk '{print $$6}')

sim: compile simulate

compile:
	$(VERILOG) -o sim.vvp $(SIM_SRCS)

simulate:
	$(SIM) sim.vvp

wave:
	$(WAVE) wave.vcd

synth: $(PROJ).bin

$(PROJ).json:
	$(YOSYS) -p "synth_ice40 -top fpga_top -json $@" $(SYNTH_SRCS)

$(PROJ).asc: $(PROJ).json $(PROJ).pcf
	$(NEXTPNR) --$(DEVICE) --package $(PACKAGE) --json $< --pcf $(PROJ).pcf --asc $@ --freq $(FREQ)

$(PROJ).bin: $(PROJ).asc
	$(ICEPACK) $< $@

prog:
	@if [ -d '$(ICELINK_DIR)' ]; \
        then \
            cp $(PROJ).bin $(ICELINK_DIR); \
        else \
            echo "iCELink não encontrado"; \
            exit 1; \
    fi

clean:
	rm -f sim.vvp *.vcd *.json *.asc *.bin *.blif

.PHONY: all sim compile simulate wave synth prog clean