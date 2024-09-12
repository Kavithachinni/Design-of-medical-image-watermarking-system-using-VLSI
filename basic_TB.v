`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:32 01/30/2020
// Design Name:   ARRAY_MULT
// Module Name:   C:/Users/VAMSHI/Downloads/New folder/AAA/ARRAY_MULT_TB.v
// Project Name:  AAA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ARRAY_MULT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module EMBEDDING_TB;
parameter N=16;

	// Inputs
	reg [N-1:0] LL1,LL2;
	reg [N-1:0] alpha;

	// Outputs
	wire [N+N-1:0] out;

embeddening UUT(LL1,LL2,alpha,out);


	initial begin
		repeat(20)
		begin
		LL1 = {$random}%10;
		LL2 = {$random}%10;
		alpha = {$random}%10;
				#20;
end
end
		// Wait 100 ns for global reset to finish

endmodule
////////////////////////////////////////////////////////////////////////////////
module MULT_TB;
parameter N=16;

	// Inputs
	reg [N-1:0] A;
	reg [N-1:0] B;

	// Outputs
	wire [N+N-1:0] P;

	// Instantiate the Unit Under Test (UUT)
	HYBRID_MULT uut (
		.A(A), 
		.B(B), 
		.P(P)
	);

	initial begin
		repeat(20)
		begin
		A = $random;
		B = $random;
#20;
end
		// Wait 100 ns for global reset to finish
#20 $finish;
        
		// Add stimulus here

	end
      
endmodule

module Adder_tb;

parameter N=32;
reg [N-1:0] a,b;
reg  cin;
wire [N-1:0] sum;
wire cout;


 M41HA_NBIT UUT(a,b,cin,sum,cout);

initial 
begin
		repeat(20)
		begin
		a = $random;
		b = $random;
		cin = $random;

#20;
end
		// Wait 100 ns for global reset to finish
#20 $finish;
        
		// Add stimulus here

	end
      
endmodule

