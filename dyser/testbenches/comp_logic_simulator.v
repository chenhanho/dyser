`include "config.v"


task comp_logic_simulate;
  input              [1:0] conf;
  input  [`PATH_WIDTH-1:0] in0;
  input  [`PATH_WIDTH-1:0] in1;
  output [`PATH_WIDTH-1:0] result;
  
  begin
    case (conf[1:0])
      2'b00: result = in0 + in1;
      2'b01: result = in0 + in1; // TEMPORARY
      2'b10: result = in0 + in1;
      2'b11: result = in0 + in1;
    endcase
  end
endtask
