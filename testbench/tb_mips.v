module testbench();
    reg         clk;
    reg         reset;
    wire [31:0] writedata, dataadr;
    wire        memwrite;

    // Instancia o dispositivo a ser testado
    top dut(
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .dataadr(dataadr),
        .memwrite(memwrite)
    );

    // Inicialização do teste
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        reset = 1;
        #22 reset = 0;
    end

    // Geração do clock
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    // Verificação dos resultados
    always @(negedge clk) begin
        if(memwrite) begin
            if(dataadr === 84 & writedata === 7) begin
                $display("Simulação bem sucedida!");
                $stop;
            end else if (dataadr !== 80) begin
                $display("Simulação falhou!");
                $stop;
            end
        end
    end
endmodule
