//dyser.v
//
//  this file was auto-generated
`include "config.v"

module dyser(
  /* inputs */
  // dyser_send
  send_data_r0,
  send_data_r1,
  send_port_r0,
  send_port_r1,
  send_en0,
  send_en1,
  // dyser_recv
  recv_port_r0,
  recv_port_r1,
  recv_en0,
  recv_en1,
  // dyser_init
  config_bits,
  config_en,
  // dyser_commit
  commit,
  // extra
  clk,
  rst,
  /* outputs */
  // dyser_send
  send_stall,
  // dyser_recv
  recv_data_r0,
  recv_data_r1,
  recv_stall
  );

/* inputs */
input [`DATA_WIDTH:0] send_data_r0;
input [`DATA_WIDTH:0] send_data_r1;
input [4:0] send_port_r0;
input [4:0] send_port_r1;
input  send_en0;
input  send_en1;
input [4:0] recv_port_r0;
input [4:0] recv_port_r1;
input  recv_en0;
input  recv_en1;
input [20:0] config_bits;
input  config_en;
input  commit;
input  clk;
input  rst;

/* outputs */
output  send_stall;
output [`DATA_WIDTH:0] recv_data_r0;
output [`DATA_WIDTH:0] recv_data_r1;
output  recv_stall;


////////////////////////////////////////////////
//
//    wires
//
////////////////////////////////////////////////

wire [`PATH_WIDTH:0] d_i_0;
wire [`PATH_WIDTH:0] d_i_1;
wire [`PATH_WIDTH:0] d_i_2;
wire [`PATH_WIDTH:0] d_i_3;
wire [`PATH_WIDTH:0] d_i_4;
wire [`PATH_WIDTH:0] d_i_5;
wire [`PATH_WIDTH:0] d_i_6;
wire [`PATH_WIDTH:0] d_i_7;
wire [`PATH_WIDTH:0] d_i_8;
wire [`PATH_WIDTH:0] d_i_9;
wire [`PATH_WIDTH:0] d_i_10;
wire [`PATH_WIDTH:0] d_i_11;
wire [`PATH_WIDTH:0] d_i_12;
wire [`PATH_WIDTH:0] d_i_13;
wire [`PATH_WIDTH:0] d_i_14;
wire [`PATH_WIDTH:0] d_i_15;
wire [`PATH_WIDTH:0] d_i_16;
wire [`PATH_WIDTH:0] d_i_17;
wire [`PATH_WIDTH:0] d_i_18;
wire [`PATH_WIDTH:0] d_i_19;
wire [`PATH_WIDTH:0] d_i_20;
wire [`PATH_WIDTH:0] d_i_21;
wire [`PATH_WIDTH:0] d_i_22;
wire [`PATH_WIDTH:0] d_i_23;
wire [`PATH_WIDTH:0] d_i_24;
wire [`PATH_WIDTH:0] d_i_25;
wire [`PATH_WIDTH:0] d_i_26;
wire [`PATH_WIDTH:0] d_i_27;
wire [`PATH_WIDTH:0] d_i_28;
wire [`PATH_WIDTH:0] d_i_29;
wire [`PATH_WIDTH:0] d_i_30;
wire [`PATH_WIDTH:0] d_i_31;
wire c_i_0;
wire c_i_1;
wire c_i_2;
wire c_i_3;
wire c_i_4;
wire c_i_5;
wire c_i_6;
wire c_i_7;
wire c_i_8;
wire c_i_9;
wire c_i_10;
wire c_i_11;
wire c_i_12;
wire c_i_13;
wire c_i_14;
wire c_i_15;
wire c_i_16;
wire c_i_17;
wire c_i_18;
wire c_i_19;
wire c_i_20;
wire c_i_21;
wire c_i_22;
wire c_i_23;
wire c_i_24;
wire c_i_25;
wire c_i_26;
wire c_i_27;
wire c_i_28;
wire c_i_29;
wire c_i_30;
wire c_i_31;
wire busy_i_0;
wire busy_i_1;

wire [`PATH_WIDTH:0] d_o_0;
wire [`PATH_WIDTH:0] d_o_1;
wire [`PATH_WIDTH:0] d_o_2;
wire [`PATH_WIDTH:0] d_o_3;
wire [`PATH_WIDTH:0] d_o_4;
wire [`PATH_WIDTH:0] d_o_5;
wire [`PATH_WIDTH:0] d_o_6;
wire [`PATH_WIDTH:0] d_o_7;
wire [`PATH_WIDTH:0] d_o_8;
wire [`PATH_WIDTH:0] d_o_9;
wire [`PATH_WIDTH:0] d_o_10;
wire [`PATH_WIDTH:0] d_o_11;
wire [`PATH_WIDTH:0] d_o_12;
wire [`PATH_WIDTH:0] d_o_13;
wire [`PATH_WIDTH:0] d_o_14;
wire [`PATH_WIDTH:0] d_o_15;
wire [`PATH_WIDTH:0] d_o_16;
wire [`PATH_WIDTH:0] d_o_17;
wire [`PATH_WIDTH:0] d_o_18;
wire [`PATH_WIDTH:0] d_o_19;
wire [`PATH_WIDTH:0] d_o_20;
wire [`PATH_WIDTH:0] d_o_21;
wire [`PATH_WIDTH:0] d_o_22;
wire [`PATH_WIDTH:0] d_o_23;
wire [`PATH_WIDTH:0] d_o_24;
wire [`PATH_WIDTH:0] d_o_25;
wire [`PATH_WIDTH:0] d_o_26;
wire [`PATH_WIDTH:0] d_o_27;
wire [`PATH_WIDTH:0] d_o_28;
wire [`PATH_WIDTH:0] d_o_29;
wire [`PATH_WIDTH:0] d_o_30;
wire [`PATH_WIDTH:0] d_o_31;
wire c_o_0;
wire c_o_1;
wire c_o_2;
wire c_o_3;
wire c_o_4;
wire c_o_5;
wire c_o_6;
wire c_o_7;
wire c_o_8;
wire c_o_9;
wire c_o_10;
wire c_o_11;
wire c_o_12;
wire c_o_13;
wire c_o_14;
wire c_o_15;
wire c_o_16;
wire c_o_17;
wire c_o_18;
wire c_o_19;
wire c_o_20;
wire c_o_21;
wire c_o_22;
wire c_o_23;
wire c_o_24;
wire c_o_25;
wire c_o_26;
wire c_o_27;
wire c_o_28;
wire c_o_29;
wire c_o_30;
wire c_o_31;
wire done_o_0;
wire done_o_1;

// stall signals
assign send_stall = (send_en0 &  busy_i_0) | (send_en1 &  busy_i_1);
assign recv_stall = (recv_en0 & ~done_o_0) | (recv_en1 & ~done_o_1);

input_bridge i0(
  /* inputs */
  .d_in0(send_data_r0),
  .d_in1(send_data_r1),
  .port0(send_port_r0),
  .port1(send_port_r1),
  .wr_en0(send_en0),
  .wr_en1(send_en1),
  .c_in_0(c_i_0),
  .c_in_1(c_i_1),
  .c_in_2(c_i_2),
  .c_in_3(c_i_3),
  .c_in_4(c_i_4),
  .c_in_5(c_i_5),
  .c_in_6(c_i_6),
  .c_in_7(c_i_7),
  .c_in_8(c_i_8),
  .c_in_9(c_i_9),
  .c_in_10(c_i_10),
  .c_in_11(c_i_11),
  .c_in_12(c_i_12),
  .c_in_13(c_i_13),
  .c_in_14(c_i_14),
  .c_in_15(c_i_15),
  .c_in_16(c_i_16),
  .c_in_17(c_i_17),
  .c_in_18(c_i_18),
  .c_in_19(c_i_19),
  .c_in_20(c_i_20),
  .c_in_21(c_i_21),
  .c_in_22(c_i_22),
  .c_in_23(c_i_23),
  .c_in_24(c_i_24),
  .c_in_25(c_i_25),
  .c_in_26(c_i_26),
  .c_in_27(c_i_27),
  .c_in_28(c_i_28),
  .c_in_29(c_i_29),
  .c_in_30(c_i_30),
  .c_in_31(c_i_31),
  .conf_en(config_en),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .d_out_0(d_i_0),
  .d_out_1(d_i_1),
  .d_out_2(d_i_2),
  .d_out_3(d_i_3),
  .d_out_4(d_i_4),
  .d_out_5(d_i_5),
  .d_out_6(d_i_6),
  .d_out_7(d_i_7),
  .d_out_8(d_i_8),
  .d_out_9(d_i_9),
  .d_out_10(d_i_10),
  .d_out_11(d_i_11),
  .d_out_12(d_i_12),
  .d_out_13(d_i_13),
  .d_out_14(d_i_14),
  .d_out_15(d_i_15),
  .d_out_16(d_i_16),
  .d_out_17(d_i_17),
  .d_out_18(d_i_18),
  .d_out_19(d_i_19),
  .d_out_20(d_i_20),
  .d_out_21(d_i_21),
  .d_out_22(d_i_22),
  .d_out_23(d_i_23),
  .d_out_24(d_i_24),
  .d_out_25(d_i_25),
  .d_out_26(d_i_26),
  .d_out_27(d_i_27),
  .d_out_28(d_i_28),
  .d_out_29(d_i_29),
  .d_out_30(d_i_30),
  .d_out_31(d_i_31),
  .busy0(busy_i_0),
  .busy1(busy_i_1)
  );

output_bridge o0(
  /* inputs */
  .port0(recv_port_r0),
  .port1(recv_port_r1),
  .rd_en0(recv_en0),
  .rd_en1(recv_en1),
  .d_in_0(d_o_0),
  .d_in_1(d_o_1),
  .d_in_2(d_o_2),
  .d_in_3(d_o_3),
  .d_in_4(d_o_4),
  .d_in_5(d_o_5),
  .d_in_6(d_o_6),
  .d_in_7(d_o_7),
  .d_in_8(d_o_8),
  .d_in_9(d_o_9),
  .d_in_10(d_o_10),
  .d_in_11(d_o_11),
  .d_in_12(d_o_12),
  .d_in_13(d_o_13),
  .d_in_14(d_o_14),
  .d_in_15(d_o_15),
  .d_in_16(d_o_16),
  .d_in_17(d_o_17),
  .d_in_18(d_o_18),
  .d_in_19(d_o_19),
  .d_in_20(d_o_20),
  .d_in_21(d_o_21),
  .d_in_22(d_o_22),
  .d_in_23(d_o_23),
  .d_in_24(d_o_24),
  .d_in_25(d_o_25),
  .d_in_26(d_o_26),
  .d_in_27(d_o_27),
  .d_in_28(d_o_28),
  .d_in_29(d_o_29),
  .d_in_30(d_o_30),
  .d_in_31(d_o_31),
  .conf_en(config_en),
  .clk(clk),
  .rst(rst),
  /* outputs */
  .c_out_0(c_o_0),
  .c_out_1(c_o_1),
  .c_out_2(c_o_2),
  .c_out_3(c_o_3),
  .c_out_4(c_o_4),
  .c_out_5(c_o_5),
  .c_out_6(c_o_6),
  .c_out_7(c_o_7),
  .c_out_8(c_o_8),
  .c_out_9(c_o_9),
  .c_out_10(c_o_10),
  .c_out_11(c_o_11),
  .c_out_12(c_o_12),
  .c_out_13(c_o_13),
  .c_out_14(c_o_14),
  .c_out_15(c_o_15),
  .c_out_16(c_o_16),
  .c_out_17(c_o_17),
  .c_out_18(c_o_18),
  .c_out_19(c_o_19),
  .c_out_20(c_o_20),
  .c_out_21(c_o_21),
  .c_out_22(c_o_22),
  .c_out_23(c_o_23),
  .c_out_24(c_o_24),
  .c_out_25(c_o_25),
  .c_out_26(c_o_26),
  .c_out_27(c_o_27),
  .c_out_28(c_o_28),
  .c_out_29(c_o_29),
  .c_out_30(c_o_30),
  .c_out_31(c_o_31),
  .d_out0(recv_data_r0),
  .d_out1(recv_data_r1),
  .done0(done_o_0),
  .done1(done_o_1)
  );

// Multiplex the configuration bits into the Core's existing data network
wire   [`PATH_WIDTH:0] di0_or_conf;
assign di0_or_conf = (config_en ? (`CONF_WIDTH == `PATH_WIDTH ? config_bits[`CONF_WIDTH:0] : {d_i_0[`PATH_WIDTH:`CONF_BITS], config_bits[`CONF_WIDTH:0]}) : d_i_0);

