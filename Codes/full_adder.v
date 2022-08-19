`timescale 1ps/100fs

module full_adder(
    input a,
    input b,
    input c_in ,
    output  sum,
    output  carry
  
);

assign #120  sum = a ^ b ^ c_in;
assign #80  carry = (a & b) +(b & c_in) + (a & c_in);

endmodule // full_adder
