`include "config.v"

module ff_stage_tb();

`include "check_error.v"


// INPUTS
reg                    valid_in,
                       credit_in;
reg  [`PATH_WIDTH-1:0] data_in;
reg                    done;
reg                    clk, rst;

// OUTPUTS
wire                   credit_out;
wire [`PATH_WIDTH-1:0] data_out;
wire                   valid_out;

// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;


ff_stage ff0(
    // inputs
    valid_in,
    credit_in,
    data_in,
    done,
    clk,
    rst,
    // outputs
    credit_out,
    data_out,
    valid_out
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
    $display("Beginning ff_stage tests...");
    
    // RESET
    clear_inputs;
    ERR = 0;
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
    
    
    // FF_STAGE
    valid_in = 1;
    credit_in = 1;
    data_in = $random;
    done = 1;
    
    
    // FF_STAGE TESTS
    @(negedge clk);
    ASSERT(data_out == data_in, "Result does not match expected", cycle, ERR);
    
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task clear_inputs;

  begin
    valid_in = 0;
    credit_in = 0;
    data_in = 0;
    done = 0;
  end
endtask

endmodule
