//switch.v
//
// DySER switch, responsible for passing data    
//
`include "dyser_config.v"


module switch(
    /* inputs */
    d_in_NW,
    d_in_N,
    d_in_E,
    d_in_W,
    d_in_S,
    c_in_NW,
    c_in_N,
    c_in_NE,
    c_in_E,
    c_in_SE,
    c_in_S,
    c_in_SW,
    c_in_W,
    conf_en,
    clk,
    rst_n,
    /* outputs */
    d_out_NW,
    d_out_N,
    d_out_NE,
    d_out_E,
    d_out_SE,
    d_out_S,
    d_out_SW,
    d_out_W,
    c_out_NW,
    c_out_N,
    c_out_E,
    c_out_W,
    c_out_S
    );


parameter              ID = 0;
parameter              EDGE = 0;
parameter              CONFIG_PATH_IN = 0;  // Statically configured input for CONFIG bits
parameter              CONFIG_PATH_OUT = 0; // Statically configured output for CONFIG bits

// TODO: EDGE switches have only 32 config bits!

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

input                  conf_en;
input                  clk, rst_n;


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

///////////////////////////////////////
//
//    configure logic
//
//////////////////////////////////////

reg             [31:0] conf;  // configuration register
wire            [31:0] conf_in; 
wire            [31:0] conf_out; 

wire            [`PATH_WIDTH:0] d_out_NW_stage, d_out_N_stage, d_out_E_stage, d_out_W_stage;

