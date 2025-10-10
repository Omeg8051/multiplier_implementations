`timescale 1ns / 1ps
module f_add_1b (
    output s,
    output c_o,
    input in_a,
    input in_b,
    input c_i
);
    wire w0;
    wire w1;
  /**
  xor delay 3 ns
  and delay 1ns
  or delay 1ns
  */

    assign #3 w0 = in_a ^ in_b;//xor
    assign #1 w1 = in_a & in_b;//and

    assign #4 c_o = w1 | (c_i & w0);//and + or
    
    assign #3 s = c_i ^ w0;//xor

endmodule