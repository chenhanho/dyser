`include "config.v"


task switch_simulate;
  input           [23:0] conf;
  input  [`PATH_WIDTH:0] d_in_NW;
  input  [`PATH_WIDTH:0] d_in_N;
  input  [`PATH_WIDTH:0] d_in_E;
  input  [`PATH_WIDTH:0] d_in_W;
  input  [`PATH_WIDTH:0] d_in_S;
  input                  c_in_NW;
  input                  c_in_N;
  input                  c_in_NE;
  input                  c_in_E;
  input                  c_in_SE;
  input                  c_in_S;
  input                  c_in_SW;
  input                  c_in_W;
  output [`PATH_WIDTH:0] d_out_NW;
  output [`PATH_WIDTH:0] d_out_N;
  output [`PATH_WIDTH:0] d_out_NE;
  output [`PATH_WIDTH:0] d_out_E;
  output [`PATH_WIDTH:0] d_out_SE;
  output [`PATH_WIDTH:0] d_out_S;
  output [`PATH_WIDTH:0] d_out_SW;
  output [`PATH_WIDTH:0] d_out_W;
  output                 c_out_NW;
  output                 c_out_N;
  output                 c_out_E;
  output                 c_out_W;
  output                 c_out_S;
  
  begin
    // defaults
    c_out_NW = 1;
    c_out_N  = 1;
    c_out_E  = 1;
    c_out_W  = 1;
    c_out_S  = 1;
    d_out_NW = 0;
    d_out_N  = 0;
    d_out_NE = 0;
    d_out_E  = 0;
    d_out_SE = 0;
    d_out_S  = 0;
    d_out_SW = 0;
    d_out_W  = 0;
    
    case (conf[2:0])
      3'b000: begin d_out_N  = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_N  = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_N  = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_N  = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_N  = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[5:3])
      3'b000: begin d_out_E  = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_E  = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_E  = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_E  = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_E  = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[8:6])
      3'b000: begin d_out_W  = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_W  = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_W  = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_W  = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_W  = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[11:9])
      3'b000: begin d_out_S  = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_S  = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_S  = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_S  = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_S  = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[14:12])
      3'b000: begin d_out_NW = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_NW = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_NW = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_NW = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_NW = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[17:15])
      3'b000: begin d_out_NE = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_NE = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_NE = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_NE = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_NE = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[20:18])
      3'b000: begin d_out_SW = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_SW = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_SW = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_SW = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_SW = d_in_NW; c_out_NW = 1; end
    endcase
    case (conf[23:21])
      3'b000: begin d_out_SE = d_in_N;  c_out_N  = 1; end
      3'b001: begin d_out_SE = d_in_E;  c_out_E  = 1; end
      3'b010: begin d_out_SE = d_in_W;  c_out_W  = 1; end
      3'b011: begin d_out_SE = d_in_S;  c_out_S  = 1; end
      3'b100: begin d_out_SE = d_in_NW; c_out_NW = 1; end
    endcase
  end
endtask
