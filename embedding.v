`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:25 02/23/2023 
// Design Name: 
// Module Name:    embedding 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//module embedding(LL1,LL2,alpha,LLNEW);
//
//input [31:0]LL1,LL2;
//input [31:0]alpha;
//output [31:0]LLNEW;
//
//wire [31:0] P;
//
//assign LLNEW=LL1+ alpha*LL2;
//
//
//endmodule


//////////////
module embeddening(LL1,LL2,alpha,out);
parameter N=32;

input  [N-1:0]LL1,LL2,alpha;
output [N+N-1:0]out;
 wire [N+N-1:0]P;

HYBRID_MULT #(N)   M1(LL2,alpha,P);
M41HA_NBIT #(N+N)  M2({16'b0,LL1},P,1'b0,out,cout);

endmodule
