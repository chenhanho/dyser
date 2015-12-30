`include "config.v"

module dyser_tb();

`include "check_error.v"


// INPUTS
                       // dyser_send
reg  [`PATH_WIDTH-1:0] send_data_r0;
reg  [`PATH_WIDTH-1:0] send_data_r1;
reg              [4:0] send_port_r0;
reg              [4:0] send_port_r1;
reg                    send_en0;
reg                    send_en1;
                       // dyser_recv
reg              [4:0] recv_port_r0;
reg              [4:0] recv_port_r1;
reg                    recv_en0;
reg                    recv_en1;
                       // dyser_init
reg             [29:0] config_bits;
reg                    config_en;
                       // dyser_commit
reg                    commit;
                       // extra
reg                    clk, rst;

// OUTPUTS
                       // dyser_send
wire                   send_stall;
                       // dyser_recv
wire [`PATH_WIDTH-1:0] recv_data_r0;
wire [`PATH_WIDTH-1:0] recv_data_r1;
wire                   recv_stall;


// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;
reg  [`PATH_WIDTH-1:0] received;
integer                idx;


dyser d0(
    /* inputs */
    .send_data_r0(send_data_r0),
    .send_data_r1(send_data_r1),
    .send_port_r0(send_port_r0),
    .send_port_r1(send_port_r1),
    .send_en0(send_en0),
    .send_en1(send_en1),
    .recv_port_r0(recv_port_r0),
    .recv_port_r1(recv_port_r1),
    .recv_en0(recv_en0),
    .recv_en1(recv_en1),
    .config_bits(config_bits),
    .config_en(config_en),
    .commit(commit),
    .clk(clk),
    .rst(rst),
    /* outputs */
    .send_stall(send_stall),
    .recv_data_r0(recv_data_r0),
    .recv_data_r1(recv_data_r1),
    .recv_stall(recv_stall)
    );


  // Clock
  initial clk = 0;
  always #10 clk = ~clk;

  // Clock cycle
integer cycle;
  initial cycle = 0;
  always @(posedge clk)
    cycle = cycle + 1;


  initial begin
    $display("Beginning DySER tests...");
    
    // RESET
    clear_inputs;
    ERR = 0;
    reset;
    
    
    $display("[%0d] Configuring Straight Through Test...", cycle);
    config_send_straight_through;
    $display("[%0d] Configuration done.", cycle);
    
    
    // Send to: 0,2, 4,6, 8,10, 12,14 (8 switch rows; from bottom to top)
    send_data_r0 = -1; send_port_r0 = -4;
    send_data_r1 = 0; send_port_r1 = -2;
    
    repeat (32) begin
      send_data_r0 = send_data_r0 + 2;  send_port_r0 = (send_port_r0 + 4) % 16;  send_en0 = 1;
      send_data_r1 = send_data_r1 + 2;  send_port_r1 = (send_port_r1 + 4) % 16;  send_en1 = 1;
      @(negedge clk);
    end
    
    send_en0 = 0; send_en1 = 0;
    
    
    // receive all data at appropriate output ports when ready
    idx = 1;
    expected = 1;
    repeat (64) begin
      recv_data(idx, received);
      
      if (idx == 1) $display("----------");
      $display("[%0d] Port[%0d]=%0d", cycle, idx, received);
      ASSERT(received == expected, "received data is different than expected", cycle, ERR);
      
      idx = (idx + 3) % 24;
      expected = expected + 1;
    end
    
    
    // Check error from first test
    check_error(ERR, cycle);
    
    
    reset;
    
    
    $display("[%0d] Configuring Reduction Path...", cycle);
    config_reduction_path;
    $display("[%0d] Configuration done.", cycle);
    
    
    // Slightly strange way to generate the following SUM REDUCTIONS:
    //   (1+2+3+4+5+6+7+8)
    //   (2+3+4+5+6+7+8+9)
    //   (3+4+5+6+7+8+9+10)
    //   ... etc.
    send_data_r0 = 6; send_data_r1 = 7;
    
    
    expected = 36;
    
    // Pipeline START
    repeat (6) begin
      send_data_r0 = send_data_r0 - 5;  send_port_r0 = 17;  send_en0 = 1;
      send_data_r1 = send_data_r1 - 5;  send_port_r1 = 14;  send_en1 = 1;
      @(negedge clk);
      
      send_data_r0 = send_data_r0 + 2;  send_port_r0 = 12;  send_en0 = 1;
      send_data_r1 = send_data_r1 + 2;  send_port_r1 = 10;  send_en1 = 1;
      @(negedge clk);
      
      send_data_r0 = send_data_r0 + 2;  send_port_r0 = 8;  send_en0 = 1;
      send_data_r1 = send_data_r1 + 2;  send_port_r1 = 6;  send_en1 = 1;
      @(negedge clk);
      
      send_data_r0 = send_data_r0 + 2;  send_port_r0 = 4;  send_en0 = 1;
      send_data_r1 = send_data_r1 + 2;  send_port_r1 = 2;  send_en1 = 1;
      @(negedge clk);
    end
    
    // Pipeline BODY
    repeat (1000) begin
      repeat (6) begin
        send_data_r0 = send_data_r0 - 5;  send_port_r0 = 17;  send_en0 = 1;
        send_data_r1 = send_data_r1 - 5;  send_port_r1 = 14;  send_en1 = 1;
        @(negedge clk);
        
        send_data_r0 = send_data_r0 + 2;  send_port_r0 = 12;  send_en0 = 1;
        send_data_r1 = send_data_r1 + 2;  send_port_r1 = 10;  send_en1 = 1;
        @(negedge clk);
        
        send_data_r0 = send_data_r0 + 2;  send_port_r0 = 8;  send_en0 = 1;
        send_data_r1 = send_data_r1 + 2;  send_port_r1 = 6;  send_en1 = 1;
        @(negedge clk);
        
        send_data_r0 = send_data_r0 + 2;  send_port_r0 = 4;  send_en0 = 1;
        send_data_r1 = send_data_r1 + 2;  send_port_r1 = 2;  send_en1 = 1;
        @(negedge clk);
      end
      
      send_en0 = 0; send_en1 = 0;
      
      
      repeat (6) begin
        recv_data(10, received);
        
        $display("[%0d] Port[10]=%0d", cycle, received);
        ASSERT(received == expected, "received data is different than expected", cycle, ERR);
        
        expected = received + 8;
      end
    end
    
    // Pipeline END
    repeat (6) begin
      recv_data(10, received);
      
      $display("[%0d] Port[10]=%0d", cycle, received);
      ASSERT(received == expected, "received data is different than expected", cycle, ERR);
      
      expected = received + 8;
    end
    
    
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
  
  begin
    send_data_r0 = 0;
    send_data_r1 = 0;
    send_port_r0 = 0;
    send_port_r1 = 0;
    send_en0     = 0;
    send_en1     = 0;
    
    recv_port_r0 = 0;
    recv_port_r1 = 0;
    recv_en0     = 0;
    recv_en1     = 0;
    
    config_bits = 0;
    config_en   = 0;
    
    commit = 0;
  end
endtask


task recv_data;
  input              [4:0] port;
  output [`PATH_WIDTH-1:0] data;

  begin
    recv_port_r0 = port;
    recv_en0     = 1;
    
    #1 data = recv_data_r0;
    
    while (recv_stall) begin
    	@(negedge clk);
      data = recv_data_r0;
    end
    
    @(negedge clk);
    recv_en0 = 0;
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
      config_bits = conf_all[i];
      config_en = 1;
      $display("dyser_init 0x%h", config_bits);
      @(negedge clk);
    end
    
    config_en = 0;
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
      
      config_bits = conf_all[i];
      config_en = 1;
      $display("dyser_init 0x%h", config_bits);
      @(negedge clk);
    end
    
    config_en = 0;
  end
endtask


endmodule
