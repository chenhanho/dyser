//switch-limited-connect.v
//
// DySER switch, responsible for passing data    
//
`include "dyser_config.v"


module switch_limited(
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
    conf,
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
    c_out_S,
    fu_conf
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
output          [15:0] fu_conf;


//parameter CONF_BITS = (EDGE == 0 ? 47 : 31);
input             [47:0] conf;


assign fu_conf = (EDGE == 0 ? conf[47:32] : 16'b0); // top 16 bits

//always @(posedge clk or negedge rst_n)
//begin
//  if (~rst_n == 1'b1)
//    conf <= 0;
//  else if (conf_en == 1'b1) begin
//  	if (EDGE == 0) begin // CORE SWITCH
//  		conf[47-`CONF_BITS:0]  <= conf[47:`CONF_BITS];
//    	conf[47:47-`CONF_WIDTH] <= (CONFIG_PATH_IN == `NORTH ? d_in_N[`CONF_WIDTH:0] : 
//      	                          CONFIG_PATH_IN == `EAST  ? d_in_E[`CONF_WIDTH:0] : 
//        	                        CONFIG_PATH_IN == `SOUTH ? d_in_S[`CONF_WIDTH:0] : 
//          	                    /*CONFIG_PATH_IN == `WEST*/  d_in_W[`CONF_WIDTH:0]);
//    end
//    else begin // EDGE SWITCH
//    	conf[31-`CONF_BITS:0]  <= conf[31:`CONF_BITS];
//    	conf[31:31-`CONF_WIDTH] <= (CONFIG_PATH_IN == `NORTH ? d_in_N[`CONF_WIDTH:0] : 
//      	                          CONFIG_PATH_IN == `EAST  ? d_in_E[`CONF_WIDTH:0] : 
//        	                        CONFIG_PATH_IN == `SOUTH ? d_in_S[`CONF_WIDTH:0] : 
//          	                    /*CONFIG_PATH_IN == `WEST*/  d_in_W[`CONF_WIDTH:0]);
//    end
//  end
//end


///////////////////////////////////////////
//
//    wires
//
//////////////////////////////////////////

reg   [`PATH_WIDTH:0] stage_0_in,     stage_1_in,     stage_2_in;
wire  [`PATH_WIDTH:0] d_out_stage_0,  d_out_stage_1,  d_out_stage_2;

wire                  stage_0_c_out,  stage_1_c_out,  stage_2_c_out;

wire                  c_in_stage_0,   c_in_stage_1,   c_in_stage_2;

reg   [7:0]           stage_0_c_in_orig;
reg   [7:0]           stage_1_c_in_orig;
reg   [7:0]           stage_2_c_in_orig;

reg   [`PATH_WIDTH:0] d_out_NW;
reg   [`PATH_WIDTH:0] d_out_N;
reg   [`PATH_WIDTH:0] d_out_NE;
reg   [`PATH_WIDTH:0] d_out_E;
reg   [`PATH_WIDTH:0] d_out_SE;
reg   [`PATH_WIDTH:0] d_out_S;
reg   [`PATH_WIDTH:0] d_out_SW;
reg   [`PATH_WIDTH:0] d_out_W;

//////////////////////////////////////////
//
//    data muxes and flip-flop stage
//
//////////////////////////////////////////

//
//  implementation 7/24 - reduced connectivity
//

// stage 0
always @(*)
  case (conf[2:0]) 
    3'b001  :  stage_0_in       = d_in_NW;
    3'b010  :  stage_0_in       = d_in_E;
    3'b011  :  stage_0_in       = d_in_N;
    3'b100  :  stage_0_in       = d_in_S;
    3'b101  :  stage_0_in       = d_in_W;
    default :  stage_0_in       = 0;
  endcase 

