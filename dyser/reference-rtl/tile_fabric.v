//tile_fabric.v
//
//  this file was auto-generated
`include "config.v"

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
  d_in_e29,
  d_in_e30,
  d_in_e31,
  d_in_e32,
  d_in_e33,
  d_in_e34,
  d_in_e35,
  d_in_e36,
  d_in_e37,
  d_in_e38,
  d_in_e39,
  d_in_e40,
  d_in_e41,
  d_in_e42,
  d_in_e43,
  d_in_e44,
  d_in_e45,
  d_in_e46,
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
  c_in_o18,
  c_in_o19,
  c_in_o20,
  c_in_o21,
  c_in_o22,
  c_in_o23,
  c_in_o24,
  c_in_o25,
  c_in_o26,
  c_in_o27,
  c_in_o28,
  c_in_o29,
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
  c_in_e10,
  c_in_e11,
  c_in_e12,
  c_in_e13,
  c_in_e14,
  c_in_e15,
  // --
  clk,
  rst,
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
  d_out_e10,
  d_out_e11,
  d_out_e12,
  d_out_e13,
  d_out_e14,
  d_out_e15,
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
  d_out_o18,
  d_out_o19,
  d_out_o20,
  d_out_o21,
  d_out_o22,
  d_out_o23,
  d_out_o24,
  d_out_o25,
  d_out_o26,
  d_out_o27,
  d_out_o28,
  d_out_o29,
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
  c_out_e28,
  c_out_e29,
  c_out_e30,
  c_out_e31,
  c_out_e32,
  c_out_e33,
  c_out_e34,
  c_out_e35,
  c_out_e36,
  c_out_e37,
  c_out_e38,
  c_out_e39,
  c_out_e40,
  c_out_e41,
  c_out_e42,
  c_out_e43,
  c_out_e44,
  c_out_e45,
  c_out_e46
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
input [`PATH_WIDTH:0] d_in_e29;
input [`PATH_WIDTH:0] d_in_e30;
input [`PATH_WIDTH:0] d_in_e31;
input [`PATH_WIDTH:0] d_in_e32;
input [`PATH_WIDTH:0] d_in_e33;
input [`PATH_WIDTH:0] d_in_e34;
input [`PATH_WIDTH:0] d_in_e35;
input [`PATH_WIDTH:0] d_in_e36;
input [`PATH_WIDTH:0] d_in_e37;
input [`PATH_WIDTH:0] d_in_e38;
input [`PATH_WIDTH:0] d_in_e39;
input [`PATH_WIDTH:0] d_in_e40;
input [`PATH_WIDTH:0] d_in_e41;
input [`PATH_WIDTH:0] d_in_e42;
input [`PATH_WIDTH:0] d_in_e43;
input [`PATH_WIDTH:0] d_in_e44;
input [`PATH_WIDTH:0] d_in_e45;
input [`PATH_WIDTH:0] d_in_e46;
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
input  c_in_o18;
input  c_in_o19;
input  c_in_o20;
input  c_in_o21;
input  c_in_o22;
input  c_in_o23;
input  c_in_o24;
input  c_in_o25;
input  c_in_o26;
input  c_in_o27;
input  c_in_o28;
input  c_in_o29;
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
input  c_in_e10;
input  c_in_e11;
input  c_in_e12;
input  c_in_e13;
input  c_in_e14;
input  c_in_e15;
input  clk;
input  rst;
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
output [`PATH_WIDTH:0] d_out_e10;
output [`PATH_WIDTH:0] d_out_e11;
output [`PATH_WIDTH:0] d_out_e12;
output [`PATH_WIDTH:0] d_out_e13;
output [`PATH_WIDTH:0] d_out_e14;
output [`PATH_WIDTH:0] d_out_e15;
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
output [`PATH_WIDTH:0] d_out_o18;
output [`PATH_WIDTH:0] d_out_o19;
output [`PATH_WIDTH:0] d_out_o20;
output [`PATH_WIDTH:0] d_out_o21;
output [`PATH_WIDTH:0] d_out_o22;
output [`PATH_WIDTH:0] d_out_o23;
output [`PATH_WIDTH:0] d_out_o24;
output [`PATH_WIDTH:0] d_out_o25;
output [`PATH_WIDTH:0] d_out_o26;
output [`PATH_WIDTH:0] d_out_o27;
output [`PATH_WIDTH:0] d_out_o28;
output [`PATH_WIDTH:0] d_out_o29;
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
output  c_out_e29;
output  c_out_e30;
output  c_out_e31;
output  c_out_e32;
output  c_out_e33;
output  c_out_e34;
output  c_out_e35;
output  c_out_e36;
output  c_out_e37;
output  c_out_e38;
output  c_out_e39;
output  c_out_e40;
output  c_out_e41;
output  c_out_e42;
output  c_out_e43;
output  c_out_e44;
output  c_out_e45;
output  c_out_e46;


////////////////////////////////////////////////
//
//    tiles and wires
//
////////////////////////////////////////////////

/* tile 0 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_0_1, d_o_0_1, d_0_9, d_0_8, d_o_0_8;
wire c_o_0_8, c_o_0_1;
/* tile 0 input wires (credit and data lines) */
wire c_1_0, c_o_1_0, c_9_0, c_8_0, c_o_8_0;
wire [`PATH_WIDTH:0] d_o_8_0, d_o_1_0;

tile #(0, 1, 3) t0(
  /* inputs */
  .d_in_f_NW(d_in_e0),
  .d_in_f_NE(d_in_e1),
  .d_in_f_SW(d_in_e24),
  .d_in_s_N(d_in_e2),
  .d_in_s_E(d_o_1_0),
  .d_in_s_S(d_o_8_0),
  .d_in_s_W(d_in_e25),
  .c_in_s_N(c_in_e0),
  .c_in_s_NE(c_1_0),
  .c_in_s_E(c_o_1_0),
  .c_in_s_SE(c_9_0),
  .c_in_s_S(c_o_8_0),
  .c_in_s_SW(c_8_0),
  .c_in_s_W(c_in_e8),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e0),
  .d_out_s_NE(d_0_1),
  .d_out_s_E(d_o_0_1),
  .d_out_s_SE(d_0_9),
  .d_out_s_S(d_o_0_8),
  .d_out_s_SW(d_0_8),
  .d_out_s_W(d_out_e8),
  .c_out_f_NW(c_out_e0),
  .c_out_f_NE(c_out_e1),
  .c_out_f_SW(c_out_e24),
  .c_out_s_N(c_out_e2),
  .c_out_s_E(c_o_0_1),
  .c_out_s_S(c_o_0_8),
  .c_out_s_W(c_out_e25)
  );

/* tile 1 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_1_2, d_o_1_2, d_1_10, d_1_9, d_o_1_9;
wire c_o_1_9, c_o_1_2;
/* tile 1 input wires (credit and data lines) */
wire c_2_1, c_o_2_1, c_10_1, c_9_1, c_o_9_1;
wire [`PATH_WIDTH:0] d_o_9_1, d_o_2_1;

tile #(1, 1, 3) t1(
  /* inputs */
  .d_in_f_NW(d_in_e3),
  .d_in_f_NE(d_in_e4),
  .d_in_f_SW(d_0_1),
  .d_in_s_N(d_in_e5),
  .d_in_s_E(d_o_2_1),
  .d_in_s_S(d_o_9_1),
  .d_in_s_W(d_o_0_1),
  .c_in_s_N(c_in_e1),
  .c_in_s_NE(c_2_1),
  .c_in_s_E(c_o_2_1),
  .c_in_s_SE(c_10_1),
  .c_in_s_S(c_o_9_1),
  .c_in_s_SW(c_9_1),
  .c_in_s_W(c_o_0_1),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e1),
  .d_out_s_NE(d_1_2),
  .d_out_s_E(d_o_1_2),
  .d_out_s_SE(d_1_10),
  .d_out_s_S(d_o_1_9),
  .d_out_s_SW(d_1_9),
  .d_out_s_W(d_o_1_0),
  .c_out_f_NW(c_out_e3),
  .c_out_f_NE(c_out_e4),
  .c_out_f_SW(c_1_0),
  .c_out_s_N(c_out_e5),
  .c_out_s_E(c_o_1_2),
  .c_out_s_S(c_o_1_9),
  .c_out_s_W(c_o_1_0)
  );

/* tile 2 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_2_3, d_o_2_3, d_2_11, d_2_10, d_o_2_10;
wire c_o_2_10, c_o_2_3;
/* tile 2 input wires (credit and data lines) */
wire c_3_2, c_o_3_2, c_11_2, c_10_2, c_o_10_2;
wire [`PATH_WIDTH:0] d_o_10_2, d_o_3_2;

tile #(2, 1, 3) t2(
  /* inputs */
  .d_in_f_NW(d_in_e6),
  .d_in_f_NE(d_in_e7),
  .d_in_f_SW(d_1_2),
  .d_in_s_N(d_in_e8),
  .d_in_s_E(d_o_3_2),
  .d_in_s_S(d_o_10_2),
  .d_in_s_W(d_o_1_2),
  .c_in_s_N(c_in_e2),
  .c_in_s_NE(c_3_2),
  .c_in_s_E(c_o_3_2),
  .c_in_s_SE(c_11_2),
  .c_in_s_S(c_o_10_2),
  .c_in_s_SW(c_10_2),
  .c_in_s_W(c_o_1_2),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e2),
  .d_out_s_NE(d_2_3),
  .d_out_s_E(d_o_2_3),
  .d_out_s_SE(d_2_11),
  .d_out_s_S(d_o_2_10),
  .d_out_s_SW(d_2_10),
  .d_out_s_W(d_o_2_1),
  .c_out_f_NW(c_out_e6),
  .c_out_f_NE(c_out_e7),
  .c_out_f_SW(c_2_1),
  .c_out_s_N(c_out_e8),
  .c_out_s_E(c_o_2_3),
  .c_out_s_S(c_o_2_10),
  .c_out_s_W(c_o_2_1)
  );

/* tile 3 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_3_4, d_o_3_4, d_3_12, d_3_11, d_o_3_11;
wire c_o_3_11, c_o_3_4;
/* tile 3 input wires (credit and data lines) */
wire c_4_3, c_o_4_3, c_12_3, c_11_3, c_o_11_3;
wire [`PATH_WIDTH:0] d_o_11_3, d_o_4_3;

tile #(3, 1, 3) t3(
  /* inputs */
  .d_in_f_NW(d_in_e9),
  .d_in_f_NE(d_in_e10),
  .d_in_f_SW(d_2_3),
  .d_in_s_N(d_in_e11),
  .d_in_s_E(d_o_4_3),
  .d_in_s_S(d_o_11_3),
  .d_in_s_W(d_o_2_3),
  .c_in_s_N(c_in_e3),
  .c_in_s_NE(c_4_3),
  .c_in_s_E(c_o_4_3),
  .c_in_s_SE(c_12_3),
  .c_in_s_S(c_o_11_3),
  .c_in_s_SW(c_11_3),
  .c_in_s_W(c_o_2_3),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e3),
  .d_out_s_NE(d_3_4),
  .d_out_s_E(d_o_3_4),
  .d_out_s_SE(d_3_12),
  .d_out_s_S(d_o_3_11),
  .d_out_s_SW(d_3_11),
  .d_out_s_W(d_o_3_2),
  .c_out_f_NW(c_out_e9),
  .c_out_f_NE(c_out_e10),
  .c_out_f_SW(c_3_2),
  .c_out_s_N(c_out_e11),
  .c_out_s_E(c_o_3_4),
  .c_out_s_S(c_o_3_11),
  .c_out_s_W(c_o_3_2)
  );

/* tile 4 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_4_5, d_o_4_5, d_4_13, d_4_12, d_o_4_12;
wire c_o_4_12, c_o_4_5;
/* tile 4 input wires (credit and data lines) */
wire c_5_4, c_o_5_4, c_13_4, c_12_4, c_o_12_4;
wire [`PATH_WIDTH:0] d_o_12_4, d_o_5_4;

tile #(4, 1, 3) t4(
  /* inputs */
  .d_in_f_NW(d_in_e12),
  .d_in_f_NE(d_in_e13),
  .d_in_f_SW(d_3_4),
  .d_in_s_N(d_in_e14),
  .d_in_s_E(d_o_5_4),
  .d_in_s_S(d_o_12_4),
  .d_in_s_W(d_o_3_4),
  .c_in_s_N(c_in_e4),
  .c_in_s_NE(c_5_4),
  .c_in_s_E(c_o_5_4),
  .c_in_s_SE(c_13_4),
  .c_in_s_S(c_o_12_4),
  .c_in_s_SW(c_12_4),
  .c_in_s_W(c_o_3_4),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e4),
  .d_out_s_NE(d_4_5),
  .d_out_s_E(d_o_4_5),
  .d_out_s_SE(d_4_13),
  .d_out_s_S(d_o_4_12),
  .d_out_s_SW(d_4_12),
  .d_out_s_W(d_o_4_3),
  .c_out_f_NW(c_out_e12),
  .c_out_f_NE(c_out_e13),
  .c_out_f_SW(c_4_3),
  .c_out_s_N(c_out_e14),
  .c_out_s_E(c_o_4_5),
  .c_out_s_S(c_o_4_12),
  .c_out_s_W(c_o_4_3)
  );

