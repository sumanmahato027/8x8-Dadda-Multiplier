module processing_block(
	input [7:0][7:0] P,
	input [15:0] M,
	output [1:0][15:0] PRE); //pre for pre result
	
	wire [47:0] fs,fc;	//wires for intermediate full adders & carry
	wire [7:0] hs,hc; 	//wires for intermediate half adder & carry

	genvar i; 		//generate variable for use in generate loop

	//for the connections given in the code, refer to the file 
	//"Dadda design.pdf" attached 
	
	//level 1 design	

	half_adder ha0(P[4][1],P[5][0],hs[0],hc[0]);
	
	half_adder ha1(P[2][4],P[3][3],hs[1],hc[1]);
	full_adder fa0(P[4][2],P[5][1],P[6][0],fs[0],fc[0]);

	full_adder fa2(P[5][2],P[6][1],P[7][0],fs[2],fc[2]);
	full_adder fa1(P[2][5],P[3][4],P[4][3],fs[1],fc[1]);
	half_adder ha2(P[0][7],P[1][6],hs[2],hc[2]);
	
	full_adder fa4(P[5][3],P[6][2],P[7][1],fs[4],fc[4]);
	full_adder fa3(P[2][6],P[3][5],P[4][4],fs[3],fc[3]);
	half_adder ha3(M[8],P[1][7],hs[3],hc[3]);
	
	
	full_adder fa6(P[5][4],P[6][3],P[7][2],fs[6],fc[6]);
	full_adder fa5(P[2][7],P[3][6],P[4][5],fs[5],fc[5]);
	
	full_adder fa7(P[5][5],P[6][4],P[7][3],fs[7],fc[7]);

	//level 2 adders
	half_adder ha4(P[3][0],P[2][1],hs[4],hc[4]);
	
	half_adder ha5(P[0][4],P[1][3],hs[5],hc[5]);
	full_adder fa8(P[2][2],P[3][1],P[4][0],fs[8],fc[8]);

	full_adder fa9(hs[0],P[0][05],P[1][4],fs[9],fc[9]);
	full_adder fa10(P[2][3],P[3][2],M[5],fs[10],fc[10]);

	full_adder fa11(fs[0],hc[0],hs[1],fs[11],fc[11]);
	full_adder fa12(P[0][6],M[6],P[1][5],fs[12],fc[12]);

	full_adder fa13(fs[1],fc[0],fs[2],fs[13],fc[13]);
	full_adder fa14(hc[1],hs[2],M[7],fs[14],fc[14]);
	
	full_adder fa15(fs[3],fc[1],fs[4],fs[15],fc[15]);
	full_adder fa16(fc[2],hs[3],hc[2],fs[16],fc[16]);

	full_adder fa17(fs[5],fc[3],fs[6],fs[17],fc[17]);
	full_adder fa18(fc[4],M[9],hc[3],fs[18],fc[18]);

	full_adder fa19(M[10],fc[5],P[3][7],fs[19],fc[19]);
	full_adder fa20(fc[6],fs[7],P[4][6],fs[20],fc[20]);

	full_adder fa21(M[11],P[4][7],P[5][6],fs[21],fc[21]);
	full_adder fa22(P[6][5],P[7][4],fc[7],fs[22],fc[22]);

	full_adder fa23(P[5][7],P[6][6],P[7][5],fs[23],fc[23]);

	//level 3
	
	
	half_adder ha6(P[1][1],P[2][0],hs[6],hc[6]);
	
	full_adder fa24(M[3],P[0][3],P[1][2],fs[24],fc[24]);
	full_adder fa25(hc[4],hs[5],M[4],fs[25],fc[25]);
	full_adder fa26(fc[8],fs[10],hc[5],fs[26],fc[26]);
	
	full_adder fa27(fc[9],fs[12],fc[10],fs[27],fc[27]);
	full_adder fa28(fc[11],fs[14],fc[12],fs[28],fc[28]);
	full_adder fa29(fc[13],fs[16],fc[14],fs[29],fc[29]);
	full_adder fa30(fc[15],fs[18],fc[16],fs[30],fc[30]);
	full_adder fa31(fc[17],fs[20],fc[18],fs[31],fc[31]);
	full_adder fa32(fc[19],fs[22],fc[20],fs[32],fc[32]);
	full_adder fa33(fc[21],M[12],fc[22],fs[33],fc[33]);
	full_adder fa34(M[13],P[6][7],P[7][6],fs[34],fc[34]);
		
	//level 4
	
	//i need to jus pass through some wires 
	and pass1(PRE[1][1],M[1],1'b1);
	and pass2(PRE[1][0],P[0][0],1'b1);

	and pass3(PRE[0][0],M[0],1'b1);
	and pass4(PRE[0][15],M[15],1'b1);
	
	half_adder ha7(P[0][1],P[1][0],PRE[0][1],PRE[1][2]);
	
	full_adder fa35(hs[6],M[2],P[0][2],PRE[0][2],PRE[1][3]);
	
	full_adder fa36(fs[24],hc[6],hs[4],PRE[0][3],PRE[1][4]);
	full_adder fa37(fs[25],fc[24],fs[8],PRE[0][4],PRE[1][5]);
	full_adder fa38(fs[26],fc[25],fs[9],PRE[0][5],PRE[1][6]);
	full_adder fa39(fs[27],fc[26],fs[11],PRE[0][6],PRE[1][7]);
	full_adder fa40(fs[28],fc[27],fs[13],PRE[0][7],PRE[1][8]);
	full_adder fa41(fs[29],fc[28],fs[15],PRE[0][8],PRE[1][9]);
	full_adder fa42(fs[30],fc[29],fs[17],PRE[0][9],PRE[1][10]);
	full_adder fa43(fs[31],fc[30],fs[19],PRE[0][10],PRE[1][11]);
	full_adder fa44(fs[32],fc[31],fs[21],PRE[0][11],PRE[1][12]);
	full_adder fa45(fs[33],fc[32],fs[23],PRE[0][12],PRE[1][13]);
	full_adder fa46(fs[34],fc[33],fc[23],PRE[0][13],PRE[1][14]);
	full_adder fa47(M[14],fc[34],P[7][7],PRE[0][14],PRE[1][15]);
endmodule