stage #(ID, EDGE) stage_0(
    /* inputs */
    .ready_in(stage_0_in[0]),
    .valid_in(stage_0_in[1]),
    .credit_in(c_in_stage_0),
    .data_in(stage_0_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_0_c_out),
    .data_out(d_out_stage_0[`PATH_WIDTH:2]),
    .valid_out(d_out_stage_0[1]),
    .ready_out(d_out_stage_0[0])
    );

// stage 1
always @(*)
  case (conf[5:3]) 
    3'b001  :  stage_1_in       = d_in_NW;
    3'b010  :  stage_1_in       = d_in_E;
    3'b011  :  stage_1_in       = d_in_N;
    3'b100  :  stage_1_in       = d_in_S;
    3'b101  :  stage_1_in       = d_in_W;
    default :  stage_1_in       = 0;
  endcase 

stage #(ID, EDGE) stage_1(
    /* inputs */
    .ready_in(stage_1_in[0]),
    .valid_in(stage_1_in[1]),
    .credit_in(c_in_stage_1),
    .data_in(stage_1_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_1_c_out),
    .data_out(d_out_stage_1[`PATH_WIDTH:2]),
    .valid_out(d_out_stage_1[1]),
    .ready_out(d_out_stage_1[0])
    );

// stage 2
always @(*)
  case (conf[8:6]) 
    3'b001  :  stage_2_in       = d_in_NW;
    3'b010  :  stage_2_in       = d_in_E;
    3'b011  :  stage_2_in       = d_in_N;
    3'b100  :  stage_2_in       = d_in_S;
    3'b101  :  stage_2_in       = d_in_W;
    default :  stage_2_in       = 0;
  endcase 

stage #(ID, EDGE) stage_2(
    /* inputs */
    .ready_in(stage_2_in[0]),
    .valid_in(stage_2_in[1]),
    .credit_in(c_in_stage_2),
    .data_in(stage_2_in[`PATH_WIDTH:2]),
    .clk(clk),
    .rst_n(rst_n),
    /* outputs */
    .credit_out(stage_2_c_out),
    .data_out(d_out_stage_2[`PATH_WIDTH:2]),
    .valid_out(d_out_stage_2[1]),
    .ready_out(d_out_stage_2[0])
    );

///////////////////////////
//
//  output mux
//
//////////////////////////

always @(*)
  case (conf[10:9]) 
    2'b00: begin
             d_out_NW = 0;
             stage_0_c_in_orig[0] = 0;
             stage_1_c_in_orig[0] = 0;
             stage_2_c_in_orig[0] = 0;
           end
    2'b01: begin
             d_out_NW = d_out_stage_0;
             stage_0_c_in_orig[0] = 1;
             stage_1_c_in_orig[0] = 0;
             stage_2_c_in_orig[0] = 0;
           end
    2'b10: begin
             d_out_NW = d_out_stage_1;
             stage_0_c_in_orig[0] = 0;
             stage_1_c_in_orig[0] = 1;
             stage_2_c_in_orig[0] = 0;
           end
    2'b11: begin
             d_out_NW = d_out_stage_2;
             stage_0_c_in_orig[0] = 0;
             stage_1_c_in_orig[0] = 0;
             stage_2_c_in_orig[0] = 1;
           end
  endcase

always @(*)
  case (conf[12:11]) 
    2'b00: begin
             d_out_N = 0;
             stage_0_c_in_orig[1] = 0;
             stage_1_c_in_orig[1] = 0;
             stage_2_c_in_orig[1] = 0;
           end
    2'b01: begin
             d_out_N = d_out_stage_0;
             stage_0_c_in_orig[1] = 1;
             stage_1_c_in_orig[1] = 0;
             stage_2_c_in_orig[1] = 0;
           end
    2'b10: begin
             d_out_N = d_out_stage_1;
             stage_0_c_in_orig[1] = 0;
             stage_1_c_in_orig[1] = 1;
             stage_2_c_in_orig[1] = 0;
           end
    2'b11: begin
             d_out_N = d_out_stage_2;
             stage_0_c_in_orig[1] = 0;
             stage_1_c_in_orig[1] = 0;
             stage_2_c_in_orig[1] = 1;
           end
  endcase

always @(*)
  case (conf[14:13]) 
    2'b00: begin
             d_out_NE = 0;
             stage_0_c_in_orig[2] = 0;
             stage_1_c_in_orig[2] = 0;
             stage_2_c_in_orig[2] = 0;
           end
    2'b01: begin
             d_out_NE = d_out_stage_0;
             stage_0_c_in_orig[2] = 1;
             stage_1_c_in_orig[2] = 0;
             stage_2_c_in_orig[2] = 0;
           end
    2'b10: begin
             d_out_NE = d_out_stage_1;
             stage_0_c_in_orig[2] = 0;
             stage_1_c_in_orig[2] = 1;
             stage_2_c_in_orig[2] = 0;
           end
    2'b11: begin
             d_out_NE = d_out_stage_2;
             stage_0_c_in_orig[2] = 0;
             stage_1_c_in_orig[2] = 0;
             stage_2_c_in_orig[2] = 1;
           end
  endcase

