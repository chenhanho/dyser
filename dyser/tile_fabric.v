//tile_fabric.v
//
//  this file was auto-generated
`include "dyser_config.v"

module tile_fabric(
  /* inputs */
  // data from edge fabric
  d_in_e0,
  d_in_e1,
  d_in_e2,
  d_in_e3,
  d_in_e4,
  d_in_e5,
  d_in_e6,
  d_in_e7,
  d_in_e8,
  d_in_e9,
  d_in_e10,
  d_in_e11,
  d_in_e12,
  d_in_e13,
  d_in_e14,
  d_in_e15,
  d_in_e16,
  d_in_e17,
  d_in_e18,
  d_in_e19,
  d_in_e20,
  d_in_e21,
  d_in_e22,
  d_in_e23,
  d_in_e24,
  d_in_e25,
  d_in_e26,
  d_in_e27,
  d_in_e28,
  // credit from output bridge
  c_in_o0,
  c_in_o1,
  c_in_o2,
  c_in_o3,
  c_in_o4,
  c_in_o5,
  c_in_o6,
  c_in_o7,
  c_in_o8,
  c_in_o9,
  c_in_o10,
  c_in_o11,
  c_in_o12,
  c_in_o13,
  c_in_o14,
  c_in_o15,
  c_in_o16,
  c_in_o17,
  // credit from edge fabric
  c_in_e0,
  c_in_e1,
  c_in_e2,
  c_in_e3,
  c_in_e4,
  c_in_e5,
  c_in_e6,
  c_in_e7,
  c_in_e8,
  c_in_e9,
  // --
  clk,
  rst_n,
  conf_en,
  /* outputs */
  // data to edge fabric
  d_out_e0,
  d_out_e1,
  d_out_e2,
  d_out_e3,
  d_out_e4,
  d_out_e5,
  d_out_e6,
  d_out_e7,
  d_out_e8,
  d_out_e9,
  // data to core output bridge
  d_out_o0,
  d_out_o1,
  d_out_o2,
  d_out_o3,
  d_out_o4,
  d_out_o5,
  d_out_o6,
  d_out_o7,
  d_out_o8,
  d_out_o9,
  d_out_o10,
  d_out_o11,
  d_out_o12,
  d_out_o13,
  d_out_o14,
  d_out_o15,
  d_out_o16,
  d_out_o17,
  // credit to edge fabric
  c_out_e0,
  c_out_e1,
  c_out_e2,
  c_out_e3,
  c_out_e4,
  c_out_e5,
  c_out_e6,
  c_out_e7,
  c_out_e8,
  c_out_e9,
  c_out_e10,
  c_out_e11,
  c_out_e12,
  c_out_e13,
  c_out_e14,
  c_out_e15,
  c_out_e16,
  c_out_e17,
  c_out_e18,
  c_out_e19,
  c_out_e20,
  c_out_e21,
  c_out_e22,
  c_out_e23,
  c_out_e24,
  c_out_e25,
  c_out_e26,
  c_out_e27,
  c_out_e28
  );

/* inputs */
input [`PATH_WIDTH:0] d_in_e0;
input [`PATH_WIDTH:0] d_in_e1;
input [`PATH_WIDTH:0] d_in_e2;
input [`PATH_WIDTH:0] d_in_e3;
input [`PATH_WIDTH:0] d_in_e4;
input [`PATH_WIDTH:0] d_in_e5;
input [`PATH_WIDTH:0] d_in_e6;
input [`PATH_WIDTH:0] d_in_e7;
input [`PATH_WIDTH:0] d_in_e8;
input [`PATH_WIDTH:0] d_in_e9;
input [`PATH_WIDTH:0] d_in_e10;
input [`PATH_WIDTH:0] d_in_e11;
input [`PATH_WIDTH:0] d_in_e12;
input [`PATH_WIDTH:0] d_in_e13;
input [`PATH_WIDTH:0] d_in_e14;
input [`PATH_WIDTH:0] d_in_e15;
input [`PATH_WIDTH:0] d_in_e16;
input [`PATH_WIDTH:0] d_in_e17;
input [`PATH_WIDTH:0] d_in_e18;
input [`PATH_WIDTH:0] d_in_e19;
input [`PATH_WIDTH:0] d_in_e20;
input [`PATH_WIDTH:0] d_in_e21;
input [`PATH_WIDTH:0] d_in_e22;
input [`PATH_WIDTH:0] d_in_e23;
input [`PATH_WIDTH:0] d_in_e24;
input [`PATH_WIDTH:0] d_in_e25;
input [`PATH_WIDTH:0] d_in_e26;
input [`PATH_WIDTH:0] d_in_e27;
input [`PATH_WIDTH:0] d_in_e28;
input  c_in_o0;
input  c_in_o1;
input  c_in_o2;
input  c_in_o3;
input  c_in_o4;
input  c_in_o5;
input  c_in_o6;
input  c_in_o7;
input  c_in_o8;
input  c_in_o9;
input  c_in_o10;
input  c_in_o11;
input  c_in_o12;
input  c_in_o13;
input  c_in_o14;
input  c_in_o15;
input  c_in_o16;
input  c_in_o17;
input  c_in_e0;
input  c_in_e1;
input  c_in_e2;
input  c_in_e3;
input  c_in_e4;
input  c_in_e5;
input  c_in_e6;
input  c_in_e7;
input  c_in_e8;
input  c_in_e9;
input  clk;
input  rst_n;
input  conf_en;

