`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:23 01/30/2020 
// Design Name: 
// Module Name:    fa 
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
module mux41(a,b,c,d,s0,s1,out);
input a,b,c,d,s0,s1;
output reg out;

always@(*)
begin
case({s0,s1})
2'b00: out = a;
2'b01: out = b;
2'b10: out = c;
2'b11: out = d;
endcase
end
endmodule
//////////////////

module M41FA(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
mux41 M1(cin,~cin,~cin,cin,a,b,s);
mux41 M2(1'b0,cin,cin,1'b1,a,b,cout);
endmodule
/////////////////////////////

module M41HA_NBIT(a,b,cin,sum,cout);
parameter N=32;
input [N-1:0] a,b;
input  cin;
output [N-1:0] sum;
output cout;
wire [N:0] C;
	
	assign C[0]=cin;
	assign cout=C[N];
	genvar i;
	
   generate 
   for(i=0;i<=N-1;i=i+1)
     begin: aa
       M41FA b1(a[i],b[i],C[i],sum[i],C[i+1]);
     end
   endgenerate

endmodule 

