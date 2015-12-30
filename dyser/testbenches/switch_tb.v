`include "config.v"

module switch_tb();

`include "switch_simulator.v"
`include "check_error.v"


// INPUTS
reg  [`PATH_WIDTH:0] d_in_NW,
                     d_in_N,
                     d_in_E,
                     d_in_W,
                     d_in_S;
 
reg                  c_in_NW,
                     c_in_N,
                     c_in_NE,
                     c_in_E,
                     c_in_SE,
                     c_in_S,
                     c_in_SW,
                     c_in_W;

reg           [23:0] conf;
reg                  conf_en;
reg                  clk, rst;

// OUTPUTS
wire [`PATH_WIDTH:0] d_out_NW,
                     d_out_N,
                     d_out_NE,
                     d_out_E,
                     d_out_SE,
                     d_out_S,
                     d_out_SW,
                     d_out_W;

wire                 c_out_NW,
                     c_out_N,
                     c_out_E,
                     c_out_W,
                     c_out_S;

// INTERNAL SIGNALS
wire [4:0]           c_out;
assign c_out[4:0] = {c_out_NW, c_out_N, c_out_E, c_out_W, c_out_S};

reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;


switch #(0) s0(
    // inputs
    .d_in_NW(d_in_NW),
    .d_in_N(conf_en ? {35'd0, 6'b11_11_11, conf} : d_in_N),
    .d_in_E(d_in_E),
    .d_in_W(d_in_W),
    .d_in_S(d_in_S),
    .c_in_NW(c_in_NW),
    .c_in_N(c_in_N),
    .c_in_NE(c_in_NE),
    .c_in_E(c_in_E),
    .c_in_SE(c_in_SE),
    .c_in_S(c_in_S),
    .c_in_SW(c_in_SW),
    .c_in_W(c_in_W),
    .conf_en(conf_en),
    .clk(clk),
    .rst(rst),
    // outputs
    .d_out_NW(d_out_NW),
    .d_out_N(d_out_N),
    .d_out_NE(d_out_NE),
    .d_out_E(d_out_E),
    .d_out_SE(d_out_SE),
    .d_out_S(d_out_S),
    .d_out_SW(d_out_SW),
    .d_out_W(d_out_W),
    .c_out_NW(c_out_NW),
    .c_out_N(c_out_N),
    .c_out_E(c_out_E),
    .c_out_W(c_out_W),
    .c_out_S(c_out_S),
    .fu_conf() //NC
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
    $display("Beginning switch tests...");
    
    // RESET
    clear_inputs;
    ERR = 0;
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
    
    
    // SWITCH TESTS
    // configuration:
    // SE_SW_NE_NW__S_W_E_N
    // 0=N 1=E 2=W 3=S 4=NW 5-7=0
    //  e.g. 7777_7702 = N->E, W->N (N input sent out E output, W sent out N)
    conf = 24'o7777_7717;
    conf_en = 1;
    @(posedge clk);
    @(negedge clk);
    conf_en = 0;
    
    d_in_E = {$random, 1'b1};
    c_in_E = 1;
    
    @(negedge clk);
    ASSERT(d_out_E == d_in_E, "Result is different than expected", cycle, ERR);
    
    d_in_E = {$random, 1'b1};
    @(negedge clk);
    ASSERT(d_out_E == d_in_E, "Result is different than expected", cycle, ERR);
    
    d_in_E = {$random, 1'b1};
    @(negedge clk);
    ASSERT(d_out_E == d_in_E, "Result is different than expected", cycle, ERR);
    
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task clear_inputs;
  
  begin
    d_in_NW = 0;
    d_in_N = 0;
    d_in_E = 0;
    d_in_W = 0;
    d_in_S = 0;
    c_in_NW = 0;
    c_in_N = 0;
    c_in_NE = 0;
    c_in_E = 0;
    c_in_SE = 0;
    c_in_S = 0;
    c_in_SW = 0;
    c_in_W = 0;
    conf = 0;
    conf_en = 0;
  end
endtask

endmodule