/* tile 5 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_5_6, d_o_5_6, d_5_14, d_5_13, d_o_5_13;
wire c_o_5_13, c_o_5_6;
/* tile 5 input wires (credit and data lines) */
wire c_6_5, c_o_6_5, c_14_5, c_13_5, c_o_13_5;
wire [`PATH_WIDTH:0] d_o_13_5, d_o_6_5;

tile #(5, 1, 3) t5(
  /* inputs */
  .d_in_f_NW(d_in_e15),
  .d_in_f_NE(d_in_e16),
  .d_in_f_SW(d_4_5),
  .d_in_s_N(d_in_e17),
  .d_in_s_E(d_o_6_5),
  .d_in_s_S(d_o_13_5),
  .d_in_s_W(d_o_4_5),
  .c_in_s_N(c_in_e5),
  .c_in_s_NE(c_6_5),
  .c_in_s_E(c_o_6_5),
  .c_in_s_SE(c_14_5),
  .c_in_s_S(c_o_13_5),
  .c_in_s_SW(c_13_5),
  .c_in_s_W(c_o_4_5),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e5),
  .d_out_s_NE(d_5_6),
  .d_out_s_E(d_o_5_6),
  .d_out_s_SE(d_5_14),
  .d_out_s_S(d_o_5_13),
  .d_out_s_SW(d_5_13),
  .d_out_s_W(d_o_5_4),
  .c_out_f_NW(c_out_e15),
  .c_out_f_NE(c_out_e16),
  .c_out_f_SW(c_5_4),
  .c_out_s_N(c_out_e17),
  .c_out_s_E(c_o_5_6),
  .c_out_s_S(c_o_5_13),
  .c_out_s_W(c_o_5_4)
  );

/* tile 6 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_6_7, d_o_6_7, d_6_15, d_6_14, d_o_6_14;
wire c_o_6_14, c_o_6_7;
/* tile 6 input wires (credit and data lines) */
wire c_7_6, c_o_7_6, c_15_6, c_14_6, c_o_14_6;
wire [`PATH_WIDTH:0] d_o_14_6, d_o_7_6;

tile #(6, 1, 3) t6(
  /* inputs */
  .d_in_f_NW(d_in_e18),
  .d_in_f_NE(d_in_e19),
  .d_in_f_SW(d_5_6),
  .d_in_s_N(d_in_e20),
  .d_in_s_E(d_o_7_6),
  .d_in_s_S(d_o_14_6),
  .d_in_s_W(d_o_5_6),
  .c_in_s_N(c_in_e6),
  .c_in_s_NE(c_7_6),
  .c_in_s_E(c_o_7_6),
  .c_in_s_SE(c_15_6),
  .c_in_s_S(c_o_14_6),
  .c_in_s_SW(c_14_6),
  .c_in_s_W(c_o_5_6),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e6),
  .d_out_s_NE(d_6_7),
  .d_out_s_E(d_o_6_7),
  .d_out_s_SE(d_6_15),
  .d_out_s_S(d_o_6_14),
  .d_out_s_SW(d_6_14),
  .d_out_s_W(d_o_6_5),
  .c_out_f_NW(c_out_e18),
  .c_out_f_NE(c_out_e19),
  .c_out_f_SW(c_6_5),
  .c_out_s_N(c_out_e20),
  .c_out_s_E(c_o_6_7),
  .c_out_s_S(c_o_6_14),
  .c_out_s_W(c_o_6_5)
  );

/* tile 7 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_7_15, d_o_7_15;
wire c_o_7_15;
/* tile 7 input wires (credit and data lines) */
wire c_15_7, c_o_15_7;
wire [`PATH_WIDTH:0] d_o_15_7;

tile #(7, 2, 3) t7(
  /* inputs */
  .d_in_f_NW(d_in_e21),
  .d_in_f_NE(d_in_e22),
  .d_in_f_SW(d_6_7),
  .d_in_s_N(d_in_e23),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_15_7),
  .d_in_s_W(d_o_6_7),
  .c_in_s_N(c_in_e7),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o29),
  .c_in_s_SE(c_in_o28),
  .c_in_s_S(c_o_15_7),
  .c_in_s_SW(c_15_7),
  .c_in_s_W(c_o_6_7),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_out_e7),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o29),
  .d_out_s_SE(d_out_o28),
  .d_out_s_S(d_o_7_15),
  .d_out_s_SW(d_7_15),
  .d_out_s_W(d_o_7_6),
  .c_out_f_NW(c_out_e21),
  .c_out_f_NE(c_out_e22),
  .c_out_f_SW(c_7_6),
  .c_out_s_N(c_out_e23),
  .c_out_s_E(),
  .c_out_s_S(c_o_7_15),
  .c_out_s_W(c_o_7_6)
  );

/* tile 8 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_8_9, d_o_8_9, d_8_17, d_8_16, d_o_8_16;
wire c_o_8_16, c_o_8_9;
/* tile 8 input wires (credit and data lines) */
wire c_9_8, c_o_9_8, c_17_8, c_16_8, c_o_16_8;
wire [`PATH_WIDTH:0] d_o_16_8, d_o_9_8;

tile #(8, 3, 1) t8(
  /* inputs */
  .d_in_f_NW(d_in_e26),
  .d_in_f_NE(d_0_8),
  .d_in_f_SW(d_in_e27),
  .d_in_s_N(d_o_0_8),
  .d_in_s_E(d_o_9_8),
  .d_in_s_S(d_o_16_8),
  .d_in_s_W(d_in_e28),
  .c_in_s_N(c_o_0_8),
  .c_in_s_NE(c_9_8),
  .c_in_s_E(c_o_9_8),
  .c_in_s_SE(c_17_8),
  .c_in_s_S(c_o_16_8),
  .c_in_s_SW(c_16_8),
  .c_in_s_W(c_in_e9),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_8_0),
  .d_out_s_NE(d_8_9),
  .d_out_s_E(d_o_8_9),
  .d_out_s_SE(d_8_17),
  .d_out_s_S(d_o_8_16),
  .d_out_s_SW(d_8_16),
  .d_out_s_W(d_out_e9),
  .c_out_f_NW(c_out_e26),
  .c_out_f_NE(c_8_0),
  .c_out_f_SW(c_out_e27),
  .c_out_s_N(c_o_8_0),
  .c_out_s_E(c_o_8_9),
  .c_out_s_S(c_o_8_16),
  .c_out_s_W(c_out_e28)
  );

/* tile 9 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_9_10, d_o_9_10, d_9_18, d_9_17, d_o_9_17;
wire c_o_9_17, c_o_9_10;
/* tile 9 input wires (credit and data lines) */
wire c_10_9, c_o_10_9, c_18_9, c_17_9, c_o_17_9;
wire [`PATH_WIDTH:0] d_o_17_9, d_o_10_9;

tile #(9, 3, 1) t9(
  /* inputs */
  .d_in_f_NW(d_0_9),
  .d_in_f_NE(d_1_9),
  .d_in_f_SW(d_8_9),
  .d_in_s_N(d_o_1_9),
  .d_in_s_E(d_o_10_9),
  .d_in_s_S(d_o_17_9),
  .d_in_s_W(d_o_8_9),
  .c_in_s_N(c_o_1_9),
  .c_in_s_NE(c_10_9),
  .c_in_s_E(c_o_10_9),
  .c_in_s_SE(c_18_9),
  .c_in_s_S(c_o_17_9),
  .c_in_s_SW(c_17_9),
  .c_in_s_W(c_o_8_9),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_9_1),
  .d_out_s_NE(d_9_10),
  .d_out_s_E(d_o_9_10),
  .d_out_s_SE(d_9_18),
  .d_out_s_S(d_o_9_17),
  .d_out_s_SW(d_9_17),
  .d_out_s_W(d_o_9_8),
  .c_out_f_NW(c_9_0),
  .c_out_f_NE(c_9_1),
  .c_out_f_SW(c_9_8),
  .c_out_s_N(c_o_9_1),
  .c_out_s_E(c_o_9_10),
  .c_out_s_S(c_o_9_17),
  .c_out_s_W(c_o_9_8)
  );

/* tile 10 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_10_11, d_o_10_11, d_10_19, d_10_18, d_o_10_18;
wire c_o_10_18, c_o_10_11;
/* tile 10 input wires (credit and data lines) */
wire c_11_10, c_o_11_10, c_19_10, c_18_10, c_o_18_10;
wire [`PATH_WIDTH:0] d_o_18_10, d_o_11_10;

tile #(10, 3, 1) t10(
  /* inputs */
  .d_in_f_NW(d_1_10),
  .d_in_f_NE(d_2_10),
  .d_in_f_SW(d_9_10),
  .d_in_s_N(d_o_2_10),
  .d_in_s_E(d_o_11_10),
  .d_in_s_S(d_o_18_10),
  .d_in_s_W(d_o_9_10),
  .c_in_s_N(c_o_2_10),
  .c_in_s_NE(c_11_10),
  .c_in_s_E(c_o_11_10),
  .c_in_s_SE(c_19_10),
  .c_in_s_S(c_o_18_10),
  .c_in_s_SW(c_18_10),
  .c_in_s_W(c_o_9_10),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_10_2),
  .d_out_s_NE(d_10_11),
  .d_out_s_E(d_o_10_11),
  .d_out_s_SE(d_10_19),
  .d_out_s_S(d_o_10_18),
  .d_out_s_SW(d_10_18),
  .d_out_s_W(d_o_10_9),
  .c_out_f_NW(c_10_1),
  .c_out_f_NE(c_10_2),
  .c_out_f_SW(c_10_9),
  .c_out_s_N(c_o_10_2),
  .c_out_s_E(c_o_10_11),
  .c_out_s_S(c_o_10_18),
  .c_out_s_W(c_o_10_9)
  );

/* tile 11 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_11_12, d_o_11_12, d_11_20, d_11_19, d_o_11_19;
wire c_o_11_19, c_o_11_12;
/* tile 11 input wires (credit and data lines) */
wire c_12_11, c_o_12_11, c_20_11, c_19_11, c_o_19_11;
wire [`PATH_WIDTH:0] d_o_19_11, d_o_12_11;

tile #(11, 3, 1) t11(
  /* inputs */
  .d_in_f_NW(d_2_11),
  .d_in_f_NE(d_3_11),
  .d_in_f_SW(d_10_11),
  .d_in_s_N(d_o_3_11),
  .d_in_s_E(d_o_12_11),
  .d_in_s_S(d_o_19_11),
  .d_in_s_W(d_o_10_11),
  .c_in_s_N(c_o_3_11),
  .c_in_s_NE(c_12_11),
  .c_in_s_E(c_o_12_11),
  .c_in_s_SE(c_20_11),
  .c_in_s_S(c_o_19_11),
  .c_in_s_SW(c_19_11),
  .c_in_s_W(c_o_10_11),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_11_3),
  .d_out_s_NE(d_11_12),
  .d_out_s_E(d_o_11_12),
  .d_out_s_SE(d_11_20),
  .d_out_s_S(d_o_11_19),
  .d_out_s_SW(d_11_19),
  .d_out_s_W(d_o_11_10),
  .c_out_f_NW(c_11_2),
  .c_out_f_NE(c_11_3),
  .c_out_f_SW(c_11_10),
  .c_out_s_N(c_o_11_3),
  .c_out_s_E(c_o_11_12),
  .c_out_s_S(c_o_11_19),
  .c_out_s_W(c_o_11_10)
  );

/* tile 12 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_12_13, d_o_12_13, d_12_21, d_12_20, d_o_12_20;
wire c_o_12_20, c_o_12_13;
/* tile 12 input wires (credit and data lines) */
wire c_13_12, c_o_13_12, c_21_12, c_20_12, c_o_20_12;
wire [`PATH_WIDTH:0] d_o_20_12, d_o_13_12;

tile #(12, 3, 1) t12(
  /* inputs */
  .d_in_f_NW(d_3_12),
  .d_in_f_NE(d_4_12),
  .d_in_f_SW(d_11_12),
  .d_in_s_N(d_o_4_12),
  .d_in_s_E(d_o_13_12),
  .d_in_s_S(d_o_20_12),
  .d_in_s_W(d_o_11_12),
  .c_in_s_N(c_o_4_12),
  .c_in_s_NE(c_13_12),
  .c_in_s_E(c_o_13_12),
  .c_in_s_SE(c_21_12),
  .c_in_s_S(c_o_20_12),
  .c_in_s_SW(c_20_12),
  .c_in_s_W(c_o_11_12),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_12_4),
  .d_out_s_NE(d_12_13),
  .d_out_s_E(d_o_12_13),
  .d_out_s_SE(d_12_21),
  .d_out_s_S(d_o_12_20),
  .d_out_s_SW(d_12_20),
  .d_out_s_W(d_o_12_11),
  .c_out_f_NW(c_12_3),
  .c_out_f_NE(c_12_4),
  .c_out_f_SW(c_12_11),
  .c_out_s_N(c_o_12_4),
  .c_out_s_E(c_o_12_13),
  .c_out_s_S(c_o_12_20),
  .c_out_s_W(c_o_12_11)
  );