/* outputs */
output [`PATH_WIDTH:0] d_out_e0;
output [`PATH_WIDTH:0] d_out_e1;
output [`PATH_WIDTH:0] d_out_e2;
output [`PATH_WIDTH:0] d_out_e3;
output [`PATH_WIDTH:0] d_out_e4;
output [`PATH_WIDTH:0] d_out_e5;
output [`PATH_WIDTH:0] d_out_e6;
output [`PATH_WIDTH:0] d_out_e7;
output [`PATH_WIDTH:0] d_out_e8;
output [`PATH_WIDTH:0] d_out_e9;
output [`PATH_WIDTH:0] d_out_o0;
output [`PATH_WIDTH:0] d_out_o1;
output [`PATH_WIDTH:0] d_out_o2;
output [`PATH_WIDTH:0] d_out_o3;
output [`PATH_WIDTH:0] d_out_o4;
output [`PATH_WIDTH:0] d_out_o5;
output [`PATH_WIDTH:0] d_out_o6;
output [`PATH_WIDTH:0] d_out_o7;
output [`PATH_WIDTH:0] d_out_o8;
output [`PATH_WIDTH:0] d_out_o9;
output [`PATH_WIDTH:0] d_out_o10;
output [`PATH_WIDTH:0] d_out_o11;
output [`PATH_WIDTH:0] d_out_o12;
output [`PATH_WIDTH:0] d_out_o13;
output [`PATH_WIDTH:0] d_out_o14;
output [`PATH_WIDTH:0] d_out_o15;
output [`PATH_WIDTH:0] d_out_o16;
output [`PATH_WIDTH:0] d_out_o17;
output  c_out_e0;
output  c_out_e1;
output  c_out_e2;
output  c_out_e3;
output  c_out_e4;
output  c_out_e5;
output  c_out_e6;
output  c_out_e7;
output  c_out_e8;
output  c_out_e9;
output  c_out_e10;
output  c_out_e11;
output  c_out_e12;
output  c_out_e13;
output  c_out_e14;
output  c_out_e15;
output  c_out_e16;
output  c_out_e17;
output  c_out_e18;
output  c_out_e19;
output  c_out_e20;
output  c_out_e21;
output  c_out_e22;
output  c_out_e23;
output  c_out_e24;
output  c_out_e25;
output  c_out_e26;
output  c_out_e27;
output  c_out_e28;


////////////////////////////////////////////////
//
//    tiles and wires
//
////////////////////////////////////////////////

/* tile 0 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_0_1, d_o_0_1, d_0_6, d_0_5, d_o_0_5;
wire c_o_0_5, c_o_0_1;
/* tile 0 input wires (credit and data lines) */
wire c_1_0, c_o_1_0, c_6_0, c_5_0, c_o_5_0;
wire [`PATH_WIDTH:0] d_o_5_0, d_o_1_0;

tile #(0, 0, `WEST, `EAST) t0(
  /* inputs */
  .d_in_f_NW(d_in_e0),
  .d_in_f_NE(d_in_e1),
  .d_in_f_SW(d_in_e15),
  .d_in_s_N(d_in_e2),
  .d_in_s_E(d_o_1_0),
  .d_in_s_S(d_o_5_0),
  .d_in_s_W(d_in_e16),
  .c_in_s_N(c_in_e0),
  .c_in_s_NE(c_1_0),
  .c_in_s_E(c_o_1_0),
  .c_in_s_SE(c_6_0),
  .c_in_s_S(c_o_5_0),
  .c_in_s_SW(c_5_0),
  .c_in_s_W(c_in_e5),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e0),
  .d_out_s_NE(d_0_1),
  .d_out_s_E(d_o_0_1),
  .d_out_s_SE(d_0_6),
  .d_out_s_S(d_o_0_5),
  .d_out_s_SW(d_0_5),
  .d_out_s_W(d_out_e5),
  .c_out_f_NW(c_out_e0),
  .c_out_f_NE(c_out_e1),
  .c_out_f_SW(c_out_e15),
  .c_out_s_N(c_out_e2),
  .c_out_s_E(c_o_0_1),
  .c_out_s_S(c_o_0_5),
  .c_out_s_W(c_out_e16)
  );

/* tile 1 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_1_2, d_o_1_2, d_1_7, d_1_6, d_o_1_6;
wire c_o_1_6, c_o_1_2;
/* tile 1 input wires (credit and data lines) */
wire c_2_1, c_o_2_1, c_7_1, c_6_1, c_o_6_1;
wire [`PATH_WIDTH:0] d_o_6_1, d_o_2_1;

tile #(1, 0, `WEST, `EAST) t1(
  /* inputs */
  .d_in_f_NW(d_in_e3),
  .d_in_f_NE(d_in_e4),
  .d_in_f_SW(d_0_1),
  .d_in_s_N(d_in_e5),
  .d_in_s_E(d_o_2_1),
  .d_in_s_S(d_o_6_1),
  .d_in_s_W(d_o_0_1),
  .c_in_s_N(c_in_e1),
  .c_in_s_NE(c_2_1),
  .c_in_s_E(c_o_2_1),
  .c_in_s_SE(c_7_1),
  .c_in_s_S(c_o_6_1),
  .c_in_s_SW(c_6_1),
  .c_in_s_W(c_o_0_1),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e1),
  .d_out_s_NE(d_1_2),
  .d_out_s_E(d_o_1_2),
  .d_out_s_SE(d_1_7),
  .d_out_s_S(d_o_1_6),
  .d_out_s_SW(d_1_6),
  .d_out_s_W(d_o_1_0),
  .c_out_f_NW(c_out_e3),
  .c_out_f_NE(c_out_e4),
  .c_out_f_SW(c_1_0),
  .c_out_s_N(c_out_e5),
  .c_out_s_E(c_o_1_2),
  .c_out_s_S(c_o_1_6),
  .c_out_s_W(c_o_1_0)
  );

