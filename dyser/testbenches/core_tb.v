`include "config.v"

module core_tb();

`include "check_error.v"


// INPUTS
                     // data from input bridge
reg  [`PATH_WIDTH:0] d_in_0,  d_in_1,  d_in_2,  d_in_3,  d_in_4,  d_in_5,  d_in_6,  d_in_7,
                     d_in_8,  d_in_9,  d_in_10, d_in_11, d_in_12, d_in_13, d_in_14, d_in_15,
                     d_in_16, d_in_17, d_in_18, d_in_19, d_in_20, d_in_21, d_in_22, d_in_23,
                     d_in_24, d_in_25, d_in_26, d_in_27, d_in_28, d_in_29, d_in_30, d_in_31;
                     // credit from output bridge
reg                  c_in_0,  c_in_1,  c_in_2, c_in_3,  c_in_4,  c_in_5,  c_in_6,  c_in_7,  c_in_8,
                     c_in_9, c_in_10, c_in_11, c_in_12, c_in_13, c_in_14, c_in_15, c_in_16,c_in_17,
                     c_in_18, c_in_19, c_in_20, c_in_21, c_in_22,c_in_23, c_in_24, c_in_25, c_in_26;

reg           [29:0] conf;
reg                  conf_en;
reg                  clk, rst;

// OUTPUTS
                     // data to output bridge
wire [`PATH_WIDTH:0] d_out_0,  d_out_1,  d_out_2,  d_out_3,  d_out_4,  d_out_5,  d_out_6,  d_out_7,  d_out_8,
                     d_out_9,  d_out_10, d_out_11, d_out_12, d_out_13, d_out_14, d_out_15, d_out_16, d_out_17,
                     d_out_18, d_out_19, d_out_20, d_out_21, d_out_22, d_out_23, d_out_24, d_out_25, d_out_26;
                     // credit to input bridge
wire                 c_out_0,  c_out_1,  c_out_2,  c_out_3,  c_out_4,  c_out_5,  c_out_6,  c_out_7,
                     c_out_8,  c_out_9,  c_out_10, c_out_11, c_out_12, c_out_13, c_out_14, c_out_15,
                     c_out_16, c_out_17, c_out_18, c_out_19, c_out_20, c_out_21, c_out_22, c_out_23,
                     c_out_24, c_out_25, c_out_26, c_out_27, c_out_28, c_out_29, c_out_30, c_out_31;

// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;


