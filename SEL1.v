// Single-bit SEL module
module SEL1(s, a, b, f);
	input s;					// Selector control input
	input a, b;			// Selector data inputs
	output f;				// Selector data output
	
	wire not_a;
	wire not_b;
	wire not_s;
	wire and_mid1;
	wire and_mid2;
	wire and_mid3;
	wire and_sel1;
	wire and_sel2;
	wire or_1;
	wire or_2;

	not Na(not_a, a);
	not Nb(not_b, b);
	not Ns(not_s, s);

	and and1(and_mid1, not_a, b);
	and and2(and_mid2, not_b, a);
	and and3(and_mid3, a, b);
	or or1(or_1, and_mid3, and_mid1);
	or or2(or_2, and_mid3, and_mid2);
	and and_final1(and_sel1, or_1, not_s);
	and and_final2(and_sel2, or_2, s);
	or or_final(f, and_sel1, and_sel2);

	//assign f = (~s & ((a & b) | (a & ~b))) | (s & (~a & b) | (a & b));

endmodule // SEL1