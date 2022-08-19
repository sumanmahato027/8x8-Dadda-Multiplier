`timescale 1ps/100fs
module full_adder_tb(); //testbench doesnt have any inputs or outputs
	reg a,b,c_in; 	//inputs are takens as reqisters ( they need to hold the value)

	wire sum,carry; //outputs are takens as wires in tb .
	full_adder dut(a,b,c_in,sum,carry); //since all the inputs to the dut are the wires of same name
	initial begin
		$dumpfile("full_adder_tb.vcd"); 	
		$dumpvars(0,full_adder_tb);			//first argument is the level of debugging
								//level 0 will log all the variable even in 
		//sub modules 
		//whereas level 1 will log only the ones in the top module 
		a = 0;
		b = 0; c_in = 0;
		#200;
		a = 0;
		b = 1; c_in = 1;
		#200;
		a = 1;
		b = 0; c_in = 0;
		#200;
		a = 1;
		b = 1; c_in = 1;
		#200;  //assign reister values and wait for 100 ps 
	end
endmodule
