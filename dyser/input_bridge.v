//input_bridge.v
//
//  this file was auto-generated
`include "dyser_config.v"

module input_bridge(
  /* inputs */
  d_in0,
  d_in1,
  port0,
  port1,
  wr_en0,
  wr_en1,
  // credit from core
  c_in_0,
  c_in_1,
  c_in_2,
  c_in_3,
  c_in_4,
  c_in_5,
  c_in_6,
  c_in_7,
  c_in_8,
  c_in_9,
  c_in_10,
  c_in_11,
  c_in_12,
  c_in_13,
  c_in_14,
  c_in_15,
  c_in_16,
  c_in_17,
  c_in_18,
  c_in_19,
  // --
  clk,
  rst_n,
  conf_en,
  /* outputs */
  // data to core
  d_out_0,
  d_out_1,
  d_out_2,
  d_out_3,
  d_out_4,
  d_out_5,
  d_out_6,
  d_out_7,
  d_out_8,
  d_out_9,
  d_out_10,
  d_out_11,
  d_out_12,
  d_out_13,
  d_out_14,
  d_out_15,
  d_out_16,
  d_out_17,
  d_out_18,
  d_out_19,
  busy0,
  busy1
  );

/* inputs */
input [`DATA_WIDTH:0] d_in0;
input [`DATA_WIDTH:0] d_in1;
input [4:0] port0;
input [4:0] port1;
input  wr_en0;
input  wr_en1;
input  c_in_0;
input  c_in_1;
input  c_in_2;
input  c_in_3;
input  c_in_4;
input  c_in_5;
input  c_in_6;
input  c_in_7;
input  c_in_8;
input  c_in_9;
input  c_in_10;
input  c_in_11;
input  c_in_12;
input  c_in_13;
input  c_in_14;
input  c_in_15;
input  c_in_16;
input  c_in_17;
input  c_in_18;
input  c_in_19;
input  clk;
input  rst_n;
input  conf_en;

/* outputs */
output [`PATH_WIDTH:0] d_out_0;
output [`PATH_WIDTH:0] d_out_1;
output [`PATH_WIDTH:0] d_out_2;
output [`PATH_WIDTH:0] d_out_3;
output [`PATH_WIDTH:0] d_out_4;
output [`PATH_WIDTH:0] d_out_5;
output [`PATH_WIDTH:0] d_out_6;
output [`PATH_WIDTH:0] d_out_7;
output [`PATH_WIDTH:0] d_out_8;
output [`PATH_WIDTH:0] d_out_9;
output [`PATH_WIDTH:0] d_out_10;
output [`PATH_WIDTH:0] d_out_11;
output [`PATH_WIDTH:0] d_out_12;
output [`PATH_WIDTH:0] d_out_13;
output [`PATH_WIDTH:0] d_out_14;
output [`PATH_WIDTH:0] d_out_15;
output [`PATH_WIDTH:0] d_out_16;
output [`PATH_WIDTH:0] d_out_17;
output [`PATH_WIDTH:0] d_out_18;
output [`PATH_WIDTH:0] d_out_19;
output  busy0;
output  busy1;


////////////////////////////////////////////////
//
//    wires
//
////////////////////////////////////////////////

wire [19:0] write0;
wire [19:0] write1;
wire [19:0] c_out;

assign write0[0] = (port0 == 5'd0) & wr_en0;
assign write0[1] = (port0 == 5'd1) & wr_en0;
assign write0[2] = (port0 == 5'd2) & wr_en0;
assign write0[3] = (port0 == 5'd3) & wr_en0;
assign write0[4] = (port0 == 5'd4) & wr_en0;
assign write0[5] = (port0 == 5'd5) & wr_en0;
assign write0[6] = (port0 == 5'd6) & wr_en0;
assign write0[7] = (port0 == 5'd7) & wr_en0;
assign write0[8] = (port0 == 5'd8) & wr_en0;
assign write0[9] = (port0 == 5'd9) & wr_en0;
assign write0[10] = (port0 == 5'd10) & wr_en0;
assign write0[11] = (port0 == 5'd11) & wr_en0;
assign write0[12] = (port0 == 5'd12) & wr_en0;
assign write0[13] = (port0 == 5'd13) & wr_en0;
assign write0[14] = (port0 == 5'd14) & wr_en0;
assign write0[15] = (port0 == 5'd15) & wr_en0;
assign write0[16] = (port0 == 5'd16) & wr_en0;
assign write0[17] = (port0 == 5'd17) & wr_en0;
assign write0[18] = (port0 == 5'd18) & wr_en0;
assign write0[19] = (port0 == 5'd19) & wr_en0;

assign write1[0] = (port1 == 5'd0) & wr_en1;
assign write1[1] = (port1 == 5'd1) & wr_en1;
assign write1[2] = (port1 == 5'd2) & wr_en1;
assign write1[3] = (port1 == 5'd3) & wr_en1;
assign write1[4] = (port1 == 5'd4) & wr_en1;
assign write1[5] = (port1 == 5'd5) & wr_en1;
assign write1[6] = (port1 == 5'd6) & wr_en1;
assign write1[7] = (port1 == 5'd7) & wr_en1;
assign write1[8] = (port1 == 5'd8) & wr_en1;
assign write1[9] = (port1 == 5'd9) & wr_en1;
assign write1[10] = (port1 == 5'd10) & wr_en1;
assign write1[11] = (port1 == 5'd11) & wr_en1;
assign write1[12] = (port1 == 5'd12) & wr_en1;
assign write1[13] = (port1 == 5'd13) & wr_en1;
assign write1[14] = (port1 == 5'd14) & wr_en1;
assign write1[15] = (port1 == 5'd15) & wr_en1;
assign write1[16] = (port1 == 5'd16) & wr_en1;
assign write1[17] = (port1 == 5'd17) & wr_en1;
assign write1[18] = (port1 == 5'd18) & wr_en1;
assign write1[19] = (port1 == 5'd19) & wr_en1;

assign busy0 = | (~c_out & write0);
assign busy1 = | (~c_out & write1);

////////////////////////////////////////////////
//
//    configuration path
//
////////////////////////////////////////////////

wire [`PATH_WIDTH:0] d_out_0_fifo;
assign d_out_0 = conf_en ? {d_in0,2'b0} : d_out_0_fifo;

////////////////////////////////////////////////
//
//    FIFO
//
////////////////////////////////////////////////

fifo #(0) f0(
  /* inputs */
  .d_in(write0[0] ? d_in0 : d_in1),
  .enq(write0[0] | write1[0]),
  .deq(c_in_0),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_0_fifo[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_0_fifo[0]),
  .valid(d_out_0_fifo[1]),
  .c_out(c_out[0])
  );

