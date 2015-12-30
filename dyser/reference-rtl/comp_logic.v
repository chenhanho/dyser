//comp_logic.v
//
// temp module for computational logic
// dummy add
`include "config.v"

module comp_logic(
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


parameter              TYPE = 0;

input    [`PATH_WIDTH:0] d_in_c0;
input    [`PATH_WIDTH:0] d_in_c1;
input              [1:0] conf;
input                    clk;
input                    rst;

output [`PATH_WIDTH-1:0] d_out;
output                   done;



assign d_out[`PATH_WIDTH-1:1] = 
            (TYPE == 0 ?
/* Add */      (conf[1:0] == 2'b00 ? d_in_c0[`PATH_WIDTH:`META_BITS] + d_in_c1[`PATH_WIDTH:`META_BITS] :
/* Sub */       conf[1:0] == 2'b01 ? d_in_c0[`PATH_WIDTH:`META_BITS] - d_in_c1[`PATH_WIDTH:`META_BITS] :
/* Shl */       conf[1:0] == 2'b10 ? d_in_c0[`PATH_WIDTH:`META_BITS] << d_in_c1[`PATH_WIDTH:`META_BITS] :
/* LShr */    /*conf[1:0] == 2'b11*/ d_in_c0[`PATH_WIDTH:`META_BITS] >> d_in_c1[`PATH_WIDTH:`META_BITS]) :
           /*TYPE == 1*/
/* Xor */      (conf[1:0] == 2'b00 ? d_in_c0[`PATH_WIDTH:`META_BITS] ^ d_in_c1[`PATH_WIDTH:`META_BITS] :
/* ICmp GE */   conf[1:0] == 2'b01 ? (d_in_c0[`PATH_WIDTH:`META_BITS] >= d_in_c1[`PATH_WIDTH:`META_BITS] ? 1 : 0) :
/* And */       conf[1:0] == 2'b10 ? d_in_c0[`PATH_WIDTH:`META_BITS] & d_in_c1[`PATH_WIDTH:`META_BITS] :
/* Or */      /*conf[1:0] == 2'b11*/ d_in_c0[`PATH_WIDTH:`META_BITS] | d_in_c1[`PATH_WIDTH:`META_BITS]));



assign d_out[0] =
            (TYPE == 0 ?
/* Add */      (conf[1:0] == 2'b00 ? d_in_c0[1] & d_in_c1[1] :
/* Sub */       conf[1:0] == 2'b01 ? d_in_c0[1] & d_in_c1[1] :
/* Shl */       conf[1:0] == 2'b10 ? d_in_c0[1] & d_in_c1[1] :
/* LShr */    /*conf[1:0] == 2'b11*/ d_in_c0[1] & d_in_c1[1]) :
           /*TYPE == 1*/
/* Xor */      (conf[1:0] == 2'b00 ? d_in_c0[1] & d_in_c1[1] :
/* ICmp GE */   conf[1:0] == 2'b01 ? (d_in_c0[`PATH_WIDTH:`META_BITS] >= d_in_c1[`PATH_WIDTH:`META_BITS] ? 1'b1 : 1'b0) :
/* And */       conf[1:0] == 2'b10 ? d_in_c0[1] & d_in_c1[1] :
/* Or */      /*conf[1:0] == 2'b11*/ d_in_c0[1] & d_in_c1[1]));



assign done = d_in_c0[0] & d_in_c1[0];



endmodule
