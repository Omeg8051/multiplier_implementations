`timescale 1ns / 1ps
module cla_add_4b(
  output [3:0]out,
  output c_o,
  input [3:0]in_a,
  input [3:0]in_b,
  input c_i
);

  wire [3:0]P;
  wire [3:0]G;
  wire [4:0]C;

  /**
  xor delay 3 ns
  and delay 1ns
  or delay 1ns
  */

  assign #3 P = in_a ^ in_b;
  assign #1 G = in_a & in_b;
  assign C[0] = c_i;
  assign #2 C[1] = |{G[0],(C[0] & P[0])};
  assign #2 C[2] = |{G[1],(G[0] & P[1]),(C[0] & P[0] & P[1])};
  assign #2 C[3] = |{G[2],(G[1] & P[2]),(G[0] & P[1] & P[2]),(C[0] & P[0] & P[1] & P[2])};
  assign #2 C[4] = |{G[3],(G[2] & P[3]),(G[1] & P[2] & P[3]),(G[0] & P[1] & P[2] & P[3]),(C[0] & P[0] & P[1] & P[2] & P[3])};

assign c_o = C[4];

assign out = C[3:0] ^ P;
  
  
endmodule