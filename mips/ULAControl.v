module ULAControl(
	input clk,
	input [0:1] OpALU,
	input [0:5] funct,
	output reg [0:3] inputALU
);

always @(posedge clk, funct) begin
	if(OpALU == 2'b00)
		inputALU <= 4'b0010;
	if(OpALU == 2'b01)
		inputALU <= 4'b0110;
	if(OpALU == 2'b10) begin
		if(funct == 6'b100000)
			inputALU <= 4'b0010;
		if(funct == 6'b100010)
			inputALU <= 4'b0110;
		if(funct == 6'b100100)
			inputALU <= 4'b0000;
		if(funct == 6'b100101)
			inputALU <= 4'b0001;
		if(funct == 6'b101010)
			inputALU <= 4'b0111;
	end
end
	
endmodule