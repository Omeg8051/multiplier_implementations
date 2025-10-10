`timescale 1ns / 1ps
module ma_ele_1b(
    output s_o,
    output c_o,
    input x_i,
    input y_i,
    input s_i,
    input c_i
);
wire x_y;
  /**
  and delay 1ns
  */
assign #1 x_y = x_i & y_i;//and

f_add_1b add_elem(
    .s(s_o),
    .c_o(c_o),
    .in_a(x_y),
    .in_b(s_i),
    .c_i(c_i)
);

endmodule