///////////////////////////////////////////////////////////////////////////////////////////////////
//
//       MODULE: top_level
//  DESCRIPTION: top level module for dadda multiplier 
//   IO SIGNALS: ---
//       AUTHOR: YOUR NAME (), 
// ORGANIZATION: 
//      VERSION: 1.0
//      CREATED: Sunday 11 November 2018 03:39:59  IST
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ps/100fs
module top_level(
	input [7:0] A,
	input [7:0] B,
	input [15:0] M,
	output [16:0] RES);
	
	genvar i;
	wire [7:0] P [7:0] ;
	wire [1:0] PRE[15:0];
	gen_part_products U1(A,B,P);
	
	processing_block U2(P,M,PRE);

	adder16 U3(PRE[1],PRE[0],1'b0,RES);
endmodule