/* tile 13 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_13_14, d_o_13_14, d_13_22, d_13_21, d_o_13_21;
wire c_o_13_21, c_o_13_14;
/* tile 13 input wires (credit and data lines) */
wire c_14_13, c_o_14_13, c_22_13, c_21_13, c_o_21_13;
wire [`PATH_WIDTH:0] d_o_21_13, d_o_14_13;

tile #(13, 3, 1) t13(
  /* inputs */
  .d_in_f_NW(d_4_13),
  .d_in_f_NE(d_5_13),
  .d_in_f_SW(d_12_13),
  .d_in_s_N(d_o_5_13),
  .d_in_s_E(d_o_14_13),
  .d_in_s_S(d_o_21_13),
  .d_in_s_W(d_o_12_13),
  .c_in_s_N(c_o_5_13),
  .c_in_s_NE(c_14_13),
  .c_in_s_E(c_o_14_13),
  .c_in_s_SE(c_22_13),
  .c_in_s_S(c_o_21_13),
  .c_in_s_SW(c_21_13),
  .c_in_s_W(c_o_12_13),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_13_5),
  .d_out_s_NE(d_13_14),
  .d_out_s_E(d_o_13_14),
  .d_out_s_SE(d_13_22),
  .d_out_s_S(d_o_13_21),
  .d_out_s_SW(d_13_21),
  .d_out_s_W(d_o_13_12),
  .c_out_f_NW(c_13_4),
  .c_out_f_NE(c_13_5),
  .c_out_f_SW(c_13_12),
  .c_out_s_N(c_o_13_5),
  .c_out_s_E(c_o_13_14),
  .c_out_s_S(c_o_13_21),
  .c_out_s_W(c_o_13_12)
  );

/* tile 14 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_14_15, d_o_14_15, d_14_23, d_14_22, d_o_14_22;
wire c_o_14_22, c_o_14_15;
/* tile 14 input wires (credit and data lines) */
wire c_15_14, c_o_15_14, c_23_14, c_22_14, c_o_22_14;
wire [`PATH_WIDTH:0] d_o_22_14, d_o_15_14;

tile #(14, 3, 1) t14(
  /* inputs */
  .d_in_f_NW(d_5_14),
  .d_in_f_NE(d_6_14),
  .d_in_f_SW(d_13_14),
  .d_in_s_N(d_o_6_14),
  .d_in_s_E(d_o_15_14),
  .d_in_s_S(d_o_22_14),
  .d_in_s_W(d_o_13_14),
  .c_in_s_N(c_o_6_14),
  .c_in_s_NE(c_15_14),
  .c_in_s_E(c_o_15_14),
  .c_in_s_SE(c_23_14),
  .c_in_s_S(c_o_22_14),
  .c_in_s_SW(c_22_14),
  .c_in_s_W(c_o_13_14),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_14_6),
  .d_out_s_NE(d_14_15),
  .d_out_s_E(d_o_14_15),
  .d_out_s_SE(d_14_23),
  .d_out_s_S(d_o_14_22),
  .d_out_s_SW(d_14_22),
  .d_out_s_W(d_o_14_13),
  .c_out_f_NW(c_14_5),
  .c_out_f_NE(c_14_6),
  .c_out_f_SW(c_14_13),
  .c_out_s_N(c_o_14_6),
  .c_out_s_E(c_o_14_15),
  .c_out_s_S(c_o_14_22),
  .c_out_s_W(c_o_14_13)
  );

/* tile 15 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_15_23, d_o_15_23;
wire c_o_15_23;
/* tile 15 input wires (credit and data lines) */
wire c_23_15, c_o_23_15;
wire [`PATH_WIDTH:0] d_o_23_15;

tile #(15, 3, 0) t15(
  /* inputs */
  .d_in_f_NW(d_6_15),
  .d_in_f_NE(d_7_15),
  .d_in_f_SW(d_14_15),
  .d_in_s_N(d_o_7_15),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_23_15),
  .d_in_s_W(d_o_14_15),
  .c_in_s_N(c_o_7_15),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o27),
  .c_in_s_SE(c_in_o26),
  .c_in_s_S(c_o_23_15),
  .c_in_s_SW(c_23_15),
  .c_in_s_W(c_o_14_15),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_15_7),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o27),
  .d_out_s_SE(d_out_o26),
  .d_out_s_S(d_o_15_23),
  .d_out_s_SW(d_15_23),
  .d_out_s_W(d_o_15_14),
  .c_out_f_NW(c_15_6),
  .c_out_f_NE(c_15_7),
  .c_out_f_SW(c_15_14),
  .c_out_s_N(c_o_15_7),
  .c_out_s_E(),
  .c_out_s_S(c_o_15_23),
  .c_out_s_W(c_o_15_14)
  );

/* tile 16 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_16_17, d_o_16_17, d_16_25, d_16_24, d_o_16_24;
wire c_o_16_24, c_o_16_17;
/* tile 16 input wires (credit and data lines) */
wire c_17_16, c_o_17_16, c_25_16, c_24_16, c_o_24_16;
wire [`PATH_WIDTH:0] d_o_24_16, d_o_17_16;

tile #(16, 1, 3) t16(
  /* inputs */
  .d_in_f_NW(d_in_e29),
  .d_in_f_NE(d_8_16),
  .d_in_f_SW(d_in_e30),
  .d_in_s_N(d_o_8_16),
  .d_in_s_E(d_o_17_16),
  .d_in_s_S(d_o_24_16),
  .d_in_s_W(d_in_e31),
  .c_in_s_N(c_o_8_16),
  .c_in_s_NE(c_17_16),
  .c_in_s_E(c_o_17_16),
  .c_in_s_SE(c_25_16),
  .c_in_s_S(c_o_24_16),
  .c_in_s_SW(c_24_16),
  .c_in_s_W(c_in_e10),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_16_8),
  .d_out_s_NE(d_16_17),
  .d_out_s_E(d_o_16_17),
  .d_out_s_SE(d_16_25),
  .d_out_s_S(d_o_16_24),
  .d_out_s_SW(d_16_24),
  .d_out_s_W(d_out_e10),
  .c_out_f_NW(c_out_e29),
  .c_out_f_NE(c_16_8),
  .c_out_f_SW(c_out_e30),
  .c_out_s_N(c_o_16_8),
  .c_out_s_E(c_o_16_17),
  .c_out_s_S(c_o_16_24),
  .c_out_s_W(c_out_e31)
  );

/* tile 17 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_17_18, d_o_17_18, d_17_26, d_17_25, d_o_17_25;
wire c_o_17_25, c_o_17_18;
/* tile 17 input wires (credit and data lines) */
wire c_18_17, c_o_18_17, c_26_17, c_25_17, c_o_25_17;
wire [`PATH_WIDTH:0] d_o_25_17, d_o_18_17;

tile #(17, 1, 3) t17(
  /* inputs */
  .d_in_f_NW(d_8_17),
  .d_in_f_NE(d_9_17),
  .d_in_f_SW(d_16_17),
  .d_in_s_N(d_o_9_17),
  .d_in_s_E(d_o_18_17),
  .d_in_s_S(d_o_25_17),
  .d_in_s_W(d_o_16_17),
  .c_in_s_N(c_o_9_17),
  .c_in_s_NE(c_18_17),
  .c_in_s_E(c_o_18_17),
  .c_in_s_SE(c_26_17),
  .c_in_s_S(c_o_25_17),
  .c_in_s_SW(c_25_17),
  .c_in_s_W(c_o_16_17),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_17_9),
  .d_out_s_NE(d_17_18),
  .d_out_s_E(d_o_17_18),
  .d_out_s_SE(d_17_26),
  .d_out_s_S(d_o_17_25),
  .d_out_s_SW(d_17_25),
  .d_out_s_W(d_o_17_16),
  .c_out_f_NW(c_17_8),
  .c_out_f_NE(c_17_9),
  .c_out_f_SW(c_17_16),
  .c_out_s_N(c_o_17_9),
  .c_out_s_E(c_o_17_18),
  .c_out_s_S(c_o_17_25),
  .c_out_s_W(c_o_17_16)
  );

/* tile 18 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_18_19, d_o_18_19, d_18_27, d_18_26, d_o_18_26;
wire c_o_18_26, c_o_18_19;
/* tile 18 input wires (credit and data lines) */
wire c_19_18, c_o_19_18, c_27_18, c_26_18, c_o_26_18;
wire [`PATH_WIDTH:0] d_o_26_18, d_o_19_18;

tile #(18, 1, 3) t18(
  /* inputs */
  .d_in_f_NW(d_9_18),
  .d_in_f_NE(d_10_18),
  .d_in_f_SW(d_17_18),
  .d_in_s_N(d_o_10_18),
  .d_in_s_E(d_o_19_18),
  .d_in_s_S(d_o_26_18),
  .d_in_s_W(d_o_17_18),
  .c_in_s_N(c_o_10_18),
  .c_in_s_NE(c_19_18),
  .c_in_s_E(c_o_19_18),
  .c_in_s_SE(c_27_18),
  .c_in_s_S(c_o_26_18),
  .c_in_s_SW(c_26_18),
  .c_in_s_W(c_o_17_18),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_18_10),
  .d_out_s_NE(d_18_19),
  .d_out_s_E(d_o_18_19),
  .d_out_s_SE(d_18_27),
  .d_out_s_S(d_o_18_26),
  .d_out_s_SW(d_18_26),
  .d_out_s_W(d_o_18_17),
  .c_out_f_NW(c_18_9),
  .c_out_f_NE(c_18_10),
  .c_out_f_SW(c_18_17),
  .c_out_s_N(c_o_18_10),
  .c_out_s_E(c_o_18_19),
  .c_out_s_S(c_o_18_26),
  .c_out_s_W(c_o_18_17)
  );

/* tile 19 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_19_20, d_o_19_20, d_19_28, d_19_27, d_o_19_27;
wire c_o_19_27, c_o_19_20;
/* tile 19 input wires (credit and data lines) */
wire c_20_19, c_o_20_19, c_28_19, c_27_19, c_o_27_19;
wire [`PATH_WIDTH:0] d_o_27_19, d_o_20_19;

tile #(19, 1, 3) t19(
  /* inputs */
  .d_in_f_NW(d_10_19),
  .d_in_f_NE(d_11_19),
  .d_in_f_SW(d_18_19),
  .d_in_s_N(d_o_11_19),
  .d_in_s_E(d_o_20_19),
  .d_in_s_S(d_o_27_19),
  .d_in_s_W(d_o_18_19),
  .c_in_s_N(c_o_11_19),
  .c_in_s_NE(c_20_19),
  .c_in_s_E(c_o_20_19),
  .c_in_s_SE(c_28_19),
  .c_in_s_S(c_o_27_19),
  .c_in_s_SW(c_27_19),
  .c_in_s_W(c_o_18_19),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_19_11),
  .d_out_s_NE(d_19_20),
  .d_out_s_E(d_o_19_20),
  .d_out_s_SE(d_19_28),
  .d_out_s_S(d_o_19_27),
  .d_out_s_SW(d_19_27),
  .d_out_s_W(d_o_19_18),
  .c_out_f_NW(c_19_10),
  .c_out_f_NE(c_19_11),
  .c_out_f_SW(c_19_18),
  .c_out_s_N(c_o_19_11),
  .c_out_s_E(c_o_19_20),
  .c_out_s_S(c_o_19_27),
  .c_out_s_W(c_o_19_18)
  );

/* tile 20 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_20_21, d_o_20_21, d_20_29, d_20_28, d_o_20_28;
wire c_o_20_28, c_o_20_21;
/* tile 20 input wires (credit and data lines) */
wire c_21_20, c_o_21_20, c_29_20, c_28_20, c_o_28_20;
wire [`PATH_WIDTH:0] d_o_28_20, d_o_21_20;

tile #(20, 1, 3) t20(
  /* inputs */
  .d_in_f_NW(d_11_20),
  .d_in_f_NE(d_12_20),
  .d_in_f_SW(d_19_20),
  .d_in_s_N(d_o_12_20),
  .d_in_s_E(d_o_21_20),
  .d_in_s_S(d_o_28_20),
  .d_in_s_W(d_o_19_20),
  .c_in_s_N(c_o_12_20),
  .c_in_s_NE(c_21_20),
  .c_in_s_E(c_o_21_20),
  .c_in_s_SE(c_29_20),
  .c_in_s_S(c_o_28_20),
  .c_in_s_SW(c_28_20),
  .c_in_s_W(c_o_19_20),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_20_12),
  .d_out_s_NE(d_20_21),
  .d_out_s_E(d_o_20_21),
  .d_out_s_SE(d_20_29),
  .d_out_s_S(d_o_20_28),
  .d_out_s_SW(d_20_28),
  .d_out_s_W(d_o_20_19),
  .c_out_f_NW(c_20_11),
  .c_out_f_NE(c_20_12),
  .c_out_f_SW(c_20_19),
  .c_out_s_N(c_o_20_12),
  .c_out_s_E(c_o_20_21),
  .c_out_s_S(c_o_20_28),
  .c_out_s_W(c_o_20_19)
  );

