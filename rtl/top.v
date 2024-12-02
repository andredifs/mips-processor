module top(
    input  wire        clk, reset,
    output wire [31:0] writedata, dataadr,
    output wire        memwrite
);
    wire [31:0] pc, instr, readdata;

    // Processador MIPS
    mips mips(
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .memwrite(memwrite),
        .aluout(dataadr),
        .writedata(writedata),
        .readdata(readdata)
    );

    // Memória de instruções
    imem imem(
        .a(pc[7:2]),
        .rd(instr)
    );

    // Memória de dados
    dmem dmem(
        .clk(clk),
        .we(memwrite),
        .a(dataadr[7:2]),
        .wd(writedata),
        .rd(readdata)
    );

endmodule 