core c0(
    // inputs
    //data from input bridge
    (conf_en ? {35'd0, conf[29:0]} : d_in_0),  d_in_1,  d_in_2,  d_in_3,  d_in_4,  d_in_5,  d_in_6, d_in_7,
    d_in_8,  d_in_9,  d_in_10, d_in_11, d_in_12, d_in_13, d_in_14, d_in_15,
    d_in_16, d_in_17, d_in_18, d_in_19, d_in_20, d_in_21, d_in_22, d_in_23,
    d_in_24, d_in_25, d_in_26, d_in_27, d_in_28, d_in_29, d_in_30, d_in_31,
    //credit from output bridge
    c_in_0,  c_in_1,  c_in_2,  c_in_3,  c_in_4,  c_in_5,  c_in_6,  c_in_7,  c_in_8,
    c_in_9,  c_in_10, c_in_11, c_in_12, c_in_13, c_in_14, c_in_15, c_in_16, c_in_17,
    c_in_18, c_in_19, c_in_20, c_in_21, c_in_22, c_in_23, c_in_24, c_in_25, c_in_26,
    // edge_fabric configuration
    conf_en,
    clk,     rst,
    // outputs
    //data to output bridge
    d_out_0,  d_out_1,  d_out_2,  d_out_3,  d_out_4,  d_out_5,  d_out_6,  d_out_7,  d_out_8,
    d_out_9,  d_out_10, d_out_11, d_out_12, d_out_13, d_out_14, d_out_15, d_out_16, d_out_17,
    d_out_18, d_out_19, d_out_20, d_out_21, d_out_22, d_out_23, d_out_24, d_out_25, d_out_26, 
    //credit to input bridge
    c_out_0,  c_out_1,  c_out_2,  c_out_3,  c_out_4,  c_out_5,  c_out_6,  c_out_7,
    c_out_8,  c_out_9,  c_out_10, c_out_11, c_out_12, c_out_13, c_out_14, c_out_15,
    c_out_16, c_out_17, c_out_18, c_out_19, c_out_20, c_out_21, c_out_22, c_out_23,
    c_out_24, c_out_25, c_out_26, c_out_27, c_out_28, c_out_29, c_out_30, c_out_31
    );


  // Clock
  initial clk = 0;
  always #10 clk = ~clk;

  // Clock cycle
integer cycle;
  initial cycle = 0;
  always @(posedge clk)
    cycle = cycle + 1;


  always @(negedge clk) begin
    
    d_in_17[0] = (c_out_17 ? $random % 2 : 1'b0);
    d_in_14[0] = (c_out_14 ? $random % 2 : 1'b0);
    d_in_12[0] = (c_out_12 ? $random % 2 : 1'b0);
    d_in_10[0] = (c_out_10 ? $random % 2 : 1'b0);
    d_in_8[0]  = (c_out_8  ? $random % 2 : 1'b0);
    d_in_6[0]  = (c_out_6  ? $random % 2 : 1'b0);
    d_in_4[0]  = (c_out_4  ? $random % 2 : 1'b0);
    d_in_2[0]  = (c_out_2  ? $random % 2 : 1'b0);
    d_in_0[0]  = (c_out_0  ? $random % 2 : 1'b0);
    
    if (d_in_17[0]) d_in_17[`PATH_WIDTH:1] = d_in_17[`PATH_WIDTH:1] + 1;
    if (d_in_14[0]) d_in_14[`PATH_WIDTH:1] = d_in_14[`PATH_WIDTH:1] + 1;
    if (d_in_12[0]) d_in_12[`PATH_WIDTH:1] = d_in_12[`PATH_WIDTH:1] + 1;
    if (d_in_10[0]) d_in_10[`PATH_WIDTH:1] = d_in_10[`PATH_WIDTH:1] + 1;
    if (d_in_8[0])  d_in_8[`PATH_WIDTH:1]  = d_in_8[`PATH_WIDTH:1]  + 1;
    if (d_in_6[0])  d_in_6[`PATH_WIDTH:1]  = d_in_6[`PATH_WIDTH:1]  + 1;
    if (d_in_4[0])  d_in_4[`PATH_WIDTH:1]  = d_in_4[`PATH_WIDTH:1]  + 1;
    if (d_in_2[0])  d_in_2[`PATH_WIDTH:1]  = d_in_2[`PATH_WIDTH:1]  + 1;
    if (d_in_0[0])  d_in_0[`PATH_WIDTH:1]  = d_in_0[`PATH_WIDTH:1]  + 1;
    
    c_in_13 = $random % 2;
    
  end

  initial begin
    $display("Beginning tile tests...");
    
    // RESET
    clear_inputs;
    ERR = 0;
    reset;
    
    
    $display("  Straight Through Test...");
    config_send_straight_through;
    #1;
    d_in_17 = {64'd1, 1'b1}; // s1
    d_in_14 = {64'd2, 1'b1}; // s9
    d_in_12 = {64'd3, 1'b1}; // s10
    d_in_10 = {64'd4, 1'b1}; // s11
    d_in_8  = {64'd5, 1'b1}; // s12
    d_in_6  = {64'd6, 1'b1}; // s13
    d_in_4  = {64'd7, 1'b1}; // s14
    d_in_2  = {64'd8, 1'b1}; // s15
    d_in_0  = {64'd9, 1'b1}; // s16
    
    check_send_straight_through;
    
    // Check error from first test
    check_error(ERR, cycle);
    
    
    reset;
    
    
    $display("  Reduction Path...");
    config_reduction_path;
    #1;
    d_in_17 = {64'd1, 1'b1}; // s1
    d_in_14 = {64'd2, 1'b1}; // s9
    d_in_12 = {64'd3, 1'b1}; // s10
    d_in_10 = {64'd4, 1'b1}; // s11
    d_in_8  = {64'd5, 1'b1}; // s12
    d_in_6  = {64'd6, 1'b1}; // s13
    d_in_4  = {64'd7, 1'b1}; // s14
    d_in_2  = {64'd8, 1'b1}; // s15
    
    check_reduction_path;
    
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task reset;

  begin
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
  end
endtask

task clear_inputs;
  integer i;
  
  begin
    d_in_0  = 0; d_in_1  = 0; d_in_2  = 0; d_in_3  = 0; d_in_4  = 0; d_in_5  = 0; d_in_6  = 0; d_in_7  = 0;
    d_in_8  = 0; d_in_9  = 0; d_in_10 = 0; d_in_11 = 0; d_in_12 = 0; d_in_13 = 0; d_in_14 = 0; d_in_15 = 0;
    d_in_16 = 0; d_in_17 = 0; d_in_18 = 0; d_in_19 = 0; d_in_20 = 0; d_in_21 = 0; d_in_22 = 0; d_in_23 = 0;
    d_in_24 = 0; d_in_25 = 0; d_in_26 = 0; d_in_27 = 0; d_in_28 = 0; d_in_29 = 0; d_in_30 = 0; d_in_31 = 0;
    
    c_in_0  = 1; c_in_1  = 1; c_in_2  = 1; c_in_3  = 1; c_in_4  = 1; c_in_5  = 1; c_in_6  = 1;
    c_in_7  = 1; c_in_8  = 1; c_in_9  = 1; c_in_10 = 1; c_in_11 = 1; c_in_12 = 1; c_in_13 = 1;
    c_in_14 = 1; c_in_15 = 1; c_in_16 = 1; c_in_17 = 1; c_in_18 = 1; c_in_19 = 1; c_in_20 = 1;
    c_in_21 = 1; c_in_22 = 1; c_in_23 = 1; c_in_24 = 1; c_in_25 = 1; c_in_26 = 1;
    
    conf    = 0;
    conf_en = 0;
  end
endtask

task config_send_straight_through;
  integer i;
  reg   [29:0] conf_edge [16:0];
  reg   [29:0] conf_core [63:0];
  reg   [29:0] conf_all  [80:0];
  
  begin
    clear_inputs;
    
    for (i=0; i < 17; i=i+1) begin
      conf_edge[i] = {6'b11_11_11, 24'o7777_7727}; // W->E
    end
    conf_edge[1] = {6'b11_11_11, 24'o7777_7707}; // N->E
    
    for (i=0; i < 64; i=i+1) begin
      conf_core[i] = {6'b00_00_00, 24'o7777_7727}; // W->E
    end
    
    
    // AUTO-GENERATED
    conf_all[0] = conf_edge[8][29:0];
    conf_all[1] = conf_edge[7][29:0];
    conf_all[2] = conf_edge[6][29:0];
    conf_all[3] = conf_edge[5][29:0];
    conf_all[4] = conf_edge[4][29:0];
    conf_all[5] = conf_edge[3][29:0];
    conf_all[6] = conf_edge[2][29:0];
    conf_all[7] = conf_edge[1][29:0];
    conf_all[8] = conf_edge[0][29:0];
    conf_all[9] = conf_edge[9][29:0];
    conf_all[10] = conf_core[0][29:0];
    conf_all[11] = conf_core[1][29:0];
    conf_all[12] = conf_core[2][29:0];
    conf_all[13] = conf_core[3][29:0];
    conf_all[14] = conf_core[4][29:0];
    conf_all[15] = conf_core[5][29:0];
    conf_all[16] = conf_core[6][29:0];
    conf_all[17] = conf_core[7][29:0];
    conf_all[18] = conf_core[15][29:0];
    conf_all[19] = conf_core[14][29:0];
    conf_all[20] = conf_core[13][29:0];
    conf_all[21] = conf_core[12][29:0];
    conf_all[22] = conf_core[11][29:0];
    conf_all[23] = conf_core[10][29:0];
    conf_all[24] = conf_core[9][29:0];
    conf_all[25] = conf_core[8][29:0];
    conf_all[26] = conf_edge[10][29:0];
    conf_all[27] = conf_edge[11][29:0];
    conf_all[28] = conf_core[16][29:0];
    conf_all[29] = conf_core[17][29:0];
    conf_all[30] = conf_core[18][29:0];
    conf_all[31] = conf_core[19][29:0];
    conf_all[32] = conf_core[20][29:0];
    conf_all[33] = conf_core[21][29:0];
    conf_all[34] = conf_core[22][29:0];
    conf_all[35] = conf_core[23][29:0];
    conf_all[36] = conf_core[31][29:0];
    conf_all[37] = conf_core[30][29:0];
    conf_all[38] = conf_core[29][29:0];
    conf_all[39] = conf_core[28][29:0];
    conf_all[40] = conf_core[27][29:0];
    conf_all[41] = conf_core[26][29:0];
    conf_all[42] = conf_core[25][29:0];
    conf_all[43] = conf_core[24][29:0];
    conf_all[44] = conf_edge[12][29:0];
    conf_all[45] = conf_edge[13][29:0];
    conf_all[46] = conf_core[32][29:0];
    conf_all[47] = conf_core[33][29:0];
    conf_all[48] = conf_core[34][29:0];
    conf_all[49] = conf_core[35][29:0];
    conf_all[50] = conf_core[36][29:0];
    conf_all[51] = conf_core[37][29:0];
    conf_all[52] = conf_core[38][29:0];
    conf_all[53] = conf_core[39][29:0];
    conf_all[54] = conf_core[47][29:0];
    conf_all[55] = conf_core[46][29:0];
    conf_all[56] = conf_core[45][29:0];
    conf_all[57] = conf_core[44][29:0];
    conf_all[58] = conf_core[43][29:0];
    conf_all[59] = conf_core[42][29:0];
    conf_all[60] = conf_core[41][29:0];
    conf_all[61] = conf_core[40][29:0];
    conf_all[62] = conf_edge[14][29:0];
    conf_all[63] = conf_edge[15][29:0];
    conf_all[64] = conf_core[48][29:0];
    conf_all[65] = conf_core[49][29:0];
    conf_all[66] = conf_core[50][29:0];
    conf_all[67] = conf_core[51][29:0];
    conf_all[68] = conf_core[52][29:0];
    conf_all[69] = conf_core[53][29:0];
    conf_all[70] = conf_core[54][29:0];
    conf_all[71] = conf_core[55][29:0];
    conf_all[72] = conf_core[63][29:0];
    conf_all[73] = conf_core[62][29:0];
    conf_all[74] = conf_core[61][29:0];
    conf_all[75] = conf_core[60][29:0];
    conf_all[76] = conf_core[59][29:0];
    conf_all[77] = conf_core[58][29:0];
    conf_all[78] = conf_core[57][29:0];
    conf_all[79] = conf_core[56][29:0];
    conf_all[80] = conf_edge[16][29:0];
    
    
    for (i=0; i < 81; i=i+1) begin
      conf    = conf_all[i];
      conf_en = 1;
      @(negedge clk);
    end
    
    conf_en = 0;
  end
endtask

task check_send_straight_through;
  integer expected1;
  integer expected4;
  integer expected7;
  integer expected10;
  integer expected13;
  integer expected16;
  integer expected19;
  integer expected22;
  integer expected25;
  
  begin
    while (!d_out_1[0]) begin
      //#1; display_dyser;
      
      @(negedge clk);
      
      /*
      $display("[%0d] 1:(%0d,%b) 4:(%0d,%b), 7:(%0d,%b), 10:(%0d,%b), 13:(%0d,%b), 16:(%0d,%b), 19:(%0d,%b), 22:(%0d,%b) 25:(%0d,%b)", 
                cycle, d_out_1[`PATH_WIDTH:1],  d_out_1[0],  d_out_4[`PATH_WIDTH:1],  d_out_4[0],
                       d_out_7[`PATH_WIDTH:1],  d_out_7[0],  d_out_10[`PATH_WIDTH:1], d_out_10[0],
                       d_out_13[`PATH_WIDTH:1], d_out_13[0], d_out_16[`PATH_WIDTH:1], d_out_16[0],
                       d_out_19[`PATH_WIDTH:1], d_out_19[0], d_out_22[`PATH_WIDTH:1], d_out_22[0],
                       d_out_25[`PATH_WIDTH:1], d_out_25[0]);
      */
    end
    
    ASSERT(d_out_0  == 0, "d_out_0  is not zero", cycle, ERR);
    ASSERT(d_out_1  != 0, "d_out_1  is zero", cycle, ERR);
    ASSERT(d_out_2  == 0, "d_out_2  is not zero", cycle, ERR);
    ASSERT(d_out_3  == 0, "d_out_3  is not zero", cycle, ERR);
    ASSERT(d_out_4  != 0, "d_out_4  is zero", cycle, ERR);
    ASSERT(d_out_5  == 0, "d_out_5  is not zero", cycle, ERR);
    ASSERT(d_out_6  == 0, "d_out_6  is not zero", cycle, ERR);
    ASSERT(d_out_7  != 0, "d_out_7  is zero", cycle, ERR);
    ASSERT(d_out_8  == 0, "d_out_8  is not zero", cycle, ERR);
    ASSERT(d_out_9  == 0, "d_out_9  is not zero", cycle, ERR);
    ASSERT(d_out_10 != 0, "d_out_10 is zero", cycle, ERR);
    ASSERT(d_out_11 == 0, "d_out_11 is not zero", cycle, ERR);
    ASSERT(d_out_12 == 0, "d_out_12 is not zero", cycle, ERR);
    ASSERT(d_out_13 != 0, "d_out_13 is zero", cycle, ERR);
    ASSERT(d_out_14 == 0, "d_out_14 is not zero", cycle, ERR);
    ASSERT(d_out_15 == 0, "d_out_15 is not zero", cycle, ERR);
    ASSERT(d_out_16 != 0, "d_out_16 is zero", cycle, ERR);
    ASSERT(d_out_17 == 0, "d_out_17 is not zero", cycle, ERR);
    ASSERT(d_out_18 == 0, "d_out_18 is not zero", cycle, ERR);
    ASSERT(d_out_19 != 0, "d_out_19 is zero", cycle, ERR);
    ASSERT(d_out_20 == 0, "d_out_20 is not zero", cycle, ERR);
    ASSERT(d_out_21 == 0, "d_out_21 is not zero", cycle, ERR);
    ASSERT(d_out_22 != 0, "d_out_22 is zero", cycle, ERR);
    ASSERT(d_out_23 == 0, "d_out_23 is not zero", cycle, ERR);
    ASSERT(d_out_24 == 0, "d_out_24 is not zero", cycle, ERR);
    ASSERT(d_out_25 != 0, "d_out_25 is zero", cycle, ERR);
    ASSERT(d_out_26 == 0, "d_out_26 is not zero", cycle, ERR);
    
    expected1  =  d_out_1[`PATH_WIDTH:1] + 1;
    expected4  =  d_out_4[`PATH_WIDTH:1] + 1;
    expected7  =  d_out_7[`PATH_WIDTH:1] + 1;
    expected10 = d_out_10[`PATH_WIDTH:1] + 1;
    expected13 = d_out_13[`PATH_WIDTH:1] + 1;
    expected16 = d_out_16[`PATH_WIDTH:1] + 1;
    expected19 = d_out_19[`PATH_WIDTH:1] + 1;
    expected22 = d_out_22[`PATH_WIDTH:1] + 1;
    expected25 = d_out_25[`PATH_WIDTH:1] + 1;
        
    repeat (20) begin
      //#1; display_dyser;
      
      @(negedge clk);
      
      /*
      $display("[%0d] 1:(%0d,%b) 4:(%0d,%b), 7:(%0d,%b), 10:(%0d,%b), 13:(%0d,%b), 16:(%0d,%b), 19:(%0d,%b), 22:(%0d,%b) 25:(%0d,%b)", 
                cycle, d_out_1[`PATH_WIDTH:1],  d_out_1[0],  d_out_4[`PATH_WIDTH:1],  d_out_4[0],
                       d_out_7[`PATH_WIDTH:1],  d_out_7[0],  d_out_10[`PATH_WIDTH:1], d_out_10[0],
                       d_out_13[`PATH_WIDTH:1], d_out_13[0], d_out_16[`PATH_WIDTH:1], d_out_16[0],
                       d_out_19[`PATH_WIDTH:1], d_out_19[0], d_out_22[`PATH_WIDTH:1], d_out_22[0],
                       d_out_25[`PATH_WIDTH:1], d_out_25[0]);
      */
      
      if (d_out_1[0]) begin
        ASSERT(d_out_1[`PATH_WIDTH:1] == expected1, "d_out_1 is different than expected", cycle, ERR);
        expected1 = d_out_1[`PATH_WIDTH:1] + 1;
      end
      if (d_out_4[0]) begin
        ASSERT(d_out_4[`PATH_WIDTH:1] == expected4, "d_out_4 is different than expected", cycle, ERR);
        expected4 = d_out_4[`PATH_WIDTH:1] + 1;
      end
      if (d_out_7[0]) begin
        ASSERT(d_out_7[`PATH_WIDTH:1] == expected7, "d_out_7 is different than expected", cycle, ERR);
        expected7 = d_out_7[`PATH_WIDTH:1] + 1;
      end
      if (d_out_10[0]) begin
        ASSERT(d_out_10[`PATH_WIDTH:1] == expected10, "d_out_10 is different than expected", cycle, ERR);
        expected10 = d_out_10[`PATH_WIDTH:1] + 1;
      end
      if (d_out_13[0]) begin
        ASSERT(d_out_13[`PATH_WIDTH:1] == expected13, "d_out_13 is different than expected", cycle, ERR);
        expected13 = d_out_13[`PATH_WIDTH:1] + 1;
      end
      if (d_out_16[0]) begin
        ASSERT(d_out_16[`PATH_WIDTH:1] == expected16, "d_out_16 is different than expected", cycle, ERR);
        expected16 = d_out_16[`PATH_WIDTH:1] + 1;
      end
      if (d_out_19[0]) begin
        ASSERT(d_out_19[`PATH_WIDTH:1] == expected19, "d_out_19 is different than expected", cycle, ERR);
        expected19 = d_out_19[`PATH_WIDTH:1] + 1;
      end
      if (d_out_22[0]) begin
        ASSERT(d_out_22[`PATH_WIDTH:1] == expected22, "d_out_22 is different than expected", cycle, ERR);
        expected22 = d_out_22[`PATH_WIDTH:1] + 1;
      end
      if (d_out_25[0]) begin
        ASSERT(d_out_25[`PATH_WIDTH:1] == expected25, "d_out_25 is different than expected", cycle, ERR);
        expected25 = d_out_25[`PATH_WIDTH:1] + 1;
      end
    end
  end
endtask


task config_reduction_path;
  integer i;
  integer j;
  reg   [29:0] conf_edge [16:0];
  reg   [29:0] conf_core [63:0];
  reg   [29:0] conf_all  [80:0];
  
  begin
    clear_inputs;
    
    // configuration:
    // SE_SW_NE_NW__S_W_E_N
    // 0=N 1=E 2=W 3=S 4=NW 5-7=0
    //  e.g. 7777_7702 = N->E, W->N (N input sent out E output, W sent out N)
    
    // Edge configuration
    conf_edge[1][23:0]  = {6'b11_11_11, 24'o7077_7777}; // N->SW
    conf_edge[9][23:0]  = {6'b11_11_11, 24'o7727_7777}; // W->NE
    conf_edge[10][23:0] = {6'b11_11_11, 24'o2777_7777}; // W->SE
    conf_edge[11][23:0] = {6'b11_11_11, 24'o7727_7777}; // W->NE
    conf_edge[12][23:0] = {6'b11_11_11, 24'o2777_7777}; // W->SE
    conf_edge[13][23:0] = {6'b11_11_11, 24'o7727_7777}; // W->NE
    conf_edge[14][23:0] = {6'b11_11_11, 24'o2777_7777}; // W->SE
    conf_edge[15][23:0] = {6'b11_11_11, 24'o7727_7777}; // W->NE
    
    
    // First stage
    conf_core[0][29:0]  = {6'b00_01_10, 24'o7777_4777}; // (NE+SW) NW->S
    conf_core[8][29:0]  = {6'b00_00_00, 24'o0777_7777}; //          N->SE
    conf_core[16][29:0] = {6'b00_00_10, 24'o7747_7777}; // (NW+SW) NW->NE
    conf_core[32][29:0] = {6'b00_00_10, 24'o4777_7777}; // (NW+SW) NW->SE
    conf_core[40][29:0] = {6'b00_00_00, 24'o7737_7777}; //          S->NE
    conf_core[48][29:0] = {6'b00_00_10, 24'o7777_7774}; // (NW+SW) NW->N
    
    // Second stage
    conf_core[17][29:0] = {6'b00_00_10, 24'o7777_4777}; // (NW+SW) NW->S
    conf_core[25][29:0] = {6'b00_00_00, 24'o0777_7777}; //          N->SE
    conf_core[33][29:0] = {6'b00_00_00, 24'o7737_7777}; //          S->NE
    conf_core[41][29:0] = {6'b00_00_10, 24'o7777_7774}; // (NW+SW) NW->N
    
    // Third stage
    conf_core[34][29:0] = {6'b00_00_10, 24'o7777_7747}; // (NW+SW) NW->E
    
    
    // Forward data to output
    conf_core[35][29:0] = {6'b00_00_00, 24'o7777_7727}; // W->E
    conf_core[36][29:0] = {6'b00_00_00, 24'o7777_7727}; // W->E
    conf_core[37][29:0] = {6'b00_00_00, 24'o7777_7727}; // W->E
    conf_core[38][29:0] = {6'b00_00_00, 24'o7777_7727}; // W->E
    conf_core[39][29:0] = {6'b00_00_00, 24'o7777_7727}; // W->E
    
    
    // AUTO-GENERATED
    conf_all[0] = conf_edge[8][29:0];
    conf_all[1] = conf_edge[7][29:0];
    conf_all[2] = conf_edge[6][29:0];
    conf_all[3] = conf_edge[5][29:0];
    conf_all[4] = conf_edge[4][29:0];
    conf_all[5] = conf_edge[3][29:0];
    conf_all[6] = conf_edge[2][29:0];
    conf_all[7] = conf_edge[1][29:0];
    conf_all[8] = conf_edge[0][29:0];
    conf_all[9] = conf_edge[9][29:0];
    conf_all[10] = conf_core[0][29:0];
    conf_all[11] = conf_core[1][29:0];
    conf_all[12] = conf_core[2][29:0];
    conf_all[13] = conf_core[3][29:0];
    conf_all[14] = conf_core[4][29:0];
    conf_all[15] = conf_core[5][29:0];
    conf_all[16] = conf_core[6][29:0];
    conf_all[17] = conf_core[7][29:0];
    conf_all[18] = conf_core[15][29:0];
    conf_all[19] = conf_core[14][29:0];
    conf_all[20] = conf_core[13][29:0];
    conf_all[21] = conf_core[12][29:0];
    conf_all[22] = conf_core[11][29:0];
    conf_all[23] = conf_core[10][29:0];
    conf_all[24] = conf_core[9][29:0];
    conf_all[25] = conf_core[8][29:0];
    conf_all[26] = conf_edge[10][29:0];
    conf_all[27] = conf_edge[11][29:0];
    conf_all[28] = conf_core[16][29:0];
    conf_all[29] = conf_core[17][29:0];
    conf_all[30] = conf_core[18][29:0];
    conf_all[31] = conf_core[19][29:0];
    conf_all[32] = conf_core[20][29:0];
    conf_all[33] = conf_core[21][29:0];
    conf_all[34] = conf_core[22][29:0];
    conf_all[35] = conf_core[23][29:0];
    conf_all[36] = conf_core[31][29:0];
    conf_all[37] = conf_core[30][29:0];
    conf_all[38] = conf_core[29][29:0];
    conf_all[39] = conf_core[28][29:0];
    conf_all[40] = conf_core[27][29:0];
    conf_all[41] = conf_core[26][29:0];
    conf_all[42] = conf_core[25][29:0];
    conf_all[43] = conf_core[24][29:0];
    conf_all[44] = conf_edge[12][29:0];
    conf_all[45] = conf_edge[13][29:0];
    conf_all[46] = conf_core[32][29:0];
    conf_all[47] = conf_core[33][29:0];
    conf_all[48] = conf_core[34][29:0];
    conf_all[49] = conf_core[35][29:0];
    conf_all[50] = conf_core[36][29:0];
    conf_all[51] = conf_core[37][29:0];
    conf_all[52] = conf_core[38][29:0];
    conf_all[53] = conf_core[39][29:0];
    conf_all[54] = conf_core[47][29:0];
    conf_all[55] = conf_core[46][29:0];
    conf_all[56] = conf_core[45][29:0];
    conf_all[57] = conf_core[44][29:0];
    conf_all[58] = conf_core[43][29:0];
    conf_all[59] = conf_core[42][29:0];
    conf_all[60] = conf_core[41][29:0];
    conf_all[61] = conf_core[40][29:0];
    conf_all[62] = conf_edge[14][29:0];
    conf_all[63] = conf_edge[15][29:0];
    conf_all[64] = conf_core[48][29:0];
    conf_all[65] = conf_core[49][29:0];
    conf_all[66] = conf_core[50][29:0];
    conf_all[67] = conf_core[51][29:0];
    conf_all[68] = conf_core[52][29:0];
    conf_all[69] = conf_core[53][29:0];
    conf_all[70] = conf_core[54][29:0];
    conf_all[71] = conf_core[55][29:0];
    conf_all[72] = conf_core[63][29:0];
    conf_all[73] = conf_core[62][29:0];
    conf_all[74] = conf_core[61][29:0];
    conf_all[75] = conf_core[60][29:0];
    conf_all[76] = conf_core[59][29:0];
    conf_all[77] = conf_core[58][29:0];
    conf_all[78] = conf_core[57][29:0];
    conf_all[79] = conf_core[56][29:0];
    conf_all[80] = conf_edge[16][29:0];
    
    
    for (i=0; i < 81; i=i+1) begin
      // If there are any "don't care" bits, set them to "1" to turn off the switch/FU
      for (j=0; j < 30; j=j+1) begin
        if (conf_all[i][j] === 1'bx)
          conf_all[i][j] = 1'b1;
      end
      
      conf    = conf_all[i];
      conf_en = 1;
      @(negedge clk);
    end
    
    conf_en = 0;
  end
endtask


task check_reduction_path;
  integer expected;
  
  begin
    while (!d_out_10[0]) begin
      //#1; display_reduction;
      @(negedge clk);
      $display("[%0d] SUM:(%0d,%b)", cycle, d_out_10[`PATH_WIDTH:1], d_out_10[0]);
    end
    
    ASSERT(d_out_0  == 0, "d_out_0  is not zero", cycle, ERR);
    ASSERT(d_out_1  == 0, "d_out_1  is not zero", cycle, ERR);
    ASSERT(d_out_2  == 0, "d_out_2  is not zero", cycle, ERR);
    ASSERT(d_out_3  == 0, "d_out_3  is not zero", cycle, ERR);
    ASSERT(d_out_4  == 0, "d_out_4  is not zero", cycle, ERR);
    ASSERT(d_out_5  == 0, "d_out_5  is not zero", cycle, ERR);
    ASSERT(d_out_6  == 0, "d_out_6  is not zero", cycle, ERR);
    ASSERT(d_out_7  == 0, "d_out_7  is not zero", cycle, ERR);
    ASSERT(d_out_8  == 0, "d_out_8  is not zero", cycle, ERR);
    ASSERT(d_out_9  == 0, "d_out_9  is not zero", cycle, ERR);
    ASSERT(d_out_10 != 0, "d_out_10 is zero", cycle, ERR);
    ASSERT(d_out_11 == 0, "d_out_11 is not zero", cycle, ERR);
    ASSERT(d_out_12 == 0, "d_out_12 is not zero", cycle, ERR);
    ASSERT(d_out_13 == 0, "d_out_13 is not zero", cycle, ERR);
    ASSERT(d_out_14 == 0, "d_out_14 is not zero", cycle, ERR);
    ASSERT(d_out_15 == 0, "d_out_15 is not zero", cycle, ERR);
    ASSERT(d_out_16 == 0, "d_out_16 is not zero", cycle, ERR);
    ASSERT(d_out_17 == 0, "d_out_17 is not zero", cycle, ERR);
    ASSERT(d_out_18 == 0, "d_out_18 is not zero", cycle, ERR);
    ASSERT(d_out_19 == 0, "d_out_19 is not zero", cycle, ERR);
    ASSERT(d_out_20 == 0, "d_out_20 is not zero", cycle, ERR);
    ASSERT(d_out_21 == 0, "d_out_21 is not zero", cycle, ERR);
    ASSERT(d_out_22 == 0, "d_out_22 is not zero", cycle, ERR);
    ASSERT(d_out_23 == 0, "d_out_23 is not zero", cycle, ERR);
    ASSERT(d_out_24 == 0, "d_out_24 is not zero", cycle, ERR);
    ASSERT(d_out_25 == 0, "d_out_25 is not zero", cycle, ERR);
    ASSERT(d_out_26 == 0, "d_out_26 is not zero", cycle, ERR);
    
    repeat (100) begin
      expected = d_out_10[`PATH_WIDTH:1] + 8;
      
      //#1; display_reduction;
      @(negedge clk);
      $display("[%0d] SUM:(%0d,%b)", cycle, d_out_10[`PATH_WIDTH:1], d_out_10[0]);
      
      while (!d_out_10[0]) begin
        //#1; display_reduction;
        @(negedge clk);
        $display("[%0d] SUM:(%0d,%b)", cycle, d_out_10[`PATH_WIDTH:1], d_out_10[0]);
      end
      
      ASSERT(d_out_10[`PATH_WIDTH:1] == expected, "SUM is different than expected.", cycle, ERR);
    end
    
  end
endtask


task display_dyser;

  begin
    $display("  0[%3d,%b]  1[%3d,%b]  2[%3d,%b]  3[%3d,%b]  4[%3d,%b]  5[%3d,%b]  6[%3d,%b]  7[%3d,%b]  8[%3d,%b]",
      c0.e0.s0.d_in_W[`PATH_WIDTH:1], c0.e0.s0.d_in_W[0], c0.e0.s1.d_in_W[`PATH_WIDTH:1], c0.e0.s1.d_in_W[0], c0.e0.s2.d_in_W[`PATH_WIDTH:1], c0.e0.s2.d_in_W[0], c0.e0.s3.d_in_W[`PATH_WIDTH:1], c0.e0.s3.d_in_W[0], c0.e0.s4.d_in_W[`PATH_WIDTH:1], c0.e0.s4.d_in_W[0], c0.e0.s5.d_in_W[`PATH_WIDTH:1], c0.e0.s5.d_in_W[0], c0.e0.s6.d_in_W[`PATH_WIDTH:1], c0.e0.s6.d_in_W[0], c0.e0.s7.d_in_W[`PATH_WIDTH:1], c0.e0.s7.d_in_W[0], c0.e0.s8.d_in_W[`PATH_WIDTH:1], c0.e0.s8.d_in_W[0]);
    $display("  9[%3d,%b]  0[%3d,%b]  1[%3d,%b]  2[%3d,%b]  3[%3d,%b]  4[%3d,%b]  5[%3d,%b]  6[%3d,%b]  7[%3d,%b]",
      c0.e0.s9.d_in_W[`PATH_WIDTH:1], c0.e0.s9.d_in_W[0], c0.t0.t0.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t0.s0.d_in_W[0], c0.t0.t1.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t1.s0.d_in_W[0], c0.t0.t2.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t2.s0.d_in_W[0], c0.t0.t3.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t3.s0.d_in_W[0], c0.t0.t4.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t4.s0.d_in_W[0], c0.t0.t5.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t5.s0.d_in_W[0], c0.t0.t6.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t6.s0.d_in_W[0], c0.t0.t7.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t7.s0.d_in_W[0]);
    $display(" 10[%3d,%b]  8[%3d,%b]  9[%3d,%b] 10[%3d,%b] 11[%3d,%b] 12[%3d,%b] 13[%3d,%b] 14[%3d,%b] 15[%3d,%b]",
      c0.e0.s10.d_in_W[`PATH_WIDTH:1], c0.e0.s10.d_in_W[0], c0.t0.t8.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t8.s0.d_in_W[0], c0.t0.t9.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t9.s0.d_in_W[0], c0.t0.t10.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t10.s0.d_in_W[0], c0.t0.t11.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t11.s0.d_in_W[0], c0.t0.t12.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t12.s0.d_in_W[0], c0.t0.t13.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t13.s0.d_in_W[0], c0.t0.t14.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t14.s0.d_in_W[0], c0.t0.t15.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t15.s0.d_in_W[0]);
    $display(" 11[%3d,%b] 16[%3d,%b] 17[%3d,%b] 18[%3d,%b] 19[%3d,%b] 20[%3d,%b] 21[%3d,%b] 22[%3d,%b] 23[%3d,%b]",
      c0.e0.s11.d_in_W[`PATH_WIDTH:1], c0.e0.s11.d_in_W[0], c0.t0.t16.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t16.s0.d_in_W[0], c0.t0.t17.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t17.s0.d_in_W[0], c0.t0.t18.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t18.s0.d_in_W[0], c0.t0.t19.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t19.s0.d_in_W[0], c0.t0.t20.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t20.s0.d_in_W[0], c0.t0.t21.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t21.s0.d_in_W[0], c0.t0.t22.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t22.s0.d_in_W[0], c0.t0.t23.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t23.s0.d_in_W[0]);
    $display(" 12[%3d,%b] 24[%3d,%b] 25[%3d,%b] 26[%3d,%b] 27[%3d,%b] 28[%3d,%b] 29[%3d,%b] 30[%3d,%b] 31[%3d,%b]",
      c0.e0.s12.d_in_W[`PATH_WIDTH:1], c0.e0.s12.d_in_W[0], c0.t0.t24.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t24.s0.d_in_W[0], c0.t0.t25.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t25.s0.d_in_W[0], c0.t0.t26.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t26.s0.d_in_W[0], c0.t0.t27.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t27.s0.d_in_W[0], c0.t0.t28.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t28.s0.d_in_W[0], c0.t0.t29.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t29.s0.d_in_W[0], c0.t0.t30.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t30.s0.d_in_W[0], c0.t0.t31.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t31.s0.d_in_W[0]);
    $display(" 13[%3d,%b] 32[%3d,%b] 33[%3d,%b] 34[%3d,%b] 35[%3d,%b] 36[%3d,%b] 37[%3d,%b] 38[%3d,%b] 39[%3d,%b]",
      c0.e0.s13.d_in_W[`PATH_WIDTH:1], c0.e0.s13.d_in_W[0], c0.t0.t32.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t32.s0.d_in_W[0], c0.t0.t33.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t33.s0.d_in_W[0], c0.t0.t34.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t34.s0.d_in_W[0], c0.t0.t35.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t35.s0.d_in_W[0], c0.t0.t36.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t36.s0.d_in_W[0], c0.t0.t37.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t37.s0.d_in_W[0], c0.t0.t38.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t38.s0.d_in_W[0], c0.t0.t39.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t39.s0.d_in_W[0]);
    $display(" 14[%3d,%b] 40[%3d,%b] 41[%3d,%b] 42[%3d,%b] 43[%3d,%b] 44[%3d,%b] 45[%3d,%b] 46[%3d,%b] 47[%3d,%b]",
      c0.e0.s14.d_in_W[`PATH_WIDTH:1], c0.e0.s14.d_in_W[0], c0.t0.t40.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t40.s0.d_in_W[0], c0.t0.t41.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t41.s0.d_in_W[0], c0.t0.t42.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t42.s0.d_in_W[0], c0.t0.t43.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t43.s0.d_in_W[0], c0.t0.t44.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t44.s0.d_in_W[0], c0.t0.t45.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t45.s0.d_in_W[0], c0.t0.t46.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t46.s0.d_in_W[0], c0.t0.t47.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t47.s0.d_in_W[0]);
    $display(" 15[%3d,%b] 48[%3d,%b] 49[%3d,%b] 50[%3d,%b] 51[%3d,%b] 52[%3d,%b] 53[%3d,%b] 54[%3d,%b] 55[%3d,%b]",
      c0.e0.s15.d_in_W[`PATH_WIDTH:1], c0.e0.s15.d_in_W[0], c0.t0.t48.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t48.s0.d_in_W[0], c0.t0.t49.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t49.s0.d_in_W[0], c0.t0.t50.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t50.s0.d_in_W[0], c0.t0.t51.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t51.s0.d_in_W[0], c0.t0.t52.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t52.s0.d_in_W[0], c0.t0.t53.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t53.s0.d_in_W[0], c0.t0.t54.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t54.s0.d_in_W[0], c0.t0.t55.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t55.s0.d_in_W[0]);
    $display(" 16[%3d,%b] 56[%3d,%b] 57[%3d,%b] 58[%3d,%b] 59[%3d,%b] 60[%3d,%b] 61[%3d,%b] 62[%3d,%b] 63[%3d,%b]",
      c0.e0.s16.d_in_W[`PATH_WIDTH:1], c0.e0.s16.d_in_W[0], c0.t0.t56.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t56.s0.d_in_W[0], c0.t0.t57.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t57.s0.d_in_W[0], c0.t0.t58.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t58.s0.d_in_W[0], c0.t0.t59.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t59.s0.d_in_W[0], c0.t0.t60.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t60.s0.d_in_W[0], c0.t0.t61.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t61.s0.d_in_W[0], c0.t0.t62.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t62.s0.d_in_W[0], c0.t0.t63.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t63.s0.d_in_W[0]);
  end
endtask

task display_reduction;

  begin
    $display("   1[%3d,%b => %3d,%b]",
      c0.e0.s1.d_in_N[`PATH_WIDTH:1], c0.e0.s1.d_in_N[0], c0.e0.s1.d_out_SW[`PATH_WIDTH:1], c0.e0.s1.d_out_SW[0]);
    $display("   9[%3d,%b => %3d,%b]  0[%3d,%b]",
      c0.e0.s9.d_in_W[`PATH_WIDTH:1], c0.e0.s9.d_in_W[0], c0.e0.s9.d_out_NE[`PATH_WIDTH:1], c0.e0.s9.d_out_NE[0], c0.t0.t0.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t0.s0.d_in_NW[0]);
    $display(" 10[%3d,%b => %3d,%b]  8[%3d,%b => %3d,%b]",
      c0.e0.s10.d_in_W[`PATH_WIDTH:1], c0.e0.s10.d_in_W[0], c0.e0.s10.d_out_SE[`PATH_WIDTH:1], c0.e0.s10.d_out_SE[0], c0.t0.t8.s0.d_in_N[`PATH_WIDTH:1], c0.t0.t8.s0.d_in_N[0], c0.t0.t8.s0.d_out_SE[`PATH_WIDTH:1], c0.t0.t8.s0.d_out_SE[0]);
    $display(" 11[%3d,%b => %3d,%b] 16[%3d,%b => %3d,%b] 17[%3d,%b]",
      c0.e0.s11.d_in_W[`PATH_WIDTH:1], c0.e0.s11.d_in_W[0], c0.e0.s11.d_out_NE[`PATH_WIDTH:1], c0.e0.s11.d_out_NE[0], c0.t0.t16.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t16.s0.d_in_NW[0], c0.t0.t16.s0.d_out_NE[`PATH_WIDTH:1], c0.t0.t16.s0.d_out_NE[0], c0.t0.t17.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t17.s0.d_in_NW[0]);
    $display(" 12[%3d,%b => %3d,%b]                           25[%3d,%b => %3d,%b]",
      c0.e0.s12.d_in_W[`PATH_WIDTH:1], c0.e0.s12.d_in_W[0], c0.e0.s12.d_out_SE[`PATH_WIDTH:1], c0.e0.s12.d_out_SE[0], c0.t0.t25.s0.d_in_N[`PATH_WIDTH:1], c0.t0.t25.s0.d_in_N[0], c0.t0.t25.s0.d_out_SE[`PATH_WIDTH:1], c0.t0.t25.s0.d_out_SE[0]);
    $display(" 13[%3d,%b => %3d,%b] 32[%3d,%b => %3d,%b] 33[%3d,%b => %3d,%b] 34[%3d,%b => %3d,%b] 35[%3d,%b => %3d,%b] 36[%3d,%b => %3d,%b]",
      c0.e0.s13.d_in_W[`PATH_WIDTH:1], c0.e0.s13.d_in_W[0], c0.e0.s13.d_out_NE[`PATH_WIDTH:1], c0.e0.s13.d_out_NE[0], c0.t0.t32.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t32.s0.d_in_NW[0], c0.t0.t32.s0.d_out_SE[`PATH_WIDTH:1], c0.t0.t32.s0.d_out_SE[0], c0.t0.t33.s0.d_in_S[`PATH_WIDTH:1], c0.t0.t33.s0.d_in_S[0], c0.t0.t33.s0.d_out_NE[`PATH_WIDTH:1], c0.t0.t33.s0.d_out_NE[0], c0.t0.t34.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t34.s0.d_in_NW[0], c0.t0.t34.s0.d_out_E[`PATH_WIDTH:1], c0.t0.t34.s0.d_out_E[0], c0.t0.t35.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t35.s0.d_in_W[0], c0.t0.t35.s0.d_out_E[`PATH_WIDTH:1], c0.t0.t35.s0.d_out_E[0], c0.t0.t36.s0.d_in_W[`PATH_WIDTH:1], c0.t0.t36.s0.d_in_W[0], c0.t0.t36.s0.d_out_E[`PATH_WIDTH:1], c0.t0.t36.s0.d_out_E[0]);
    $display(" 14[%3d,%b => %3d,%b] 40[%3d,%b => %3d,%b] 41[%3d,%b]",
      c0.e0.s14.d_in_W[`PATH_WIDTH:1], c0.e0.s14.d_in_W[0], c0.e0.s14.d_out_SE[`PATH_WIDTH:1], c0.e0.s14.d_out_SE[0], c0.t0.t40.s0.d_in_S[`PATH_WIDTH:1], c0.t0.t40.s0.d_in_S[0], c0.t0.t40.s0.d_out_NE[`PATH_WIDTH:1], c0.t0.t40.s0.d_out_NE[0], c0.t0.t41.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t41.s0.d_in_NW[0]);
    $display(" 15[%3d,%b => %3d,%b] 48[%3d,%b]",
      c0.e0.s15.d_in_W[`PATH_WIDTH:1], c0.e0.s15.d_in_W[0], c0.e0.s15.d_out_NE[`PATH_WIDTH:1], c0.e0.s15.d_out_NE[0], c0.t0.t48.s0.d_in_NW[`PATH_WIDTH:1], c0.t0.t48.s0.d_in_NW[0]);
  end
endtask

endmodule