always @(*)
  case (conf[16:15]) 
    2'b00: begin
             d_out_E = 0;
             stage_0_c_in_orig[3] = 0;
             stage_1_c_in_orig[3] = 0;
             stage_2_c_in_orig[3] = 0;
           end
    2'b01: begin
             d_out_E = d_out_stage_0;
             stage_0_c_in_orig[3] = 1;
             stage_1_c_in_orig[3] = 0;
             stage_2_c_in_orig[3] = 0;
           end
    2'b10: begin
             d_out_E = d_out_stage_1;
             stage_0_c_in_orig[3] = 0;
             stage_1_c_in_orig[3] = 1;
             stage_2_c_in_orig[3] = 0;
           end
    2'b11: begin
             d_out_E = d_out_stage_2;
             stage_0_c_in_orig[3] = 0;
             stage_1_c_in_orig[3] = 0;
             stage_2_c_in_orig[3] = 1;
           end
  endcase

always @(*)
  case (conf[18:17]) 
    2'b00: begin
             d_out_SE = 0;
             stage_0_c_in_orig[4] = 0;
             stage_1_c_in_orig[4] = 0;
             stage_2_c_in_orig[4] = 0;
           end
    2'b01: begin
             d_out_SE = d_out_stage_0;
             stage_0_c_in_orig[4] = 1;
             stage_1_c_in_orig[4] = 0;
             stage_2_c_in_orig[4] = 0;
           end
    2'b10: begin
             d_out_SE = d_out_stage_1;
             stage_0_c_in_orig[4] = 0;
             stage_1_c_in_orig[4] = 1;
             stage_2_c_in_orig[4] = 0;
           end
    2'b11: begin
             d_out_SE = d_out_stage_2;
             stage_0_c_in_orig[4] = 0;
             stage_1_c_in_orig[4] = 0;
             stage_2_c_in_orig[4] = 1;
           end
  endcase

always @(*)
  case (conf[20:19]) 
    2'b00: begin
             d_out_S = 0;
             stage_0_c_in_orig[5] = 0;
             stage_1_c_in_orig[5] = 0;
             stage_2_c_in_orig[5] = 0;
           end
    2'b01: begin
             d_out_S = d_out_stage_0;
             stage_0_c_in_orig[5] = 1;
             stage_1_c_in_orig[5] = 0;
             stage_2_c_in_orig[5] = 0;
           end
    2'b10: begin
             d_out_S = d_out_stage_1;
             stage_0_c_in_orig[5] = 0;
             stage_1_c_in_orig[5] = 1;
             stage_2_c_in_orig[5] = 0;
           end
    2'b11: begin
             d_out_S = d_out_stage_2;
             stage_0_c_in_orig[5] = 0;
             stage_1_c_in_orig[5] = 0;
             stage_2_c_in_orig[5] = 1;
           end
  endcase

always @(*)
  case (conf[22:21]) 
    2'b00: begin
             d_out_SW = 0;
             stage_0_c_in_orig[6] = 0;
             stage_1_c_in_orig[6] = 0;
             stage_2_c_in_orig[6] = 0;
           end
    2'b01: begin
             d_out_SW = d_out_stage_0;
             stage_0_c_in_orig[6] = 1;
             stage_1_c_in_orig[6] = 0;
             stage_2_c_in_orig[6] = 0;
           end
    2'b10: begin
             d_out_SW = d_out_stage_1;
             stage_0_c_in_orig[6] = 0;
             stage_1_c_in_orig[6] = 1;
             stage_2_c_in_orig[6] = 0;
           end
    2'b11: begin
             d_out_SW = d_out_stage_2;
             stage_0_c_in_orig[6] = 0;
             stage_1_c_in_orig[6] = 0;
             stage_2_c_in_orig[6] = 1;
           end
  endcase

