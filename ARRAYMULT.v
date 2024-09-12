`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:52 01/30/2020 
// Design Name: 
// Module Name:    ARRAYMULT 
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

////////////////////////
module HYBRID_MULT(A,B,P);
parameter N=16;
input  [N-1:0]A,B;
output [N+N-1:0]P;

wire [N-1:0]T[0:N-1];
wire [N-1:0]sum1[0:N-1];
wire [N-1:0]cout1;

  genvar i,j;	
  generate
  for(j=0;j<=N-1;j=j+1)
   for(i=0;i<=N-1;i=i+1)
   begin: AND_GATES
	  assign T[j][i]=A[i]&B[j];
   end
  endgenerate
	
M41HA_NBIT #(N) R1({1'b0,T[0][N-1:1]},T[1],1'b0,sum1[0],cout1[0]);
	//assign P[1]=sum1[0][0];

  genvar ii;
  generate
  for(ii=0;ii<=N-3;ii=ii+1)
  begin
   M41HA_NBIT #(N) R2({cout1[ii],sum1[ii][N-1:1]},T[ii+2],1'b0,sum1[ii+1],cout1[ii+1]);
	assign P[ii+1]=sum1[ii][0];
  end
  endgenerate


assign P[0]=T[0][0];
assign P[N+N-2:N-1]=sum1[N-2];
assign P[N+N-1]=cout1[N-2];

endmodule
