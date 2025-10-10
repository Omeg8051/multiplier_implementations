// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb;

  reg clk;
  reg [7:0]data;
  wire [7:0]data_inc;
  wire [3:0]a;
  wire [3:0]b;
  wire [7:0]o;
  wire [7:0]cla_o;
  wire [7:0]csa_o;
  wire [7:0]o_right;
  assign a = data[3:0];
  assign b = data[7:4];
  assign data_inc = data + 8'h1;
  assign o_right = a * b;
  
  wire cla_off;
  wire csa_off;
  wire rca_off;
  assign cla_off = |(cla_o ^ o_right);
  assign csa_off = |(csa_o ^ o_right);
  assign rca_off = |(o ^ o_right);

  ma_mul_4b dut(
    .in_a(a),
    .in_b(b),
    .out(o)    
  );
  csa_mul_4b dut_csa(
    .in_a(a),
    .in_b(b),
    .out(csa_o)    
  );
  mul_4x4 dut_cla(
    .in_a(a),
    .in_b(b),
    .out(cla_o) 
  );
  initial begin
    data = 8'h00;
    clk = 0;
    $dumpfile("tb_dut.vcd");
    $dumpvars(0, tb);
    //$monitor("a: %d   b: %d   o: %d   correct?: %b",a,b,o,correct);
    #52000 $finish();
  end
  
  always @(*) begin
    $display("a: %d   b: %d   o: %d   cla_o: %d   csa_o: %d   rca?: %b   cla?: %b   csa?: %b",a,b,o,cla_o,csa_o,rca_off,cla_off,csa_off);
    #50 clk <= ~clk;
  end
  
  always @ (posedge clk)begin
    
    data <= data_inc;
  end
  
endmodule