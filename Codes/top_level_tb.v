///////////////////////////////////////////////////////////////////////////////////////////////////
//
//       MODULE: top_level_tb
//  DESCRIPTION: tset bench for 8*8 dadda 
//   IO SIGNALS: ---
//       AUTHOR: YOUR NAME (), 
// ORGANIZATION: 
//      VERSION: 1.0
//      CREATED: Sunday 11 November 2018 04:05:03  IST
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ps/100fs
module top_level_tb(); //testbench doesnt have any inputs or outputs
	reg [7:0] A; 	//inputs are takens as reqisters ( they need to hold the value)
	reg [7:0] B;
	reg[15:0] M;
	wire [16:0] RES; //outputs are takens as wires in tb .
	reg[7:0] ain_array[0:250]; 
	reg[7:0] bin_array[0:250]; 
	reg[16:0] res_array[0:250];
	reg[15:0] M_array[0:250];   
	top_level dut(	 A,B, M,RES); //since all the inputs to the dut are the wires of same name
	integer i;
	initial begin
		$dumpfile("top_level_tb.vcd"); 	
		$dumpvars(0,top_level_tb);			//first argument is the level of debugging
									//level 0 will log all the variable even in 
		$monitor(A,B,M,RES);

		$readmemb("ain.txt",ain_array);
		$readmemb("bin.txt",bin_array);
		$readmemb("res.txt",res_array);
		$readmemb("m.txt",M_array);
		//sub modules 
		//whereas level 1 will log only the ones in the top module 
		A = 8'h0;
		B = 8'h0;
		M = 16'h0;
		#2000;
		A = 8'hff;
		B = 8'haa;
		#2000;
		B = 8'hff;
		#200;
		#1000;
	
		M = 16'h02;
		$display("starting....");

		for(i = 0;i<250;i = i+1)begin
			A = ain_array[i];
			B = bin_array[i];
			M = M_array[i];
			#1000;
			$display("A = %h, B = %h, M = %h , RES = %h",A,B,M,RES);
			if(RES != res_array[i])
				$display("error");
			else 
				$display("test passed");

		end
		
	end
endmodule
