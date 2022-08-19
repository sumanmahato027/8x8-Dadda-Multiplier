`timescale 1ps/100fs

module half_adder(
    input a,
    input b,
    output  sum,
    output  carry
  
);

assign #70  sum = a ^ b;
assign #40  carry = a & b;

endmodule // half_adder
