`include "config.v"

module functional_unit_tb();

`include "comp_logic_simulator.v"
`include "check_error.v"


// INPUTS
reg    [`PATH_WIDTH:0] d_in_NW;
reg    [`PATH_WIDTH:0] d_in_NE;
reg    [`PATH_WIDTH:0] d_in_SE;
reg    [`PATH_WIDTH:0] d_in_SW;
reg                    c_in_SE;
reg              [5:0] conf;
reg                    clk, rst;

// OUTPUTS
wire                   c_out_NW;
wire                   c_out_NE;
wire                   c_out_SE;
wire                   c_out_SW;
wire   [`PATH_WIDTH:0] d_out_SE;

// INTERNAL
reg                    ERR;
reg  [`PATH_WIDTH-1:0] expected;

reg  [`PATH_WIDTH-1:0] _input0;
reg  [`PATH_WIDTH-1:0] _input1;

reg                    credit0;
reg                    credit1;
integer                count_NW;
integer                count_SW;
integer                count_out;


functional_unit #(0) f0(
    /* inputs */
    .d_in_NW(d_in_NW),
    .d_in_NE(d_in_NE),
    .d_in_SE(d_in_SE),
    .d_in_SW(d_in_SW),
    .c_in_SE(c_in_SE),
    .clk(clk),
    .rst(rst),
    .conf(conf),
    /* outputs */
    .c_out_NW(c_out_NW),
    .c_out_NE(c_out_NE),
    .c_out_SE(c_out_SE),
    .c_out_SW(c_out_SW),
    .d_out_SE(d_out_SE)
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
    $display("Beginning functional_unit tests...");
    
    // RESET
    clear_inputs;
    ERR = 0;
    rst = 1;
    @(posedge clk);
    @(negedge clk);
    rst = 0;
    
    ASSERT(d_out_SE[0] == 0, "why is functional_unit output valid after reset?", cycle, ERR);
    
    
    conf[5:0] = 6'b00_00_10;
    @(negedge clk);
    
    d_in_NW = {64'd0, 1'b1};
    d_in_SW = {64'd1, 1'b1};
    credit0 = 1'b1;
    credit1 = 1'b1;
    count_NW = 0;
    count_SW = 0;
    count_out = 0;
    expected = d_in_NW[`PATH_WIDTH:1] + d_in_SW[`PATH_WIDTH:1] + 2;
    
    repeat (100) begin
      credit0 = (c_out_NW ? 1'b1 : credit0);
      credit1 = (c_out_SW ? 1'b1 : credit1);
      d_in_NW[0] = (credit0 ? $random % 2 : 1'b0);
      d_in_SW[0] = (credit1 ? $random % 2 : 1'b0);
      c_in_SE = $random % 2;
      
      if (d_in_NW[0]) begin
        d_in_NW[`PATH_WIDTH:1] = d_in_NW[`PATH_WIDTH:1] + 1;
        count_NW = count_NW + 1;
        credit0 = 1'b0;
      end
      if (d_in_SW[0]) begin
        d_in_SW[`PATH_WIDTH:1] = d_in_SW[`PATH_WIDTH:1] + 1;
        count_SW = count_SW + 1;
        credit1 = 1'b0;
      end
      if (d_out_SE[0]) begin
        count_out = count_out + 1;
        ASSERT(d_out_SE[`PATH_WIDTH:1] == expected, "Output different than expected", cycle, ERR);
        expected = d_out_SE[`PATH_WIDTH:1] + 2;
      end
      
      @(negedge clk);
      
      /*
      $display("[%3d] in:(%3d,%b + %3d,%b) C:(%b) => out:(%3d,%b) C:(%b,%b)",
        cycle, d_in_NW[`PATH_WIDTH:1], d_in_NW[0],
               d_in_SW[`PATH_WIDTH:1], d_in_SW[0], c_in_SE,
               d_out_SE[`PATH_WIDTH:1], d_out_SE[0], c_out_NW, c_out_SW);
      */
    end
    
    d_in_NW[0] = 1'b0;
    d_in_SW[0] = 1'b0;
    c_in_SE = 1'b1;
    
    // Make sure to grab the rest of the outputs
    repeat(10) begin
      if (d_out_SE[0]) begin
        count_out = count_out + 1;
        ASSERT(d_out_SE[`PATH_WIDTH:1] == expected, "Output different than expected", cycle, ERR);
        expected = d_out_SE[`PATH_WIDTH:1] + 2;
      end
      
      @(negedge clk);
      
      /*
      $display("[%3d] in:(%3d,%b + %3d,%b) C:(%b) => out:(%3d,%b) C:(%b,%b)",
        cycle, d_in_NW[`PATH_WIDTH:1], d_in_NW[0],
               d_in_SW[`PATH_WIDTH:1], d_in_SW[0], c_in_SE,
               d_out_SE[`PATH_WIDTH:1], d_out_SE[0], c_out_NW, c_out_SW);
      */
    end
    
    $display("COUNTS (A:%2d B:%2d SUM:%2d)", count_NW, count_SW, count_out);
    ASSERT(count_NW == count_SW && count_SW == count_out, "Why were a different number of Sums computed?", cycle, ERR);
    
    
    // Randomized inputs
    repeat (100) begin
      // configure the switch
      clear_inputs;
      conf[1:0] = $random % 4;
      conf[3:2] = $random % 4;
      conf[3:2] = (conf[3:2] == conf[1:0] ? (conf[3:2]+1) % 4 : conf[3:2]);
      conf[5:4] = $random % 4;
      
      // clock in configuration
      @(negedge clk);  // not necessary to clock it in...technically
      
      repeat (10) begin
        c_in_SE = 1;
        d_in_NW = {$random, (conf[1:0] == 2'b00) || (conf[3:2] == 2'b00)};
        d_in_NE = {$random, (conf[1:0] == 2'b01) || (conf[3:2] == 2'b01)};
        d_in_SW = {$random, (conf[1:0] == 2'b10) || (conf[3:2] == 2'b10)};
        d_in_SE = {$random, (conf[1:0] == 2'b11) || (conf[3:2] == 2'b11)};
        
        @(negedge clk);
        d_in_NW[0] = 0;
        d_in_NE[0] = 0;
        d_in_SW[0] = 0;
        d_in_SE[0] = 0;
        
        
        // SIMULATE COMP_LOGIC
        case (conf[3:2])
          2'b00: _input0 = d_in_NW[`PATH_WIDTH:1];
          2'b01: _input0 = d_in_NE[`PATH_WIDTH:1];
          2'b10: _input0 = d_in_SW[`PATH_WIDTH:1];
          2'b11: _input0 = d_in_SE[`PATH_WIDTH:1];
        endcase
        case (conf[1:0])
          2'b00: _input1 = d_in_NW[`PATH_WIDTH:1];
          2'b01: _input1 = d_in_NE[`PATH_WIDTH:1];
          2'b10: _input1 = d_in_SW[`PATH_WIDTH:1];
          2'b11: _input1 = d_in_SE[`PATH_WIDTH:1];
        endcase
        comp_logic_simulate(conf[5:4], _input0, _input1, expected);
        
        
        #1; wait_until_done;
        
        
        ASSERT(d_out_SE[`PATH_WIDTH:1] == expected, "Result does not match expected", cycle, ERR);
      end
    end
    
    
    // DONE
    check_error(ERR, cycle);
    $stop;
  end


task clear_inputs;
  
  begin
    c_in_SE = 0;
    d_in_NW = 0;
    d_in_NE = 0;
    d_in_SW = 0;
    d_in_SE = 0;
  end
endtask

task wait_until_done;
  reg done;
  reg credit0;
  reg credit1;
  
  begin
    done = 0;
    credit0 = 0;
    credit1 = 0;
    
    while (!done || !credit0 || !credit1) begin
      done = done | d_out_SE[0];
      
      case (conf[3:2])
        2'b00: credit0 = credit0 | c_out_NW;
        2'b01: credit0 = credit0 | c_out_NE;
        2'b10: credit0 = credit0 | c_out_SW;
        2'b11: credit0 = credit0 | c_out_SE;
      endcase
      case (conf[1:0])
        2'b00: credit1 = credit1 | c_out_NW;
        2'b01: credit1 = credit1 | c_out_NE;
        2'b10: credit1 = credit1 | c_out_SW;
        2'b11: credit1 = credit1 | c_out_SE;
      endcase
      
      @(negedge clk);
    end
  end
endtask

endmodule
