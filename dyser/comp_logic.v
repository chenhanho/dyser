//comp_logic.v
//
// temp module for computational logic
// dummy add
`include "dyser_config.v"

module comp_logic(
    /* inputs */
    ready_in,
    d_in_R,
    d_in_L,
    conf,
    clk,
    rst_n,
    /* outputs */
    d_out,
    done
    );

parameter              TYPE = 0;

input                    ready_in;
input    [`DATA_WIDTH:0] d_in_R;
input    [`DATA_WIDTH:0] d_in_L;
input             [15:0] conf;
input                    clk;
input                    rst_n;

output   [`DATA_WIDTH:0] d_out;
reg      [`DATA_WIDTH:0] d_out;
output                   done;



//////////////////////
//
//    instructions
//
//////////////////////

// conf [0:1]  function group
//  00 = off
//  01 = shift
//  10 = logic
//  11 = adder

// conf [3:2]  shift
//  00 = shifter_rotate
//  01 = shifter_arith
//  10 = shifter_right
//  11 = shifter_logl

// conf [6:4]  logic
// 000 =  logical_and  
// 001 =  logical_or   
// 010 =  logical_equate
// 011 =  logical_nequate
// 100 =  logical_xor
// 101 =  reserved 
// 110 =  reserved
// 111 =  reserved

// conf [9:7]  adder
// 000 =  signed ge
// 001 =  signed geq
// 010 =  unsigned ge
// 011 =  unsigned geq
// 100 =  adder_add
// 101 =  adder_sub

//  [TODO] op_code field or encoded

////////////////////////////////
//
//  shifter: L shift by R[4:0] bits
//
///////////////////////////////

reg   [`DATA_WIDTH:0] shift_out;

always @(*) begin
  case(conf[3:2])
    2'b00: shift_out         = d_in_L << d_in_R[4:0];
    2'b01: shift_out         = { {32{d_in_L[31]}},d_in_L} >> d_in_R[4:0];
    2'b10: shift_out         = {32'h0, d_in_L} >> d_in_R[4:0];
    2'b11: shift_out         = {32'h0, d_in_L} << d_in_R[4:0];
  endcase
end

////////////////////////////////
//
//  logic: L op R
//
///////////////////////////////

reg   [`DATA_WIDTH:0] logic_out;
wire  [`DATA_WIDTH:0] xor_out;
wire                  neq_out;

assign xor_out = d_in_L ^ d_in_R;
assign neq_out = |xor_out;

always @(*) begin
  case(conf[6:4])
    3'b000: logic_out = d_in_L & d_in_R;
    3'b001: logic_out = d_in_L | d_in_R;
    3'b010: logic_out = {31'd0,~neq_out};
    3'b011: logic_out = {31'd0,neq_out};
    3'b100: logic_out = xor_out;
   default: logic_out = 32'd0;
  endcase
end

////////////////////////////////
//
//  adder: L op R
//
///////////////////////////////

reg        [`DATA_WIDTH:0] adder_out;

wire                       carry;
wire       [`DATA_WIDTH:0] sum;
reg        [`DATA_BITS:0] op_a;
reg        [`DATA_BITS:0] op_b;

// input mux
always @(*) begin
  case(conf[9:7])
    3'b000: begin 
              op_a = {1'b0,d_in_L};
              op_b = {1'b0,d_in_R};
            end
    3'b001: begin 
              op_a = {1'b0,d_in_L};
              op_b = -{1'b0,d_in_R};
            end
    3'b010: begin 
              op_a = {1'b0,d_in_L};
              op_b = -{1'b0,d_in_R};
            end
    3'b011: begin 
              op_a = {1'b0,d_in_L};
              op_b = -{1'b0,d_in_R};
            end
    3'b100: begin 
              op_a = {1'b0,d_in_L};
              op_b = {1'b0,d_in_R};
            end
    3'b101: begin 
              op_a = {d_in_L[31],d_in_L};
              op_b = -{d_in_R[31],d_in_R};
            end
   default: begin 
              op_a = {1'b0,d_in_L};
              op_b = {1'b0,d_in_R};
            end
  endcase
end

// adder
assign {carry,sum} = op_a + op_b;

// output mux
always @(*) begin
  casez(conf[9:7])
    3'b0?0: adder_out = {31'd0, ~carry & neq_out}; //a pos&b neg or a - b > 0
    3'b0?1: adder_out = {31'd0, ~carry }; // a-b >= 0
    3'b1??: adder_out = sum;
   default: adder_out = 32'd0;
  endcase
end

///////////////////////////
//
//  comp_logic output mux
//
//////////////////////////

always @(*) begin
  case(conf[1:0])
    2'b00: d_out = 32'd0;
    2'b01: d_out = shift_out; 
    2'b10: d_out = logic_out;
    2'b11: d_out = adder_out;
  endcase
end

// all single cycle

assign done = ready_in;

endmodule
