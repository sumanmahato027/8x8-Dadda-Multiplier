///////////////////////////////////////////////////////////////////////////////////////////////////
//
//       MODULE: hello_world
//  DESCRIPTION: hello world program to under stand verilog coding 
//   IO SIGNALS: ---***none*****
//       AUTHOR: aswinpajayan, 
// ORGANIZATION: 
//      VERSION: 1.0
//      CREATED: Wednesday 07 November 2018 11:58:58  IST
//     REVISION: ---
//////////////////////////////////////////////////////////////////////////////////////////////////
//
module hello_world;
	initial begin
		$display("hello verilog world");
		#10 $finish ;// assigning a delay of 10 units before the program closes 
	end
endmodule

