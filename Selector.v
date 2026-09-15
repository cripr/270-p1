// File Name: Selector.v
// Implements a 2-to-1 7-bit MUX
module Selector(
	input sel,            // Selector control input
	input [6:0] A, B,  // Selector data inputs
	output [6:0] F		  // Selector data outputs
	);
	
	SEL1 m0 [6:0] (.s(sel), .a(A), .b(B), .f(F));

endmodule // Selector