/* tile 21 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_21_22, d_o_21_22, d_21_30, d_21_29, d_o_21_29;
wire c_o_21_29, c_o_21_22;
/* tile 21 input wires (credit and data lines) */
wire c_22_21, c_o_22_21, c_30_21, c_29_21, c_o_29_21;
wire [`PATH_WIDTH:0] d_o_29_21, d_o_22_21;

tile #(21, 1, 3) t21(
  /* inputs */
  .d_in_f_NW(d_12_21),
  .d_in_f_NE(d_13_21),
  .d_in_f_SW(d_20_21),
  .d_in_s_N(d_o_13_21),
  .d_in_s_E(d_o_22_21),
  .d_in_s_S(d_o_29_21),
  .d_in_s_W(d_o_20_21),
  .c_in_s_N(c_o_13_21),
  .c_in_s_NE(c_22_21),
  .c_in_s_E(c_o_22_21),
  .c_in_s_SE(c_30_21),
  .c_in_s_S(c_o_29_21),
  .c_in_s_SW(c_29_21),
  .c_in_s_W(c_o_20_21),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_21_13),
  .d_out_s_NE(d_21_22),
  .d_out_s_E(d_o_21_22),
  .d_out_s_SE(d_21_30),
  .d_out_s_S(d_o_21_29),
  .d_out_s_SW(d_21_29),
  .d_out_s_W(d_o_21_20),
  .c_out_f_NW(c_21_12),
  .c_out_f_NE(c_21_13),
  .c_out_f_SW(c_21_20),
  .c_out_s_N(c_o_21_13),
  .c_out_s_E(c_o_21_22),
  .c_out_s_S(c_o_21_29),
  .c_out_s_W(c_o_21_20)
  );

/* tile 22 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_22_23, d_o_22_23, d_22_31, d_22_30, d_o_22_30;
wire c_o_22_30, c_o_22_23;
/* tile 22 input wires (credit and data lines) */
wire c_23_22, c_o_23_22, c_31_22, c_30_22, c_o_30_22;
wire [`PATH_WIDTH:0] d_o_30_22, d_o_23_22;

tile #(22, 1, 3) t22(
  /* inputs */
  .d_in_f_NW(d_13_22),
  .d_in_f_NE(d_14_22),
  .d_in_f_SW(d_21_22),
  .d_in_s_N(d_o_14_22),
  .d_in_s_E(d_o_23_22),
  .d_in_s_S(d_o_30_22),
  .d_in_s_W(d_o_21_22),
  .c_in_s_N(c_o_14_22),
  .c_in_s_NE(c_23_22),
  .c_in_s_E(c_o_23_22),
  .c_in_s_SE(c_31_22),
  .c_in_s_S(c_o_30_22),
  .c_in_s_SW(c_30_22),
  .c_in_s_W(c_o_21_22),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_22_14),
  .d_out_s_NE(d_22_23),
  .d_out_s_E(d_o_22_23),
  .d_out_s_SE(d_22_31),
  .d_out_s_S(d_o_22_30),
  .d_out_s_SW(d_22_30),
  .d_out_s_W(d_o_22_21),
  .c_out_f_NW(c_22_13),
  .c_out_f_NE(c_22_14),
  .c_out_f_SW(c_22_21),
  .c_out_s_N(c_o_22_14),
  .c_out_s_E(c_o_22_23),
  .c_out_s_S(c_o_22_30),
  .c_out_s_W(c_o_22_21)
  );

/* tile 23 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_23_31, d_o_23_31;
wire c_o_23_31;
/* tile 23 input wires (credit and data lines) */
wire c_31_23, c_o_31_23;
wire [`PATH_WIDTH:0] d_o_31_23;

tile #(23, 2, 3) t23(
  /* inputs */
  .d_in_f_NW(d_14_23),
  .d_in_f_NE(d_15_23),
  .d_in_f_SW(d_22_23),
  .d_in_s_N(d_o_15_23),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_31_23),
  .d_in_s_W(d_o_22_23),
  .c_in_s_N(c_o_15_23),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o25),
  .c_in_s_SE(c_in_o24),
  .c_in_s_S(c_o_31_23),
  .c_in_s_SW(c_31_23),
  .c_in_s_W(c_o_22_23),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_23_15),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o25),
  .d_out_s_SE(d_out_o24),
  .d_out_s_S(d_o_23_31),
  .d_out_s_SW(d_23_31),
  .d_out_s_W(d_o_23_22),
  .c_out_f_NW(c_23_14),
  .c_out_f_NE(c_23_15),
  .c_out_f_SW(c_23_22),
  .c_out_s_N(c_o_23_15),
  .c_out_s_E(),
  .c_out_s_S(c_o_23_31),
  .c_out_s_W(c_o_23_22)
  );

/* tile 24 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_24_25, d_o_24_25, d_24_33, d_24_32, d_o_24_32;
wire c_o_24_32, c_o_24_25;
/* tile 24 input wires (credit and data lines) */
wire c_25_24, c_o_25_24, c_33_24, c_32_24, c_o_32_24;
wire [`PATH_WIDTH:0] d_o_32_24, d_o_25_24;

tile #(24, 3, 1) t24(
  /* inputs */
  .d_in_f_NW(d_in_e32),
  .d_in_f_NE(d_16_24),
  .d_in_f_SW(d_in_e33),
  .d_in_s_N(d_o_16_24),
  .d_in_s_E(d_o_25_24),
  .d_in_s_S(d_o_32_24),
  .d_in_s_W(d_in_e34),
  .c_in_s_N(c_o_16_24),
  .c_in_s_NE(c_25_24),
  .c_in_s_E(c_o_25_24),
  .c_in_s_SE(c_33_24),
  .c_in_s_S(c_o_32_24),
  .c_in_s_SW(c_32_24),
  .c_in_s_W(c_in_e11),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_24_16),
  .d_out_s_NE(d_24_25),
  .d_out_s_E(d_o_24_25),
  .d_out_s_SE(d_24_33),
  .d_out_s_S(d_o_24_32),
  .d_out_s_SW(d_24_32),
  .d_out_s_W(d_out_e11),
  .c_out_f_NW(c_out_e32),
  .c_out_f_NE(c_24_16),
  .c_out_f_SW(c_out_e33),
  .c_out_s_N(c_o_24_16),
  .c_out_s_E(c_o_24_25),
  .c_out_s_S(c_o_24_32),
  .c_out_s_W(c_out_e34)
  );

/* tile 25 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_25_26, d_o_25_26, d_25_34, d_25_33, d_o_25_33;
wire c_o_25_33, c_o_25_26;
/* tile 25 input wires (credit and data lines) */
wire c_26_25, c_o_26_25, c_34_25, c_33_25, c_o_33_25;
wire [`PATH_WIDTH:0] d_o_33_25, d_o_26_25;

tile #(25, 3, 1) t25(
  /* inputs */
  .d_in_f_NW(d_16_25),
  .d_in_f_NE(d_17_25),
  .d_in_f_SW(d_24_25),
  .d_in_s_N(d_o_17_25),
  .d_in_s_E(d_o_26_25),
  .d_in_s_S(d_o_33_25),
  .d_in_s_W(d_o_24_25),
  .c_in_s_N(c_o_17_25),
  .c_in_s_NE(c_26_25),
  .c_in_s_E(c_o_26_25),
  .c_in_s_SE(c_34_25),
  .c_in_s_S(c_o_33_25),
  .c_in_s_SW(c_33_25),
  .c_in_s_W(c_o_24_25),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_25_17),
  .d_out_s_NE(d_25_26),
  .d_out_s_E(d_o_25_26),
  .d_out_s_SE(d_25_34),
  .d_out_s_S(d_o_25_33),
  .d_out_s_SW(d_25_33),
  .d_out_s_W(d_o_25_24),
  .c_out_f_NW(c_25_16),
  .c_out_f_NE(c_25_17),
  .c_out_f_SW(c_25_24),
  .c_out_s_N(c_o_25_17),
  .c_out_s_E(c_o_25_26),
  .c_out_s_S(c_o_25_33),
  .c_out_s_W(c_o_25_24)
  );

/* tile 26 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_26_27, d_o_26_27, d_26_35, d_26_34, d_o_26_34;
wire c_o_26_34, c_o_26_27;
/* tile 26 input wires (credit and data lines) */
wire c_27_26, c_o_27_26, c_35_26, c_34_26, c_o_34_26;
wire [`PATH_WIDTH:0] d_o_34_26, d_o_27_26;

tile #(26, 3, 1) t26(
  /* inputs */
  .d_in_f_NW(d_17_26),
  .d_in_f_NE(d_18_26),
  .d_in_f_SW(d_25_26),
  .d_in_s_N(d_o_18_26),
  .d_in_s_E(d_o_27_26),
  .d_in_s_S(d_o_34_26),
  .d_in_s_W(d_o_25_26),
  .c_in_s_N(c_o_18_26),
  .c_in_s_NE(c_27_26),
  .c_in_s_E(c_o_27_26),
  .c_in_s_SE(c_35_26),
  .c_in_s_S(c_o_34_26),
  .c_in_s_SW(c_34_26),
  .c_in_s_W(c_o_25_26),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_26_18),
  .d_out_s_NE(d_26_27),
  .d_out_s_E(d_o_26_27),
  .d_out_s_SE(d_26_35),
  .d_out_s_S(d_o_26_34),
  .d_out_s_SW(d_26_34),
  .d_out_s_W(d_o_26_25),
  .c_out_f_NW(c_26_17),
  .c_out_f_NE(c_26_18),
  .c_out_f_SW(c_26_25),
  .c_out_s_N(c_o_26_18),
  .c_out_s_E(c_o_26_27),
  .c_out_s_S(c_o_26_34),
  .c_out_s_W(c_o_26_25)
  );

/* tile 27 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_27_28, d_o_27_28, d_27_36, d_27_35, d_o_27_35;
wire c_o_27_35, c_o_27_28;
/* tile 27 input wires (credit and data lines) */
wire c_28_27, c_o_28_27, c_36_27, c_35_27, c_o_35_27;
wire [`PATH_WIDTH:0] d_o_35_27, d_o_28_27;

tile #(27, 3, 1) t27(
  /* inputs */
  .d_in_f_NW(d_18_27),
  .d_in_f_NE(d_19_27),
  .d_in_f_SW(d_26_27),
  .d_in_s_N(d_o_19_27),
  .d_in_s_E(d_o_28_27),
  .d_in_s_S(d_o_35_27),
  .d_in_s_W(d_o_26_27),
  .c_in_s_N(c_o_19_27),
  .c_in_s_NE(c_28_27),
  .c_in_s_E(c_o_28_27),
  .c_in_s_SE(c_36_27),
  .c_in_s_S(c_o_35_27),
  .c_in_s_SW(c_35_27),
  .c_in_s_W(c_o_26_27),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_27_19),
  .d_out_s_NE(d_27_28),
  .d_out_s_E(d_o_27_28),
  .d_out_s_SE(d_27_36),
  .d_out_s_S(d_o_27_35),
  .d_out_s_SW(d_27_35),
  .d_out_s_W(d_o_27_26),
  .c_out_f_NW(c_27_18),
  .c_out_f_NE(c_27_19),
  .c_out_f_SW(c_27_26),
  .c_out_s_N(c_o_27_19),
  .c_out_s_E(c_o_27_28),
  .c_out_s_S(c_o_27_35),
  .c_out_s_W(c_o_27_26)
  );

/* tile 28 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_28_29, d_o_28_29, d_28_37, d_28_36, d_o_28_36;
wire c_o_28_36, c_o_28_29;
/* tile 28 input wires (credit and data lines) */
wire c_29_28, c_o_29_28, c_37_28, c_36_28, c_o_36_28;
wire [`PATH_WIDTH:0] d_o_36_28, d_o_29_28;

tile #(28, 3, 1) t28(
  /* inputs */
  .d_in_f_NW(d_19_28),
  .d_in_f_NE(d_20_28),
  .d_in_f_SW(d_27_28),
  .d_in_s_N(d_o_20_28),
  .d_in_s_E(d_o_29_28),
  .d_in_s_S(d_o_36_28),
  .d_in_s_W(d_o_27_28),
  .c_in_s_N(c_o_20_28),
  .c_in_s_NE(c_29_28),
  .c_in_s_E(c_o_29_28),
  .c_in_s_SE(c_37_28),
  .c_in_s_S(c_o_36_28),
  .c_in_s_SW(c_36_28),
  .c_in_s_W(c_o_27_28),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_28_20),
  .d_out_s_NE(d_28_29),
  .d_out_s_E(d_o_28_29),
  .d_out_s_SE(d_28_37),
  .d_out_s_S(d_o_28_36),
  .d_out_s_SW(d_28_36),
  .d_out_s_W(d_o_28_27),
  .c_out_f_NW(c_28_19),
  .c_out_f_NE(c_28_20),
  .c_out_f_SW(c_28_27),
  .c_out_s_N(c_o_28_20),
  .c_out_s_E(c_o_28_29),
  .c_out_s_S(c_o_28_36),
  .c_out_s_W(c_o_28_27)
  );

/* tile 29 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_29_30, d_o_29_30, d_29_38, d_29_37, d_o_29_37;
wire c_o_29_37, c_o_29_30;
/* tile 29 input wires (credit and data lines) */
wire c_30_29, c_o_30_29, c_38_29, c_37_29, c_o_37_29;
wire [`PATH_WIDTH:0] d_o_37_29, d_o_30_29;

tile #(29, 3, 1) t29(
  /* inputs */
  .d_in_f_NW(d_20_29),
  .d_in_f_NE(d_21_29),
  .d_in_f_SW(d_28_29),
  .d_in_s_N(d_o_21_29),
  .d_in_s_E(d_o_30_29),
  .d_in_s_S(d_o_37_29),
  .d_in_s_W(d_o_28_29),
  .c_in_s_N(c_o_21_29),
  .c_in_s_NE(c_30_29),
  .c_in_s_E(c_o_30_29),
  .c_in_s_SE(c_38_29),
  .c_in_s_S(c_o_37_29),
  .c_in_s_SW(c_37_29),
  .c_in_s_W(c_o_28_29),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_29_21),
  .d_out_s_NE(d_29_30),
  .d_out_s_E(d_o_29_30),
  .d_out_s_SE(d_29_38),
  .d_out_s_S(d_o_29_37),
  .d_out_s_SW(d_29_37),
  .d_out_s_W(d_o_29_28),
  .c_out_f_NW(c_29_20),
  .c_out_f_NE(c_29_21),
  .c_out_f_SW(c_29_28),
  .c_out_s_N(c_o_29_21),
  .c_out_s_E(c_o_29_30),
  .c_out_s_S(c_o_29_37),
  .c_out_s_W(c_o_29_28)
  );

/* tile 30 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_30_31, d_o_30_31, d_30_39, d_30_38, d_o_30_38;
wire c_o_30_38, c_o_30_31;
/* tile 30 input wires (credit and data lines) */
wire c_31_30, c_o_31_30, c_39_30, c_38_30, c_o_38_30;
wire [`PATH_WIDTH:0] d_o_38_30, d_o_31_30;

