// functional_unit.v
//
// DySER functional unit, includes computational logic, mux and flip-flops
// responsible for computation.
//

// metabits: valid ready
`include "dyser_config.v"

module functional_unit(
    /* inputs */
    d_in_NW,
    d_in_NE,
    d_in_SE,
    d_in_SW,
    c_in_SE,
    conf_en,
    clk,
    rst_n,
    /* outputs */
    c_out_NW,
    c_out_NE,
    c_out_SE,
    c_out_SW,
    d_out_SE
    );


parameter              ID = 0;
parameter              TYPE = 0;
parameter              CONFIG_PATH_IN = 0;  // Statically configured input for CONFIG bits

input  [`PATH_WIDTH:0] d_in_NW;
input  [`PATH_WIDTH:0] d_in_NE;
input  [`PATH_WIDTH:0] d_in_SE;
input  [`PATH_WIDTH:0] d_in_SW;
input                  c_in_SE;
input                  conf_en;
input                  clk;
input                  rst_n;

output                 c_out_NW;
output                 c_out_NE;
output                 c_out_SE;
output                 c_out_SW;
output [`PATH_WIDTH:0] d_out_SE;

/////////////////////////////////////
//
//    wires
//  
/////////////////////////////////////

reg    [`PATH_WIDTH:0] d_in_R;     // to computational unit input 0
reg    [`PATH_WIDTH:0] d_in_L;     // to computational unit input 1
reg    [`PATH_WIDTH:0] d_in_Pred;   // Pred input

wire   [`DATA_WIDTH:0] d_out_comp; // computational unit output
reg    [`PATH_WIDTH:0] d_out_fu;   // fu output

wire   [`PATH_WIDTH:0] d_out_L_stage;
wire   [`PATH_WIDTH:0] d_out_R_stage;
wire   [`PATH_WIDTH:0] d_out_Pred_stage;
wire                   c_out_L_stage;
wire                   c_out_R_stage;
wire                   c_out_Pred_stage;
wire                   done;
wire                   done_Pred;

///////////////////////////////////////
//
//    configure logic
//
//////////////////////////////////////

reg             [31:0] conf;  // configuration register
reg             [31:0] constant0;
reg             [31:0] constant1;
wire            [31:0] conf_in; 
wire            [15:0] conf_comp; 
wire            [15:0] conf_fu; 

// configuration register
always @(posedge clk or negedge rst_n)
begin 
  if (~rst_n == 1'b1) begin
    conf <= 0;
    constant0 <= 0;
    constant1 <= 0;
  end
  else begin
    conf       <= (conf_en)?   conf_in : conf;
    constant0  <= (conf_en)?      conf : constant0;
    constant1  <= (conf_en)? constant0 : constant1;
  end
end  

// configuration path
assign conf_in  = d_in_SE[`PATH_WIDTH:`META_BITS];// input path
assign d_out_SE = (conf_en)? {constant1,2'b0} : d_out_fu; // output path
assign conf_comp= conf[15:0];
assign conf_fu  = conf[31:16];

/////////////////////////////////////
//
//     comp_logic  input mux 
//  
/////////////////////////////////////

// conf_fu [2:0] R mux select
// conf_fu [5:3] L mux select
// conf_fu [7:6] Predicate mux select
// conf_fu [9:8] Predicate function
// conf_fu [10] Phi function

// NW: 001   NE: 010
// SW: 000   SE: 011

// right hand side input:
always @(*) 
  case(conf_fu[2:0])
    3'b000: d_in_R  = d_in_SW;
    3'b001: d_in_R  = d_in_NW;
    3'b010: d_in_R  = d_in_NE;
    3'b011: d_in_R  = d_in_SE;
    3'b100: d_in_R  = {constant0,2'b11};
    3'b101: d_in_R  = {constant1,2'b11};
    default: d_in_R  = 0;
  endcase

// left hand side input
always @(*) 
  case(conf_fu[5:3])
    3'b000: d_in_L  = d_in_SW;
    3'b001: d_in_L  = d_in_NW;
    3'b010: d_in_L  = d_in_NE;
    3'b011: d_in_L  = d_in_SE;
    3'b100: d_in_L  = {constant0,2'b11};
    3'b101: d_in_L  = {constant1,2'b11};
    default: d_in_L  = 0;
  endcase

// Pred input
always @(*) 
  case(conf_fu[7:6])
    2'b00: d_in_Pred  = d_in_SW;
    2'b01: d_in_Pred  = d_in_NW;
    2'b10: d_in_Pred  = d_in_NE;
    2'b11: d_in_Pred  = d_in_SE;
  endcase

