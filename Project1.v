// File Name: Project1.v
module Project1(
	input [3:3] KEY,  // KEY = 0 --> SW[6:0], KEY = 1 --> SW[16:10]
	input [17:0] SW,
	output [6:0] LEDR,
	output [6:0] HEX0
	);
	
	wire [6:0] output_F; // variable to store results from output port
	Selector m1 (.A(SW[16:10]), .B(SW[6:0]), .sel(KEY[3]), .F(output_F));

	assign LEDR = output_F;
	assign HEX0 = ~output_F;

endmodule // Project1