`timescale 1ps/100fs
module CSA_block #(parameter width = 4)(
	input [width -1:0]A,
	input [width -1:0]B,
	output[1:0][width -1:0]SUM,
	output[1:0]c_out);

	genvar i;
	wire [1:0][width - 1:0]carry_out;
	full_adder fa0(A[0],B[0],1'b0,SUM[0][0],carry_out[0][0]);
	full_adder fa1(A[0],B[0],1'b1,SUM[1][0],carry_out[1][0]);
	generate
		for (i = 1; i < width -1 ; i = i + 1) begin:gen_CSA_block
			full_adder fa_carry_out_zero(A[i],B[i],carry_out[0][i-1],SUM[0][i],carry_out[0][i]);
			full_adder fa_carry_out_one(A[i],B[i],carry_out[1][i-1],SUM[1][i],carry_out[1][i]);
		end
	endgenerate
	
	full_adder fa_carry_out_zero_last(A[width-1],B[width-1],carry_out[0][width-2],SUM[0][width-1],c_out[0]);
	full_adder fa_carry_out_one_last(A[width-1],B[width-1],carry_out[1][width-2],SUM[1][width-1],c_out[1]);
endmodule

module selector #(parameter width = 4)(
	input [1:0][width -1:0]SUM,
	input [1:0]c_out,
	input c_in,
	output [width -1:0]SUM_OUT,
	output CARRY_OUT);


	genvar i;
	
	assign SUM_OUT = c_in?SUM[1]:SUM[0];
	assign CARRY_OUT = c_in?c_out[1]:c_out[0];
endmodule

module adder16(
	input [15:0]A,
	input [15:0]B,
	input c_in,
	output [16:0]SUM);

	wire [2:0][1:0] block_carry_out;
	wire [1:0][3:0] sum_block1;
	wire [1:0][4:0] sum_block2;
	wire [1:0][5:0] sum_block3;
	wire [3:0]cout_inter;
	wire cout_0; 
	//carry select adder is implemented in stages of 1 , 4 , 5 , 6
	full_adder fa0_in16(A[0],B[0],c_in,SUM[0],cout_0);
	CSA_block #(.width(4)) block_1(A[4:1],B[4:1],sum_block1,block_carry_out[0]);
	CSA_block #(.width(5)) block_2(A[9:5],B[9:5],sum_block2,block_carry_out[1]);
	CSA_block #(.width(6)) block_3(A[15:10],B[15:10],sum_block3,block_carry_out[2]);

	
	selector #(.width(4)) sel0(sum_block1,block_carry_out[0],cout_0,SUM[4:1],cout_inter[0]);
	selector #(.width(5)) sel1(sum_block2,block_carry_out[1],cout_inter[0],SUM[9:5],cout_inter[1]);
	selector #(.width(6)) sel2(sum_block3,block_carry_out[2],cout_inter[1],SUM[15:10],SUM[16]);
	

endmodule
