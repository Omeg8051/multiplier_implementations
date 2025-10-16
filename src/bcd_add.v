
module bcd_add(
  input [3:0]in_a,
  input [3:0]in_b,
  input in_cin,
  output [3:0] out_x,
  output out_cout
  
);

  wire [1:0]that_is_too_much_for_a_bcd_adder;
  wire I_give_up;
  wire [4:0]ab_sum;
  assign ab_sum = {1'b0,in_a} + {1'b0,in_b};
  wire [4:0]abc_sum;
  assign abc_sum = ab_sum + {4'b0,in_cin};
  assign that_is_too_much_for_a_bcd_adder[0] = &{in_a[3],|in_a[2:1]};
  assign that_is_too_much_for_a_bcd_adder[1] = &{in_b[3],|in_b[2:1]};
  assign I_give_up = | that_is_too_much_for_a_bcd_adder;
  
  wire [4:0]abc_sum_add_6;
  wire [4:0]abc_sum_BCD;
  assign abc_sum_add_6 = (abc_sum > 5'h9)? 5'h6 : 5'h0;
  assign abc_sum_BCD = abc_sum + abc_sum_add_6;
  
  assign out_x = abc_sum_BCD[3:0] | {4{I_give_up}};
  assign out_cout = abc_sum_BCD[4] | I_give_up;
  
 
endmodule