/* tile 2 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_2_3, d_o_2_3, d_2_8, d_2_7, d_o_2_7;
wire c_o_2_7, c_o_2_3;
/* tile 2 input wires (credit and data lines) */
wire c_3_2, c_o_3_2, c_8_2, c_7_2, c_o_7_2;
wire [`PATH_WIDTH:0] d_o_7_2, d_o_3_2;

tile #(2, 0, `WEST, `EAST) t2(
  /* inputs */
  .d_in_f_NW(d_in_e6),
  .d_in_f_NE(d_in_e7),
  .d_in_f_SW(d_1_2),
  .d_in_s_N(d_in_e8),
  .d_in_s_E(d_o_3_2),
  .d_in_s_S(d_o_7_2),
  .d_in_s_W(d_o_1_2),
  .c_in_s_N(c_in_e2),
  .c_in_s_NE(c_3_2),
  .c_in_s_E(c_o_3_2),
  .c_in_s_SE(c_8_2),
  .c_in_s_S(c_o_7_2),
  .c_in_s_SW(c_7_2),
  .c_in_s_W(c_o_1_2),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e2),
  .d_out_s_NE(d_2_3),
  .d_out_s_E(d_o_2_3),
  .d_out_s_SE(d_2_8),
  .d_out_s_S(d_o_2_7),
  .d_out_s_SW(d_2_7),
  .d_out_s_W(d_o_2_1),
  .c_out_f_NW(c_out_e6),
  .c_out_f_NE(c_out_e7),
  .c_out_f_SW(c_2_1),
  .c_out_s_N(c_out_e8),
  .c_out_s_E(c_o_2_3),
  .c_out_s_S(c_o_2_7),
  .c_out_s_W(c_o_2_1)
  );

/* tile 3 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_3_4, d_o_3_4, d_3_9, d_3_8, d_o_3_8;
wire c_o_3_8, c_o_3_4;
/* tile 3 input wires (credit and data lines) */
wire c_4_3, c_o_4_3, c_9_3, c_8_3, c_o_8_3;
wire [`PATH_WIDTH:0] d_o_8_3, d_o_4_3;

tile #(3, 0, `WEST, `EAST) t3(
  /* inputs */
  .d_in_f_NW(d_in_e9),
  .d_in_f_NE(d_in_e10),
  .d_in_f_SW(d_2_3),
  .d_in_s_N(d_in_e11),
  .d_in_s_E(d_o_4_3),
  .d_in_s_S(d_o_8_3),
  .d_in_s_W(d_o_2_3),
  .c_in_s_N(c_in_e3),
  .c_in_s_NE(c_4_3),
  .c_in_s_E(c_o_4_3),
  .c_in_s_SE(c_9_3),
  .c_in_s_S(c_o_8_3),
  .c_in_s_SW(c_8_3),
  .c_in_s_W(c_o_2_3),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e3),
  .d_out_s_NE(d_3_4),
  .d_out_s_E(d_o_3_4),
  .d_out_s_SE(d_3_9),
  .d_out_s_S(d_o_3_8),
  .d_out_s_SW(d_3_8),
  .d_out_s_W(d_o_3_2),
  .c_out_f_NW(c_out_e9),
  .c_out_f_NE(c_out_e10),
  .c_out_f_SW(c_3_2),
  .c_out_s_N(c_out_e11),
  .c_out_s_E(c_o_3_4),
  .c_out_s_S(c_o_3_8),
  .c_out_s_W(c_o_3_2)
  );

/* tile 4 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_4_9, d_o_4_9;
wire c_o_4_9;
/* tile 4 input wires (credit and data lines) */
wire c_9_4, c_o_9_4;
wire [`PATH_WIDTH:0] d_o_9_4;

tile #(4, 0, `WEST, `NORTH) t4(
  /* inputs */
  .d_in_f_NW(d_in_e12),
  .d_in_f_NE(d_in_e13),
  .d_in_f_SW(d_3_4),
  .d_in_s_N(d_in_e14),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_9_4),
  .d_in_s_W(d_o_3_4),
  .c_in_s_N(c_in_e4),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o17),
  .c_in_s_SE(c_in_o16),
  .c_in_s_S(c_o_9_4),
  .c_in_s_SW(c_9_4),
  .c_in_s_W(c_o_3_4),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e4),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o17),
  .d_out_s_SE(d_out_o16),
  .d_out_s_S(d_o_4_9),
  .d_out_s_SW(d_4_9),
  .d_out_s_W(d_o_4_3),
  .c_out_f_NW(c_out_e12),
  .c_out_f_NE(c_out_e13),
  .c_out_f_SW(c_4_3),
  .c_out_s_N(c_out_e14),
  .c_out_s_E(),
  .c_out_s_S(c_o_4_9),
  .c_out_s_W(c_o_4_3)
  );

/* tile 5 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_5_6, d_o_5_6, d_5_11, d_5_10, d_o_5_10;
wire c_o_5_10, c_o_5_6;
/* tile 5 input wires (credit and data lines) */
wire c_6_5, c_o_6_5, c_11_5, c_10_5, c_o_10_5;
wire [`PATH_WIDTH:0] d_o_10_5, d_o_6_5;

tile #(5, 0, `EAST, `WEST) t5(
  /* inputs */
  .d_in_f_NW(d_in_e17),
  .d_in_f_NE(d_0_5),
  .d_in_f_SW(d_in_e18),
  .d_in_s_N(d_o_0_5),
  .d_in_s_E(d_o_6_5),
  .d_in_s_S(d_o_10_5),
  .d_in_s_W(d_in_e19),
  .c_in_s_N(c_o_0_5),
  .c_in_s_NE(c_6_5),
  .c_in_s_E(c_o_6_5),
  .c_in_s_SE(c_11_5),
  .c_in_s_S(c_o_10_5),
  .c_in_s_SW(c_10_5),
  .c_in_s_W(c_in_e6),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_5_0),
  .d_out_s_NE(d_5_6),
  .d_out_s_E(d_o_5_6),
  .d_out_s_SE(d_5_11),
  .d_out_s_S(d_o_5_10),
  .d_out_s_SW(d_5_10),
  .d_out_s_W(d_out_e6),
  .c_out_f_NW(c_out_e17),
  .c_out_f_NE(c_5_0),
  .c_out_f_SW(c_out_e18),
  .c_out_s_N(c_o_5_0),
  .c_out_s_E(c_o_5_6),
  .c_out_s_S(c_o_5_10),
  .c_out_s_W(c_out_e19)
  );

