// From book

module sl2(
    input  wire [31:0] a,
    output wire [31:0] y
);

    // shift left by 2
    assign y = {a[29:0], 2'b00};

endmodule 