// configuration register
always @(posedge clk or negedge rst_n)
begin 
  if (~rst_n == 1'b1) begin
    conf <= 0;
  end
  else begin
    conf  <= (conf_en)? conf_in : conf;
  end
end  

// configuration path

// input path
assign conf_in =  CONFIG_PATH_IN == `EAST  ? d_in_E[`PATH_WIDTH:`META_BITS] : 
        	  CONFIG_PATH_IN == `SOUTH ? d_in_S[`PATH_WIDTH:`META_BITS] : 
          	/*CONFIG_PATH_IN == `WEST*/  d_in_W[`PATH_WIDTH:`META_BITS] ;

// output path, only work when config enable
assign conf_out = (EDGE == 0)? d_in_NW[`PATH_WIDTH:`META_BITS] : conf; // tile switch, conf is passed to fu, and conf_out is from fu
assign d_out_NW = ( conf_en )? {conf,2'b0} : d_out_NW_stage; // to fu, doesn't matter if it's a edge sw

assign d_out_N  = ( conf_en && (CONFIG_PATH_OUT == `NORTH))? {conf_out,2'b0} : d_out_N_stage;
assign d_out_E  = ( conf_en && (CONFIG_PATH_OUT == `EAST ))? {conf_out,2'b0} : d_out_E_stage; 
assign d_out_W  = ( conf_en && (CONFIG_PATH_OUT == `WEST ))? {conf_out,2'b0} : d_out_W_stage; //conf from tile FU


///////////////////////////////////////////
//
//    wires
//
//////////////////////////////////////////

reg   [`PATH_WIDTH:0] stage_NW_in,    stage_N_in,    stage_NE_in,    stage_E_in,
                      stage_SE_in,    stage_S_in,    stage_SW_in,    stage_W_in;


wire                  stage_NW_c_out,    stage_N_c_out,    stage_NE_c_out,    stage_E_c_out,
                      stage_SE_c_out,    stage_S_c_out,    stage_SW_c_out,    stage_W_c_out;

reg   [7:0]           c_out_NW_orig;  // where are NW credit from
reg   [7:0]           c_out_E_orig;   // where are E  credit from
reg   [7:0]           c_out_N_orig;   // where are N  credit from
reg   [7:0]           c_out_S_orig;   // where are S  credit from
reg   [7:0]           c_out_W_orig;   // where are W  credit from


wire  [`PATH_WIDTH:0] mux_d_in_NW;
wire  [`PATH_WIDTH:0] mux_d_in_N;
wire  [`PATH_WIDTH:0] mux_d_in_E;
wire  [`PATH_WIDTH:0] mux_d_in_W;
wire  [`PATH_WIDTH:0] mux_d_in_S;

//////////////////////////////////////////
//
//    data muxes and flip-flop stage
//
//////////////////////////////////////////

// 32b 0000_0000_0000_0000_0000_0000_0000_0000 
//     W    SW   S    SE   E    NE   N    NW     

// North-West output mux, credit decoder and stage
always @(*)
  case (conf[3:0]) 
    4'b0001 :  begin
                 stage_NW_in       = mux_d_in_NW;
                 c_out_NW_orig[0]  = 1'b1;
                 c_out_E_orig[0]   = 1'b0;
                 c_out_N_orig[0]   = 1'b0;
                 c_out_S_orig[0]   = 1'b0;
                 c_out_W_orig[0]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_NW_in       = mux_d_in_E;
                 c_out_NW_orig[0]  = 1'b0;
                 c_out_E_orig[0]   = 1'b1;
                 c_out_N_orig[0]   = 1'b0;
                 c_out_S_orig[0]   = 1'b0;
                 c_out_W_orig[0]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_NW_in       = mux_d_in_N;
                 c_out_NW_orig[0]  = 1'b0;
                 c_out_E_orig[0]   = 1'b0;
                 c_out_N_orig[0]   = 1'b1;
                 c_out_S_orig[0]   = 1'b0;
                 c_out_W_orig[0]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_NW_in       = mux_d_in_S;
                 c_out_NW_orig[0]  = 1'b0;
                 c_out_E_orig[0]   = 1'b0;
                 c_out_N_orig[0]   = 1'b0;
                 c_out_S_orig[0]   = 1'b1;
                 c_out_W_orig[0]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_NW_in       = mux_d_in_W;
                 c_out_NW_orig[0]  = 1'b0;
                 c_out_E_orig[0]   = 1'b0;
                 c_out_N_orig[0]   = 1'b0;
                 c_out_S_orig[0]   = 1'b0;
                 c_out_W_orig[0]   = 1'b1;
               end
    default :  begin //off
                 stage_NW_in       = 0;
                 c_out_NW_orig[0]  = 1'b0;
                 c_out_E_orig[0]   = 1'b0;
                 c_out_N_orig[0]   = 1'b0;
                 c_out_S_orig[0]   = 1'b0;
                 c_out_W_orig[0]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_NW(
    /* inputs */
    .ready_in(stage_NW_in[0]),
    .valid_in(stage_NW_in[1]),
    .credit_in(c_in_NW),
    .data_in(stage_NW_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_NW_c_out),
    .data_out(d_out_NW_stage[`PATH_WIDTH:2]),
    .valid_out(d_out_NW_stage[1]),
    .ready_out(d_out_NW_stage[0])
    );

// North output mux, credit decoder and stage
always @(*)
  case (conf[7:4]) 
    4'b0001 :  begin
                 stage_N_in        = mux_d_in_NW;
                 c_out_NW_orig[1]  = 1'b1;
                 c_out_E_orig[1]   = 1'b0;
                 c_out_N_orig[1]   = 1'b0;
                 c_out_S_orig[1]   = 1'b0;
                 c_out_W_orig[1]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_N_in        = mux_d_in_E;
                 c_out_NW_orig[1]  = 1'b0;
                 c_out_E_orig[1]   = 1'b1;
                 c_out_N_orig[1]   = 1'b0;
                 c_out_S_orig[1]   = 1'b0;
                 c_out_W_orig[1]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_N_in        = mux_d_in_N;
                 c_out_NW_orig[1]  = 1'b0;
                 c_out_E_orig[1]   = 1'b0;
                 c_out_N_orig[1]   = 1'b1;
                 c_out_S_orig[1]   = 1'b0;
                 c_out_W_orig[1]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_N_in        = mux_d_in_S;
                 c_out_NW_orig[1]  = 1'b0;
                 c_out_E_orig[1]   = 1'b0;
                 c_out_N_orig[1]   = 1'b0;
                 c_out_S_orig[1]   = 1'b1;
                 c_out_W_orig[1]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_N_in        = mux_d_in_W;
                 c_out_NW_orig[1]  = 1'b0;
                 c_out_E_orig[1]   = 1'b0;
                 c_out_N_orig[1]   = 1'b0;
                 c_out_S_orig[1]   = 1'b0;
                 c_out_W_orig[1]   = 1'b1;
               end
    default :  begin //off
                 stage_N_in        = 0;
                 c_out_NW_orig[1]  = 1'b0;
                 c_out_E_orig[1]   = 1'b0;
                 c_out_N_orig[1]   = 1'b0;
                 c_out_S_orig[1]   = 1'b0;
                 c_out_W_orig[1]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_N(
    /* inputs */
    .ready_in(stage_N_in[0]),
    .valid_in(stage_N_in[1]),
    .credit_in(c_in_N),
    .data_in(stage_N_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_N_c_out),
    .data_out(d_out_N_stage[`PATH_WIDTH:2]),
    .valid_out(d_out_N_stage[1]),
    .ready_out(d_out_N_stage[0])
    );

// North-East output mux, credit decoder and stage
always @(*)
  case (conf[11:8]) 
    4'b0001 :  begin
                 stage_NE_in       = mux_d_in_NW;
                 c_out_NW_orig[2]  = 1'b1;
                 c_out_E_orig[2]   = 1'b0;
                 c_out_N_orig[2]   = 1'b0;
                 c_out_S_orig[2]   = 1'b0;
                 c_out_W_orig[2]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_NE_in       = mux_d_in_E;
                 c_out_NW_orig[2]  = 1'b0;
                 c_out_E_orig[2]   = 1'b1;
                 c_out_N_orig[2]   = 1'b0;
                 c_out_S_orig[2]   = 1'b0;
                 c_out_W_orig[2]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_NE_in       = mux_d_in_N;
                 c_out_NW_orig[2]  = 1'b0;
                 c_out_E_orig[2]   = 1'b0;
                 c_out_N_orig[2]   = 1'b1;
                 c_out_S_orig[2]   = 1'b0;
                 c_out_W_orig[2]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_NE_in       = mux_d_in_S;
                 c_out_NW_orig[2]  = 1'b0;
                 c_out_E_orig[2]   = 1'b0;
                 c_out_N_orig[2]   = 1'b0;
                 c_out_S_orig[2]   = 1'b1;
                 c_out_W_orig[2]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_NE_in       = mux_d_in_W;
                 c_out_NW_orig[2]  = 1'b0;
                 c_out_E_orig[2]   = 1'b0;
                 c_out_N_orig[2]   = 1'b0;
                 c_out_S_orig[2]   = 1'b0;
                 c_out_W_orig[2]   = 1'b1;
               end
    default :  begin //off
                 stage_NE_in       = 0;
                 c_out_NW_orig[2]  = 1'b0;
                 c_out_E_orig[2]   = 1'b0;
                 c_out_N_orig[2]   = 1'b0;
                 c_out_S_orig[2]   = 1'b0;
                 c_out_W_orig[2]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_NE(
    /* inputs */
    .ready_in(stage_NE_in[0]),
    .valid_in(stage_NE_in[1]),
    .credit_in(c_in_NE),
    .data_in(stage_NE_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_NE_c_out),
    .data_out(d_out_NE[`PATH_WIDTH:2]),
    .valid_out(d_out_NE[1]),
    .ready_out(d_out_NE[0])
    );

// East output mux, credit decoder and stage
always @(*)
  case (conf[15:12]) 
    4'b0001 :  begin
                 stage_E_in        = mux_d_in_NW;
                 c_out_NW_orig[3]  = 1'b1;
                 c_out_E_orig[3]   = 1'b0;
                 c_out_N_orig[3]   = 1'b0;
                 c_out_S_orig[3]   = 1'b0;
                 c_out_W_orig[3]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_E_in        = mux_d_in_E;
                 c_out_NW_orig[3]  = 1'b0;
                 c_out_E_orig[3]   = 1'b1;
                 c_out_N_orig[3]   = 1'b0;
                 c_out_S_orig[3]   = 1'b0;
                 c_out_W_orig[3]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_E_in        = mux_d_in_N;
                 c_out_NW_orig[3]  = 1'b0;
                 c_out_E_orig[3]   = 1'b0;
                 c_out_N_orig[3]   = 1'b1;
                 c_out_S_orig[3]   = 1'b0;
                 c_out_W_orig[3]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_E_in        = mux_d_in_S;
                 c_out_NW_orig[3]  = 1'b0;
                 c_out_E_orig[3]   = 1'b0;
                 c_out_N_orig[3]   = 1'b0;
                 c_out_S_orig[3]   = 1'b1;
                 c_out_W_orig[3]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_E_in        = mux_d_in_W;
                 c_out_NW_orig[3]  = 1'b0;
                 c_out_E_orig[3]   = 1'b0;
                 c_out_N_orig[3]   = 1'b0;
                 c_out_S_orig[3]   = 1'b0;
                 c_out_W_orig[3]   = 1'b1;
               end
    default :  begin //off
                 stage_E_in        = 0;
                 c_out_NW_orig[3]  = 1'b0;
                 c_out_E_orig[3]   = 1'b0;
                 c_out_N_orig[3]   = 1'b0;
                 c_out_S_orig[3]   = 1'b0;
                 c_out_W_orig[3]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_E(
    /* inputs */
    .ready_in(stage_E_in[0]),
    .valid_in(stage_E_in[1]),
    .credit_in(c_in_E),
    .data_in(stage_E_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_E_c_out),
    .data_out(d_out_E_stage[`PATH_WIDTH:2]),
    .valid_out(d_out_E_stage[1]),
    .ready_out(d_out_E_stage[0])
    );

// South-East output mux, credit decoder and stage
always @(*)
  case (conf[19:16]) 
    4'b0001 :  begin
                 stage_SE_in       = mux_d_in_NW;
                 c_out_NW_orig[4]  = 1'b1;
                 c_out_E_orig[4]   = 1'b0;
                 c_out_N_orig[4]   = 1'b0;
                 c_out_S_orig[4]   = 1'b0;
                 c_out_W_orig[4]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_SE_in       = mux_d_in_E;
                 c_out_NW_orig[4]  = 1'b0;
                 c_out_E_orig[4]   = 1'b1;
                 c_out_N_orig[4]   = 1'b0;
                 c_out_S_orig[4]   = 1'b0;
                 c_out_W_orig[4]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_SE_in       = mux_d_in_N;
                 c_out_NW_orig[4]  = 1'b0;
                 c_out_E_orig[4]   = 1'b0;
                 c_out_N_orig[4]   = 1'b1;
                 c_out_S_orig[4]   = 1'b0;
                 c_out_W_orig[4]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_SE_in       = mux_d_in_S;
                 c_out_NW_orig[4]  = 1'b0;
                 c_out_E_orig[4]   = 1'b0;
                 c_out_N_orig[4]   = 1'b0;
                 c_out_S_orig[4]   = 1'b1;
                 c_out_W_orig[4]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_SE_in       = mux_d_in_W;
                 c_out_NW_orig[4]  = 1'b0;
                 c_out_E_orig[4]   = 1'b0;
                 c_out_N_orig[4]   = 1'b0;
                 c_out_S_orig[4]   = 1'b0;
                 c_out_W_orig[4]   = 1'b1;
               end
    default :  begin //off
                 stage_SE_in       = 0;
                 c_out_NW_orig[4]  = 1'b0;
                 c_out_E_orig[4]   = 1'b0;
                 c_out_N_orig[4]   = 1'b0;
                 c_out_S_orig[4]   = 1'b0;
                 c_out_W_orig[4]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_SE(
    /* inputs */
    .ready_in(stage_SE_in[0]),
    .valid_in(stage_SE_in[1]),
    .credit_in(c_in_SE),
    .data_in(stage_SE_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_SE_c_out),
    .data_out(d_out_SE[`PATH_WIDTH:2]),
    .valid_out(d_out_SE[1]),
    .ready_out(d_out_SE[0])
    );

// South output mux, credit decoder and stage
always @(*)
  case (conf[23:20]) 
    4'b0001 :  begin
                 stage_S_in        = mux_d_in_NW;
                 c_out_NW_orig[5]  = 1'b1;
                 c_out_E_orig[5]   = 1'b0;
                 c_out_N_orig[5]   = 1'b0;
                 c_out_S_orig[5]   = 1'b0;
                 c_out_W_orig[5]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_S_in        = mux_d_in_E;
                 c_out_NW_orig[5]  = 1'b0;
                 c_out_E_orig[5]   = 1'b1;
                 c_out_N_orig[5]   = 1'b0;
                 c_out_S_orig[5]   = 1'b0;
                 c_out_W_orig[5]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_S_in        = mux_d_in_N;
                 c_out_NW_orig[5]  = 1'b0;
                 c_out_E_orig[5]   = 1'b0;
                 c_out_N_orig[5]   = 1'b1;
                 c_out_S_orig[5]   = 1'b0;
                 c_out_W_orig[5]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_S_in        = mux_d_in_S;
                 c_out_NW_orig[5]  = 1'b0;
                 c_out_E_orig[5]   = 1'b0;
                 c_out_N_orig[5]   = 1'b0;
                 c_out_S_orig[5]   = 1'b1;
                 c_out_W_orig[5]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_S_in        = mux_d_in_W;
                 c_out_NW_orig[5]  = 1'b0;
                 c_out_E_orig[5]   = 1'b0;
                 c_out_N_orig[5]   = 1'b0;
                 c_out_S_orig[5]   = 1'b0;
                 c_out_W_orig[5]   = 1'b1;
               end
    default :  begin //off
                 stage_S_in        = 0;
                 c_out_NW_orig[5]  = 1'b0;
                 c_out_E_orig[5]   = 1'b0;
                 c_out_N_orig[5]   = 1'b0;
                 c_out_S_orig[5]   = 1'b0;
                 c_out_W_orig[5]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_S(
    /* inputs */
    .ready_in(stage_S_in[0]),
    .valid_in(stage_S_in[1]),
    .credit_in(c_in_S),
    .data_in(stage_S_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_S_c_out),
    .data_out(d_out_S[`PATH_WIDTH:2]),
    .valid_out(d_out_S[1]),
    .ready_out(d_out_S[0])
    );

// South-West output mux, credit decoder and stage
always @(*)
  case (conf[27:24]) 
    4'b0001 :  begin
                 stage_SW_in       = mux_d_in_NW;
                 c_out_NW_orig[6]  = 1'b1;
                 c_out_E_orig[6]   = 1'b0;
                 c_out_N_orig[6]   = 1'b0;
                 c_out_S_orig[6]   = 1'b0;
                 c_out_W_orig[6]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_SW_in       = mux_d_in_E;
                 c_out_NW_orig[6]  = 1'b0;
                 c_out_E_orig[6]   = 1'b1;
                 c_out_N_orig[6]   = 1'b0;
                 c_out_S_orig[6]   = 1'b0;
                 c_out_W_orig[6]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_SW_in       = mux_d_in_N;
                 c_out_NW_orig[6]  = 1'b0;
                 c_out_E_orig[6]   = 1'b0;
                 c_out_N_orig[6]   = 1'b1;
                 c_out_S_orig[6]   = 1'b0;
                 c_out_W_orig[6]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_SW_in       = mux_d_in_S;
                 c_out_NW_orig[6]  = 1'b0;
                 c_out_E_orig[6]   = 1'b0;
                 c_out_N_orig[6]   = 1'b0;
                 c_out_S_orig[6]   = 1'b1;
                 c_out_W_orig[6]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_SW_in       = mux_d_in_W;
                 c_out_NW_orig[6]  = 1'b0;
                 c_out_E_orig[6]   = 1'b0;
                 c_out_N_orig[6]   = 1'b0;
                 c_out_S_orig[6]   = 1'b0;
                 c_out_W_orig[6]   = 1'b1;
               end
    default :  begin //off
                 stage_SW_in       = 0;
                 c_out_NW_orig[6]  = 1'b0;
                 c_out_E_orig[6]   = 1'b0;
                 c_out_N_orig[6]   = 1'b0;
                 c_out_S_orig[6]   = 1'b0;
                 c_out_W_orig[6]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_SW(
    /* inputs */
    .ready_in(stage_SW_in[0]),
    .valid_in(stage_SW_in[1]),
    .credit_in(c_in_SW),
    .data_in(stage_SW_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_SW_c_out),
    .data_out(d_out_SW[`PATH_WIDTH:2]),
    .valid_out(d_out_SW[1]),
    .ready_out(d_out_SW[0])
    );

// West output mux, credit decoder and stage
always @(*)
  case (conf[31:28]) 
    4'b0001 :  begin
                 stage_W_in        = mux_d_in_NW;
                 c_out_NW_orig[7]  = 1'b1;
                 c_out_E_orig[7]   = 1'b0;
                 c_out_N_orig[7]   = 1'b0;
                 c_out_S_orig[7]   = 1'b0;
                 c_out_W_orig[7]   = 1'b0;
               end
    4'b0010 :  begin
                 stage_W_in        = mux_d_in_E;
                 c_out_NW_orig[7]  = 1'b0;
                 c_out_E_orig[7]   = 1'b1;
                 c_out_N_orig[7]   = 1'b0;
                 c_out_S_orig[7]   = 1'b0;
                 c_out_W_orig[7]   = 1'b0;
               end
    4'b0011 :  begin
                 stage_W_in        = mux_d_in_N;
                 c_out_NW_orig[7]  = 1'b0;
                 c_out_E_orig[7]   = 1'b0;
                 c_out_N_orig[7]   = 1'b1;
                 c_out_S_orig[7]   = 1'b0;
                 c_out_W_orig[7]   = 1'b0;
               end
    4'b0100 :  begin
                 stage_W_in        = mux_d_in_S;
                 c_out_NW_orig[7]  = 1'b0;
                 c_out_E_orig[7]   = 1'b0;
                 c_out_N_orig[7]   = 1'b0;
                 c_out_S_orig[7]   = 1'b1;
                 c_out_W_orig[7]   = 1'b0;
               end
    4'b0101 :  begin
                 stage_W_in        = mux_d_in_W;
                 c_out_NW_orig[7]  = 1'b0;
                 c_out_E_orig[7]   = 1'b0;
                 c_out_N_orig[7]   = 1'b0;
                 c_out_S_orig[7]   = 1'b0;
                 c_out_W_orig[7]   = 1'b1;
               end
    default :  begin //off
                 stage_W_in        = 0;
                 c_out_NW_orig[7]  = 1'b0;
                 c_out_E_orig[7]   = 1'b0;
                 c_out_N_orig[7]   = 1'b0;
                 c_out_S_orig[7]   = 1'b0;
                 c_out_W_orig[7]   = 1'b0;
               end
  endcase 

stage #(ID, EDGE) stage_W(
    /* inputs */
    .ready_in(stage_W_in[0]),
    .valid_in(stage_W_in[1]),
    .credit_in(c_in_W),
    .data_in(stage_W_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_W_c_out),
    .data_out(d_out_W_stage[`PATH_WIDTH:2]),
    .valid_out(d_out_W_stage[1]),
    .ready_out(d_out_W_stage[0])
    );

///////////////////////////
//
//  Credit output
//
//////////////////////////

assign c_out_NW = (c_out_NW_orig == 0)? 1'b0 :        // off
                  (~c_out_NW_orig[0] | stage_NW_c_out) &
                  (~c_out_NW_orig[1] | stage_N_c_out)  &
                  (~c_out_NW_orig[2] | stage_NE_c_out) &
                  (~c_out_NW_orig[3] | stage_E_c_out)  &
                  (~c_out_NW_orig[4] | stage_SE_c_out) &
                  (~c_out_NW_orig[5] | stage_S_c_out)  &
                  (~c_out_NW_orig[6] | stage_SW_c_out) &
                  (~c_out_NW_orig[7] | stage_W_c_out);    // if orig[x] = 0, input is masked out 

assign c_out_N =  (c_out_N_orig == 0)? 1'b0 :        // off
                  (~c_out_N_orig[0] | stage_NW_c_out) &
                  (~c_out_N_orig[1] | stage_N_c_out)  &
                  (~c_out_N_orig[2] | stage_NE_c_out) &
                  (~c_out_N_orig[3] | stage_E_c_out)  &
                  (~c_out_N_orig[4] | stage_SE_c_out) &
                  (~c_out_N_orig[5] | stage_S_c_out)  &
                  (~c_out_N_orig[6] | stage_SW_c_out) &
                  (~c_out_N_orig[7] | stage_W_c_out);    // if orig[x] = 0, input is masked out 

assign c_out_E = (c_out_E_orig == 0)? 1'b0 :        // off
                  (~c_out_E_orig[0] | stage_NW_c_out) &
                  (~c_out_E_orig[1] | stage_N_c_out)  &
                  (~c_out_E_orig[2] | stage_NE_c_out) &
                  (~c_out_E_orig[3] | stage_E_c_out)  &
                  (~c_out_E_orig[4] | stage_SE_c_out) &
                  (~c_out_E_orig[5] | stage_S_c_out)  &
                  (~c_out_E_orig[6] | stage_SW_c_out) &
                  (~c_out_E_orig[7] | stage_W_c_out);    // if orig[x] = 0, input is masked out 

assign c_out_S = (c_out_S_orig == 0)? 1'b0 :        // off
                  (~c_out_S_orig[0] | stage_NW_c_out) &
                  (~c_out_S_orig[1] | stage_N_c_out)  &
                  (~c_out_S_orig[2] | stage_NE_c_out) &
                  (~c_out_S_orig[3] | stage_E_c_out)  &
                  (~c_out_S_orig[4] | stage_SE_c_out) &
                  (~c_out_S_orig[5] | stage_S_c_out)  &
                  (~c_out_S_orig[6] | stage_SW_c_out) &
                  (~c_out_S_orig[7] | stage_W_c_out);    // if orig[x] = 0, input is masked out 

assign c_out_W = (c_out_W_orig == 0)? 1'b0 :        // off
                  (~c_out_W_orig[0] | stage_NW_c_out) &
                  (~c_out_W_orig[1] | stage_N_c_out)  &
                  (~c_out_W_orig[2] | stage_NE_c_out) &
                  (~c_out_W_orig[3] | stage_E_c_out)  &
                  (~c_out_W_orig[4] | stage_SE_c_out) &
                  (~c_out_W_orig[5] | stage_S_c_out)  &
                  (~c_out_W_orig[6] | stage_SW_c_out) &
                  (~c_out_W_orig[7] | stage_W_c_out);    // if orig[x] = 0, input is masked out 

//////////////////////
//
//  block ready for multi-fanout nets
//
////////////////////

assign mux_d_in_NW = {d_in_NW[`PATH_WIDTH:1], c_out_NW & d_in_NW[0]};
assign mux_d_in_N  = { d_in_N[`PATH_WIDTH:1], c_out_N  &  d_in_N[0]};
assign mux_d_in_E  = { d_in_E[`PATH_WIDTH:1], c_out_E  &  d_in_E[0]};
assign mux_d_in_W  = { d_in_W[`PATH_WIDTH:1], c_out_W  &  d_in_W[0]};
assign mux_d_in_S  = { d_in_S[`PATH_WIDTH:1], c_out_S  &  d_in_S[0]};

endmodule
