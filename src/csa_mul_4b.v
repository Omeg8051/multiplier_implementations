module csa_mul_4b(
    output [7:0]out,
    input [3:0]in_a,
    input [3:0]in_b
);


    wire [3:0]p_sum_l0;
    wire [3:0]p_sum_l1;
    wire [3:0]p_sum_l2;
    wire [3:0]p_sum_l3;
    wire [3:0]p_sum_l4;
    wire [3:0]c_out_l0;
    wire [3:0]c_out_l1;
    wire [3:0]c_out_l2;
    wire [3:0]c_out_l3;
    wire [3:0]c_out_l4;
//==============================
    ma_ele_1b ma00(
        .s_o(p_sum_l0[0]),
        .c_o(c_out_l0[0]),
        .x_i(in_a[0]),
        .y_i(in_b[0]),
        .s_i(1'b0),
        .c_i(1'b0)
    );
    ma_ele_1b ma01(
        .s_o(p_sum_l0[1]),
        .c_o(c_out_l0[1]),
        .x_i(in_a[1]),
        .y_i(in_b[0]),
        .s_i(1'b0),
        .c_i(1'b0)
    );
    ma_ele_1b ma02(
        .s_o(p_sum_l0[2]),
        .c_o(c_out_l0[2]),
        .x_i(in_a[2]),
        .y_i(in_b[0]),
        .s_i(1'b0),
        .c_i(1'b0)
    );
    ma_ele_1b ma03(
        .s_o(p_sum_l0[3]),
        .c_o(c_out_l0[3]),
        .x_i(in_a[3]),
        .y_i(in_b[0]),
        .s_i(1'b0),
        .c_i(1'b0)
    );
//==============================
    ma_ele_1b ma10(
        .s_o(p_sum_l1[0]),
        .c_o(c_out_l1[0]),
        .x_i(in_a[0]),
        .y_i(in_b[1]),
        .s_i(p_sum_l0[1]),
        .c_i(c_out_l0[0])
    );
    ma_ele_1b ma11(
        .s_o(p_sum_l1[1]),
        .c_o(c_out_l1[1]),
        .x_i(in_a[1]),
        .y_i(in_b[1]),
        .s_i(p_sum_l0[2]),
        .c_i(c_out_l0[1])
    );
    ma_ele_1b ma12(
        .s_o(p_sum_l1[2]),
        .c_o(c_out_l1[2]),
        .x_i(in_a[2]),
        .y_i(in_b[1]),
        .s_i(p_sum_l0[3]),
        .c_i(c_out_l0[2])
    );
    ma_ele_1b ma13(
        .s_o(p_sum_l1[3]),
        .c_o(c_out_l1[3]),
        .x_i(in_a[3]),
        .y_i(in_b[1]),
        .s_i(1'b0),
        .c_i(c_out_l0[3])
    );
//==============================
    ma_ele_1b ma20(
        .s_o(p_sum_l2[0]),
        .c_o(c_out_l2[0]),
        .x_i(in_a[0]),
        .y_i(in_b[2]),
        .s_i(p_sum_l1[1]),
        .c_i(c_out_l1[0])
    );
    ma_ele_1b ma21(
        .s_o(p_sum_l2[1]),
        .c_o(c_out_l2[1]),
        .x_i(in_a[1]),
        .y_i(in_b[2]),
        .s_i(p_sum_l1[2]),
        .c_i(c_out_l1[1])
    );
    ma_ele_1b ma22(
        .s_o(p_sum_l2[2]),
        .c_o(c_out_l2[2]),
        .x_i(in_a[2]),
        .y_i(in_b[2]),
        .s_i(p_sum_l1[3]),
        .c_i(c_out_l1[2])
    );
    ma_ele_1b ma23(
        .s_o(p_sum_l2[3]),
        .c_o(c_out_l2[3]),
        .x_i(in_a[3]),
        .y_i(in_b[2]),
        .s_i(1'b0),
        .c_i(c_out_l1[3])
    );
//==============================
    ma_ele_1b ma30(
        .s_o(p_sum_l3[0]),
        .c_o(c_out_l3[0]),
        .x_i(in_a[0]),
        .y_i(in_b[3]),
        .s_i(p_sum_l2[1]),
        .c_i(c_out_l2[0])
    );
    ma_ele_1b ma31(
        .s_o(p_sum_l3[1]),
        .c_o(c_out_l3[1]),
        .x_i(in_a[1]),
        .y_i(in_b[3]),
        .s_i(p_sum_l2[2]),
        .c_i(c_out_l2[1])
    );
    ma_ele_1b ma32(
        .s_o(p_sum_l3[2]),
        .c_o(c_out_l3[2]),
        .x_i(in_a[2]),
        .y_i(in_b[3]),
        .s_i(p_sum_l2[3]),
        .c_i(c_out_l2[2])
    );
    ma_ele_1b ma33(
        .s_o(p_sum_l3[3]),
        .c_o(c_out_l3[3]),
        .x_i(in_a[3]),
        .y_i(in_b[3]),
        .s_i(1'b0),
        .c_i(c_out_l2[3])
    );

//==============================
    ma_ele_1b ma40(
        .s_o(p_sum_l4[0]),
        .c_o(c_out_l4[0]),
        .x_i(1'b0),
        .y_i(1'b1),
        .s_i(p_sum_l3[1]),
        .c_i(c_out_l3[0])
    );
    ma_ele_1b ma41(
        .s_o(p_sum_l4[1]),
        .c_o(c_out_l4[1]),
        .x_i(c_out_l4[0]),
        .y_i(1'b1),
        .s_i(p_sum_l3[2]),
        .c_i(c_out_l3[1])
    );
    ma_ele_1b ma42(
        .s_o(p_sum_l4[2]),
        .c_o(c_out_l4[2]),
        .x_i(c_out_l4[1]),
        .y_i(1'b1),
        .s_i(p_sum_l3[3]),
        .c_i(c_out_l3[2])
    );
    ma_ele_1b ma43(
        .s_o(p_sum_l4[3]),
        .c_o(c_out_l4[3]),
        .x_i(c_out_l4[2]),
        .y_i(1'b1),
        .s_i(1'b0),
        .c_i(c_out_l3[3])
    );



    
assign out = {p_sum_l4,p_sum_l3[0],p_sum_l2[0],p_sum_l1[0],p_sum_l0[0]};

endmodule
