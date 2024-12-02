module alu(
    input  wire [31:0] a, b,
    input  wire [2:0]  alucontrol,
    output reg  [31:0] result,
    output wire        zero
);

    always @(*) begin
        case(alucontrol)
            3'b000: result = a & b;    // AND
            3'b001: result = a | b;    // OR
            3'b010: result = a + b;    // ADD
            3'b110: result = a - b;    // SUB
            3'b111: result = (a < b) ? 32'b1 : 32'b0; // SLT
            default: result = 32'bx;   // X
        endcase
    end

    assign zero = (result == 32'b0);

endmodule 