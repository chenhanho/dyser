//core.v
//
//  this file was auto-generated
`include "config.v"

module core(
  /* inputs */
  // data from input bridge
  d_in_0,
  d_in_1,
  d_in_2,
  d_in_3,
  d_in_4,
  d_in_5,
  d_in_6,
  d_in_7,
  d_in_8,
  d_in_9,
  d_in_10,
  d_in_11,
  d_in_12,
  d_in_13,
  d_in_14,
  d_in_15,
  d_in_16,
  d_in_17,
  d_in_18,
  d_in_19,
  d_in_20,
  d_in_21,
  d_in_22,
  d_in_23,
  d_in_24,
  d_in_25,
  d_in_26,
  d_in_27,
  d_in_28,
  d_in_29,
  d_in_30,
  d_in_31,
  // credit from output bridge
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
  conf_en,
  clk,
  rst,
  /* outputs */
  // data to output bridge
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
  // credit to input bridge
  c_out_0,
  c_out_1,
  c_out_2,
  c_out_3,
  c_out_4,
  c_out_5,
  c_out_6,
  c_out_7,
  c_out_8,
  c_out_9,
  c_out_10,
  c_out_11,
  c_out_12,
  c_out_13,
  c_out_14,
  c_out_15,
  c_out_16,
  c_out_17,
  c_out_18,
  c_out_19,
  c_out_20,
  c_out_21,
  c_out_22,
  c_out_23,
  c_out_24,
  c_out_25,
  c_out_26,
  c_out_27,
  c_out_28,
  c_out_29,
  c_out_30,
  c_out_31
  );

/* inputs */
input [`PATH_WIDTH:0] d_in_0;
input [`PATH_WIDTH:0] d_in_1;
input [`PATH_WIDTH:0] d_in_2;
input [`PATH_WIDTH:0] d_in_3;
input [`PATH_WIDTH:0] d_in_4;
input [`PATH_WIDTH:0] d_in_5;
input [`PATH_WIDTH:0] d_in_6;
input [`PATH_WIDTH:0] d_in_7;
input [`PATH_WIDTH:0] d_in_8;
input [`PATH_WIDTH:0] d_in_9;
input [`PATH_WIDTH:0] d_in_10;
input [`PATH_WIDTH:0] d_in_11;
input [`PATH_WIDTH:0] d_in_12;
input [`PATH_WIDTH:0] d_in_13;
input [`PATH_WIDTH:0] d_in_14;
input [`PATH_WIDTH:0] d_in_15;
input [`PATH_WIDTH:0] d_in_16;
input [`PATH_WIDTH:0] d_in_17;
input [`PATH_WIDTH:0] d_in_18;
input [`PATH_WIDTH:0] d_in_19;
input [`PATH_WIDTH:0] d_in_20;
input [`PATH_WIDTH:0] d_in_21;
input [`PATH_WIDTH:0] d_in_22;
input [`PATH_WIDTH:0] d_in_23;
input [`PATH_WIDTH:0] d_in_24;
input [`PATH_WIDTH:0] d_in_25;
input [`PATH_WIDTH:0] d_in_26;
input [`PATH_WIDTH:0] d_in_27;
input [`PATH_WIDTH:0] d_in_28;
input [`PATH_WIDTH:0] d_in_29;
input [`PATH_WIDTH:0] d_in_30;
input [`PATH_WIDTH:0] d_in_31;
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
input  conf_en;
input  clk;
input  rst;

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
output  c_out_0;
output  c_out_1;
output  c_out_2;
output  c_out_3;
output  c_out_4;
output  c_out_5;
output  c_out_6;
output  c_out_7;
output  c_out_8;
output  c_out_9;
output  c_out_10;
output  c_out_11;
output  c_out_12;
output  c_out_13;
output  c_out_14;
output  c_out_15;
output  c_out_16;
output  c_out_17;
output  c_out_18;
output  c_out_19;
output  c_out_20;
output  c_out_21;
output  c_out_22;
output  c_out_23;
output  c_out_24;
output  c_out_25;
output  c_out_26;
output  c_out_27;
output  c_out_28;
output  c_out_29;
output  c_out_30;
output  c_out_31;


////////////////////////////////////////////////
//
//    wires
//
////////////////////////////////////////////////

// wires from edge to tile
wire [`PATH_WIDTH:0] d_et_0, d_et_1, d_et_2, d_et_3, d_et_4, d_et_5, d_et_6, d_et_7, d_et_8, d_et_9, d_et_10, d_et_11, d_et_12, d_et_13, d_et_14, d_et_15, d_et_16, d_et_17, d_et_18, d_et_19, d_et_20, d_et_21, d_et_22, d_et_23, d_et_24, d_et_25, d_et_26, d_et_27, d_et_28, d_et_29, d_et_30, d_et_31, d_et_32, d_et_33, d_et_34, d_et_35, d_et_36, d_et_37, d_et_38, d_et_39, d_et_40, d_et_41, d_et_42, d_et_43, d_et_44, d_et_45, d_et_46;
wire c_et_0, c_et_1, c_et_2, c_et_3, c_et_4, c_et_5, c_et_6, c_et_7, c_et_8, c_et_9, c_et_10, c_et_11, c_et_12, c_et_13, c_et_14, c_et_15;

