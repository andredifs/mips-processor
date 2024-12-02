// From book

module maindec(
    input  wire [5:0] op,
    output reg        memtoreg, memwrite,
    output reg        branch, alusrc,
    output reg        regdst, regwrite,
    output reg        jump,
    output reg [1:0]  aluop
);

    reg [8:0] controls;

    always @(*) begin
        case(op)
            6'b000000: controls = 9'b110000010; // RTYPE
            6'b100011: controls = 9'b101001000; // LW
            6'b101011: controls = 9'b001010000; // SW
            6'b000100: controls = 9'b000100001; // BEQ
            6'b001000: controls = 9'b101000000; // ADDI
            6'b000010: controls = 9'b000000100; // J
            default:   controls = 9'bxxxxxxxxx; // illegal op
        endcase

        // Decodifica o campo controls
        {regwrite, regdst, alusrc, branch, memwrite,
         memtoreg, jump, aluop} = controls;
    end

endmodule 