always @(*)
  case (conf[24:23]) 
    2'b00: begin
             d_out_W = 0;
             stage_0_c_in_orig[7] = 0;
             stage_1_c_in_orig[7] = 0;
             stage_2_c_in_orig[7] = 0;
           end
    2'b01: begin
             d_out_W = d_out_stage_0;
             stage_0_c_in_orig[7] = 1;
             stage_1_c_in_orig[7] = 0;
             stage_2_c_in_orig[7] = 0;
           end
    2'b10: begin
             d_out_W = d_out_stage_1;
             stage_0_c_in_orig[7] = 0;
             stage_1_c_in_orig[7] = 1;
             stage_2_c_in_orig[7] = 0;
           end
    2'b11: begin
             d_out_W = d_out_stage_2;
             stage_0_c_in_orig[7] = 0;
             stage_1_c_in_orig[7] = 0;
             stage_2_c_in_orig[7] = 1;
           end  endcase

///////////////////////////
//
//  Credit output
//
//////////////////////////

assign c_out_NW = (conf[2:0] == 3'b001)? stage_0_c_out :
                  (conf[5:3] == 3'b001)? stage_1_c_out :
                  (conf[8:6] == 3'b001)? stage_2_c_out :
                                                  1'b0 ; // off

assign c_out_E =  (conf[2:0] == 3'b010)? stage_0_c_out :
                  (conf[5:3] == 3'b010)? stage_1_c_out :
                  (conf[8:6] == 3'b010)? stage_2_c_out :
                                                  1'b0 ; // off

assign c_out_N =  (conf[2:0] == 3'b011)? stage_0_c_out :
                  (conf[5:3] == 3'b011)? stage_1_c_out :
                  (conf[8:6] == 3'b011)? stage_2_c_out :
                                                  1'b0 ; // off

assign c_out_S =  (conf[2:0] == 3'b100)? stage_0_c_out :
                  (conf[5:3] == 3'b100)? stage_1_c_out :
                  (conf[8:6] == 3'b100)? stage_2_c_out :
                                                  1'b0 ; // off
                 
assign c_out_W =  (conf[2:0] == 3'b101)? stage_0_c_out :
                  (conf[5:3] == 3'b101)? stage_1_c_out :
                  (conf[8:6] == 3'b101)? stage_2_c_out :
                                                  1'b0 ; // off
                  
///////////////////////////
//
//  Credit input
//
//////////////////////////
                 
assign c_in_stage_0 = ( stage_0_c_in_orig == 8'b0)? 1'b0 :
                      (~stage_0_c_in_orig[0] | c_in_NW ) &
                      (~stage_0_c_in_orig[1] | c_in_N  ) &
                      (~stage_0_c_in_orig[2] | c_in_NE ) &
                      (~stage_0_c_in_orig[3] | c_in_E  ) &
                      (~stage_0_c_in_orig[4] | c_in_SE ) &
                      (~stage_0_c_in_orig[5] | c_in_S  ) &
                      (~stage_0_c_in_orig[6] | c_in_SW ) &
                      (~stage_0_c_in_orig[7] | c_in_W ); 
                   
assign c_in_stage_1 = ( stage_1_c_in_orig == 8'b0)? 1'b0 :
                      (~stage_1_c_in_orig[0] | c_in_NW ) &
                      (~stage_1_c_in_orig[1] | c_in_N  ) &
                      (~stage_1_c_in_orig[2] | c_in_NE ) &
                      (~stage_1_c_in_orig[3] | c_in_E  ) &
                      (~stage_1_c_in_orig[4] | c_in_SE ) &
                      (~stage_1_c_in_orig[5] | c_in_S  ) &
                      (~stage_1_c_in_orig[6] | c_in_SW ) &
                      (~stage_1_c_in_orig[7] | c_in_W ); 
                 
assign c_in_stage_2 = ( stage_2_c_in_orig == 8'b0)? 1'b0 :
                      (~stage_2_c_in_orig[0] | c_in_NW ) &
                      (~stage_2_c_in_orig[1] | c_in_N  ) &
                      (~stage_2_c_in_orig[2] | c_in_NE ) &
                      (~stage_2_c_in_orig[3] | c_in_E  ) &
                      (~stage_2_c_in_orig[4] | c_in_SE ) &
                      (~stage_2_c_in_orig[5] | c_in_S  ) &
                      (~stage_2_c_in_orig[6] | c_in_SW ) &
                      (~stage_2_c_in_orig[7] | c_in_W ); 
                


endmodule