tile #(30, 3, 1) t30(
  /* inputs */
  .d_in_f_NW(d_21_30),
  .d_in_f_NE(d_22_30),
  .d_in_f_SW(d_29_30),
  .d_in_s_N(d_o_22_30),
  .d_in_s_E(d_o_31_30),
  .d_in_s_S(d_o_38_30),
  .d_in_s_W(d_o_29_30),
  .c_in_s_N(c_o_22_30),
  .c_in_s_NE(c_31_30),
  .c_in_s_E(c_o_31_30),
  .c_in_s_SE(c_39_30),
  .c_in_s_S(c_o_38_30),
  .c_in_s_SW(c_38_30),
  .c_in_s_W(c_o_29_30),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_30_22),
  .d_out_s_NE(d_30_31),
  .d_out_s_E(d_o_30_31),
  .d_out_s_SE(d_30_39),
  .d_out_s_S(d_o_30_38),
  .d_out_s_SW(d_30_38),
  .d_out_s_W(d_o_30_29),
  .c_out_f_NW(c_30_21),
  .c_out_f_NE(c_30_22),
  .c_out_f_SW(c_30_29),
  .c_out_s_N(c_o_30_22),
  .c_out_s_E(c_o_30_31),
  .c_out_s_S(c_o_30_38),
  .c_out_s_W(c_o_30_29)
  );

/* tile 31 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_31_39, d_o_31_39;
wire c_o_31_39;
/* tile 31 input wires (credit and data lines) */
wire c_39_31, c_o_39_31;
wire [`PATH_WIDTH:0] d_o_39_31;

tile #(31, 3, 0) t31(
  /* inputs */
  .d_in_f_NW(d_22_31),
  .d_in_f_NE(d_23_31),
  .d_in_f_SW(d_30_31),
  .d_in_s_N(d_o_23_31),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_39_31),
  .d_in_s_W(d_o_30_31),
  .c_in_s_N(c_o_23_31),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o23),
  .c_in_s_SE(c_in_o22),
  .c_in_s_S(c_o_39_31),
  .c_in_s_SW(c_39_31),
  .c_in_s_W(c_o_30_31),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_31_23),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o23),
  .d_out_s_SE(d_out_o22),
  .d_out_s_S(d_o_31_39),
  .d_out_s_SW(d_31_39),
  .d_out_s_W(d_o_31_30),
  .c_out_f_NW(c_31_22),
  .c_out_f_NE(c_31_23),
  .c_out_f_SW(c_31_30),
  .c_out_s_N(c_o_31_23),
  .c_out_s_E(),
  .c_out_s_S(c_o_31_39),
  .c_out_s_W(c_o_31_30)
  );

/* tile 32 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_32_33, d_o_32_33, d_32_41, d_32_40, d_o_32_40;
wire c_o_32_40, c_o_32_33;
/* tile 32 input wires (credit and data lines) */
wire c_33_32, c_o_33_32, c_41_32, c_40_32, c_o_40_32;
wire [`PATH_WIDTH:0] d_o_40_32, d_o_33_32;

tile #(32, 1, 3) t32(
  /* inputs */
  .d_in_f_NW(d_in_e35),
  .d_in_f_NE(d_24_32),
  .d_in_f_SW(d_in_e36),
  .d_in_s_N(d_o_24_32),
  .d_in_s_E(d_o_33_32),
  .d_in_s_S(d_o_40_32),
  .d_in_s_W(d_in_e37),
  .c_in_s_N(c_o_24_32),
  .c_in_s_NE(c_33_32),
  .c_in_s_E(c_o_33_32),
  .c_in_s_SE(c_41_32),
  .c_in_s_S(c_o_40_32),
  .c_in_s_SW(c_40_32),
  .c_in_s_W(c_in_e12),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_32_24),
  .d_out_s_NE(d_32_33),
  .d_out_s_E(d_o_32_33),
  .d_out_s_SE(d_32_41),
  .d_out_s_S(d_o_32_40),
  .d_out_s_SW(d_32_40),
  .d_out_s_W(d_out_e12),
  .c_out_f_NW(c_out_e35),
  .c_out_f_NE(c_32_24),
  .c_out_f_SW(c_out_e36),
  .c_out_s_N(c_o_32_24),
  .c_out_s_E(c_o_32_33),
  .c_out_s_S(c_o_32_40),
  .c_out_s_W(c_out_e37)
  );

/* tile 33 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_33_34, d_o_33_34, d_33_42, d_33_41, d_o_33_41;
wire c_o_33_41, c_o_33_34;
/* tile 33 input wires (credit and data lines) */
wire c_34_33, c_o_34_33, c_42_33, c_41_33, c_o_41_33;
wire [`PATH_WIDTH:0] d_o_41_33, d_o_34_33;

tile #(33, 1, 3) t33(
  /* inputs */
  .d_in_f_NW(d_24_33),
  .d_in_f_NE(d_25_33),
  .d_in_f_SW(d_32_33),
  .d_in_s_N(d_o_25_33),
  .d_in_s_E(d_o_34_33),
  .d_in_s_S(d_o_41_33),
  .d_in_s_W(d_o_32_33),
  .c_in_s_N(c_o_25_33),
  .c_in_s_NE(c_34_33),
  .c_in_s_E(c_o_34_33),
  .c_in_s_SE(c_42_33),
  .c_in_s_S(c_o_41_33),
  .c_in_s_SW(c_41_33),
  .c_in_s_W(c_o_32_33),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_33_25),
  .d_out_s_NE(d_33_34),
  .d_out_s_E(d_o_33_34),
  .d_out_s_SE(d_33_42),
  .d_out_s_S(d_o_33_41),
  .d_out_s_SW(d_33_41),
  .d_out_s_W(d_o_33_32),
  .c_out_f_NW(c_33_24),
  .c_out_f_NE(c_33_25),
  .c_out_f_SW(c_33_32),
  .c_out_s_N(c_o_33_25),
  .c_out_s_E(c_o_33_34),
  .c_out_s_S(c_o_33_41),
  .c_out_s_W(c_o_33_32)
  );

/* tile 34 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_34_35, d_o_34_35, d_34_43, d_34_42, d_o_34_42;
wire c_o_34_42, c_o_34_35;
/* tile 34 input wires (credit and data lines) */
wire c_35_34, c_o_35_34, c_43_34, c_42_34, c_o_42_34;
wire [`PATH_WIDTH:0] d_o_42_34, d_o_35_34;

tile #(34, 1, 3) t34(
  /* inputs */
  .d_in_f_NW(d_25_34),
  .d_in_f_NE(d_26_34),
  .d_in_f_SW(d_33_34),
  .d_in_s_N(d_o_26_34),
  .d_in_s_E(d_o_35_34),
  .d_in_s_S(d_o_42_34),
  .d_in_s_W(d_o_33_34),
  .c_in_s_N(c_o_26_34),
  .c_in_s_NE(c_35_34),
  .c_in_s_E(c_o_35_34),
  .c_in_s_SE(c_43_34),
  .c_in_s_S(c_o_42_34),
  .c_in_s_SW(c_42_34),
  .c_in_s_W(c_o_33_34),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_34_26),
  .d_out_s_NE(d_34_35),
  .d_out_s_E(d_o_34_35),
  .d_out_s_SE(d_34_43),
  .d_out_s_S(d_o_34_42),
  .d_out_s_SW(d_34_42),
  .d_out_s_W(d_o_34_33),
  .c_out_f_NW(c_34_25),
  .c_out_f_NE(c_34_26),
  .c_out_f_SW(c_34_33),
  .c_out_s_N(c_o_34_26),
  .c_out_s_E(c_o_34_35),
  .c_out_s_S(c_o_34_42),
  .c_out_s_W(c_o_34_33)
  );

/* tile 35 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_35_36, d_o_35_36, d_35_44, d_35_43, d_o_35_43;
wire c_o_35_43, c_o_35_36;
/* tile 35 input wires (credit and data lines) */
wire c_36_35, c_o_36_35, c_44_35, c_43_35, c_o_43_35;
wire [`PATH_WIDTH:0] d_o_43_35, d_o_36_35;

tile #(35, 1, 3) t35(
  /* inputs */
  .d_in_f_NW(d_26_35),
  .d_in_f_NE(d_27_35),
  .d_in_f_SW(d_34_35),
  .d_in_s_N(d_o_27_35),
  .d_in_s_E(d_o_36_35),
  .d_in_s_S(d_o_43_35),
  .d_in_s_W(d_o_34_35),
  .c_in_s_N(c_o_27_35),
  .c_in_s_NE(c_36_35),
  .c_in_s_E(c_o_36_35),
  .c_in_s_SE(c_44_35),
  .c_in_s_S(c_o_43_35),
  .c_in_s_SW(c_43_35),
  .c_in_s_W(c_o_34_35),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_35_27),
  .d_out_s_NE(d_35_36),
  .d_out_s_E(d_o_35_36),
  .d_out_s_SE(d_35_44),
  .d_out_s_S(d_o_35_43),
  .d_out_s_SW(d_35_43),
  .d_out_s_W(d_o_35_34),
  .c_out_f_NW(c_35_26),
  .c_out_f_NE(c_35_27),
  .c_out_f_SW(c_35_34),
  .c_out_s_N(c_o_35_27),
  .c_out_s_E(c_o_35_36),
  .c_out_s_S(c_o_35_43),
  .c_out_s_W(c_o_35_34)
  );

/* tile 36 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_36_37, d_o_36_37, d_36_45, d_36_44, d_o_36_44;
wire c_o_36_44, c_o_36_37;
/* tile 36 input wires (credit and data lines) */
wire c_37_36, c_o_37_36, c_45_36, c_44_36, c_o_44_36;
wire [`PATH_WIDTH:0] d_o_44_36, d_o_37_36;

tile #(36, 1, 3) t36(
  /* inputs */
  .d_in_f_NW(d_27_36),
  .d_in_f_NE(d_28_36),
  .d_in_f_SW(d_35_36),
  .d_in_s_N(d_o_28_36),
  .d_in_s_E(d_o_37_36),
  .d_in_s_S(d_o_44_36),
  .d_in_s_W(d_o_35_36),
  .c_in_s_N(c_o_28_36),
  .c_in_s_NE(c_37_36),
  .c_in_s_E(c_o_37_36),
  .c_in_s_SE(c_45_36),
  .c_in_s_S(c_o_44_36),
  .c_in_s_SW(c_44_36),
  .c_in_s_W(c_o_35_36),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_36_28),
  .d_out_s_NE(d_36_37),
  .d_out_s_E(d_o_36_37),
  .d_out_s_SE(d_36_45),
  .d_out_s_S(d_o_36_44),
  .d_out_s_SW(d_36_44),
  .d_out_s_W(d_o_36_35),
  .c_out_f_NW(c_36_27),
  .c_out_f_NE(c_36_28),
  .c_out_f_SW(c_36_35),
  .c_out_s_N(c_o_36_28),
  .c_out_s_E(c_o_36_37),
  .c_out_s_S(c_o_36_44),
  .c_out_s_W(c_o_36_35)
  );

/* tile 37 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_37_38, d_o_37_38, d_37_46, d_37_45, d_o_37_45;
wire c_o_37_45, c_o_37_38;
/* tile 37 input wires (credit and data lines) */
wire c_38_37, c_o_38_37, c_46_37, c_45_37, c_o_45_37;
wire [`PATH_WIDTH:0] d_o_45_37, d_o_38_37;

tile #(37, 1, 3) t37(
  /* inputs */
  .d_in_f_NW(d_28_37),
  .d_in_f_NE(d_29_37),
  .d_in_f_SW(d_36_37),
  .d_in_s_N(d_o_29_37),
  .d_in_s_E(d_o_38_37),
  .d_in_s_S(d_o_45_37),
  .d_in_s_W(d_o_36_37),
  .c_in_s_N(c_o_29_37),
  .c_in_s_NE(c_38_37),
  .c_in_s_E(c_o_38_37),
  .c_in_s_SE(c_46_37),
  .c_in_s_S(c_o_45_37),
  .c_in_s_SW(c_45_37),
  .c_in_s_W(c_o_36_37),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_37_29),
  .d_out_s_NE(d_37_38),
  .d_out_s_E(d_o_37_38),
  .d_out_s_SE(d_37_46),
  .d_out_s_S(d_o_37_45),
  .d_out_s_SW(d_37_45),
  .d_out_s_W(d_o_37_36),
  .c_out_f_NW(c_37_28),
  .c_out_f_NE(c_37_29),
  .c_out_f_SW(c_37_36),
  .c_out_s_N(c_o_37_29),
  .c_out_s_E(c_o_37_38),
  .c_out_s_S(c_o_37_45),
  .c_out_s_W(c_o_37_36)
  );

/* tile 38 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_38_39, d_o_38_39, d_38_47, d_38_46, d_o_38_46;
wire c_o_38_46, c_o_38_39;
/* tile 38 input wires (credit and data lines) */
wire c_39_38, c_o_39_38, c_47_38, c_46_38, c_o_46_38;
wire [`PATH_WIDTH:0] d_o_46_38, d_o_39_38;

