`include "config.v"

module fifo_tb();

`include "check_error.v"


// INPUTS
reg  [`PATH_WIDTH-1:0] d_in;
reg                    enq;
reg                    deq;
reg                    clk, rst;

// OUTPUTS
wire [`PATH_WIDTH-1:0] d_out;
wire                   valid;
wire                   busy;

// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;
reg                    expected_valid;
reg                    expected_busy;


// FIFO simulator
integer                count;
reg  [`PATH_WIDTH-1:0] fifo [3:0];


fifo f0(
    /* inputs */
    .d_in(d_in),
    .enq(enq),
    .deq(deq),
    .clk(clk),
    .rst(rst),
    /* outputs */
    .d_out(d_out),
    .valid(valid),
    .busy(busy),
    .c_out() //NC
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
    $display("Beginning fifo tests...");
    
    // RESET
    clear_inputs;
    clear_fifo;
    ERR = 0;
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
    
    
    ASSERT(valid == 0, "why is fifo output valid after reset?", cycle, ERR);
    ASSERT(busy == 0, "why is fifo busy after reset?", cycle, ERR);
    
    
    repeat (500) begin
      d_in = (enq & !busy ? d_in + 1 : d_in);
      enq = $random % 2;
      deq = $random % 2;
      
      #1 simulate_fifo(d_in, enq, deq, expected, expected_valid, expected_busy);
      
      /*
      $display("[%3d] IN:(%3d, I:%b D:%b) C:(%0d) OUT:(%3d,%b B:%b) EXPECTED:(%3d,%b B:%b)",
          cycle, d_in, enq, deq, f0.count, d_out, valid, busy, expected, expected_valid, expected_busy);
      */
      
      if (expected_valid) ASSERT(d_out == expected, "FIFO output different than expected", cycle, ERR);
      ASSERT(valid == expected_valid, "FIFO valid different than expected", cycle, ERR);
      ASSERT(busy == expected_busy, "FIFO busy different than expected", cycle, ERR);
      
      @(negedge clk);
    end
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task clear_inputs;
  
  begin
    d_in = 0;
    enq  = 0;
    deq  = 0;
  end
endtask

task wait_until_done;
  reg done;
  
  begin
    done = 0;
    
  end
endtask

task clear_fifo;

  begin
    for (count = 0; count < 4; count=count+1) begin
      fifo[count] = 0;
    end
    count = 0;
  end
endtask

task simulate_fifo;
  input  [`PATH_WIDTH-1:0] d_in;
  input                    enq;
  input                    deq;
  output [`PATH_WIDTH-1:0] d_out;
  output                   valid;
  output                   busy;
  integer                  i;
 
  begin
    casez({enq, deq})
    2'b00:
      begin
        d_out = fifo[0];
        valid = 0;
        busy  = 0;
      end
    2'b01:
      begin
        d_out = (count == 0 ? 0 : fifo[0]);
        valid = (count == 0 ? 0 : 1);
        count = (count == 0 ? 0 : count - 1);
        busy  = 0;
        for (i = 0; i < count; i=i+1) begin
          fifo[i] = fifo[i+1];
        end
        fifo[count] = 0;
      end
    2'b10:
      begin
        d_out = fifo[0];
        valid = 0;
        busy  = (count == 4 ? 1 : 0);
        if (count < 4)
          fifo[count] = d_in;
        count = (count == 4 ? 4 : count + 1);
      end
    2'b11:
      begin
        d_out = (count == 0 ? d_in : fifo[0]);
        valid = 1;
        busy  = 0;
        for (i = 0; i < count-1; i=i+1) begin
          fifo[i] = fifo[i+1];
        end
        if (count == 0)
          fifo[0] = d_in;
        else
          fifo[count-1] = d_in;
      end
    endcase
  end
endtask

endmodule
