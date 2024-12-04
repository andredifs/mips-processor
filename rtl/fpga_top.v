module fpga_top (
    input  wire       clk,
    input  wire       reset,
    output wire [3:0] led,
    output wire       debug_memwrite,
    output wire       debug_zero
);

    // Sinais internos
    wire [31:0] writedata, dataadr;
    wire        memwrite;
    wire [31:0] pc, instr;
    wire        zero;

    // Instancia o módulo top do MIPS
    top mips_top (
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .dataadr(dataadr),
        .memwrite(memwrite)
    );

    // Mapeia sinais para debug
    assign led[0] = memwrite;
    assign led[1] = |dataadr[31:24];    // MSB do endereço
    assign led[2] = |writedata[31:24];   // MSB do dado
    assign led[3] = zero;                // Flag zero da ALU

    // Sinais extras de debug
    assign debug_memwrite = memwrite;
    assign debug_zero = zero;

endmodule 