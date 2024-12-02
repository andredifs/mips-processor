// From book

module dmem (
    input wire clk,
    input wire we,
    input wire [5:0] a,
    input wire [31:0] wd,
    output wire [31:0] rd
);

    reg [31:0] RAM[63:0];

    assign rd = RAM[a];

    always @(posedge clk)
        if (we) RAM[a] <= wd;

endmodule 