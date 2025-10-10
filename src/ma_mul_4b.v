module ma_mul_4b(
    output [7:0]out,
    input [3:0]in_a,
    input [3:0]in_b
);


    wire [3:0]p_sum_l0;
    wire [3:0]p_sum_l1;
    wire [3:0]p_sum_l2;
    wire [3:0]p_sum_l3;
    wire [3:0]c_internal;

    rca_ma_add_4b l_0_add(
    .s_o(p_sum_l0),
    .c_o(c_internal[0]),
    .x_i(in_a),
    .y_i(in_b[0]),
    .s_i(4'b0),
    .c_i(1'b0)

    );
    rca_ma_add_4b l_1_add(
    .s_o(p_sum_l1),
    .c_o(c_internal[1]),
    .x_i(in_a),
    .y_i(in_b[1]),
    .s_i({c_internal[0],p_sum_l0[3:1]}),
    .c_i(1'b0)

    );
    rca_ma_add_4b l_2_add(
    .s_o(p_sum_l2),
    .c_o(c_internal[2]),
    .x_i(in_a),
    .y_i(in_b[2]),
    .s_i({c_internal[1],p_sum_l1[3:1]}),
    .c_i(1'b0)

    );
    rca_ma_add_4b l_3_add(
    .s_o(p_sum_l3),
    .c_o(c_internal[3]),
    .x_i(in_a),
    .y_i(in_b[3]),
    .s_i({c_internal[2],p_sum_l2[3:1]}),
    .c_i(1'b0)

    );
    
assign out = {c_internal[3],p_sum_l3,p_sum_l2[0],p_sum_l1[0],p_sum_l0[0]};

endmodule

module rca_ma_add_4b(
  output [3:0]s_o,
  output c_o,
  input [3:0]x_i,
  input y_i,
  input [3:0]s_i,
  input c_i
);

wire [2:0]car_internal;

ma_ele_1b ma0(
    .s_o(s_o[0]),
    .c_o(car_internal[0]),
    .x_i(x_i[0]),
    .y_i(y_i),
    .s_i(s_i[0]),
    .c_i(c_i)
);

ma_ele_1b ma1(
    .s_o(s_o[1]),
    .c_o(car_internal[1]),
    .x_i(x_i[1]),
    .y_i(y_i),
    .s_i(s_i[1]),
    .c_i(car_internal[0])
);

ma_ele_1b ma2(
    .s_o(s_o[2]),
    .c_o(car_internal[2]),
    .x_i(x_i[2]),
    .y_i(y_i),
    .s_i(s_i[2]),
    .c_i(car_internal[1])
);

ma_ele_1b ma3(
    .s_o(s_o[3]),
    .c_o(c_o),
    .x_i(x_i[3]),
    .y_i(y_i),
    .s_i(s_i[3]),
    .c_i(car_internal[2])
);


endmodule