/* tile 6 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_6_7, d_o_6_7, d_6_12, d_6_11, d_o_6_11;
wire c_o_6_11, c_o_6_7;
/* tile 6 input wires (credit and data lines) */
wire c_7_6, c_o_7_6, c_12_6, c_11_6, c_o_11_6;
wire [`PATH_WIDTH:0] d_o_11_6, d_o_7_6;

tile #(6, 0, `EAST, `WEST) t6(
  /* inputs */
  .d_in_f_NW(d_0_6),
  .d_in_f_NE(d_1_6),
  .d_in_f_SW(d_5_6),
  .d_in_s_N(d_o_1_6),
  .d_in_s_E(d_o_7_6),
  .d_in_s_S(d_o_11_6),
  .d_in_s_W(d_o_5_6),
  .c_in_s_N(c_o_1_6),
  .c_in_s_NE(c_7_6),
  .c_in_s_E(c_o_7_6),
  .c_in_s_SE(c_12_6),
  .c_in_s_S(c_o_11_6),
  .c_in_s_SW(c_11_6),
  .c_in_s_W(c_o_5_6),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_6_1),
  .d_out_s_NE(d_6_7),
  .d_out_s_E(d_o_6_7),
  .d_out_s_SE(d_6_12),
  .d_out_s_S(d_o_6_11),
  .d_out_s_SW(d_6_11),
  .d_out_s_W(d_o_6_5),
  .c_out_f_NW(c_6_0),
  .c_out_f_NE(c_6_1),
  .c_out_f_SW(c_6_5),
  .c_out_s_N(c_o_6_1),
  .c_out_s_E(c_o_6_7),
  .c_out_s_S(c_o_6_11),
  .c_out_s_W(c_o_6_5)
  );

/* tile 7 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_7_8, d_o_7_8, d_7_13, d_7_12, d_o_7_12;
wire c_o_7_12, c_o_7_8;
/* tile 7 input wires (credit and data lines) */
wire c_8_7, c_o_8_7, c_13_7, c_12_7, c_o_12_7;
wire [`PATH_WIDTH:0] d_o_12_7, d_o_8_7;

tile #(7, 0, `EAST, `WEST) t7(
  /* inputs */
  .d_in_f_NW(d_1_7),
  .d_in_f_NE(d_2_7),
  .d_in_f_SW(d_6_7),
  .d_in_s_N(d_o_2_7),
  .d_in_s_E(d_o_8_7),
  .d_in_s_S(d_o_12_7),
  .d_in_s_W(d_o_6_7),
  .c_in_s_N(c_o_2_7),
  .c_in_s_NE(c_8_7),
  .c_in_s_E(c_o_8_7),
  .c_in_s_SE(c_13_7),
  .c_in_s_S(c_o_12_7),
  .c_in_s_SW(c_12_7),
  .c_in_s_W(c_o_6_7),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_7_2),
  .d_out_s_NE(d_7_8),
  .d_out_s_E(d_o_7_8),
  .d_out_s_SE(d_7_13),
  .d_out_s_S(d_o_7_12),
  .d_out_s_SW(d_7_12),
  .d_out_s_W(d_o_7_6),
  .c_out_f_NW(c_7_1),
  .c_out_f_NE(c_7_2),
  .c_out_f_SW(c_7_6),
  .c_out_s_N(c_o_7_2),
  .c_out_s_E(c_o_7_8),
  .c_out_s_S(c_o_7_12),
  .c_out_s_W(c_o_7_6)
  );

/* tile 8 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_8_9, d_o_8_9, d_8_14, d_8_13, d_o_8_13;
wire c_o_8_13, c_o_8_9;
/* tile 8 input wires (credit and data lines) */
wire c_9_8, c_o_9_8, c_14_8, c_13_8, c_o_13_8;
wire [`PATH_WIDTH:0] d_o_13_8, d_o_9_8;

tile #(8, 0, `EAST, `WEST) t8(
  /* inputs */
  .d_in_f_NW(d_2_8),
  .d_in_f_NE(d_3_8),
  .d_in_f_SW(d_7_8),
  .d_in_s_N(d_o_3_8),
  .d_in_s_E(d_o_9_8),
  .d_in_s_S(d_o_13_8),
  .d_in_s_W(d_o_7_8),
  .c_in_s_N(c_o_3_8),
  .c_in_s_NE(c_9_8),
  .c_in_s_E(c_o_9_8),
  .c_in_s_SE(c_14_8),
  .c_in_s_S(c_o_13_8),
  .c_in_s_SW(c_13_8),
  .c_in_s_W(c_o_7_8),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_8_3),
  .d_out_s_NE(d_8_9),
  .d_out_s_E(d_o_8_9),
  .d_out_s_SE(d_8_14),
  .d_out_s_S(d_o_8_13),
  .d_out_s_SW(d_8_13),
  .d_out_s_W(d_o_8_7),
  .c_out_f_NW(c_8_2),
  .c_out_f_NE(c_8_3),
  .c_out_f_SW(c_8_7),
  .c_out_s_N(c_o_8_3),
  .c_out_s_E(c_o_8_9),
  .c_out_s_S(c_o_8_13),
  .c_out_s_W(c_o_8_7)
  );

/* tile 9 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_9_14, d_o_9_14;
wire c_o_9_14;
/* tile 9 input wires (credit and data lines) */
wire c_14_9, c_o_14_9;
wire [`PATH_WIDTH:0] d_o_14_9;

