//fifo.v
//
//
//
`include "config.v"

module fifo(
    /* inputs */
    d_in,
    enq,
    deq,
    clk,
    rst,
    /* outputs */
    d_out,
    valid,
    busy,
    c_out
    );


parameter                  ID = 0;

input      [`DATA_WIDTH:0] d_in;
input                      enq;
input                      deq;
input                      clk;
input                      rst;

output     [`DATA_WIDTH:0] d_out;
output                     valid;
output                     busy;
output                     c_out; // specific to the output_bridge-core interface


reg    [`DATA_WIDTH:0] data0;
reg    [`DATA_WIDTH:0] data1;
reg    [`DATA_WIDTH:0] data2;
reg    [`DATA_WIDTH:0] data3;
reg              [2:0] count;


// Busy if FULL (unless inserting and deleting in same cycle)
assign busy = count[2] & enq & ~deq;
assign c_out = (~count[2] & (~count[1] | ~count[0])); // Will guarantee DySER won't overflow the FIFO
assign valid = (count[2] | count[1] | count[0] | enq) & deq; // enq & deq  could have timing issues
assign d_out = (enq & deq & count == 3'b000 ? d_in : data0); // bypassing


always @(posedge clk or posedge rst)
begin
  if (rst == 1'b1) begin
    count <= 3'b00;
    data0 <= 0;
    data1 <= 0;
    data2 <= 0;
    data3 <= 0;
  end
  else
  begin
    casez({enq, deq})
    2'b00: // no insert, no remove
      begin
        
      end
    2'b01: // remove, no insert
      begin
        data0 <= data1;
        data1 <= data2;
        data2 <= data3;
        data3 <= 0;
        count <= (count == 3'b100 ? 3'b011 :
                  count == 3'b011 ? 3'b010 :
                  count == 3'b010 ? 3'b001 :
                  count == 3'b001 ? 3'b000 :
                /* invalid state */ 3'b000);
      end
    2'b10: // insert, no remove
      begin
        data0 <= (count == 3'b000 ? d_in : data0);
        data1 <= (count == 3'b001 ? d_in : data1);
        data2 <= (count == 3'b010 ? d_in : data2);
        data3 <= (count == 3'b011 ? d_in : data3);
        count <= (count == 3'b000 ? 3'b001 :
                  count == 3'b001 ? 3'b010 :
                  count == 3'b010 ? 3'b011 :
                  count == 3'b011 ? 3'b100 :
                /* invalid state */ count); 
      end
    2'b11: // insert and remove
      begin
        data0 <= (count == 3'b001 ? d_in : data1);
        data1 <= (count == 3'b010 ? d_in : data2);
        data2 <= (count == 3'b011 ? d_in : data3);
        data3 <= (count == 3'b100 ? d_in : 0);
      end
    endcase
  end
end


endmodule
