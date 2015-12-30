`include "config.v"

module dyser_tb();

`include "check_error.v"


// INPUTS
                     // dyser_send
reg  [`DATA_WIDTH:0] send_data_r0;
reg  [`DATA_WIDTH:0] send_data_r1;
reg            [2:0] send_port_r0;
reg            [2:0] send_port_r1;
reg                  send_en0;
reg                  send_en1;
                     // dyser_recv
reg            [2:0] recv_port_r0;
reg            [2:0] recv_port_r1;
reg                  recv_en0;
reg                  recv_en1;
                     // dyser_init
reg           [20:0] config_bits;
reg                  config_en;
                     // dyser_commit
reg                  commit;
                     // extra
reg                  clk, rst;

// OUTPUTS
                     // dyser_send
wire                 send_stall;
                     // dyser_recv
wire [`DATA_WIDTH:0] recv_data_r0;
wire [`DATA_WIDTH:0] recv_data_r1;
wire                 recv_stall;


// INTERNAL
reg                  ERR;
reg  [`DATA_WIDTH:0] expected;
reg  [`DATA_WIDTH:0] received;
integer              x;


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


    $display("[%2d] Configuring DySER...", cycle);
    dyser_configure;
    $display("[%2d] Configuration done.", cycle);


    // Put your dyser_send's and dyser_recv's here:
    for (x=0; x < 10; x=x+1) begin
      $display("Iteration %0d", x);
      dyser_send(4, x, 3, x+1);
      dyser_send1(0, x);
    end
    
    for (x=0; x < 10; x=x+1) begin
      $display("Iteration %0d", x);
      dyser_recv(7, received);
      ASSERT(received == x, "received data is different than expected", cycle, ERR);
      dyser_recv(0, received);
      ASSERT(received == x+1, "received data is different than expected", cycle, ERR);
      dyser_recv(1, received);
      ASSERT(received == ~x, "received data is different than expected", cycle, ERR);
      dyser_recv(3, received);
      ASSERT(received == ((x+(x+1)) >> 64'h1), "received data is different than expected", cycle, ERR);
      dyser_recv(5, received);
      ASSERT(received == ((x+(x+1)) & 64'h0f), "received data is different than expected", cycle, ERR);
    end
    
    
    Straight_Thru_0;
    Straight_Thru_1;
    
    Increment;
    
    Const_Func_00;
    
    Activate_Func_00;
    Activate_Func_01;
    Activate_Func_10;
    Activate_Func_11;
    
    Complex_Func_00;
    
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


task dyser_send1;
  input            [2:0] port0;
  input  [`DATA_BITS:0] data0;

  begin
    send_data_r0 = data0;
    send_port_r0 = port0;
    send_en0 = 1;

    send_en1 = 0;

    #1;
    while (send_stall) begin
      $display("[%2d] send stall", cycle);
      @(negedge clk);
    end
    $display("[%2d] dyser_send P[%d]=%8h", cycle, port0, data0);
    @(negedge clk);

    send_en0 = 0;
    send_en1 = 0;
  end
endtask


task dyser_send;
  input            [2:0] port0;
  input  [`DATA_BITS:0] data0;
  input            [2:0] port1;
  input  [`DATA_BITS:0] data1;

  begin
    send_data_r0 = data0;
    send_port_r0 = port0;
    send_en0 = 1;

    send_data_r1 = data1;
    send_port_r1 = port1;
    send_en1 = 1;

    #1;
    while (send_stall) begin
      $display("[%2d] send stall", cycle);
      @(negedge clk);
    end
    $display("[%2d] dyser_send P[%d]=%8h  P[%d]=%8h", cycle, port0, data0, port1, data1);
    @(negedge clk);

    send_en0 = 0;
    send_en1 = 0;
  end
endtask


task dyser_recv;
  input            [2:0] port;
  output [`DATA_BITS:0] data;

  begin
    recv_port_r0 = port;
    recv_en0     = 1;

    #1 data = recv_data_r0;
    while (recv_stall) begin
      $display("[%2d] receive stall", cycle);
      @(negedge clk);
      data = recv_data_r0;
    end

    $display("[%2d] dyser_recv P[%d]=%8h", cycle, recv_port_r0, recv_data_r0);
    @(negedge clk);
    recv_en0 = 0;
  end
endtask


task dyser_configure;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h100000;
    conf_all[1] = 21'h000000;
    conf_all[2] = 21'h000400;
    conf_all[3] = 21'h000000;
    conf_all[4] = 21'h000011;
    conf_all[5] = 21'h010010;
    conf_all[6] = 21'h008000;
    conf_all[7] = 21'h000004;
    conf_all[8] = 21'h000004;
    conf_all[9] = 21'h000010;
    conf_all[10] = 21'h050f00;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h005400;
    conf_all[13] = 21'h10000e;
    conf_all[14] = 21'h100040;
    conf_all[15] = 21'h0000ff;
    conf_all[16] = 21'h000007;


    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
  end
endtask



// TESTBENCHES

task Straight_Thru_0;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h100000;
    conf_all[1] = 21'h000000;
    conf_all[2] = 21'h018400;
    conf_all[3] = 21'h000000;
    conf_all[4] = 21'h000001;
    conf_all[5] = 21'h000800;
    conf_all[6] = 21'h000000;
    conf_all[7] = 21'h0400c2;
    conf_all[8] = 21'h000000;
    conf_all[9] = 21'h000080;
    conf_all[10] = 21'h000008;
    conf_all[11] = 21'h002000;
    conf_all[12] = 21'h000200;
    conf_all[13] = 21'h080000;
    conf_all[14] = 21'h008018;
    conf_all[15] = 21'h000000;
    conf_all[16] = 21'h000010;


    $display("[%0d] Configuring Straight-Thru-0 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 2, 64'h1);
    dyser_send(0, 64'h2, 7, 64'h3);
    dyser_send(4, 64'h4, 2, 64'h5);
    dyser_send(0, 64'h6, 7, 64'h7);
    
    
    
    dyser_recv(7, received);
    ASSERT(received == 64'h0, "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == 64'h1, "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == 64'h2, "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == 64'h3, "received data is different than expected", cycle, ERR);

    dyser_recv(7, received);
    ASSERT(received == 64'h4, "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == 64'h5, "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == 64'h6, "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == 64'h7, "received data is different than expected", cycle, ERR);
    
    
    check_error(ERR, cycle);
  end
endtask



task Straight_Thru_1;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000008;
    conf_all[2] = 21'h008400;
    conf_all[3] = 21'h040000;
    conf_all[4] = 21'h000000;
    conf_all[5] = 21'h000100;
    conf_all[6] = 21'h000000;
    conf_all[7] = 21'h0400c2;
    conf_all[8] = 21'h000000;
    conf_all[9] = 21'h000800;
    conf_all[10] = 21'h000008;
    conf_all[11] = 21'h020000;
    conf_all[12] = 21'h000200;
    conf_all[13] = 21'h180000;
    conf_all[14] = 21'h008001;
    conf_all[15] = 21'h000000;
    conf_all[16] = 21'h000002;


    $display("[%0d] Configuring Straight-Thru-1 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(5, 64'h0, 3, 64'h1);
    dyser_send(1, 64'h2, 6, 64'h3);
    dyser_send(5, 64'h4, 3, 64'h5);
    dyser_send(1, 64'h6, 6, 64'h7);
    
    
    
    dyser_recv(6, received);
    ASSERT(received == 64'h0, "received data is different than expected", cycle, ERR);
    dyser_recv(4, received);
    ASSERT(received == 64'h1, "received data is different than expected", cycle, ERR);
    dyser_recv(2, received);
    ASSERT(received == 64'h2, "received data is different than expected", cycle, ERR);
    dyser_recv(1, received);
    ASSERT(received == 64'h3, "received data is different than expected", cycle, ERR);

    dyser_recv(6, received);
    ASSERT(received == 64'h4, "received data is different than expected", cycle, ERR);
    dyser_recv(4, received);
    ASSERT(received == 64'h5, "received data is different than expected", cycle, ERR);
    dyser_recv(2, received);
    ASSERT(received == 64'h6, "received data is different than expected", cycle, ERR);
    dyser_recv(1, received);
    ASSERT(received == 64'h7, "received data is different than expected", cycle, ERR);
    
    
    check_error(ERR, cycle);
  end
endtask



task Increment;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000000;
    conf_all[2] = 21'h000000;
    conf_all[3] = 21'h000000;
    conf_all[4] = 21'h000000;
    conf_all[5] = 21'h000080;
    conf_all[6] = 21'h000000;
    conf_all[7] = 21'h000040;
    conf_all[8] = 21'h000404;
    conf_all[9] = 21'h000000;
    conf_all[10] = 21'h000008;
    conf_all[11] = 21'h000000;
    conf_all[12] = 21'h000200;
    conf_all[13] = 21'h000000;
    conf_all[14] = 21'h008018;
    conf_all[15] = 21'h000000;
    conf_all[16] = 21'h000000;


    $display("[%0d] Configuring Increment Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send1(2, 64'h0);
    dyser_send1(2, 64'h2);
    dyser_send1(2, 64'h4);
    dyser_send1(2, 64'hf);
    
    
    dyser_recv(0, received);
    ASSERT(received == (64'h0+64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h2+64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h4+64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'hf+64'h1), "received data is different than expected", cycle, ERR);
    
    
    check_error(ERR, cycle);
  end
endtask



task Const_Func_00;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000000;
    conf_all[2] = 21'h001800;
    conf_all[3] = 21'h000000;
    conf_all[4] = 21'h000002;
    conf_all[5] = 21'h001000;
    conf_all[6] = 21'h000000;
    conf_all[7] = 21'h080040;
    conf_all[8] = 21'h000415;
    conf_all[9] = 21'h000100;
    conf_all[10] = 21'h010550;
    conf_all[11] = 21'h004000;
    conf_all[12] = 21'h028000;
    conf_all[13] = 21'h108002;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h000085;
    conf_all[16] = 21'h000002;


    $display("[%0d] Configuring Const Func 00 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(5, 64'h0, 3, 64'h1);
    dyser_send(7, 64'h2, 1, 64'h3);
    
    dyser_send(5, 64'ha, 3, 64'hf);
    dyser_send(7, 64'hf, 1, 64'h5);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0+64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h1^64'ha), "received data is different than expected", cycle, ERR);
    dyser_recv(4, received);
    ASSERT(received == (64'h2^64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(2, received);
    ASSERT(received == (64'h3+64'ha), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'ha+64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'hf^64'ha), "received data is different than expected", cycle, ERR);
    dyser_recv(4, received);
    ASSERT(received == (64'hf^64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(2, received);
    ASSERT(received == (64'h5+64'ha), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



task Activate_Func_00;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000080;
    conf_all[2] = 21'h040980;
    conf_all[3] = 21'h040000;
    conf_all[4] = 21'h000010;
    conf_all[5] = 21'h008010;
    conf_all[6] = 21'h018000;
    conf_all[7] = 21'h080040;
    conf_all[8] = 21'h000001;
    conf_all[9] = 21'h030010;
    conf_all[10] = 21'h000050;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h008000;
    conf_all[13] = 21'h108000;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h040000;
    conf_all[16] = 21'h000010;


    $display("[%0d] Configuring Activate Func 00 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 3, 64'h1);
    dyser_send(2, 64'h2, 1, 64'h3);
    dyser_send(6, 64'h4, 5, 64'h5);
    dyser_send(0, 64'h6, 7, 64'h7);
    
    dyser_send(4, 64'h4, 3, 64'h4);
    dyser_send(2, 64'h55, 1, 64'hff);
    dyser_send(6, 64'hff, 5, 64'h55);
    dyser_send(0, 64'h5, 7, 64'ha);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0+64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h2^64'h3), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'h4^64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h6+64'h7), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'h4+64'h4), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h55^64'hff), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'hff^64'h55), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h5+64'ha), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



task Activate_Func_01;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000080;
    conf_all[2] = 21'h040980;
    conf_all[3] = 21'h040000;
    conf_all[4] = 21'h000010;
    conf_all[5] = 21'h008010;
    conf_all[6] = 21'h018000;
    conf_all[7] = 21'h080040;
    conf_all[8] = 21'h000801;
    conf_all[9] = 21'h030010;
    conf_all[10] = 21'h020050;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h008000;
    conf_all[13] = 21'h108004;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h040100;
    conf_all[16] = 21'h000010;


    $display("[%0d] Configuring Activate Func 01 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 3, 64'h1);
    dyser_send(2, 64'h2, 1, 64'h3);
    dyser_send(6, 64'h4, 5, 64'h5);
    dyser_send(0, 64'h6, 7, 64'h7);
    
    dyser_send(4, 64'h4, 3, 64'h4);
    dyser_send(2, 64'h55, 1, 64'hff);
    dyser_send(6, 64'hff, 5, 64'h55);
    dyser_send(0, 64'h5, 7, 64'ha);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0-64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h2>=64'h3 ? 1 : 0), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'h4>=64'h5 ? 1 : 0), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h6-64'h7), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'h4-64'h4), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h55>=64'hff ? 1 : 0), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'hff>=64'h55 ? 1 : 0), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h5-64'ha), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



task Activate_Func_10;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000080;
    conf_all[2] = 21'h040980;
    conf_all[3] = 21'h040000;
    conf_all[4] = 21'h000010;
    conf_all[5] = 21'h008010;
    conf_all[6] = 21'h018000;
    conf_all[7] = 21'h080040;
    conf_all[8] = 21'h001001;
    conf_all[9] = 21'h030010;
    conf_all[10] = 21'h040050;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h008000;
    conf_all[13] = 21'h108008;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h040200;
    conf_all[16] = 21'h000010;


    $display("[%0d] Configuring Activate Func 10 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 3, 64'h1);
    dyser_send(2, 64'h2, 1, 64'h3);
    dyser_send(6, 64'h4, 5, 64'h5);
    dyser_send(0, 64'h6, 7, 64'h7);
    
    dyser_send(4, 64'h4, 3, 64'h4);
    dyser_send(2, 64'h55, 1, 64'hff);
    dyser_send(6, 64'hff, 5, 64'h55);
    dyser_send(0, 64'h5, 7, 64'ha);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0<<64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h2&64'h3), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'h4&64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h6<<64'h7), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'h4<<64'h4), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h55&64'hff), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'hff&64'h55), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h5<<64'ha), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



task Activate_Func_11;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000080;
    conf_all[2] = 21'h040980;
    conf_all[3] = 21'h040000;
    conf_all[4] = 21'h000010;
    conf_all[5] = 21'h008010;
    conf_all[6] = 21'h018000;
    conf_all[7] = 21'h080040;
    conf_all[8] = 21'h001801;
    conf_all[9] = 21'h030010;
    conf_all[10] = 21'h060050;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h008000;
    conf_all[13] = 21'h10800c;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h040300;
    conf_all[16] = 21'h000010;


    $display("[%0d] Configuring Activate Func 11 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 3, 64'h1);
    dyser_send(2, 64'h2, 1, 64'h3);
    dyser_send(6, 64'h4, 5, 64'h5);
    dyser_send(0, 64'h6, 7, 64'h7);
    
    dyser_send(4, 64'h4, 3, 64'h4);
    dyser_send(2, 64'h55, 1, 64'hff);
    dyser_send(6, 64'hff, 5, 64'h55);
    dyser_send(0, 64'h5, 7, 64'ha);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0>>64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h2|64'h3), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'h4|64'h5), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h6>>64'h7), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'h4>>64'h4), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == (64'h55|64'hff), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == (64'hff|64'h55), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == (64'h5>>64'ha), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



task Complex_Func_00;
  integer i;
  reg   [20:0] conf_all  [16:0];

  begin
    clear_inputs;

    conf_all[0] = 21'h000000;
    conf_all[1] = 21'h000000;
    conf_all[2] = 21'h000800;
    conf_all[3] = 21'h000000;
    conf_all[4] = 21'h000010;
    conf_all[5] = 21'h008080;
    conf_all[6] = 21'h008000;
    conf_all[7] = 21'h080444;
    conf_all[8] = 21'h000001;
    conf_all[9] = 21'h010010;
    conf_all[10] = 21'h000050;
    conf_all[11] = 21'h000400;
    conf_all[12] = 21'h009400;
    conf_all[13] = 21'h100000;
    conf_all[14] = 21'h050009;
    conf_all[15] = 21'h000001;
    conf_all[16] = 21'h000000;


    $display("[%0d] Configuring Complex Func 00 Test...", cycle);
    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("[%2d] dyser_init 0x%h", cycle, config_bits);

      @(negedge clk);
    end

    config_en = 0;
    $display("[%0d] Configuration done.", cycle);



    // Put your dyser_send's and dyser_recv's here:
    dyser_send(4, 64'h0, 2, 64'h1);
    dyser_send1(6, 64'h2);
    
    dyser_send(4, 64'h5, 2, 64'ha);
    dyser_send1(6, 64'hf);
    
    
    dyser_recv(1, received);
    ASSERT(received == (64'h0+64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == ((64'h0+64'h1)^64'h1), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == ((64'h0+64'h1)^64'h2), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == ((64'h0+64'h1)+((64'h0+64'h1)^64'h2)), "received data is different than expected", cycle, ERR);

    dyser_recv(1, received);
    ASSERT(received == (64'h5+64'ha), "received data is different than expected", cycle, ERR);
    dyser_recv(0, received);
    ASSERT(received == ((64'h5+64'ha)^64'ha), "received data is different than expected", cycle, ERR);
    dyser_recv(5, received);
    ASSERT(received == ((64'h5+64'ha)^64'hf), "received data is different than expected", cycle, ERR);
    dyser_recv(3, received);
    ASSERT(received == ((64'h5+64'ha)+((64'h5+64'ha)^64'hf)), "received data is different than expected", cycle, ERR);

    
    check_error(ERR, cycle);
  end
endtask



endmodule