tile #(9, 0, `SOUTH, `WEST) t9(
  /* inputs */
  .d_in_f_NW(d_3_9),
  .d_in_f_NE(d_4_9),
  .d_in_f_SW(d_8_9),
  .d_in_s_N(d_o_4_9),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_14_9),
  .d_in_s_W(d_o_8_9),
  .c_in_s_N(c_o_4_9),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o15),
  .c_in_s_SE(c_in_o14),
  .c_in_s_S(c_o_14_9),
  .c_in_s_SW(c_14_9),
  .c_in_s_W(c_o_8_9),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_9_4),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o15),
  .d_out_s_SE(d_out_o14),
  .d_out_s_S(d_o_9_14),
  .d_out_s_SW(d_9_14),
  .d_out_s_W(d_o_9_8),
  .c_out_f_NW(c_9_3),
  .c_out_f_NE(c_9_4),
  .c_out_f_SW(c_9_8),
  .c_out_s_N(c_o_9_4),
  .c_out_s_E(),
  .c_out_s_S(c_o_9_14),
  .c_out_s_W(c_o_9_8)
  );

/* tile 10 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_10_11, d_o_10_11, d_10_16, d_10_15, d_o_10_15;
wire c_o_10_15, c_o_10_11;
/* tile 10 input wires (credit and data lines) */
wire c_11_10, c_o_11_10, c_16_10, c_15_10, c_o_15_10;
wire [`PATH_WIDTH:0] d_o_15_10, d_o_11_10;

tile #(10, 0, `WEST, `EAST) t10(
  /* inputs */
  .d_in_f_NW(d_in_e20),
  .d_in_f_NE(d_5_10),
  .d_in_f_SW(d_in_e21),
  .d_in_s_N(d_o_5_10),
  .d_in_s_E(d_o_11_10),
  .d_in_s_S(d_o_15_10),
  .d_in_s_W(d_in_e22),
  .c_in_s_N(c_o_5_10),
  .c_in_s_NE(c_11_10),
  .c_in_s_E(c_o_11_10),
  .c_in_s_SE(c_16_10),
  .c_in_s_S(c_o_15_10),
  .c_in_s_SW(c_15_10),
  .c_in_s_W(c_in_e7),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_10_5),
  .d_out_s_NE(d_10_11),
  .d_out_s_E(d_o_10_11),
  .d_out_s_SE(d_10_16),
  .d_out_s_S(d_o_10_15),
  .d_out_s_SW(d_10_15),
  .d_out_s_W(d_out_e7),
  .c_out_f_NW(c_out_e20),
  .c_out_f_NE(c_10_5),
  .c_out_f_SW(c_out_e21),
  .c_out_s_N(c_o_10_5),
  .c_out_s_E(c_o_10_11),
  .c_out_s_S(c_o_10_15),
  .c_out_s_W(c_out_e22)
  );

/* tile 11 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_11_12, d_o_11_12, d_11_17, d_11_16, d_o_11_16;
wire c_o_11_16, c_o_11_12;
/* tile 11 input wires (credit and data lines) */
wire c_12_11, c_o_12_11, c_17_11, c_16_11, c_o_16_11;
wire [`PATH_WIDTH:0] d_o_16_11, d_o_12_11;

tile #(11, 0, `WEST, `EAST) t11(
  /* inputs */
  .d_in_f_NW(d_5_11),
  .d_in_f_NE(d_6_11),
  .d_in_f_SW(d_10_11),
  .d_in_s_N(d_o_6_11),
  .d_in_s_E(d_o_12_11),
  .d_in_s_S(d_o_16_11),
  .d_in_s_W(d_o_10_11),
  .c_in_s_N(c_o_6_11),
  .c_in_s_NE(c_12_11),
  .c_in_s_E(c_o_12_11),
  .c_in_s_SE(c_17_11),
  .c_in_s_S(c_o_16_11),
  .c_in_s_SW(c_16_11),
  .c_in_s_W(c_o_10_11),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_11_6),
  .d_out_s_NE(d_11_12),
  .d_out_s_E(d_o_11_12),
  .d_out_s_SE(d_11_17),
  .d_out_s_S(d_o_11_16),
  .d_out_s_SW(d_11_16),
  .d_out_s_W(d_o_11_10),
  .c_out_f_NW(c_11_5),
  .c_out_f_NE(c_11_6),
  .c_out_f_SW(c_11_10),
  .c_out_s_N(c_o_11_6),
  .c_out_s_E(c_o_11_12),
  .c_out_s_S(c_o_11_16),
  .c_out_s_W(c_o_11_10)
  );

/* tile 12 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_12_13, d_o_12_13, d_12_18, d_12_17, d_o_12_17;
wire c_o_12_17, c_o_12_13;
/* tile 12 input wires (credit and data lines) */
wire c_13_12, c_o_13_12, c_18_12, c_17_12, c_o_17_12;
wire [`PATH_WIDTH:0] d_o_17_12, d_o_13_12;

tile #(12, 0, `WEST, `EAST) t12(
  /* inputs */
  .d_in_f_NW(d_6_12),
  .d_in_f_NE(d_7_12),
  .d_in_f_SW(d_11_12),
  .d_in_s_N(d_o_7_12),
  .d_in_s_E(d_o_13_12),
  .d_in_s_S(d_o_17_12),
  .d_in_s_W(d_o_11_12),
  .c_in_s_N(c_o_7_12),
  .c_in_s_NE(c_13_12),
  .c_in_s_E(c_o_13_12),
  .c_in_s_SE(c_18_12),
  .c_in_s_S(c_o_17_12),
  .c_in_s_SW(c_17_12),
  .c_in_s_W(c_o_11_12),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_12_7),
  .d_out_s_NE(d_12_13),
  .d_out_s_E(d_o_12_13),
  .d_out_s_SE(d_12_18),
  .d_out_s_S(d_o_12_17),
  .d_out_s_SW(d_12_17),
  .d_out_s_W(d_o_12_11),
  .c_out_f_NW(c_12_6),
  .c_out_f_NE(c_12_7),
  .c_out_f_SW(c_12_11),
  .c_out_s_N(c_o_12_7),
  .c_out_s_E(c_o_12_13),
  .c_out_s_S(c_o_12_17),
  .c_out_s_W(c_o_12_11)
  );

/* tile 13 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_13_14, d_o_13_14, d_13_19, d_13_18, d_o_13_18;
wire c_o_13_18, c_o_13_14;
/* tile 13 input wires (credit and data lines) */
wire c_14_13, c_o_14_13, c_19_13, c_18_13, c_o_18_13;
wire [`PATH_WIDTH:0] d_o_18_13, d_o_14_13;