tile #(38, 1, 3) t38(
  /* inputs */
  .d_in_f_NW(d_29_38),
  .d_in_f_NE(d_30_38),
  .d_in_f_SW(d_37_38),
  .d_in_s_N(d_o_30_38),
  .d_in_s_E(d_o_39_38),
  .d_in_s_S(d_o_46_38),
  .d_in_s_W(d_o_37_38),
  .c_in_s_N(c_o_30_38),
  .c_in_s_NE(c_39_38),
  .c_in_s_E(c_o_39_38),
  .c_in_s_SE(c_47_38),
  .c_in_s_S(c_o_46_38),
  .c_in_s_SW(c_46_38),
  .c_in_s_W(c_o_37_38),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_38_30),
  .d_out_s_NE(d_38_39),
  .d_out_s_E(d_o_38_39),
  .d_out_s_SE(d_38_47),
  .d_out_s_S(d_o_38_46),
  .d_out_s_SW(d_38_46),
  .d_out_s_W(d_o_38_37),
  .c_out_f_NW(c_38_29),
  .c_out_f_NE(c_38_30),
  .c_out_f_SW(c_38_37),
  .c_out_s_N(c_o_38_30),
  .c_out_s_E(c_o_38_39),
  .c_out_s_S(c_o_38_46),
  .c_out_s_W(c_o_38_37)
  );

/* tile 39 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_39_47, d_o_39_47;
wire c_o_39_47;
/* tile 39 input wires (credit and data lines) */
wire c_47_39, c_o_47_39;
wire [`PATH_WIDTH:0] d_o_47_39;

tile #(39, 2, 3) t39(
  /* inputs */
  .d_in_f_NW(d_30_39),
  .d_in_f_NE(d_31_39),
  .d_in_f_SW(d_38_39),
  .d_in_s_N(d_o_31_39),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_47_39),
  .d_in_s_W(d_o_38_39),
  .c_in_s_N(c_o_31_39),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o21),
  .c_in_s_SE(c_in_o20),
  .c_in_s_S(c_o_47_39),
  .c_in_s_SW(c_47_39),
  .c_in_s_W(c_o_38_39),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_39_31),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o21),
  .d_out_s_SE(d_out_o20),
  .d_out_s_S(d_o_39_47),
  .d_out_s_SW(d_39_47),
  .d_out_s_W(d_o_39_38),
  .c_out_f_NW(c_39_30),
  .c_out_f_NE(c_39_31),
  .c_out_f_SW(c_39_38),
  .c_out_s_N(c_o_39_31),
  .c_out_s_E(),
  .c_out_s_S(c_o_39_47),
  .c_out_s_W(c_o_39_38)
  );

/* tile 40 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_40_41, d_o_40_41, d_40_49, d_40_48, d_o_40_48;
wire c_o_40_48, c_o_40_41;
/* tile 40 input wires (credit and data lines) */
wire c_41_40, c_o_41_40, c_49_40, c_48_40, c_o_48_40;
wire [`PATH_WIDTH:0] d_o_48_40, d_o_41_40;

tile #(40, 3, 1) t40(
  /* inputs */
  .d_in_f_NW(d_in_e38),
  .d_in_f_NE(d_32_40),
  .d_in_f_SW(d_in_e39),
  .d_in_s_N(d_o_32_40),
  .d_in_s_E(d_o_41_40),
  .d_in_s_S(d_o_48_40),
  .d_in_s_W(d_in_e40),
  .c_in_s_N(c_o_32_40),
  .c_in_s_NE(c_41_40),
  .c_in_s_E(c_o_41_40),
  .c_in_s_SE(c_49_40),
  .c_in_s_S(c_o_48_40),
  .c_in_s_SW(c_48_40),
  .c_in_s_W(c_in_e13),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_40_32),
  .d_out_s_NE(d_40_41),
  .d_out_s_E(d_o_40_41),
  .d_out_s_SE(d_40_49),
  .d_out_s_S(d_o_40_48),
  .d_out_s_SW(d_40_48),
  .d_out_s_W(d_out_e13),
  .c_out_f_NW(c_out_e38),
  .c_out_f_NE(c_40_32),
  .c_out_f_SW(c_out_e39),
  .c_out_s_N(c_o_40_32),
  .c_out_s_E(c_o_40_41),
  .c_out_s_S(c_o_40_48),
  .c_out_s_W(c_out_e40)
  );

/* tile 41 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_41_42, d_o_41_42, d_41_50, d_41_49, d_o_41_49;
wire c_o_41_49, c_o_41_42;
/* tile 41 input wires (credit and data lines) */
wire c_42_41, c_o_42_41, c_50_41, c_49_41, c_o_49_41;
wire [`PATH_WIDTH:0] d_o_49_41, d_o_42_41;

tile #(41, 3, 1) t41(
  /* inputs */
  .d_in_f_NW(d_32_41),
  .d_in_f_NE(d_33_41),
  .d_in_f_SW(d_40_41),
  .d_in_s_N(d_o_33_41),
  .d_in_s_E(d_o_42_41),
  .d_in_s_S(d_o_49_41),
  .d_in_s_W(d_o_40_41),
  .c_in_s_N(c_o_33_41),
  .c_in_s_NE(c_42_41),
  .c_in_s_E(c_o_42_41),
  .c_in_s_SE(c_50_41),
  .c_in_s_S(c_o_49_41),
  .c_in_s_SW(c_49_41),
  .c_in_s_W(c_o_40_41),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_41_33),
  .d_out_s_NE(d_41_42),
  .d_out_s_E(d_o_41_42),
  .d_out_s_SE(d_41_50),
  .d_out_s_S(d_o_41_49),
  .d_out_s_SW(d_41_49),
  .d_out_s_W(d_o_41_40),
  .c_out_f_NW(c_41_32),
  .c_out_f_NE(c_41_33),
  .c_out_f_SW(c_41_40),
  .c_out_s_N(c_o_41_33),
  .c_out_s_E(c_o_41_42),
  .c_out_s_S(c_o_41_49),
  .c_out_s_W(c_o_41_40)
  );

/* tile 42 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_42_43, d_o_42_43, d_42_51, d_42_50, d_o_42_50;
wire c_o_42_50, c_o_42_43;
/* tile 42 input wires (credit and data lines) */
wire c_43_42, c_o_43_42, c_51_42, c_50_42, c_o_50_42;
wire [`PATH_WIDTH:0] d_o_50_42, d_o_43_42;

tile #(42, 3, 1) t42(
  /* inputs */
  .d_in_f_NW(d_33_42),
  .d_in_f_NE(d_34_42),
  .d_in_f_SW(d_41_42),
  .d_in_s_N(d_o_34_42),
  .d_in_s_E(d_o_43_42),
  .d_in_s_S(d_o_50_42),
  .d_in_s_W(d_o_41_42),
  .c_in_s_N(c_o_34_42),
  .c_in_s_NE(c_43_42),
  .c_in_s_E(c_o_43_42),
  .c_in_s_SE(c_51_42),
  .c_in_s_S(c_o_50_42),
  .c_in_s_SW(c_50_42),
  .c_in_s_W(c_o_41_42),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_42_34),
  .d_out_s_NE(d_42_43),
  .d_out_s_E(d_o_42_43),
  .d_out_s_SE(d_42_51),
  .d_out_s_S(d_o_42_50),
  .d_out_s_SW(d_42_50),
  .d_out_s_W(d_o_42_41),
  .c_out_f_NW(c_42_33),
  .c_out_f_NE(c_42_34),
  .c_out_f_SW(c_42_41),
  .c_out_s_N(c_o_42_34),
  .c_out_s_E(c_o_42_43),
  .c_out_s_S(c_o_42_50),
  .c_out_s_W(c_o_42_41)
  );

/* tile 43 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_43_44, d_o_43_44, d_43_52, d_43_51, d_o_43_51;
wire c_o_43_51, c_o_43_44;
/* tile 43 input wires (credit and data lines) */
wire c_44_43, c_o_44_43, c_52_43, c_51_43, c_o_51_43;
wire [`PATH_WIDTH:0] d_o_51_43, d_o_44_43;

tile #(43, 3, 1) t43(
  /* inputs */
  .d_in_f_NW(d_34_43),
  .d_in_f_NE(d_35_43),
  .d_in_f_SW(d_42_43),
  .d_in_s_N(d_o_35_43),
  .d_in_s_E(d_o_44_43),
  .d_in_s_S(d_o_51_43),
  .d_in_s_W(d_o_42_43),
  .c_in_s_N(c_o_35_43),
  .c_in_s_NE(c_44_43),
  .c_in_s_E(c_o_44_43),
  .c_in_s_SE(c_52_43),
  .c_in_s_S(c_o_51_43),
  .c_in_s_SW(c_51_43),
  .c_in_s_W(c_o_42_43),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_43_35),
  .d_out_s_NE(d_43_44),
  .d_out_s_E(d_o_43_44),
  .d_out_s_SE(d_43_52),
  .d_out_s_S(d_o_43_51),
  .d_out_s_SW(d_43_51),
  .d_out_s_W(d_o_43_42),
  .c_out_f_NW(c_43_34),
  .c_out_f_NE(c_43_35),
  .c_out_f_SW(c_43_42),
  .c_out_s_N(c_o_43_35),
  .c_out_s_E(c_o_43_44),
  .c_out_s_S(c_o_43_51),
  .c_out_s_W(c_o_43_42)
  );

/* tile 44 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_44_45, d_o_44_45, d_44_53, d_44_52, d_o_44_52;
wire c_o_44_52, c_o_44_45;
/* tile 44 input wires (credit and data lines) */
wire c_45_44, c_o_45_44, c_53_44, c_52_44, c_o_52_44;
wire [`PATH_WIDTH:0] d_o_52_44, d_o_45_44;

tile #(44, 3, 1) t44(
  /* inputs */
  .d_in_f_NW(d_35_44),
  .d_in_f_NE(d_36_44),
  .d_in_f_SW(d_43_44),
  .d_in_s_N(d_o_36_44),
  .d_in_s_E(d_o_45_44),
  .d_in_s_S(d_o_52_44),
  .d_in_s_W(d_o_43_44),
  .c_in_s_N(c_o_36_44),
  .c_in_s_NE(c_45_44),
  .c_in_s_E(c_o_45_44),
  .c_in_s_SE(c_53_44),
  .c_in_s_S(c_o_52_44),
  .c_in_s_SW(c_52_44),
  .c_in_s_W(c_o_43_44),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_44_36),
  .d_out_s_NE(d_44_45),
  .d_out_s_E(d_o_44_45),
  .d_out_s_SE(d_44_53),
  .d_out_s_S(d_o_44_52),
  .d_out_s_SW(d_44_52),
  .d_out_s_W(d_o_44_43),
  .c_out_f_NW(c_44_35),
  .c_out_f_NE(c_44_36),
  .c_out_f_SW(c_44_43),
  .c_out_s_N(c_o_44_36),
  .c_out_s_E(c_o_44_45),
  .c_out_s_S(c_o_44_52),
  .c_out_s_W(c_o_44_43)
  );

/* tile 45 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_45_46, d_o_45_46, d_45_54, d_45_53, d_o_45_53;
wire c_o_45_53, c_o_45_46;
/* tile 45 input wires (credit and data lines) */
wire c_46_45, c_o_46_45, c_54_45, c_53_45, c_o_53_45;
wire [`PATH_WIDTH:0] d_o_53_45, d_o_46_45;

tile #(45, 3, 1) t45(
  /* inputs */
  .d_in_f_NW(d_36_45),
  .d_in_f_NE(d_37_45),
  .d_in_f_SW(d_44_45),
  .d_in_s_N(d_o_37_45),
  .d_in_s_E(d_o_46_45),
  .d_in_s_S(d_o_53_45),
  .d_in_s_W(d_o_44_45),
  .c_in_s_N(c_o_37_45),
  .c_in_s_NE(c_46_45),
  .c_in_s_E(c_o_46_45),
  .c_in_s_SE(c_54_45),
  .c_in_s_S(c_o_53_45),
  .c_in_s_SW(c_53_45),
  .c_in_s_W(c_o_44_45),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_45_37),
  .d_out_s_NE(d_45_46),
  .d_out_s_E(d_o_45_46),
  .d_out_s_SE(d_45_54),
  .d_out_s_S(d_o_45_53),
  .d_out_s_SW(d_45_53),
  .d_out_s_W(d_o_45_44),
  .c_out_f_NW(c_45_36),
  .c_out_f_NE(c_45_37),
  .c_out_f_SW(c_45_44),
  .c_out_s_N(c_o_45_37),
  .c_out_s_E(c_o_45_46),
  .c_out_s_S(c_o_45_53),
  .c_out_s_W(c_o_45_44)
  );

/* tile 46 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_46_47, d_o_46_47, d_46_55, d_46_54, d_o_46_54;
wire c_o_46_54, c_o_46_47;
/* tile 46 input wires (credit and data lines) */
wire c_47_46, c_o_47_46, c_55_46, c_54_46, c_o_54_46;
wire [`PATH_WIDTH:0] d_o_54_46, d_o_47_46;

