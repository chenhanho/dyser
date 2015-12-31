// fifo.v
//
// use same protocol as flow control stage
`include "dyser_config.v"

module fifo(
    /* inputs */
    d_in,
    enq,
    deq,
    clk,
    rst_n,
    /* outputs */
    d_out,
    valid,
    ready,
    c_out
    );


parameter                  ID = 0;

input   [`DATA_WIDTH:0]  d_in;
input                    enq;
input                    deq;
input                    clk;
input                    rst_n;

output  [`DATA_WIDTH:0]  d_out;
output                   valid;
output                   ready;

output                   c_out; // specific to the output_bridge-core interface


reg                      ready;
reg                      c_out;


//----------------------------
//      Data array and pointer
//----------------------------

reg  [`DATA_WIDTH:0]     data_array [`FIFO_WIDTH:0];
reg  [`FIFO_PTR_WIDTH:0]     wr_ptr;
reg  [`FIFO_PTR_WIDTH:0]     rd_ptr; 

//-------------------
//      Wires
//-------------------

wire [`FIFO_PTR_WIDTH:0]     pred_wr_ptr; //possible next ptr
wire [`FIFO_PTR_WIDTH:0]     pred_rd_ptr; //possible next ptr
wire                     will_full;
wire                     will_empty;
reg                      incr_wr_ptr;
reg                      incr_rd_ptr;

//-------------------
//      Logic
//-------------------

reg  [1:0]               state;

// input logic
assign pred_wr_ptr = (wr_ptr == `FIFO_WIDTH)? {`FIFO_PTR_WIDTH{1'b0}} : wr_ptr + 1'b1; 
assign pred_rd_ptr = (rd_ptr == `FIFO_WIDTH)? {`FIFO_PTR_WIDTH{1'b0}} : rd_ptr + 1'b1; 
//assign pred_rd_ptr = (rd_ptr == 0         )? LOG_FIFO_DEPTH{1'b1} : rd_ptr-1; 

// predicated position of ptrs, assuming only one ptr is moving
assign will_full   = ( pred_wr_ptr == rd_ptr )? 1'b1 : 1'b0; 
assign will_empty  = ( pred_rd_ptr == wr_ptr )? 1'b1 : 1'b0; 

parameter EMPTY     = 2'b00;
parameter FULL      = 2'b01;
parameter NOT_FULL  = 2'b10;

// state + next state logic
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n == 1'b1) begin
    state      <= EMPTY;
  end
  else begin
    case(state)
//      EMPTY     :  if        (  enq & ~deq )                state <= NOT_FULL;
      EMPTY     :  if        (  enq  )                      state <= NOT_FULL;
                   else                                     state <= EMPTY;
      FULL      :  if        ( ~enq &  deq )                state <= NOT_FULL;
                   else                                     state <= FULL;
      NOT_FULL  :  if        (  enq  & ~deq & will_full  )  state <= FULL;
                   else if   (  ~enq &  deq & will_empty )  state <= EMPTY;
                   else     /*~credit_in */                 state <= NOT_FULL;
    endcase
  end
end

// output logic (Mealy)
// outputs: incrment, ready 
//
always @* 
  case
    (state)
//      EMPTY     :  if        (  enq & ~deq )                begin
      EMPTY     :  if        (  enq )                       begin
                                                            incr_wr_ptr = 1'b1;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b0;
                                                            c_out       = 1'b1;
                                                            end
//                   else if   (  enq & deq )                 begin            
//                                                            incr_wr_ptr = 1'b0;
//                                                            incr_rd_ptr = 1'b0;
//                                                            ready       = 1'b1; //bypass
//                                                            c_out       = 1'b1;
//                                                            end
                   else     /* no enq */                    begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b0;
                                                            c_out       = 1'b1;
                                                            end
      FULL      :  if        ( ~enq &  deq )                begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b1;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else if   (  enq &  deq )                begin  
                                                            incr_wr_ptr = 1'b1;
                                                            incr_rd_ptr = 1'b1;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else     /* no deq */                    begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b0;
                                                            end
      NOT_FULL  :  if        (  enq  & ~deq & will_full  )  begin
                                                            incr_wr_ptr = 1'b1;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b0;
                                                            c_out       = 1'b1;
                                                            end
                   else if   (  enq  & ~deq & ~will_full )  begin
                                                            incr_wr_ptr = 1'b1;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else if   (  ~enq &  deq & will_empty )  begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b1;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else if   (  ~enq &  deq & ~will_empty)  begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b1;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else if   (   enq &  deq )               begin
                                                            incr_wr_ptr = 1'b1;
                                                            incr_rd_ptr = 1'b1;
                                                            ready       = 1'b1;
                                                            c_out       = 1'b1;
                                                            end
                   else     /* idle */                      begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b0;
                                                            c_out       = 1'b1;
                                                            end
      default   :                                           begin
                                                            incr_wr_ptr = 1'b0;
                                                            incr_rd_ptr = 1'b0;
                                                            ready       = 1'b0;
                                                            c_out       = 1'b0;
                                                            end
  endcase

// data array and pointer
// messy, have to clean up
integer i;

always @(posedge clk or negedge rst_n)
begin 
  if (~rst_n == 1'b1) begin
    wr_ptr      <= 0;
    rd_ptr      <= 0;
    for ( i = 0; i < `FIFO_SIZE; i = i + 1) begin
      data_array [i] <= 0;
    end 
  end
  else begin
    data_array[wr_ptr] <= ( incr_wr_ptr)  ? d_in        : data_array[wr_ptr];
    wr_ptr             <= ( incr_wr_ptr)  ? pred_wr_ptr : wr_ptr;
    rd_ptr             <= ( incr_rd_ptr)  ? pred_rd_ptr : rd_ptr;
  end
end  

// output logics
assign valid = ready;
//assign d_out = ((state == EMPTY) & enq & deq )? d_in : data_array[rd_ptr];
assign d_out = data_array[rd_ptr];

endmodule