tile #(13, 0, `WEST, `EAST) t13(
  /* inputs */
  .d_in_f_NW(d_7_13),
  .d_in_f_NE(d_8_13),
  .d_in_f_SW(d_12_13),
  .d_in_s_N(d_o_8_13),
  .d_in_s_E(d_o_14_13),
  .d_in_s_S(d_o_18_13),
  .d_in_s_W(d_o_12_13),
  .c_in_s_N(c_o_8_13),
  .c_in_s_NE(c_14_13),
  .c_in_s_E(c_o_14_13),
  .c_in_s_SE(c_19_13),
  .c_in_s_S(c_o_18_13),
  .c_in_s_SW(c_18_13),
  .c_in_s_W(c_o_12_13),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_13_8),
  .d_out_s_NE(d_13_14),
  .d_out_s_E(d_o_13_14),
  .d_out_s_SE(d_13_19),
  .d_out_s_S(d_o_13_18),
  .d_out_s_SW(d_13_18),
  .d_out_s_W(d_o_13_12),
  .c_out_f_NW(c_13_7),
  .c_out_f_NE(c_13_8),
  .c_out_f_SW(c_13_12),
  .c_out_s_N(c_o_13_8),
  .c_out_s_E(c_o_13_14),
  .c_out_s_S(c_o_13_18),
  .c_out_s_W(c_o_13_12)
  );

/* tile 14 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_14_19, d_o_14_19;
wire c_o_14_19;
/* tile 14 input wires (credit and data lines) */
wire c_19_14, c_o_19_14;
wire [`PATH_WIDTH:0] d_o_19_14;

tile #(14, 0, `WEST, `NORTH) t14(
  /* inputs */
  .d_in_f_NW(d_8_14),
  .d_in_f_NE(d_9_14),
  .d_in_f_SW(d_13_14),
  .d_in_s_N(d_o_9_14),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_19_14),
  .d_in_s_W(d_o_13_14),
  .c_in_s_N(c_o_9_14),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o13),
  .c_in_s_SE(c_in_o12),
  .c_in_s_S(c_o_19_14),
  .c_in_s_SW(c_19_14),
  .c_in_s_W(c_o_13_14),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_14_9),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o13),
  .d_out_s_SE(d_out_o12),
  .d_out_s_S(d_o_14_19),
  .d_out_s_SW(d_14_19),
  .d_out_s_W(d_o_14_13),
  .c_out_f_NW(c_14_8),
  .c_out_f_NE(c_14_9),
  .c_out_f_SW(c_14_13),
  .c_out_s_N(c_o_14_9),
  .c_out_s_E(),
  .c_out_s_S(c_o_14_19),
  .c_out_s_W(c_o_14_13)
  );

/* tile 15 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_15_16, d_o_15_16, d_15_21, d_15_20, d_o_15_20;
wire c_o_15_20, c_o_15_16;
/* tile 15 input wires (credit and data lines) */
wire c_16_15, c_o_16_15, c_21_15, c_20_15, c_o_20_15;
wire [`PATH_WIDTH:0] d_o_20_15, d_o_16_15;

tile #(15, 0, `EAST, `WEST) t15(
  /* inputs */
  .d_in_f_NW(d_in_e23),
  .d_in_f_NE(d_10_15),
  .d_in_f_SW(d_in_e24),
  .d_in_s_N(d_o_10_15),
  .d_in_s_E(d_o_16_15),
  .d_in_s_S(d_o_20_15),
  .d_in_s_W(d_in_e25),
  .c_in_s_N(c_o_10_15),
  .c_in_s_NE(c_16_15),
  .c_in_s_E(c_o_16_15),
  .c_in_s_SE(c_21_15),
  .c_in_s_S(c_o_20_15),
  .c_in_s_SW(c_20_15),
  .c_in_s_W(c_in_e8),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_15_10),
  .d_out_s_NE(d_15_16),
  .d_out_s_E(d_o_15_16),
  .d_out_s_SE(d_15_21),
  .d_out_s_S(d_o_15_20),
  .d_out_s_SW(d_15_20),
  .d_out_s_W(d_out_e8),
  .c_out_f_NW(c_out_e23),
  .c_out_f_NE(c_15_10),
  .c_out_f_SW(c_out_e24),
  .c_out_s_N(c_o_15_10),
  .c_out_s_E(c_o_15_16),
  .c_out_s_S(c_o_15_20),
  .c_out_s_W(c_out_e25)
  );

/* tile 16 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_16_17, d_o_16_17, d_16_22, d_16_21, d_o_16_21;
wire c_o_16_21, c_o_16_17;
/* tile 16 input wires (credit and data lines) */
wire c_17_16, c_o_17_16, c_22_16, c_21_16, c_o_21_16;
wire [`PATH_WIDTH:0] d_o_21_16, d_o_17_16;

tile #(16, 0, `EAST, `WEST) t16(
  /* inputs */
  .d_in_f_NW(d_10_16),
  .d_in_f_NE(d_11_16),
  .d_in_f_SW(d_15_16),
  .d_in_s_N(d_o_11_16),
  .d_in_s_E(d_o_17_16),
  .d_in_s_S(d_o_21_16),
  .d_in_s_W(d_o_15_16),
  .c_in_s_N(c_o_11_16),
  .c_in_s_NE(c_17_16),
  .c_in_s_E(c_o_17_16),
  .c_in_s_SE(c_22_16),
  .c_in_s_S(c_o_21_16),
  .c_in_s_SW(c_21_16),
  .c_in_s_W(c_o_15_16),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_16_11),
  .d_out_s_NE(d_16_17),
  .d_out_s_E(d_o_16_17),
  .d_out_s_SE(d_16_22),
  .d_out_s_S(d_o_16_21),
  .d_out_s_SW(d_16_21),
  .d_out_s_W(d_o_16_15),
  .c_out_f_NW(c_16_10),
  .c_out_f_NE(c_16_11),
  .c_out_f_SW(c_16_15),
  .c_out_s_N(c_o_16_11),
  .c_out_s_E(c_o_16_17),
  .c_out_s_S(c_o_16_21),
  .c_out_s_W(c_o_16_15)
  );

/* tile 17 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_17_18, d_o_17_18, d_17_23, d_17_22, d_o_17_22;
wire c_o_17_22, c_o_17_18;
/* tile 17 input wires (credit and data lines) */
wire c_18_17, c_o_18_17, c_23_17, c_22_17, c_o_22_17;
wire [`PATH_WIDTH:0] d_o_22_17, d_o_18_17;