core c0(
  /* inputs */
  // data from input bridge
  .d_in_0(di0_or_conf),
  .d_in_1(d_i_1),
  .d_in_2(d_i_2),
  .d_in_3(d_i_3),
  .d_in_4(d_i_4),
  .d_in_5(d_i_5),
  .d_in_6(d_i_6),
  .d_in_7(d_i_7),
  .d_in_8(d_i_8),
  .d_in_9(d_i_9),
  .d_in_10(d_i_10),
  .d_in_11(d_i_11),
  .d_in_12(d_i_12),
  .d_in_13(d_i_13),
  .d_in_14(d_i_14),
  .d_in_15(d_i_15),
  .d_in_16(d_i_16),
  .d_in_17(d_i_17),
  .d_in_18(d_i_18),
  .d_in_19(d_i_19),
  .d_in_20(d_i_20),
  .d_in_21(d_i_21),
  .d_in_22(d_i_22),
  .d_in_23(d_i_23),
  .d_in_24(d_i_24),
  .d_in_25(d_i_25),
  .d_in_26(d_i_26),
  .d_in_27(d_i_27),
  .d_in_28(d_i_28),
  .d_in_29(d_i_29),
  .d_in_30(d_i_30),
  .d_in_31(d_i_31),
  // credit from output bridge
  .c_in_0(c_o_0),
  .c_in_1(c_o_1),
  .c_in_2(c_o_2),
  .c_in_3(c_o_3),
  .c_in_4(c_o_4),
  .c_in_5(c_o_5),
  .c_in_6(c_o_6),
  .c_in_7(c_o_7),
  .c_in_8(c_o_8),
  .c_in_9(c_o_9),
  .c_in_10(c_o_10),
  .c_in_11(c_o_11),
  .c_in_12(c_o_12),
  .c_in_13(c_o_13),
  .c_in_14(c_o_14),
  .c_in_15(c_o_15),
  .c_in_16(c_o_16),
  .c_in_17(c_o_17),
  .c_in_18(c_o_18),
  .c_in_19(c_o_19),
  .c_in_20(c_o_20),
  .c_in_21(c_o_21),
  .c_in_22(c_o_22),
  .c_in_23(c_o_23),
  .c_in_24(c_o_24),
  .c_in_25(c_o_25),
  .c_in_26(c_o_26),
  .c_in_27(c_o_27),
  .c_in_28(c_o_28),
  .c_in_29(c_o_29),
  .c_in_30(c_o_30),
  .c_in_31(c_o_31),
  .conf_en(config_en),
  .clk(clk),
  .rst(rst),
  /* outputs */
  // data to output bridge
  .d_out_0(d_o_0),
  .d_out_1(d_o_1),
  .d_out_2(d_o_2),
  .d_out_3(d_o_3),
  .d_out_4(d_o_4),
  .d_out_5(d_o_5),
  .d_out_6(d_o_6),
  .d_out_7(d_o_7),
  .d_out_8(d_o_8),
  .d_out_9(d_o_9),
  .d_out_10(d_o_10),
  .d_out_11(d_o_11),
  .d_out_12(d_o_12),
  .d_out_13(d_o_13),
  .d_out_14(d_o_14),
  .d_out_15(d_o_15),
  .d_out_16(d_o_16),
  .d_out_17(d_o_17),
  .d_out_18(d_o_18),
  .d_out_19(d_o_19),
  .d_out_20(d_o_20),
  .d_out_21(d_o_21),
  .d_out_22(d_o_22),
  .d_out_23(d_o_23),
  .d_out_24(d_o_24),
  .d_out_25(d_o_25),
  .d_out_26(d_o_26),
  .d_out_27(d_o_27),
  .d_out_28(d_o_28),
  .d_out_29(d_o_29),
  .d_out_30(d_o_30),
  .d_out_31(d_o_31),
  // credit to input bridge
  .c_out_0(c_i_0),
  .c_out_1(c_i_1),
  .c_out_2(c_i_2),
  .c_out_3(c_i_3),
  .c_out_4(c_i_4),
  .c_out_5(c_i_5),
  .c_out_6(c_i_6),
  .c_out_7(c_i_7),
  .c_out_8(c_i_8),
  .c_out_9(c_i_9),
  .c_out_10(c_i_10),
  .c_out_11(c_i_11),
  .c_out_12(c_i_12),
  .c_out_13(c_i_13),
  .c_out_14(c_i_14),
  .c_out_15(c_i_15),
  .c_out_16(c_i_16),
  .c_out_17(c_i_17),
  .c_out_18(c_i_18),
  .c_out_19(c_i_19),
  .c_out_20(c_i_20),
  .c_out_21(c_i_21),
  .c_out_22(c_i_22),
  .c_out_23(c_i_23),
  .c_out_24(c_i_24),
  .c_out_25(c_i_25),
  .c_out_26(c_i_26),
  .c_out_27(c_i_27),
  .c_out_28(c_i_28),
  .c_out_29(c_i_29),
  .c_out_30(c_i_30),
  .c_out_31(c_i_31)
  );

endmodule
