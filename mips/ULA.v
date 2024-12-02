module ULA (
	input clk,
	input [0:3]  inputULA, 
	input [0:31] a,
	input [0:31] b,
	output reg [0:31] outputULA
);

always @(posedge clk) begin
	if(inputULA == 4'b0010)
		outputULA <= a + b;
	if(inputULA == 4'b0110)
		outputULA <= a - b;
	if(inputULA == 4'b0000)
		outputULA <= a & b;
	if(inputULA == 4'b0001)
		outputULA <= a | b;
	if(inputULA == 4'b0111) begin
		if (a < b)
			outputULA <= 1;
		if (a > b)
			outputULA <= 0;
		if (a == b)
			outputULA <= 0;
	end
end

endmodule