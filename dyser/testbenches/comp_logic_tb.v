`include "config.v"

module comp_logic_tb();

`include "comp_logic_simulator.v"
`include "check_error.v"


// INPUTS
reg    [`PATH_WIDTH:0] d_in_c0;
reg    [`PATH_WIDTH:0] d_in_c1;
reg              [1:0] conf;
reg                    clk, rst;

// OUTPUTS
wire [`PATH_WIDTH-1:0] d_out;
wire                   done;

// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;


comp_logic c0(
    /* inputs */
    d_in_c0,
    d_in_c1,
    clk,
    rst,
    conf,
    /* outputs */
    d_out,
    done
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
    $display("Beginning comp_logic tests...");
    
    // RESET
    ERR = 0;
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
    
    
    repeat (100) begin
      d_in_c0 = {$random, 1'b1};
      d_in_c1 = {$random, 1'b1};
      conf = $random % 4;
      
      
      // SIMULATE COMP_LOGIC
      comp_logic_simulate(conf, d_in_c0[`PATH_WIDTH:1], d_in_c1[`PATH_WIDTH:1], expected);
      
      
      wait_until_done;
      
      
      ASSERT(d_out == expected, "Result does not match expected output", cycle, ERR);
    end
    
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task wait_until_done;
  begin
    @(negedge clk);
    
    while (!done) begin
      @(negedge clk);
    end
  end
endtask

endmodule