tile #(17, 0, `EAST, `WEST) t17(
  /* inputs */
  .d_in_f_NW(d_11_17),
  .d_in_f_NE(d_12_17),
  .d_in_f_SW(d_16_17),
  .d_in_s_N(d_o_12_17),
  .d_in_s_E(d_o_18_17),
  .d_in_s_S(d_o_22_17),
  .d_in_s_W(d_o_16_17),
  .c_in_s_N(c_o_12_17),
  .c_in_s_NE(c_18_17),
  .c_in_s_E(c_o_18_17),
  .c_in_s_SE(c_23_17),
  .c_in_s_S(c_o_22_17),
  .c_in_s_SW(c_22_17),
  .c_in_s_W(c_o_16_17),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_17_12),
  .d_out_s_NE(d_17_18),
  .d_out_s_E(d_o_17_18),
  .d_out_s_SE(d_17_23),
  .d_out_s_S(d_o_17_22),
  .d_out_s_SW(d_17_22),
  .d_out_s_W(d_o_17_16),
  .c_out_f_NW(c_17_11),
  .c_out_f_NE(c_17_12),
  .c_out_f_SW(c_17_16),
  .c_out_s_N(c_o_17_12),
  .c_out_s_E(c_o_17_18),
  .c_out_s_S(c_o_17_22),
  .c_out_s_W(c_o_17_16)
  );

/* tile 18 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_18_19, d_o_18_19, d_18_24, d_18_23, d_o_18_23;
wire c_o_18_23, c_o_18_19;
/* tile 18 input wires (credit and data lines) */
wire c_19_18, c_o_19_18, c_24_18, c_23_18, c_o_23_18;
wire [`PATH_WIDTH:0] d_o_23_18, d_o_19_18;

tile #(18, 0, `EAST, `WEST) t18(
  /* inputs */
  .d_in_f_NW(d_12_18),
  .d_in_f_NE(d_13_18),
  .d_in_f_SW(d_17_18),
  .d_in_s_N(d_o_13_18),
  .d_in_s_E(d_o_19_18),
  .d_in_s_S(d_o_23_18),
  .d_in_s_W(d_o_17_18),
  .c_in_s_N(c_o_13_18),
  .c_in_s_NE(c_19_18),
  .c_in_s_E(c_o_19_18),
  .c_in_s_SE(c_24_18),
  .c_in_s_S(c_o_23_18),
  .c_in_s_SW(c_23_18),
  .c_in_s_W(c_o_17_18),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_18_13),
  .d_out_s_NE(d_18_19),
  .d_out_s_E(d_o_18_19),
  .d_out_s_SE(d_18_24),
  .d_out_s_S(d_o_18_23),
  .d_out_s_SW(d_18_23),
  .d_out_s_W(d_o_18_17),
  .c_out_f_NW(c_18_12),
  .c_out_f_NE(c_18_13),
  .c_out_f_SW(c_18_17),
  .c_out_s_N(c_o_18_13),
  .c_out_s_E(c_o_18_19),
  .c_out_s_S(c_o_18_23),
  .c_out_s_W(c_o_18_17)
  );

/* tile 19 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_19_24, d_o_19_24;
wire c_o_19_24;
/* tile 19 input wires (credit and data lines) */
wire c_24_19, c_o_24_19;
wire [`PATH_WIDTH:0] d_o_24_19;

tile #(19, 0, `SOUTH, `WEST) t19(
  /* inputs */
  .d_in_f_NW(d_13_19),
  .d_in_f_NE(d_14_19),
  .d_in_f_SW(d_18_19),
  .d_in_s_N(d_o_14_19),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_24_19),
  .d_in_s_W(d_o_18_19),
  .c_in_s_N(c_o_14_19),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o11),
  .c_in_s_SE(c_in_o10),
  .c_in_s_S(c_o_24_19),
  .c_in_s_SW(c_24_19),
  .c_in_s_W(c_o_18_19),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_19_14),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o11),
  .d_out_s_SE(d_out_o10),
  .d_out_s_S(d_o_19_24),
  .d_out_s_SW(d_19_24),
  .d_out_s_W(d_o_19_18),
  .c_out_f_NW(c_19_13),
  .c_out_f_NE(c_19_14),
  .c_out_f_SW(c_19_18),
  .c_out_s_N(c_o_19_14),
  .c_out_s_E(),
  .c_out_s_S(c_o_19_24),
  .c_out_s_W(c_o_19_18)
  );