fifo #(1) f1(
  /* inputs */
  .d_in(write0[1] ? d_in0 : d_in1),
  .enq(write0[1] | write1[1]),
  .deq(c_in_1),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_1[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_1[0]),
  .valid(d_out_1[1]),
  .c_out(c_out[1])
  );

fifo #(2) f2(
  /* inputs */
  .d_in(write0[2] ? d_in0 : d_in1),
  .enq(write0[2] | write1[2]),
  .deq(c_in_2),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_2[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_2[0]),
  .valid(d_out_2[1]),
  .c_out(c_out[2])
  );

fifo #(3) f3(
  /* inputs */
  .d_in(write0[3] ? d_in0 : d_in1),
  .enq(write0[3] | write1[3]),
  .deq(c_in_3),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_3[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_3[0]),
  .valid(d_out_3[1]),
  .c_out(c_out[3])
  );

fifo #(4) f4(
  /* inputs */
  .d_in(write0[4] ? d_in0 : d_in1),
  .enq(write0[4] | write1[4]),
  .deq(c_in_4),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_4[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_4[0]),
  .valid(d_out_4[1]),
  .c_out(c_out[4])
  );

fifo #(5) f5(
  /* inputs */
  .d_in(write0[5] ? d_in0 : d_in1),
  .enq(write0[5] | write1[5]),
  .deq(c_in_5),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_5[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_5[0]),
  .valid(d_out_5[1]),
  .c_out(c_out[5])
  );

