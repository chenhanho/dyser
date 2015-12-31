// stage.v
//
// DySER flip-flop stage
//
//  ready and credit do flow control
//  valid uses in phi nodes, ignore for now
//    
//  data has to be kept 
//
`include "dyser_config.v"

module stage(
    /* inputs */
    ready_in,
    valid_in,
    credit_in,
    data_in,
    clk,
    rst_n,
    
    /* outputs */
    credit_out,
    data_out,
    valid_out,
    ready_out
    );


parameter                ID = 0;
parameter                EDGE = 0;

input                    ready_in;
input                    valid_in;
input                    credit_in;
input  [`DATA_WIDTH:0]   data_in;
input                    clk;
input                    rst_n;

output                   credit_out;
output [`DATA_WIDTH:0]   data_out;
output                   valid_out;
output                   ready_out;


///////////////////////////////////////////////////
//
//    wires
//
//////////////////////////////////////////////////

reg                      credit_out;
reg                      data_en;
reg    [`DATA_WIDTH:0]   data;
reg                      valid;
reg                      ready_out;

//reg                [1:0] state;
reg                      state;


//////////////////////////////////////////////////////
//
//  states:     CN:  has credit     NR: has ready data 
//
//////////////////////////////////////////////////////

parameter CN    = 1'b0;
parameter NR    = 1'b1;

// state + next state logic
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n == 1'b1) begin
    state      <= CN;
  end
  else begin
    // 2- state bubbled credit-based flow control
    case(state)
      CN       :  if        ( ready_in )  state <= NR;
                  else     /*~ready_in */ state <= CN;

      NR       :  if        ( credit_in )  state <= CN;
                  else     /*~credit_in */ state <= NR;
    endcase
  end
end

// output logic (Mealy)
always @(state or credit_in or ready_in)
//always @(*)
  case (state)
    CN         : 
                  if        ( credit_in &  ready_in)  begin    //NR
                                                      ready_out     = 1'b0;
                                                      data_en       = 1'b1;
                                                      credit_out    = 1'b1;
                  end
                  else if   ( credit_in & ~ready_in)  begin    //CN 
                                                      ready_out     = 1'b0;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b1;
                  end
                  else if   (~credit_in &  ready_in)  begin    //NR
                                                      ready_out     = 1'b0;
                                                      data_en       = 1'b1;
                                                      credit_out    = 1'b1;
                  end
                  else     /*~credit_in & ~ready_in*/ begin    //CN
                                                      ready_out     = 1'b0;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b1;
                  end
    NR         : 
                  if        ( credit_in &  ready_in)  begin    //CN
                                                      ready_out     = 1'b1;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b0;
                  end
                  else if   ( credit_in & ~ready_in)  begin    //CN 
                                                      ready_out     = 1'b1;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b0;
                  end
                  else if   (~credit_in &  ready_in)  begin    //NR
                                                      ready_out     = 1'b1;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b0;
                  end
                  else     /*~credit_in & ~ready_in*/ begin    //NR
                                                      ready_out     = 1'b1;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b0;
                  end
    default     :                                     begin
                        //$display("output logic ERROR  time: %d", $time );     
                                                      ready_out     = 1'b0;
                                                      data_en       = 1'b0;
                                                      credit_out    = 1'b0;
                                                      end
  endcase


// data and valid FF
always @(posedge clk or negedge rst_n)
begin 
  if (~rst_n == 1'b1) begin
    data  <= 0;
    valid <= 0;
  end
  else begin
    data  <= (data_en)? data_in : data;
    valid <= (data_en)? valid_in: valid;
  end
end  

assign data_out  = data;
assign valid_out = valid;

endmodule