/* tile 20 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_20_21, d_o_20_21;
wire c_o_20_21;
/* tile 20 input wires (credit and data lines) */
wire c_21_20, c_o_21_20;
wire [`PATH_WIDTH:0] d_o_21_20;

tile #(20, 0, `WEST, `EAST) t20(
  /* inputs */
  .d_in_f_NW(d_in_e26),
  .d_in_f_NE(d_15_20),
  .d_in_f_SW(d_in_e27),
  .d_in_s_N(d_o_15_20),
  .d_in_s_E(d_o_21_20),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_in_e28),
  .c_in_s_N(c_o_15_20),
  .c_in_s_NE(c_21_20),
  .c_in_s_E(c_o_21_20),
  .c_in_s_SE(c_in_o1),
  .c_in_s_S(c_in_o0),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_in_e9),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_20_15),
  .d_out_s_NE(d_20_21),
  .d_out_s_E(d_o_20_21),
  .d_out_s_SE(d_out_o1),
  .d_out_s_S(d_out_o0),
  .d_out_s_SW(),
  .d_out_s_W(d_out_e9),
  .c_out_f_NW(c_out_e26),
  .c_out_f_NE(c_20_15),
  .c_out_f_SW(c_out_e27),
  .c_out_s_N(c_o_20_15),
  .c_out_s_E(c_o_20_21),
  .c_out_s_S(),
  .c_out_s_W(c_out_e28)
  );

/* tile 21 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_21_22, d_o_21_22;
wire c_o_21_22;
/* tile 21 input wires (credit and data lines) */
wire c_22_21, c_o_22_21;
wire [`PATH_WIDTH:0] d_o_22_21;

tile #(21, 0, `WEST, `EAST) t21(
  /* inputs */
  .d_in_f_NW(d_15_21),
  .d_in_f_NE(d_16_21),
  .d_in_f_SW(d_20_21),
  .d_in_s_N(d_o_16_21),
  .d_in_s_E(d_o_22_21),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_20_21),
  .c_in_s_N(c_o_16_21),
  .c_in_s_NE(c_22_21),
  .c_in_s_E(c_o_22_21),
  .c_in_s_SE(c_in_o3),
  .c_in_s_S(c_in_o2),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_20_21),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_21_16),
  .d_out_s_NE(d_21_22),
  .d_out_s_E(d_o_21_22),
  .d_out_s_SE(d_out_o3),
  .d_out_s_S(d_out_o2),
  .d_out_s_SW(),
  .d_out_s_W(d_o_21_20),
  .c_out_f_NW(c_21_15),
  .c_out_f_NE(c_21_16),
  .c_out_f_SW(c_21_20),
  .c_out_s_N(c_o_21_16),
  .c_out_s_E(c_o_21_22),
  .c_out_s_S(),
  .c_out_s_W(c_o_21_20)
  );

/* tile 22 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_22_23, d_o_22_23;
wire c_o_22_23;
/* tile 22 input wires (credit and data lines) */
wire c_23_22, c_o_23_22;
wire [`PATH_WIDTH:0] d_o_23_22;

tile #(22, 0, `WEST, `EAST) t22(
  /* inputs */
  .d_in_f_NW(d_16_22),
  .d_in_f_NE(d_17_22),
  .d_in_f_SW(d_21_22),
  .d_in_s_N(d_o_17_22),
  .d_in_s_E(d_o_23_22),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_21_22),
  .c_in_s_N(c_o_17_22),
  .c_in_s_NE(c_23_22),
  .c_in_s_E(c_o_23_22),
  .c_in_s_SE(c_in_o5),
  .c_in_s_S(c_in_o4),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_21_22),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_22_17),
  .d_out_s_NE(d_22_23),
  .d_out_s_E(d_o_22_23),
  .d_out_s_SE(d_out_o5),
  .d_out_s_S(d_out_o4),
  .d_out_s_SW(),
  .d_out_s_W(d_o_22_21),
  .c_out_f_NW(c_22_16),
  .c_out_f_NE(c_22_17),
  .c_out_f_SW(c_22_21),
  .c_out_s_N(c_o_22_17),
  .c_out_s_E(c_o_22_23),
  .c_out_s_S(),
  .c_out_s_W(c_o_22_21)
  );

/* tile 23 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_23_24, d_o_23_24;
wire c_o_23_24;
/* tile 23 input wires (credit and data lines) */
wire c_24_23, c_o_24_23;
wire [`PATH_WIDTH:0] d_o_24_23;

tile #(23, 0, `WEST, `EAST) t23(
  /* inputs */
  .d_in_f_NW(d_17_23),
  .d_in_f_NE(d_18_23),
  .d_in_f_SW(d_22_23),
  .d_in_s_N(d_o_18_23),
  .d_in_s_E(d_o_24_23),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_22_23),
  .c_in_s_N(c_o_18_23),
  .c_in_s_NE(c_24_23),
  .c_in_s_E(c_o_24_23),
  .c_in_s_SE(c_in_o7),
  .c_in_s_S(c_in_o6),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_22_23),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_23_18),
  .d_out_s_NE(d_23_24),
  .d_out_s_E(d_o_23_24),
  .d_out_s_SE(d_out_o7),
  .d_out_s_S(d_out_o6),
  .d_out_s_SW(),
  .d_out_s_W(d_o_23_22),
  .c_out_f_NW(c_23_17),
  .c_out_f_NE(c_23_18),
  .c_out_f_SW(c_23_22),
  .c_out_s_N(c_o_23_18),
  .c_out_s_E(c_o_23_24),
  .c_out_s_S(),
  .c_out_s_W(c_o_23_22)
  );

/* tile 24 output wires (data and credit lines) */
/* tile 24 input wires (credit and data lines) */

tile #(24, 0, `WEST, `NORTH) t24(
  /* inputs */
  .d_in_f_NW(d_18_24),
  .d_in_f_NE(d_19_24),
  .d_in_f_SW(d_23_24),
  .d_in_s_N(d_o_19_24),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_23_24),
  .c_in_s_N(c_o_19_24),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o9),
  .c_in_s_SE(c_in_o8),
  .c_in_s_S(1'b0),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_23_24),
  .clk(clk),
  .rst_n(rst_n),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_24_19),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o9),
  .d_out_s_SE(d_out_o8),
  .d_out_s_S(),
  .d_out_s_SW(),
  .d_out_s_W(d_o_24_23),
  .c_out_f_NW(c_24_18),
  .c_out_f_NE(c_24_19),
  .c_out_f_SW(c_24_23),
  .c_out_s_N(c_o_24_19),
  .c_out_s_E(),
  .c_out_s_S(),
  .c_out_s_W(c_o_24_23)
  );

endmodule