// wires from tile to edge
wire c_te_0, c_te_1, c_te_2, c_te_3, c_te_4, c_te_5, c_te_6, c_te_7, c_te_8, c_te_9, c_te_10, c_te_11, c_te_12, c_te_13, c_te_14, c_te_15, c_te_16, c_te_17, c_te_18, c_te_19, c_te_20, c_te_21, c_te_22, c_te_23, c_te_24, c_te_25, c_te_26, c_te_27, c_te_28, c_te_29, c_te_30, c_te_31, c_te_32, c_te_33, c_te_34, c_te_35, c_te_36, c_te_37, c_te_38, c_te_39, c_te_40, c_te_41, c_te_42, c_te_43, c_te_44, c_te_45, c_te_46;
wire [`PATH_WIDTH:0] d_te_0, d_te_1, d_te_2, d_te_3, d_te_4, d_te_5, d_te_6, d_te_7, d_te_8, d_te_9, d_te_10, d_te_11, d_te_12, d_te_13, d_te_14, d_te_15;

edge_fabric e0(
  /* inputs */
  // data from input bridge
  .d_in_i0(d_in_0),
  .d_in_i1(d_in_1),
  .d_in_i2(d_in_2),
  .d_in_i3(d_in_3),
  .d_in_i4(d_in_4),
  .d_in_i5(d_in_5),
  .d_in_i6(d_in_6),
  .d_in_i7(d_in_7),
  .d_in_i8(d_in_8),
  .d_in_i9(d_in_9),
  .d_in_i10(d_in_10),
  .d_in_i11(d_in_11),
  .d_in_i12(d_in_12),
  .d_in_i13(d_in_13),
  .d_in_i14(d_in_14),
  .d_in_i15(d_in_15),
  .d_in_i16(d_in_16),
  .d_in_i17(d_in_17),
  .d_in_i18(d_in_18),
  .d_in_i19(d_in_19),
  .d_in_i20(d_in_20),
  .d_in_i21(d_in_21),
  .d_in_i22(d_in_22),
  .d_in_i23(d_in_23),
  .d_in_i24(d_in_24),
  .d_in_i25(d_in_25),
  .d_in_i26(d_in_26),
  .d_in_i27(d_in_27),
  .d_in_i28(d_in_28),
  .d_in_i29(d_in_29),
  .d_in_i30(d_in_30),
  .d_in_i31(d_in_31),
  // data from tile fabric
  .d_in_t0(d_te_0),
  .d_in_t1(d_te_1),
  .d_in_t2(d_te_2),
  .d_in_t3(d_te_3),
  .d_in_t4(d_te_4),
  .d_in_t5(d_te_5),
  .d_in_t6(d_te_6),
  .d_in_t7(d_te_7),
  .d_in_t8(d_te_8),
  .d_in_t9(d_te_9),
  .d_in_t10(d_te_10),
  .d_in_t11(d_te_11),
  .d_in_t12(d_te_12),
  .d_in_t13(d_te_13),
  .d_in_t14(d_te_14),
  .d_in_t15(d_te_15),
  // credit from output bridge
  .c_in_o0(c_in_30),
  .c_in_o1(c_in_31),
  // credit from tile fabric
  .c_in_t0(c_te_0),
  .c_in_t1(c_te_1),
  .c_in_t2(c_te_2),
  .c_in_t3(c_te_3),
  .c_in_t4(c_te_4),
  .c_in_t5(c_te_5),
  .c_in_t6(c_te_6),
  .c_in_t7(c_te_7),
  .c_in_t8(c_te_8),
  .c_in_t9(c_te_9),
  .c_in_t10(c_te_10),
  .c_in_t11(c_te_11),
  .c_in_t12(c_te_12),
  .c_in_t13(c_te_13),
  .c_in_t14(c_te_14),
  .c_in_t15(c_te_15),
  .c_in_t16(c_te_16),
  .c_in_t17(c_te_17),
  .c_in_t18(c_te_18),
  .c_in_t19(c_te_19),
  .c_in_t20(c_te_20),
  .c_in_t21(c_te_21),
  .c_in_t22(c_te_22),
  .c_in_t23(c_te_23),
  .c_in_t24(c_te_24),
  .c_in_t25(c_te_25),
  .c_in_t26(c_te_26),
  .c_in_t27(c_te_27),
  .c_in_t28(c_te_28),
  .c_in_t29(c_te_29),
  .c_in_t30(c_te_30),
  .c_in_t31(c_te_31),
  .c_in_t32(c_te_32),
  .c_in_t33(c_te_33),
  .c_in_t34(c_te_34),
  .c_in_t35(c_te_35),
  .c_in_t36(c_te_36),
  .c_in_t37(c_te_37),
  .c_in_t38(c_te_38),
  .c_in_t39(c_te_39),
  .c_in_t40(c_te_40),
  .c_in_t41(c_te_41),
  .c_in_t42(c_te_42),
  .c_in_t43(c_te_43),
  .c_in_t44(c_te_44),
  .c_in_t45(c_te_45),
  .c_in_t46(c_te_46),
  //--
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  // data to tile fabric
  .d_out_t0(d_et_0),
  .d_out_t1(d_et_1),
  .d_out_t2(d_et_2),
  .d_out_t3(d_et_3),
  .d_out_t4(d_et_4),
  .d_out_t5(d_et_5),
  .d_out_t6(d_et_6),
  .d_out_t7(d_et_7),
  .d_out_t8(d_et_8),
  .d_out_t9(d_et_9),
  .d_out_t10(d_et_10),
  .d_out_t11(d_et_11),
  .d_out_t12(d_et_12),
  .d_out_t13(d_et_13),
  .d_out_t14(d_et_14),
  .d_out_t15(d_et_15),
  .d_out_t16(d_et_16),
  .d_out_t17(d_et_17),
  .d_out_t18(d_et_18),
  .d_out_t19(d_et_19),
  .d_out_t20(d_et_20),
  .d_out_t21(d_et_21),
  .d_out_t22(d_et_22),
  .d_out_t23(d_et_23),
  .d_out_t24(d_et_24),
  .d_out_t25(d_et_25),
  .d_out_t26(d_et_26),
  .d_out_t27(d_et_27),
  .d_out_t28(d_et_28),
  .d_out_t29(d_et_29),
  .d_out_t30(d_et_30),
  .d_out_t31(d_et_31),
  .d_out_t32(d_et_32),
  .d_out_t33(d_et_33),
  .d_out_t34(d_et_34),
  .d_out_t35(d_et_35),
  .d_out_t36(d_et_36),
  .d_out_t37(d_et_37),
  .d_out_t38(d_et_38),
  .d_out_t39(d_et_39),
  .d_out_t40(d_et_40),
  .d_out_t41(d_et_41),
  .d_out_t42(d_et_42),
  .d_out_t43(d_et_43),
  .d_out_t44(d_et_44),
  .d_out_t45(d_et_45),
  .d_out_t46(d_et_46),
  // data to output bridge
  .d_out_o0(d_out_30),
  .d_out_o1(d_out_31),
  // credit to tile fabric
  .c_out_t0(c_et_0),
  .c_out_t1(c_et_1),
  .c_out_t2(c_et_2),
  .c_out_t3(c_et_3),
  .c_out_t4(c_et_4),
  .c_out_t5(c_et_5),
  .c_out_t6(c_et_6),
  .c_out_t7(c_et_7),
  .c_out_t8(c_et_8),
  .c_out_t9(c_et_9),
  .c_out_t10(c_et_10),
  .c_out_t11(c_et_11),
  .c_out_t12(c_et_12),
  .c_out_t13(c_et_13),
  .c_out_t14(c_et_14),
  .c_out_t15(c_et_15),
  // credit to input bridge
  .c_out_i0(c_out_0),
  .c_out_i1(c_out_1),
  .c_out_i2(c_out_2),
  .c_out_i3(c_out_3),
  .c_out_i4(c_out_4),
  .c_out_i5(c_out_5),
  .c_out_i6(c_out_6),
  .c_out_i7(c_out_7),
  .c_out_i8(c_out_8),
  .c_out_i9(c_out_9),
  .c_out_i10(c_out_10),
  .c_out_i11(c_out_11),
  .c_out_i12(c_out_12),
  .c_out_i13(c_out_13),
  .c_out_i14(c_out_14),
  .c_out_i15(c_out_15),
  .c_out_i16(c_out_16),
  .c_out_i17(c_out_17),
  .c_out_i18(c_out_18),
  .c_out_i19(c_out_19),
  .c_out_i20(c_out_20),
  .c_out_i21(c_out_21),
  .c_out_i22(c_out_22),
  .c_out_i23(c_out_23),
  .c_out_i24(c_out_24),
  .c_out_i25(c_out_25),
  .c_out_i26(c_out_26),
  .c_out_i27(c_out_27),
  .c_out_i28(c_out_28),
  .c_out_i29(c_out_29),
  .c_out_i30(c_out_30),
  .c_out_i31(c_out_31)
  );

tile_fabric t0(
  /* inputs */
  // data from edge fabric
  .d_in_e0(d_et_0),
  .d_in_e1(d_et_1),
  .d_in_e2(d_et_2),
  .d_in_e3(d_et_3),
  .d_in_e4(d_et_4),
  .d_in_e5(d_et_5),
  .d_in_e6(d_et_6),
  .d_in_e7(d_et_7),
  .d_in_e8(d_et_8),
  .d_in_e9(d_et_9),
  .d_in_e10(d_et_10),
  .d_in_e11(d_et_11),
  .d_in_e12(d_et_12),
  .d_in_e13(d_et_13),
  .d_in_e14(d_et_14),
  .d_in_e15(d_et_15),
  .d_in_e16(d_et_16),
  .d_in_e17(d_et_17),
  .d_in_e18(d_et_18),
  .d_in_e19(d_et_19),
  .d_in_e20(d_et_20),
  .d_in_e21(d_et_21),
  .d_in_e22(d_et_22),
  .d_in_e23(d_et_23),
  .d_in_e24(d_et_24),
  .d_in_e25(d_et_25),
  .d_in_e26(d_et_26),
  .d_in_e27(d_et_27),
  .d_in_e28(d_et_28),
  .d_in_e29(d_et_29),
  .d_in_e30(d_et_30),
  .d_in_e31(d_et_31),
  .d_in_e32(d_et_32),
  .d_in_e33(d_et_33),
  .d_in_e34(d_et_34),
  .d_in_e35(d_et_35),
  .d_in_e36(d_et_36),
  .d_in_e37(d_et_37),
  .d_in_e38(d_et_38),
  .d_in_e39(d_et_39),
  .d_in_e40(d_et_40),
  .d_in_e41(d_et_41),
  .d_in_e42(d_et_42),
  .d_in_e43(d_et_43),
  .d_in_e44(d_et_44),
  .d_in_e45(d_et_45),
  .d_in_e46(d_et_46),
  // credit from output bridge
  .c_in_o0(c_in_0),
  .c_in_o1(c_in_1),
  .c_in_o2(c_in_2),
  .c_in_o3(c_in_3),
  .c_in_o4(c_in_4),
  .c_in_o5(c_in_5),
  .c_in_o6(c_in_6),
  .c_in_o7(c_in_7),
  .c_in_o8(c_in_8),
  .c_in_o9(c_in_9),
  .c_in_o10(c_in_10),
  .c_in_o11(c_in_11),
  .c_in_o12(c_in_12),
  .c_in_o13(c_in_13),
  .c_in_o14(c_in_14),
  .c_in_o15(c_in_15),
  .c_in_o16(c_in_16),
  .c_in_o17(c_in_17),
  .c_in_o18(c_in_18),
  .c_in_o19(c_in_19),
  .c_in_o20(c_in_20),
  .c_in_o21(c_in_21),
  .c_in_o22(c_in_22),
  .c_in_o23(c_in_23),
  .c_in_o24(c_in_24),
  .c_in_o25(c_in_25),
  .c_in_o26(c_in_26),
  .c_in_o27(c_in_27),
  .c_in_o28(c_in_28),
  .c_in_o29(c_in_29),
  // credit from edge fabric
  .c_in_e0(c_et_0),
  .c_in_e1(c_et_1),
  .c_in_e2(c_et_2),
  .c_in_e3(c_et_3),
  .c_in_e4(c_et_4),
  .c_in_e5(c_et_5),
  .c_in_e6(c_et_6),
  .c_in_e7(c_et_7),
  .c_in_e8(c_et_8),
  .c_in_e9(c_et_9),
  .c_in_e10(c_et_10),
  .c_in_e11(c_et_11),
  .c_in_e12(c_et_12),
  .c_in_e13(c_et_13),
  .c_in_e14(c_et_14),
  .c_in_e15(c_et_15),
  //--
  .clk(clk),
  .rst(rst),
  .conf_en(conf_en),
  /* outputs */
  // data to edge fabric
  .d_out_e0(d_te_0),
  .d_out_e1(d_te_1),
  .d_out_e2(d_te_2),
  .d_out_e3(d_te_3),
  .d_out_e4(d_te_4),
  .d_out_e5(d_te_5),
  .d_out_e6(d_te_6),
  .d_out_e7(d_te_7),
  .d_out_e8(d_te_8),
  .d_out_e9(d_te_9),
  .d_out_e10(d_te_10),
  .d_out_e11(d_te_11),
  .d_out_e12(d_te_12),
  .d_out_e13(d_te_13),
  .d_out_e14(d_te_14),
  .d_out_e15(d_te_15),
  // data to output bridge
  .d_out_o0(d_out_0),
  .d_out_o1(d_out_1),
  .d_out_o2(d_out_2),
  .d_out_o3(d_out_3),
  .d_out_o4(d_out_4),
  .d_out_o5(d_out_5),
  .d_out_o6(d_out_6),
  .d_out_o7(d_out_7),
  .d_out_o8(d_out_8),
  .d_out_o9(d_out_9),
  .d_out_o10(d_out_10),
  .d_out_o11(d_out_11),
  .d_out_o12(d_out_12),
  .d_out_o13(d_out_13),
  .d_out_o14(d_out_14),
  .d_out_o15(d_out_15),
  .d_out_o16(d_out_16),
  .d_out_o17(d_out_17),
  .d_out_o18(d_out_18),
  .d_out_o19(d_out_19),
  .d_out_o20(d_out_20),
  .d_out_o21(d_out_21),
  .d_out_o22(d_out_22),
  .d_out_o23(d_out_23),
  .d_out_o24(d_out_24),
  .d_out_o25(d_out_25),
  .d_out_o26(d_out_26),
  .d_out_o27(d_out_27),
  .d_out_o28(d_out_28),
  .d_out_o29(d_out_29),
  // credit to edge fabric
  .c_out_e0(c_te_0),
  .c_out_e1(c_te_1),
  .c_out_e2(c_te_2),
  .c_out_e3(c_te_3),
  .c_out_e4(c_te_4),
  .c_out_e5(c_te_5),
  .c_out_e6(c_te_6),
  .c_out_e7(c_te_7),
  .c_out_e8(c_te_8),
  .c_out_e9(c_te_9),
  .c_out_e10(c_te_10),
  .c_out_e11(c_te_11),
  .c_out_e12(c_te_12),
  .c_out_e13(c_te_13),
  .c_out_e14(c_te_14),
  .c_out_e15(c_te_15),
  .c_out_e16(c_te_16),
  .c_out_e17(c_te_17),
  .c_out_e18(c_te_18),
  .c_out_e19(c_te_19),
  .c_out_e20(c_te_20),
  .c_out_e21(c_te_21),
  .c_out_e22(c_te_22),
  .c_out_e23(c_te_23),
  .c_out_e24(c_te_24),
  .c_out_e25(c_te_25),
  .c_out_e26(c_te_26),
  .c_out_e27(c_te_27),
  .c_out_e28(c_te_28),
  .c_out_e29(c_te_29),
  .c_out_e30(c_te_30),
  .c_out_e31(c_te_31),
  .c_out_e32(c_te_32),
  .c_out_e33(c_te_33),
  .c_out_e34(c_te_34),
  .c_out_e35(c_te_35),
  .c_out_e36(c_te_36),
  .c_out_e37(c_te_37),
  .c_out_e38(c_te_38),
  .c_out_e39(c_te_39),
  .c_out_e40(c_te_40),
  .c_out_e41(c_te_41),
  .c_out_e42(c_te_42),
  .c_out_e43(c_te_43),
  .c_out_e44(c_te_44),
  .c_out_e45(c_te_45),
  .c_out_e46(c_te_46)
  );

endmodule
