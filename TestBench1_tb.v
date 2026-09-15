// File Name: TestBench1.v
`timescale 1ns / 1ns
module TestBench1();
	reg [3:3] KEY;	// KEY = 0 --> SW[6:0],KEY = 1 --> SW[16:10]
	reg [17:0] SW;
	wire [6:0] LEDR;
	wire [6:0] HEX0;
	
	wire [6:0] output_F; // variable to store results from output port
	Selector m1 (.A(SW[6:0]), .B(SW[16:10]), .sel(KEY[3]), .F(output_F));

	assign LEDR = output_F;
	assign HEX0 = ~output_F;

	initial begin
		$dumpvars(0, TestBench1);

		KEY = 1'b0; 
		SW[6:0] = 7'b0000000;
		SW[16:10] = 7'b1111111;
		#5;

		KEY = 1'b0; 
		SW[6:0] = 7'b1111111;
		SW[16:10] = 7'b0000000;
		#5;

		KEY = 1'b1; 
		SW[6:0] = 7'b0000000;
		SW[16:10] = 7'b1111111;
		#5;

		KEY = 1'b1; 
		SW[6:0] = 7'b1111111;
		SW[16:10] = 7'b0000000;
		#5;

	end
endmodule // TestBench1