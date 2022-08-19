`timescale 1ps/100fs
module half_adder_tb(); //testbench doesnt have any inputs or outputs
	reg a,b; 	//inputs are takens as reqisters ( they need to hold the value)
	wire sum,carry; //outputs are takens as wires in tb .
	half_adder dut(a,b,sum,carry); //since all the inputs to the dut are the wires of same name
	initial begin
		$dumpfile("half_adder_tb.vcd"); 	
		$dumpvars(0,half_adder_tb);			//first argument is the level of debugging
								//level 0 will log all the variable even in 
		//sub modules 
		//whereas level 1 will log only the ones in the top module 
		a = 0;
		b = 0;
		#100;
		a = 0;
		b = 1;
		#100;
		a = 1;
		b = 0;
		#100;
		a = 1;
		b = 1;
		#100;  //assign reister values and wait for 100 ps 
	end

endmodule