// a decoder to forward credit to the correct direction [FIXME: priority queue can be improved]
assign c_out_SW= //(~done)              ?        1'b0 :    // not done yet
                 (conf_fu[2:0] == 3'b000)? c_out_R_stage :    // if SW is R input 
                 (conf_fu[5:3] == 3'b000)? c_out_L_stage :    // if SW is L input
                 (conf_fu[8:6] == 3'b100)? c_out_Pred_stage :  // if SW is Pred input
                                            1'b0 ;    // if SW is off

assign c_out_NW = //(~done)              ?        1'b0 :    // not done yet
                  (conf_fu[2:0] == 3'b001)? c_out_R_stage :  // if NW is R input 
                  (conf_fu[5:3] == 3'b001)? c_out_L_stage :  // if NW is L input
                  (conf_fu[8:6] == 3'b101)? c_out_Pred_stage :  // if SW is Pred input
                                            1'b0 ;    // if NW is off

assign c_out_NE = //(~done)              ?        1'b0 :    // not done yet
                  (conf_fu[2:0] == 3'b010)? c_out_R_stage :  // if NE is R input 
                  (conf_fu[5:3] == 3'b010)? c_out_L_stage :  // if NE is L input
                  (conf_fu[8:6] == 3'b110)? c_out_Pred_stage :  // if SW is Pred input
                                            1'b0 ;    // if NE is off
               
assign c_out_SE = //(~done)              ?        1'b0 :    // not done yet
                  (conf_fu[2:0] == 3'b011)? c_out_R_stage :  // if SE is R input 
                  (conf_fu[5:3] == 3'b011)? c_out_L_stage :  // if SE is L input
                  (conf_fu[8:6] == 3'b111)? c_out_Pred_stage :  // if SW is Pred input
                                                1'b0 ;    // if SE is off
 
/////////////////////////////////////
//
//  input stage
//  
/////////////////////////////////////

// if current input is ready, and there is credit in but not done, block credit signals

stage #(ID, 0) L_stage(
    .ready_in(d_in_L[0] ),
    .valid_in(d_in_L[1]),
    .credit_in(c_in_SE & done), 
    .data_in(d_in_L[`PATH_WIDTH:`META_BITS]), // data only
    .clk(clk | conf_en),
    .rst_n(rst_n),
    // output
    .credit_out(c_out_L_stage),
    .data_out(d_out_L_stage[`PATH_WIDTH:`META_BITS]),
    .valid_out(d_out_L_stage[1]),
    .ready_out(d_out_L_stage[0]));


stage #(ID, 0) R_stage(
    .ready_in(d_in_R[0] ),
    .valid_in(d_in_R[1]),
    .credit_in(c_in_SE & done),
    .data_in(d_in_R[`PATH_WIDTH:`META_BITS]), // data only
    .clk(clk | conf_en),
    .rst_n(rst_n),
    // output
    .credit_out(c_out_R_stage),
    .data_out(d_out_R_stage[`PATH_WIDTH:`META_BITS]),
    .valid_out(d_out_R_stage[1]),
    .ready_out(d_out_R_stage[0]));


stage #(ID, 0) Pred_stage(
    .ready_in(d_in_Pred[0] ),
    .valid_in(d_in_Pred[1]),
    .credit_in(c_in_SE & done),
    .data_in(d_in_Pred[`PATH_WIDTH:`META_BITS]), // data only
    .clk(clk | conf_en),
    .rst_n(rst_n),
    // output
    .credit_out(c_out_Pred_stage),
    .data_out(d_out_Pred_stage[`PATH_WIDTH:`META_BITS]),
    .valid_out(d_out_Pred_stage[1]),
    .ready_out(d_out_Pred_stage[0]));

             
/////////////////////////////////////
//
//  computational logic
//  
/////////////////////////////////////

// computation logic take ready as start, don't care if it is valid [FIXME for optimize power]
comp_logic #(TYPE) comp_0(
    .ready_in(d_out_R_stage[0] & d_out_L_stage[0]),
    .d_in_R(conf_en ? 32'd0 : d_out_R_stage[`PATH_WIDTH:`META_BITS]),
    .d_in_L(conf_en ? 32'd0 : d_out_L_stage[`PATH_WIDTH:`META_BITS]),
    .conf(conf_comp), // comp logic control
    .clk(clk),
    .rst_n(rst_n),
    //output
    .d_out(d_out_comp), //data only
    .done(done));

assign done_Pred  = d_out_L_stage[0] & d_out_R_stage[0];

always @(*)
  case(conf_fu[9:8])
    2'b00: d_out_fu = {d_out_comp ,d_out_R_stage[1] & d_out_L_stage[1], done};
    2'b01: d_out_fu = {(d_out_Pred_stage[3])? d_out_L_stage[`PATH_WIDTH:1] : d_out_R_stage[`PATH_WIDTH:1], done_Pred};
    2'b10: d_out_fu = 0;
    2'b11: d_out_fu = {(d_out_Pred_stage[3])? d_out_R_stage[`PATH_WIDTH:1] : d_out_L_stage[`PATH_WIDTH:1], done_Pred};
  endcase

endmodule
