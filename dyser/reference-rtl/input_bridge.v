//input_bridge.v
//
//  this file was auto-generated
`include "config.v"

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
  c_in_20,
  c_in_21,
  c_in_22,
  c_in_23,
  c_in_24,
  c_in_25,
  c_in_26,
  c_in_27,
  c_in_28,
  c_in_29,
  c_in_30,
  c_in_31,
  // --
  clk,
  rst,
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
  d_out_20,
  d_out_21,
  d_out_22,
  d_out_23,
  d_out_24,
  d_out_25,
  d_out_26,
  d_out_27,
  d_out_28,
  d_out_29,
  d_out_30,
  d_out_31,
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
input  c_in_20;
input  c_in_21;
input  c_in_22;
input  c_in_23;
input  c_in_24;
input  c_in_25;
input  c_in_26;
input  c_in_27;
input  c_in_28;
input  c_in_29;
input  c_in_30;
input  c_in_31;
input  clk;
input  rst;
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
output [`PATH_WIDTH:0] d_out_20;
output [`PATH_WIDTH:0] d_out_21;
output [`PATH_WIDTH:0] d_out_22;
output [`PATH_WIDTH:0] d_out_23;
output [`PATH_WIDTH:0] d_out_24;
output [`PATH_WIDTH:0] d_out_25;
output [`PATH_WIDTH:0] d_out_26;
output [`PATH_WIDTH:0] d_out_27;
output [`PATH_WIDTH:0] d_out_28;
output [`PATH_WIDTH:0] d_out_29;
output [`PATH_WIDTH:0] d_out_30;
output [`PATH_WIDTH:0] d_out_31;
output  busy0;
output  busy1;


////////////////////////////////////////////////
//
//    wires
//
////////////////////////////////////////////////

wire [31:0] write0;
wire [31:0] write1;
wire [31:0] busy;

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
assign write0[20] = (port0 == 5'd20) & wr_en0;
assign write0[21] = (port0 == 5'd21) & wr_en0;
assign write0[22] = (port0 == 5'd22) & wr_en0;
assign write0[23] = (port0 == 5'd23) & wr_en0;
assign write0[24] = (port0 == 5'd24) & wr_en0;
assign write0[25] = (port0 == 5'd25) & wr_en0;
assign write0[26] = (port0 == 5'd26) & wr_en0;
assign write0[27] = (port0 == 5'd27) & wr_en0;
assign write0[28] = (port0 == 5'd28) & wr_en0;
assign write0[29] = (port0 == 5'd29) & wr_en0;
assign write0[30] = (port0 == 5'd30) & wr_en0;
assign write0[31] = (port0 == 5'd31) & wr_en0;

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
assign write1[20] = (port1 == 5'd20) & wr_en1;
assign write1[21] = (port1 == 5'd21) & wr_en1;
assign write1[22] = (port1 == 5'd22) & wr_en1;
assign write1[23] = (port1 == 5'd23) & wr_en1;
assign write1[24] = (port1 == 5'd24) & wr_en1;
assign write1[25] = (port1 == 5'd25) & wr_en1;
assign write1[26] = (port1 == 5'd26) & wr_en1;
assign write1[27] = (port1 == 5'd27) & wr_en1;
assign write1[28] = (port1 == 5'd28) & wr_en1;
assign write1[29] = (port1 == 5'd29) & wr_en1;
assign write1[30] = (port1 == 5'd30) & wr_en1;
assign write1[31] = (port1 == 5'd31) & wr_en1;

assign busy0 = | (busy & write0);
assign busy1 = | (busy & write1);



reg [31:0] read_en;

always @(posedge clk or posedge rst)
begin
  if (rst == 1'b1)
    read_en <= ~(32'b0);
  else begin
    read_en[0] <= (c_in_0 ? 1'b1 : (d_out_0[0] ? 1'b0 : read_en[0]));
    read_en[1] <= (c_in_1 ? 1'b1 : (d_out_1[0] ? 1'b0 : read_en[1]));
    read_en[2] <= (c_in_2 ? 1'b1 : (d_out_2[0] ? 1'b0 : read_en[2]));
    read_en[3] <= (c_in_3 ? 1'b1 : (d_out_3[0] ? 1'b0 : read_en[3]));
    read_en[4] <= (c_in_4 ? 1'b1 : (d_out_4[0] ? 1'b0 : read_en[4]));
    read_en[5] <= (c_in_5 ? 1'b1 : (d_out_5[0] ? 1'b0 : read_en[5]));
    read_en[6] <= (c_in_6 ? 1'b1 : (d_out_6[0] ? 1'b0 : read_en[6]));
    read_en[7] <= (c_in_7 ? 1'b1 : (d_out_7[0] ? 1'b0 : read_en[7]));
    read_en[8] <= (c_in_8 ? 1'b1 : (d_out_8[0] ? 1'b0 : read_en[8]));
    read_en[9] <= (c_in_9 ? 1'b1 : (d_out_9[0] ? 1'b0 : read_en[9]));
    read_en[10] <= (c_in_10 ? 1'b1 : (d_out_10[0] ? 1'b0 : read_en[10]));
    read_en[11] <= (c_in_11 ? 1'b1 : (d_out_11[0] ? 1'b0 : read_en[11]));
    read_en[12] <= (c_in_12 ? 1'b1 : (d_out_12[0] ? 1'b0 : read_en[12]));
    read_en[13] <= (c_in_13 ? 1'b1 : (d_out_13[0] ? 1'b0 : read_en[13]));
    read_en[14] <= (c_in_14 ? 1'b1 : (d_out_14[0] ? 1'b0 : read_en[14]));
    read_en[15] <= (c_in_15 ? 1'b1 : (d_out_15[0] ? 1'b0 : read_en[15]));
    read_en[16] <= (c_in_16 ? 1'b1 : (d_out_16[0] ? 1'b0 : read_en[16]));
    read_en[17] <= (c_in_17 ? 1'b1 : (d_out_17[0] ? 1'b0 : read_en[17]));
    read_en[18] <= (c_in_18 ? 1'b1 : (d_out_18[0] ? 1'b0 : read_en[18]));
    read_en[19] <= (c_in_19 ? 1'b1 : (d_out_19[0] ? 1'b0 : read_en[19]));
    read_en[20] <= (c_in_20 ? 1'b1 : (d_out_20[0] ? 1'b0 : read_en[20]));
    read_en[21] <= (c_in_21 ? 1'b1 : (d_out_21[0] ? 1'b0 : read_en[21]));
    read_en[22] <= (c_in_22 ? 1'b1 : (d_out_22[0] ? 1'b0 : read_en[22]));
    read_en[23] <= (c_in_23 ? 1'b1 : (d_out_23[0] ? 1'b0 : read_en[23]));
    read_en[24] <= (c_in_24 ? 1'b1 : (d_out_24[0] ? 1'b0 : read_en[24]));
    read_en[25] <= (c_in_25 ? 1'b1 : (d_out_25[0] ? 1'b0 : read_en[25]));
    read_en[26] <= (c_in_26 ? 1'b1 : (d_out_26[0] ? 1'b0 : read_en[26]));
    read_en[27] <= (c_in_27 ? 1'b1 : (d_out_27[0] ? 1'b0 : read_en[27]));
    read_en[28] <= (c_in_28 ? 1'b1 : (d_out_28[0] ? 1'b0 : read_en[28]));
    read_en[29] <= (c_in_29 ? 1'b1 : (d_out_29[0] ? 1'b0 : read_en[29]));
    read_en[30] <= (c_in_30 ? 1'b1 : (d_out_30[0] ? 1'b0 : read_en[30]));
    read_en[31] <= (c_in_31 ? 1'b1 : (d_out_31[0] ? 1'b0 : read_en[31]));
  end
end



////////////////////////////////////////////////
//
//    FIFO
//
////////////////////////////////////////////////

assign d_out_0[1] = 1'b1;
fifo #(0) f0(
  /* inputs */
  .d_in(write0[0] ? d_in0 : d_in1),
  .enq(write0[0] | write1[0]),
  .deq(~conf_en & read_en[0]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_0[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_0[0]),
  .busy(busy[0]),
  .c_out() // NC
  );

assign d_out_1[1] = 1'b1;
fifo #(1) f1(
  /* inputs */
  .d_in(write0[1] ? d_in0 : d_in1),
  .enq(write0[1] | write1[1]),
  .deq(~conf_en & read_en[1]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_1[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_1[0]),
  .busy(busy[1]),
  .c_out() // NC
  );

assign d_out_2[1] = 1'b1;
fifo #(2) f2(
  /* inputs */
  .d_in(write0[2] ? d_in0 : d_in1),
  .enq(write0[2] | write1[2]),
  .deq(~conf_en & read_en[2]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_2[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_2[0]),
  .busy(busy[2]),
  .c_out() // NC
  );

assign d_out_3[1] = 1'b1;
fifo #(3) f3(
  /* inputs */
  .d_in(write0[3] ? d_in0 : d_in1),
  .enq(write0[3] | write1[3]),
  .deq(~conf_en & read_en[3]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_3[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_3[0]),
  .busy(busy[3]),
  .c_out() // NC
  );

assign d_out_4[1] = 1'b1;
fifo #(4) f4(
  /* inputs */
  .d_in(write0[4] ? d_in0 : d_in1),
  .enq(write0[4] | write1[4]),
  .deq(~conf_en & read_en[4]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_4[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_4[0]),
  .busy(busy[4]),
  .c_out() // NC
  );

assign d_out_5[1] = 1'b1;
fifo #(5) f5(
  /* inputs */
  .d_in(write0[5] ? d_in0 : d_in1),
  .enq(write0[5] | write1[5]),
  .deq(~conf_en & read_en[5]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_5[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_5[0]),
  .busy(busy[5]),
  .c_out() // NC
  );

assign d_out_6[1] = 1'b1;
fifo #(6) f6(
  /* inputs */
  .d_in(write0[6] ? d_in0 : d_in1),
  .enq(write0[6] | write1[6]),
  .deq(~conf_en & read_en[6]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_6[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_6[0]),
  .busy(busy[6]),
  .c_out() // NC
  );

assign d_out_7[1] = 1'b1;
fifo #(7) f7(
  /* inputs */
  .d_in(write0[7] ? d_in0 : d_in1),
  .enq(write0[7] | write1[7]),
  .deq(~conf_en & read_en[7]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_7[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_7[0]),
  .busy(busy[7]),
  .c_out() // NC
  );

assign d_out_8[1] = 1'b1;
fifo #(8) f8(
  /* inputs */
  .d_in(write0[8] ? d_in0 : d_in1),
  .enq(write0[8] | write1[8]),
  .deq(~conf_en & read_en[8]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_8[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_8[0]),
  .busy(busy[8]),
  .c_out() // NC
  );

assign d_out_9[1] = 1'b1;
fifo #(9) f9(
  /* inputs */
  .d_in(write0[9] ? d_in0 : d_in1),
  .enq(write0[9] | write1[9]),
  .deq(~conf_en & read_en[9]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_9[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_9[0]),
  .busy(busy[9]),
  .c_out() // NC
  );

assign d_out_10[1] = 1'b1;
fifo #(10) f10(
  /* inputs */
  .d_in(write0[10] ? d_in0 : d_in1),
  .enq(write0[10] | write1[10]),
  .deq(~conf_en & read_en[10]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_10[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_10[0]),
  .busy(busy[10]),
  .c_out() // NC
  );

assign d_out_11[1] = 1'b1;
fifo #(11) f11(
  /* inputs */
  .d_in(write0[11] ? d_in0 : d_in1),
  .enq(write0[11] | write1[11]),
  .deq(~conf_en & read_en[11]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_11[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_11[0]),
  .busy(busy[11]),
  .c_out() // NC
  );

assign d_out_12[1] = 1'b1;
fifo #(12) f12(
  /* inputs */
  .d_in(write0[12] ? d_in0 : d_in1),
  .enq(write0[12] | write1[12]),
  .deq(~conf_en & read_en[12]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_12[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_12[0]),
  .busy(busy[12]),
  .c_out() // NC
  );

assign d_out_13[1] = 1'b1;
fifo #(13) f13(
  /* inputs */
  .d_in(write0[13] ? d_in0 : d_in1),
  .enq(write0[13] | write1[13]),
  .deq(~conf_en & read_en[13]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_13[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_13[0]),
  .busy(busy[13]),
  .c_out() // NC
  );

assign d_out_14[1] = 1'b1;
fifo #(14) f14(
  /* inputs */
  .d_in(write0[14] ? d_in0 : d_in1),
  .enq(write0[14] | write1[14]),
  .deq(~conf_en & read_en[14]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_14[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_14[0]),
  .busy(busy[14]),
  .c_out() // NC
  );

assign d_out_15[1] = 1'b1;
fifo #(15) f15(
  /* inputs */
  .d_in(write0[15] ? d_in0 : d_in1),
  .enq(write0[15] | write1[15]),
  .deq(~conf_en & read_en[15]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_15[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_15[0]),
  .busy(busy[15]),
  .c_out() // NC
  );

assign d_out_16[1] = 1'b1;
fifo #(16) f16(
  /* inputs */
  .d_in(write0[16] ? d_in0 : d_in1),
  .enq(write0[16] | write1[16]),
  .deq(~conf_en & read_en[16]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_16[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_16[0]),
  .busy(busy[16]),
  .c_out() // NC
  );

assign d_out_17[1] = 1'b1;
fifo #(17) f17(
  /* inputs */
  .d_in(write0[17] ? d_in0 : d_in1),
  .enq(write0[17] | write1[17]),
  .deq(~conf_en & read_en[17]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_17[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_17[0]),
  .busy(busy[17]),
  .c_out() // NC
  );

assign d_out_18[1] = 1'b1;
fifo #(18) f18(
  /* inputs */
  .d_in(write0[18] ? d_in0 : d_in1),
  .enq(write0[18] | write1[18]),
  .deq(~conf_en & read_en[18]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_18[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_18[0]),
  .busy(busy[18]),
  .c_out() // NC
  );

assign d_out_19[1] = 1'b1;
fifo #(19) f19(
  /* inputs */
  .d_in(write0[19] ? d_in0 : d_in1),
  .enq(write0[19] | write1[19]),
  .deq(~conf_en & read_en[19]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_19[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_19[0]),
  .busy(busy[19]),
  .c_out() // NC
  );

assign d_out_20[1] = 1'b1;
fifo #(20) f20(
  /* inputs */
  .d_in(write0[20] ? d_in0 : d_in1),
  .enq(write0[20] | write1[20]),
  .deq(~conf_en & read_en[20]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_20[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_20[0]),
  .busy(busy[20]),
  .c_out() // NC
  );

assign d_out_21[1] = 1'b1;
fifo #(21) f21(
  /* inputs */
  .d_in(write0[21] ? d_in0 : d_in1),
  .enq(write0[21] | write1[21]),
  .deq(~conf_en & read_en[21]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_21[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_21[0]),
  .busy(busy[21]),
  .c_out() // NC
  );

assign d_out_22[1] = 1'b1;
fifo #(22) f22(
  /* inputs */
  .d_in(write0[22] ? d_in0 : d_in1),
  .enq(write0[22] | write1[22]),
  .deq(~conf_en & read_en[22]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_22[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_22[0]),
  .busy(busy[22]),
  .c_out() // NC
  );

assign d_out_23[1] = 1'b1;
fifo #(23) f23(
  /* inputs */
  .d_in(write0[23] ? d_in0 : d_in1),
  .enq(write0[23] | write1[23]),
  .deq(~conf_en & read_en[23]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_23[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_23[0]),
  .busy(busy[23]),
  .c_out() // NC
  );

assign d_out_24[1] = 1'b1;
fifo #(24) f24(
  /* inputs */
  .d_in(write0[24] ? d_in0 : d_in1),
  .enq(write0[24] | write1[24]),
  .deq(~conf_en & read_en[24]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_24[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_24[0]),
  .busy(busy[24]),
  .c_out() // NC
  );

assign d_out_25[1] = 1'b1;
fifo #(25) f25(
  /* inputs */
  .d_in(write0[25] ? d_in0 : d_in1),
  .enq(write0[25] | write1[25]),
  .deq(~conf_en & read_en[25]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_25[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_25[0]),
  .busy(busy[25]),
  .c_out() // NC
  );

assign d_out_26[1] = 1'b1;
fifo #(26) f26(
  /* inputs */
  .d_in(write0[26] ? d_in0 : d_in1),
  .enq(write0[26] | write1[26]),
  .deq(~conf_en & read_en[26]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_26[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_26[0]),
  .busy(busy[26]),
  .c_out() // NC
  );

assign d_out_27[1] = 1'b1;
fifo #(27) f27(
  /* inputs */
  .d_in(write0[27] ? d_in0 : d_in1),
  .enq(write0[27] | write1[27]),
  .deq(~conf_en & read_en[27]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_27[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_27[0]),
  .busy(busy[27]),
  .c_out() // NC
  );

assign d_out_28[1] = 1'b1;
fifo #(28) f28(
  /* inputs */
  .d_in(write0[28] ? d_in0 : d_in1),
  .enq(write0[28] | write1[28]),
  .deq(~conf_en & read_en[28]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_28[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_28[0]),
  .busy(busy[28]),
  .c_out() // NC
  );

assign d_out_29[1] = 1'b1;
fifo #(29) f29(
  /* inputs */
  .d_in(write0[29] ? d_in0 : d_in1),
  .enq(write0[29] | write1[29]),
  .deq(~conf_en & read_en[29]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_29[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_29[0]),
  .busy(busy[29]),
  .c_out() // NC
  );

assign d_out_30[1] = 1'b1;
fifo #(30) f30(
  /* inputs */
  .d_in(write0[30] ? d_in0 : d_in1),
  .enq(write0[30] | write1[30]),
  .deq(~conf_en & read_en[30]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_30[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_30[0]),
  .busy(busy[30]),
  .c_out() // NC
  );

assign d_out_31[1] = 1'b1;
fifo #(31) f31(
  /* inputs */
  .d_in(write0[31] ? d_in0 : d_in1),
  .enq(write0[31] | write1[31]),
  .deq(~conf_en & read_en[31]),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out(d_out_31[`PATH_WIDTH:`META_BITS]),
  .valid(d_out_31[0]),
  .busy(busy[31]),
  .c_out() // NC
  );

endmodule