tile #(46, 3, 1) t46(
  /* inputs */
  .d_in_f_NW(d_37_46),
  .d_in_f_NE(d_38_46),
  .d_in_f_SW(d_45_46),
  .d_in_s_N(d_o_38_46),
  .d_in_s_E(d_o_47_46),
  .d_in_s_S(d_o_54_46),
  .d_in_s_W(d_o_45_46),
  .c_in_s_N(c_o_38_46),
  .c_in_s_NE(c_47_46),
  .c_in_s_E(c_o_47_46),
  .c_in_s_SE(c_55_46),
  .c_in_s_S(c_o_54_46),
  .c_in_s_SW(c_54_46),
  .c_in_s_W(c_o_45_46),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_46_38),
  .d_out_s_NE(d_46_47),
  .d_out_s_E(d_o_46_47),
  .d_out_s_SE(d_46_55),
  .d_out_s_S(d_o_46_54),
  .d_out_s_SW(d_46_54),
  .d_out_s_W(d_o_46_45),
  .c_out_f_NW(c_46_37),
  .c_out_f_NE(c_46_38),
  .c_out_f_SW(c_46_45),
  .c_out_s_N(c_o_46_38),
  .c_out_s_E(c_o_46_47),
  .c_out_s_S(c_o_46_54),
  .c_out_s_W(c_o_46_45)
  );

/* tile 47 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_47_55, d_o_47_55;
wire c_o_47_55;
/* tile 47 input wires (credit and data lines) */
wire c_55_47, c_o_55_47;
wire [`PATH_WIDTH:0] d_o_55_47;

tile #(47, 3, 0) t47(
  /* inputs */
  .d_in_f_NW(d_38_47),
  .d_in_f_NE(d_39_47),
  .d_in_f_SW(d_46_47),
  .d_in_s_N(d_o_39_47),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_55_47),
  .d_in_s_W(d_o_46_47),
  .c_in_s_N(c_o_39_47),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o19),
  .c_in_s_SE(c_in_o18),
  .c_in_s_S(c_o_55_47),
  .c_in_s_SW(c_55_47),
  .c_in_s_W(c_o_46_47),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_47_39),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o19),
  .d_out_s_SE(d_out_o18),
  .d_out_s_S(d_o_47_55),
  .d_out_s_SW(d_47_55),
  .d_out_s_W(d_o_47_46),
  .c_out_f_NW(c_47_38),
  .c_out_f_NE(c_47_39),
  .c_out_f_SW(c_47_46),
  .c_out_s_N(c_o_47_39),
  .c_out_s_E(),
  .c_out_s_S(c_o_47_55),
  .c_out_s_W(c_o_47_46)
  );

/* tile 48 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_48_49, d_o_48_49, d_48_57, d_48_56, d_o_48_56;
wire c_o_48_56, c_o_48_49;
/* tile 48 input wires (credit and data lines) */
wire c_49_48, c_o_49_48, c_57_48, c_56_48, c_o_56_48;
wire [`PATH_WIDTH:0] d_o_56_48, d_o_49_48;

tile #(48, 1, 3) t48(
  /* inputs */
  .d_in_f_NW(d_in_e41),
  .d_in_f_NE(d_40_48),
  .d_in_f_SW(d_in_e42),
  .d_in_s_N(d_o_40_48),
  .d_in_s_E(d_o_49_48),
  .d_in_s_S(d_o_56_48),
  .d_in_s_W(d_in_e43),
  .c_in_s_N(c_o_40_48),
  .c_in_s_NE(c_49_48),
  .c_in_s_E(c_o_49_48),
  .c_in_s_SE(c_57_48),
  .c_in_s_S(c_o_56_48),
  .c_in_s_SW(c_56_48),
  .c_in_s_W(c_in_e14),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_48_40),
  .d_out_s_NE(d_48_49),
  .d_out_s_E(d_o_48_49),
  .d_out_s_SE(d_48_57),
  .d_out_s_S(d_o_48_56),
  .d_out_s_SW(d_48_56),
  .d_out_s_W(d_out_e14),
  .c_out_f_NW(c_out_e41),
  .c_out_f_NE(c_48_40),
  .c_out_f_SW(c_out_e42),
  .c_out_s_N(c_o_48_40),
  .c_out_s_E(c_o_48_49),
  .c_out_s_S(c_o_48_56),
  .c_out_s_W(c_out_e43)
  );

/* tile 49 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_49_50, d_o_49_50, d_49_58, d_49_57, d_o_49_57;
wire c_o_49_57, c_o_49_50;
/* tile 49 input wires (credit and data lines) */
wire c_50_49, c_o_50_49, c_58_49, c_57_49, c_o_57_49;
wire [`PATH_WIDTH:0] d_o_57_49, d_o_50_49;

tile #(49, 1, 3) t49(
  /* inputs */
  .d_in_f_NW(d_40_49),
  .d_in_f_NE(d_41_49),
  .d_in_f_SW(d_48_49),
  .d_in_s_N(d_o_41_49),
  .d_in_s_E(d_o_50_49),
  .d_in_s_S(d_o_57_49),
  .d_in_s_W(d_o_48_49),
  .c_in_s_N(c_o_41_49),
  .c_in_s_NE(c_50_49),
  .c_in_s_E(c_o_50_49),
  .c_in_s_SE(c_58_49),
  .c_in_s_S(c_o_57_49),
  .c_in_s_SW(c_57_49),
  .c_in_s_W(c_o_48_49),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_49_41),
  .d_out_s_NE(d_49_50),
  .d_out_s_E(d_o_49_50),
  .d_out_s_SE(d_49_58),
  .d_out_s_S(d_o_49_57),
  .d_out_s_SW(d_49_57),
  .d_out_s_W(d_o_49_48),
  .c_out_f_NW(c_49_40),
  .c_out_f_NE(c_49_41),
  .c_out_f_SW(c_49_48),
  .c_out_s_N(c_o_49_41),
  .c_out_s_E(c_o_49_50),
  .c_out_s_S(c_o_49_57),
  .c_out_s_W(c_o_49_48)
  );

/* tile 50 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_50_51, d_o_50_51, d_50_59, d_50_58, d_o_50_58;
wire c_o_50_58, c_o_50_51;
/* tile 50 input wires (credit and data lines) */
wire c_51_50, c_o_51_50, c_59_50, c_58_50, c_o_58_50;
wire [`PATH_WIDTH:0] d_o_58_50, d_o_51_50;

tile #(50, 1, 3) t50(
  /* inputs */
  .d_in_f_NW(d_41_50),
  .d_in_f_NE(d_42_50),
  .d_in_f_SW(d_49_50),
  .d_in_s_N(d_o_42_50),
  .d_in_s_E(d_o_51_50),
  .d_in_s_S(d_o_58_50),
  .d_in_s_W(d_o_49_50),
  .c_in_s_N(c_o_42_50),
  .c_in_s_NE(c_51_50),
  .c_in_s_E(c_o_51_50),
  .c_in_s_SE(c_59_50),
  .c_in_s_S(c_o_58_50),
  .c_in_s_SW(c_58_50),
  .c_in_s_W(c_o_49_50),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_50_42),
  .d_out_s_NE(d_50_51),
  .d_out_s_E(d_o_50_51),
  .d_out_s_SE(d_50_59),
  .d_out_s_S(d_o_50_58),
  .d_out_s_SW(d_50_58),
  .d_out_s_W(d_o_50_49),
  .c_out_f_NW(c_50_41),
  .c_out_f_NE(c_50_42),
  .c_out_f_SW(c_50_49),
  .c_out_s_N(c_o_50_42),
  .c_out_s_E(c_o_50_51),
  .c_out_s_S(c_o_50_58),
  .c_out_s_W(c_o_50_49)
  );

/* tile 51 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_51_52, d_o_51_52, d_51_60, d_51_59, d_o_51_59;
wire c_o_51_59, c_o_51_52;
/* tile 51 input wires (credit and data lines) */
wire c_52_51, c_o_52_51, c_60_51, c_59_51, c_o_59_51;
wire [`PATH_WIDTH:0] d_o_59_51, d_o_52_51;

tile #(51, 1, 3) t51(
  /* inputs */
  .d_in_f_NW(d_42_51),
  .d_in_f_NE(d_43_51),
  .d_in_f_SW(d_50_51),
  .d_in_s_N(d_o_43_51),
  .d_in_s_E(d_o_52_51),
  .d_in_s_S(d_o_59_51),
  .d_in_s_W(d_o_50_51),
  .c_in_s_N(c_o_43_51),
  .c_in_s_NE(c_52_51),
  .c_in_s_E(c_o_52_51),
  .c_in_s_SE(c_60_51),
  .c_in_s_S(c_o_59_51),
  .c_in_s_SW(c_59_51),
  .c_in_s_W(c_o_50_51),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_51_43),
  .d_out_s_NE(d_51_52),
  .d_out_s_E(d_o_51_52),
  .d_out_s_SE(d_51_60),
  .d_out_s_S(d_o_51_59),
  .d_out_s_SW(d_51_59),
  .d_out_s_W(d_o_51_50),
  .c_out_f_NW(c_51_42),
  .c_out_f_NE(c_51_43),
  .c_out_f_SW(c_51_50),
  .c_out_s_N(c_o_51_43),
  .c_out_s_E(c_o_51_52),
  .c_out_s_S(c_o_51_59),
  .c_out_s_W(c_o_51_50)
  );

/* tile 52 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_52_53, d_o_52_53, d_52_61, d_52_60, d_o_52_60;
wire c_o_52_60, c_o_52_53;
/* tile 52 input wires (credit and data lines) */
wire c_53_52, c_o_53_52, c_61_52, c_60_52, c_o_60_52;
wire [`PATH_WIDTH:0] d_o_60_52, d_o_53_52;

tile #(52, 1, 3) t52(
  /* inputs */
  .d_in_f_NW(d_43_52),
  .d_in_f_NE(d_44_52),
  .d_in_f_SW(d_51_52),
  .d_in_s_N(d_o_44_52),
  .d_in_s_E(d_o_53_52),
  .d_in_s_S(d_o_60_52),
  .d_in_s_W(d_o_51_52),
  .c_in_s_N(c_o_44_52),
  .c_in_s_NE(c_53_52),
  .c_in_s_E(c_o_53_52),
  .c_in_s_SE(c_61_52),
  .c_in_s_S(c_o_60_52),
  .c_in_s_SW(c_60_52),
  .c_in_s_W(c_o_51_52),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_52_44),
  .d_out_s_NE(d_52_53),
  .d_out_s_E(d_o_52_53),
  .d_out_s_SE(d_52_61),
  .d_out_s_S(d_o_52_60),
  .d_out_s_SW(d_52_60),
  .d_out_s_W(d_o_52_51),
  .c_out_f_NW(c_52_43),
  .c_out_f_NE(c_52_44),
  .c_out_f_SW(c_52_51),
  .c_out_s_N(c_o_52_44),
  .c_out_s_E(c_o_52_53),
  .c_out_s_S(c_o_52_60),
  .c_out_s_W(c_o_52_51)
  );

/* tile 53 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_53_54, d_o_53_54, d_53_62, d_53_61, d_o_53_61;
wire c_o_53_61, c_o_53_54;
/* tile 53 input wires (credit and data lines) */
wire c_54_53, c_o_54_53, c_62_53, c_61_53, c_o_61_53;
wire [`PATH_WIDTH:0] d_o_61_53, d_o_54_53;

tile #(53, 1, 3) t53(
  /* inputs */
  .d_in_f_NW(d_44_53),
  .d_in_f_NE(d_45_53),
  .d_in_f_SW(d_52_53),
  .d_in_s_N(d_o_45_53),
  .d_in_s_E(d_o_54_53),
  .d_in_s_S(d_o_61_53),
  .d_in_s_W(d_o_52_53),
  .c_in_s_N(c_o_45_53),
  .c_in_s_NE(c_54_53),
  .c_in_s_E(c_o_54_53),
  .c_in_s_SE(c_62_53),
  .c_in_s_S(c_o_61_53),
  .c_in_s_SW(c_61_53),
  .c_in_s_W(c_o_52_53),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_53_45),
  .d_out_s_NE(d_53_54),
  .d_out_s_E(d_o_53_54),
  .d_out_s_SE(d_53_62),
  .d_out_s_S(d_o_53_61),
  .d_out_s_SW(d_53_61),
  .d_out_s_W(d_o_53_52),
  .c_out_f_NW(c_53_44),
  .c_out_f_NE(c_53_45),
  .c_out_f_SW(c_53_52),
  .c_out_s_N(c_o_53_45),
  .c_out_s_E(c_o_53_54),
  .c_out_s_S(c_o_53_61),
  .c_out_s_W(c_o_53_52)
  );

/* tile 54 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_54_55, d_o_54_55, d_54_63, d_54_62, d_o_54_62;
wire c_o_54_62, c_o_54_55;
/* tile 54 input wires (credit and data lines) */
wire c_55_54, c_o_55_54, c_63_54, c_62_54, c_o_62_54;
wire [`PATH_WIDTH:0] d_o_62_54, d_o_55_54;

