`timescale 1ns / 1ps
module mul_4x4(
  output [7:0]out,
  input [3:0]in_a,
  input [3:0]in_b
);
  /**
  and delay 1ns
  */
  
  wire [3:0]p_sum_l0;
  wire [3:0]p_sum_l1;
  wire [3:0]p_sum_l2;
  wire [3:0]p_sum_l3;
  wire [3:0]c_internal;

  wire [3:0]in_aab_0;
  wire [3:0]in_aab_1;
  wire [3:0]in_aab_2;
  wire [3:0]in_aab_3;

  assign #1 in_aab_0 = in_a & {4{in_b[0]}};
  assign #1 in_aab_1 = in_a & {4{in_b[1]}};
  assign #1 in_aab_2 = in_a & {4{in_b[2]}};
  assign #1 in_aab_3 = in_a & {4{in_b[3]}};
  
  cla_add_4b l_0_add(
    .out(p_sum_l0),
    .c_o(c_internal[0]),
    .in_a(in_aab_0),
    .in_b(4'b0),
    .c_i(1'b0)
    
  );
  cla_add_4b l_1_add(
    .out(p_sum_l1),
    .c_o(c_internal[1]),
    .in_a(in_aab_1),
    .in_b({c_internal[0],p_sum_l0[3:1]}),
    .c_i(1'b0)
    
  );
  cla_add_4b l_2_add(
    .out(p_sum_l2),
    .c_o(c_internal[2]),
    .in_a(in_aab_2),
    .in_b({c_internal[1],p_sum_l1[3:1]}),
    .c_i(1'b0)
    
  );
  cla_add_4b l_3_add(
    .out(p_sum_l3),
    .c_o(c_internal[3]),
    .in_a(in_aab_3),
    .in_b({c_internal[2],p_sum_l2[3:1]}),
    .c_i(1'b0)
    
  );

  assign out = {c_internal[3],p_sum_l3,p_sum_l2[0],p_sum_l1[0],p_sum_l0[0]};
    
  
endmodule