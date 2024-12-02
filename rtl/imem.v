// From book

module imem (
    input wire [5:0] a,
    output wire [31:0] rd
);

    reg [31:0] RAM[63:0];

    initial
        $readmemh("program/memfile.dat", RAM);

    assign rd = RAM[a];

endmodule 