tile #(54, 1, 3) t54(
  /* inputs */
  .d_in_f_NW(d_45_54),
  .d_in_f_NE(d_46_54),
  .d_in_f_SW(d_53_54),
  .d_in_s_N(d_o_46_54),
  .d_in_s_E(d_o_55_54),
  .d_in_s_S(d_o_62_54),
  .d_in_s_W(d_o_53_54),
  .c_in_s_N(c_o_46_54),
  .c_in_s_NE(c_55_54),
  .c_in_s_E(c_o_55_54),
  .c_in_s_SE(c_63_54),
  .c_in_s_S(c_o_62_54),
  .c_in_s_SW(c_62_54),
  .c_in_s_W(c_o_53_54),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_54_46),
  .d_out_s_NE(d_54_55),
  .d_out_s_E(d_o_54_55),
  .d_out_s_SE(d_54_63),
  .d_out_s_S(d_o_54_62),
  .d_out_s_SW(d_54_62),
  .d_out_s_W(d_o_54_53),
  .c_out_f_NW(c_54_45),
  .c_out_f_NE(c_54_46),
  .c_out_f_SW(c_54_53),
  .c_out_s_N(c_o_54_46),
  .c_out_s_E(c_o_54_55),
  .c_out_s_S(c_o_54_62),
  .c_out_s_W(c_o_54_53)
  );

/* tile 55 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_55_63, d_o_55_63;
wire c_o_55_63;
/* tile 55 input wires (credit and data lines) */
wire c_63_55, c_o_63_55;
wire [`PATH_WIDTH:0] d_o_63_55;

tile #(55, 2, 3) t55(
  /* inputs */
  .d_in_f_NW(d_46_55),
  .d_in_f_NE(d_47_55),
  .d_in_f_SW(d_54_55),
  .d_in_s_N(d_o_47_55),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S(d_o_63_55),
  .d_in_s_W(d_o_54_55),
  .c_in_s_N(c_o_47_55),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o17),
  .c_in_s_SE(c_in_o16),
  .c_in_s_S(c_o_63_55),
  .c_in_s_SW(c_63_55),
  .c_in_s_W(c_o_54_55),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_55_47),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o17),
  .d_out_s_SE(d_out_o16),
  .d_out_s_S(d_o_55_63),
  .d_out_s_SW(d_55_63),
  .d_out_s_W(d_o_55_54),
  .c_out_f_NW(c_55_46),
  .c_out_f_NE(c_55_47),
  .c_out_f_SW(c_55_54),
  .c_out_s_N(c_o_55_47),
  .c_out_s_E(),
  .c_out_s_S(c_o_55_63),
  .c_out_s_W(c_o_55_54)
  );

/* tile 56 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_56_57, d_o_56_57;
wire c_o_56_57;
/* tile 56 input wires (credit and data lines) */
wire c_57_56, c_o_57_56;
wire [`PATH_WIDTH:0] d_o_57_56;

tile #(56, 3, 1) t56(
  /* inputs */
  .d_in_f_NW(d_in_e44),
  .d_in_f_NE(d_48_56),
  .d_in_f_SW(d_in_e45),
  .d_in_s_N(d_o_48_56),
  .d_in_s_E(d_o_57_56),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_in_e46),
  .c_in_s_N(c_o_48_56),
  .c_in_s_NE(c_57_56),
  .c_in_s_E(c_o_57_56),
  .c_in_s_SE(c_in_o1),
  .c_in_s_S(c_in_o0),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_in_e15),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_56_48),
  .d_out_s_NE(d_56_57),
  .d_out_s_E(d_o_56_57),
  .d_out_s_SE(d_out_o1),
  .d_out_s_S(d_out_o0),
  .d_out_s_SW(),
  .d_out_s_W(d_out_e15),
  .c_out_f_NW(c_out_e44),
  .c_out_f_NE(c_56_48),
  .c_out_f_SW(c_out_e45),
  .c_out_s_N(c_o_56_48),
  .c_out_s_E(c_o_56_57),
  .c_out_s_S(),
  .c_out_s_W(c_out_e46)
  );

/* tile 57 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_57_58, d_o_57_58;
wire c_o_57_58;
/* tile 57 input wires (credit and data lines) */
wire c_58_57, c_o_58_57;
wire [`PATH_WIDTH:0] d_o_58_57;

tile #(57, 3, 1) t57(
  /* inputs */
  .d_in_f_NW(d_48_57),
  .d_in_f_NE(d_49_57),
  .d_in_f_SW(d_56_57),
  .d_in_s_N(d_o_49_57),
  .d_in_s_E(d_o_58_57),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_56_57),
  .c_in_s_N(c_o_49_57),
  .c_in_s_NE(c_58_57),
  .c_in_s_E(c_o_58_57),
  .c_in_s_SE(c_in_o3),
  .c_in_s_S(c_in_o2),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_56_57),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_57_49),
  .d_out_s_NE(d_57_58),
  .d_out_s_E(d_o_57_58),
  .d_out_s_SE(d_out_o3),
  .d_out_s_S(d_out_o2),
  .d_out_s_SW(),
  .d_out_s_W(d_o_57_56),
  .c_out_f_NW(c_57_48),
  .c_out_f_NE(c_57_49),
  .c_out_f_SW(c_57_56),
  .c_out_s_N(c_o_57_49),
  .c_out_s_E(c_o_57_58),
  .c_out_s_S(),
  .c_out_s_W(c_o_57_56)
  );

/* tile 58 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_58_59, d_o_58_59;
wire c_o_58_59;
/* tile 58 input wires (credit and data lines) */
wire c_59_58, c_o_59_58;
wire [`PATH_WIDTH:0] d_o_59_58;

tile #(58, 3, 1) t58(
  /* inputs */
  .d_in_f_NW(d_49_58),
  .d_in_f_NE(d_50_58),
  .d_in_f_SW(d_57_58),
  .d_in_s_N(d_o_50_58),
  .d_in_s_E(d_o_59_58),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_57_58),
  .c_in_s_N(c_o_50_58),
  .c_in_s_NE(c_59_58),
  .c_in_s_E(c_o_59_58),
  .c_in_s_SE(c_in_o5),
  .c_in_s_S(c_in_o4),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_57_58),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_58_50),
  .d_out_s_NE(d_58_59),
  .d_out_s_E(d_o_58_59),
  .d_out_s_SE(d_out_o5),
  .d_out_s_S(d_out_o4),
  .d_out_s_SW(),
  .d_out_s_W(d_o_58_57),
  .c_out_f_NW(c_58_49),
  .c_out_f_NE(c_58_50),
  .c_out_f_SW(c_58_57),
  .c_out_s_N(c_o_58_50),
  .c_out_s_E(c_o_58_59),
  .c_out_s_S(),
  .c_out_s_W(c_o_58_57)
  );

/* tile 59 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_59_60, d_o_59_60;
wire c_o_59_60;
/* tile 59 input wires (credit and data lines) */
wire c_60_59, c_o_60_59;
wire [`PATH_WIDTH:0] d_o_60_59;

tile #(59, 3, 1) t59(
  /* inputs */
  .d_in_f_NW(d_50_59),
  .d_in_f_NE(d_51_59),
  .d_in_f_SW(d_58_59),
  .d_in_s_N(d_o_51_59),
  .d_in_s_E(d_o_60_59),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_58_59),
  .c_in_s_N(c_o_51_59),
  .c_in_s_NE(c_60_59),
  .c_in_s_E(c_o_60_59),
  .c_in_s_SE(c_in_o7),
  .c_in_s_S(c_in_o6),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_58_59),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_59_51),
  .d_out_s_NE(d_59_60),
  .d_out_s_E(d_o_59_60),
  .d_out_s_SE(d_out_o7),
  .d_out_s_S(d_out_o6),
  .d_out_s_SW(),
  .d_out_s_W(d_o_59_58),
  .c_out_f_NW(c_59_50),
  .c_out_f_NE(c_59_51),
  .c_out_f_SW(c_59_58),
  .c_out_s_N(c_o_59_51),
  .c_out_s_E(c_o_59_60),
  .c_out_s_S(),
  .c_out_s_W(c_o_59_58)
  );

/* tile 60 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_60_61, d_o_60_61;
wire c_o_60_61;
/* tile 60 input wires (credit and data lines) */
wire c_61_60, c_o_61_60;
wire [`PATH_WIDTH:0] d_o_61_60;

tile #(60, 3, 1) t60(
  /* inputs */
  .d_in_f_NW(d_51_60),
  .d_in_f_NE(d_52_60),
  .d_in_f_SW(d_59_60),
  .d_in_s_N(d_o_52_60),
  .d_in_s_E(d_o_61_60),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_59_60),
  .c_in_s_N(c_o_52_60),
  .c_in_s_NE(c_61_60),
  .c_in_s_E(c_o_61_60),
  .c_in_s_SE(c_in_o9),
  .c_in_s_S(c_in_o8),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_59_60),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_60_52),
  .d_out_s_NE(d_60_61),
  .d_out_s_E(d_o_60_61),
  .d_out_s_SE(d_out_o9),
  .d_out_s_S(d_out_o8),
  .d_out_s_SW(),
  .d_out_s_W(d_o_60_59),
  .c_out_f_NW(c_60_51),
  .c_out_f_NE(c_60_52),
  .c_out_f_SW(c_60_59),
  .c_out_s_N(c_o_60_52),
  .c_out_s_E(c_o_60_61),
  .c_out_s_S(),
  .c_out_s_W(c_o_60_59)
  );

/* tile 61 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_61_62, d_o_61_62;
wire c_o_61_62;
/* tile 61 input wires (credit and data lines) */
wire c_62_61, c_o_62_61;
wire [`PATH_WIDTH:0] d_o_62_61;

tile #(61, 3, 1) t61(
  /* inputs */
  .d_in_f_NW(d_52_61),
  .d_in_f_NE(d_53_61),
  .d_in_f_SW(d_60_61),
  .d_in_s_N(d_o_53_61),
  .d_in_s_E(d_o_62_61),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_60_61),
  .c_in_s_N(c_o_53_61),
  .c_in_s_NE(c_62_61),
  .c_in_s_E(c_o_62_61),
  .c_in_s_SE(c_in_o11),
  .c_in_s_S(c_in_o10),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_60_61),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_61_53),
  .d_out_s_NE(d_61_62),
  .d_out_s_E(d_o_61_62),
  .d_out_s_SE(d_out_o11),
  .d_out_s_S(d_out_o10),
  .d_out_s_SW(),
  .d_out_s_W(d_o_61_60),
  .c_out_f_NW(c_61_52),
  .c_out_f_NE(c_61_53),
  .c_out_f_SW(c_61_60),
  .c_out_s_N(c_o_61_53),
  .c_out_s_E(c_o_61_62),
  .c_out_s_S(),
  .c_out_s_W(c_o_61_60)
  );

/* tile 62 output wires (data and credit lines) */
wire [`PATH_WIDTH:0] d_62_63, d_o_62_63;
wire c_o_62_63;
/* tile 62 input wires (credit and data lines) */
wire c_63_62, c_o_63_62;
wire [`PATH_WIDTH:0] d_o_63_62;

tile #(62, 3, 1) t62(
  /* inputs */
  .d_in_f_NW(d_53_62),
  .d_in_f_NE(d_54_62),
  .d_in_f_SW(d_61_62),
  .d_in_s_N(d_o_54_62),
  .d_in_s_E(d_o_63_62),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_61_62),
  .c_in_s_N(c_o_54_62),
  .c_in_s_NE(c_63_62),
  .c_in_s_E(c_o_63_62),
  .c_in_s_SE(c_in_o13),
  .c_in_s_S(c_in_o12),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_61_62),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_62_54),
  .d_out_s_NE(d_62_63),
  .d_out_s_E(d_o_62_63),
  .d_out_s_SE(d_out_o13),
  .d_out_s_S(d_out_o12),
  .d_out_s_SW(),
  .d_out_s_W(d_o_62_61),
  .c_out_f_NW(c_62_53),
  .c_out_f_NE(c_62_54),
  .c_out_f_SW(c_62_61),
  .c_out_s_N(c_o_62_54),
  .c_out_s_E(c_o_62_63),
  .c_out_s_S(),
  .c_out_s_W(c_o_62_61)
  );

/* tile 63 output wires (data and credit lines) */
/* tile 63 input wires (credit and data lines) */

tile #(63, 3, 0) t63(
  /* inputs */
  .d_in_f_NW(d_54_63),
  .d_in_f_NE(d_55_63),
  .d_in_f_SW(d_62_63),
  .d_in_s_N(d_o_55_63),
  .d_in_s_E({`PATH_BITS{1'b0}}),
  .d_in_s_S({`PATH_BITS{1'b0}}),
  .d_in_s_W(d_o_62_63),
  .c_in_s_N(c_o_55_63),
  .c_in_s_NE(),
  .c_in_s_E(c_in_o15),
  .c_in_s_SE(c_in_o14),
  .c_in_s_S(1'b0),
  .c_in_s_SW(1'b0),
  .c_in_s_W(c_o_62_63),
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  .d_out_s_N(d_o_63_55),
  .d_out_s_NE(),
  .d_out_s_E(d_out_o15),
  .d_out_s_SE(d_out_o14),
  .d_out_s_S(),
  .d_out_s_SW(),
  .d_out_s_W(d_o_63_62),
  .c_out_f_NW(c_63_54),
  .c_out_f_NE(c_63_55),
  .c_out_f_SW(c_63_62),
  .c_out_s_N(c_o_63_55),
  .c_out_s_E(),
  .c_out_s_S(),
  .c_out_s_W(c_o_63_62)
  );

endmodule
