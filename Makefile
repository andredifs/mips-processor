VERILOG = iverilog
SIM = vvp
WAVE = gtkwave

SRCS = rtl/*.v testbench/tb_mips.v
TOP = testbench

all: compile simulate

compile:
	$(VERILOG) -o sim.vvp $(SRCS)

simulate:
	$(SIM) sim.vvp

wave:
	$(WAVE) wave.vcd

clean:
	rm -f sim.vvp *.vcd

.PHONY: all compile simulate wave clean