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


    $display("[%0d] Configuring DySER...", cycle);
    dyser_configure;
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
  input  [`DATA_WIDTH:0] data0;

  begin
    send_data_r0 = data0;
    send_port_r0 = port0;
    send_en0 = 1;

    send_en1 = 0;

    $display("  dyser_send P[%d]=%8h", port0, data0);
    @(negedge clk);

    send_en0 = 0;
    send_en1 = 0;
  end
endtask


task dyser_send;
  input            [2:0] port0;
  input  [`DATA_WIDTH:0] data0;
  input            [2:0] port1;
  input  [`DATA_WIDTH:0] data1;

  begin
    send_data_r0 = data0;
    send_port_r0 = port0;
    send_en0 = 1;

    send_data_r1 = data1;
    send_port_r1 = port1;
    send_en1 = 1;

    $display("  dyser_send P[%d]=%8h  P[%d]=%8h", port0, data0, port1, data1);
    @(negedge clk);

    send_en0 = 0;
    send_en1 = 0;
  end
endtask


task dyser_recv;
  input            [2:0] port;
  output [`DATA_WIDTH:0] data;

  begin
    recv_port_r0 = port;
    recv_en0     = 1;

    #1 data = recv_data_r0;
    while (recv_stall) begin
      @(negedge clk);
      data = recv_data_r0;
    end

    $display("  dyser_recv P[%d]=%8h", recv_port_r0, recv_data_r0);
    @(negedge clk);
    recv_en0 = 0;
  end
endtask


task dyser_configure;
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


    for (i=0; i <= 16; i=i+1) begin
      config_bits = conf_all[i];
      config_en = 1;
      $display("dyser_init 0x%h", config_bits);

      @(negedge clk);
    end

    config_en = 0;
  end
endtask

endmodule