fifo #(6) f6(
  /* inputs */
  .d_in(write0[6] ? d_in0 : d_in1),
  .enq(write0[6] | write1[6]),
  .deq(c_in_6),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_6[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_6[0]),
  .valid(d_out_6[1]),
  .c_out(c_out[6])
  );

fifo #(7) f7(
  /* inputs */
  .d_in(write0[7] ? d_in0 : d_in1),
  .enq(write0[7] | write1[7]),
  .deq(c_in_7),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_7[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_7[0]),
  .valid(d_out_7[1]),
  .c_out(c_out[7])
  );

fifo #(8) f8(
  /* inputs */
  .d_in(write0[8] ? d_in0 : d_in1),
  .enq(write0[8] | write1[8]),
  .deq(c_in_8),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_8[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_8[0]),
  .valid(d_out_8[1]),
  .c_out(c_out[8])
  );

fifo #(9) f9(
  /* inputs */
  .d_in(write0[9] ? d_in0 : d_in1),
  .enq(write0[9] | write1[9]),
  .deq(c_in_9),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_9[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_9[0]),
  .valid(d_out_9[1]),
  .c_out(c_out[9])
  );

fifo #(10) f10(
  /* inputs */
  .d_in(write0[10] ? d_in0 : d_in1),
  .enq(write0[10] | write1[10]),
  .deq(c_in_10),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_10[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_10[0]),
  .valid(d_out_10[1]),
  .c_out(c_out[10])
  );

fifo #(11) f11(
  /* inputs */
  .d_in(write0[11] ? d_in0 : d_in1),
  .enq(write0[11] | write1[11]),
  .deq(c_in_11),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_11[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_11[0]),
  .valid(d_out_11[1]),
  .c_out(c_out[11])
  );

fifo #(12) f12(
  /* inputs */
  .d_in(write0[12] ? d_in0 : d_in1),
  .enq(write0[12] | write1[12]),
  .deq(c_in_12),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_12[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_12[0]),
  .valid(d_out_12[1]),
  .c_out(c_out[12])
  );

fifo #(13) f13(
  /* inputs */
  .d_in(write0[13] ? d_in0 : d_in1),
  .enq(write0[13] | write1[13]),
  .deq(c_in_13),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_13[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_13[0]),
  .valid(d_out_13[1]),
  .c_out(c_out[13])
  );

fifo #(14) f14(
  /* inputs */
  .d_in(write0[14] ? d_in0 : d_in1),
  .enq(write0[14] | write1[14]),
  .deq(c_in_14),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_14[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_14[0]),
  .valid(d_out_14[1]),
  .c_out(c_out[14])
  );

fifo #(15) f15(
  /* inputs */
  .d_in(write0[15] ? d_in0 : d_in1),
  .enq(write0[15] | write1[15]),
  .deq(c_in_15),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_15[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_15[0]),
  .valid(d_out_15[1]),
  .c_out(c_out[15])
  );

fifo #(16) f16(
  /* inputs */
  .d_in(write0[16] ? d_in0 : d_in1),
  .enq(write0[16] | write1[16]),
  .deq(c_in_16),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_16[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_16[0]),
  .valid(d_out_16[1]),
  .c_out(c_out[16])
  );

fifo #(17) f17(
  /* inputs */
  .d_in(write0[17] ? d_in0 : d_in1),
  .enq(write0[17] | write1[17]),
  .deq(c_in_17),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_17[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_17[0]),
  .valid(d_out_17[1]),
  .c_out(c_out[17])
  );

fifo #(18) f18(
  /* inputs */
  .d_in(write0[18] ? d_in0 : d_in1),
  .enq(write0[18] | write1[18]),
  .deq(c_in_18),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_18[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_18[0]),
  .valid(d_out_18[1]),
  .c_out(c_out[18])
  );

fifo #(19) f19(
  /* inputs */
  .d_in(write0[19] ? d_in0 : d_in1),
  .enq(write0[19] | write1[19]),
  .deq(c_in_19),
  .clk(clk),
  .rst_n(rst_n),
  /* outputs */
  .d_out(d_out_19[`PATH_WIDTH:`META_BITS]),
  .ready(d_out_19[0]),
  .valid(d_out_19[1]),
  .c_out(c_out[19])
  );

endmodule
