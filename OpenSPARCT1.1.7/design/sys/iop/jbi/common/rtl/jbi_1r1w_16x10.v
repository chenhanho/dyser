// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbi_1r1w_16x10.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
/////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the 
					// time scale definition

//Verilog code automatically  generated by  genregfile


module jbi_1r1w_16x10(
do,
rd_a,
wr_a,
di,
rd_clk,
wr_clk,
csn_wr 
);

output [9:0] do; 
input  [3:0] rd_a;
input  [3:0] wr_a;
input  [9:0] di;
input  rd_clk;
input  wr_clk;
input  csn_wr;

wire cs_wr;
reg  [9:0] dout; 

wire wrstrb_0000;
wire wrstrb_0001;
wire wrstrb_0010;
wire wrstrb_0011;
wire wrstrb_0100;
wire wrstrb_0101;
wire wrstrb_0110;
wire wrstrb_0111;
wire wrstrb_1000;
wire wrstrb_1001;
wire wrstrb_1010;
wire wrstrb_1011;
wire wrstrb_1100;
wire wrstrb_1101;
wire wrstrb_1110;
wire wrstrb_1111;

wire [9:0] mem_0000;
wire [9:0] mem_0001;
wire [9:0] mem_0010;
wire [9:0] mem_0011;
wire [9:0] mem_0100;
wire [9:0] mem_0101;
wire [9:0] mem_0110;
wire [9:0] mem_0111;
wire [9:0] mem_1000;
wire [9:0] mem_1001;
wire [9:0] mem_1010;
wire [9:0] mem_1011;
wire [9:0] mem_1100;
wire [9:0] mem_1101;
wire [9:0] mem_1110;
wire [9:0] mem_1111;

assign cs_wr = ~csn_wr;

assign do = dout; 
assign wrstrb_0000 = ~wr_a[3] & ~wr_a[2] & ~wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_0001 = ~wr_a[3] & ~wr_a[2] & ~wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_0010 = ~wr_a[3] & ~wr_a[2] & wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_0011 = ~wr_a[3] & ~wr_a[2] & wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_0100 = ~wr_a[3] & wr_a[2] & ~wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_0101 = ~wr_a[3] & wr_a[2] & ~wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_0110 = ~wr_a[3] & wr_a[2] & wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_0111 = ~wr_a[3] & wr_a[2] & wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_1000 = wr_a[3] & ~wr_a[2] & ~wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_1001 = wr_a[3] & ~wr_a[2] & ~wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_1010 = wr_a[3] & ~wr_a[2] & wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_1011 = wr_a[3] & ~wr_a[2] & wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_1100 = wr_a[3] & wr_a[2] & ~wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_1101 = wr_a[3] & wr_a[2] & ~wr_a[1] & wr_a[0] &  cs_wr;
assign wrstrb_1110 = wr_a[3] & wr_a[2] & wr_a[1] & ~wr_a[0] &  cs_wr;
assign wrstrb_1111 = wr_a[3] & wr_a[2] & wr_a[1] & wr_a[0] &  cs_wr;

dffe_ns #(10)  U_dff_mem0000( .en(wrstrb_0000),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0000[9:0]));
dffe_ns #(10)  U_dff_mem0001( .en(wrstrb_0001),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0001[9:0]));
dffe_ns #(10)  U_dff_mem0010( .en(wrstrb_0010),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0010[9:0]));
dffe_ns #(10)  U_dff_mem0011( .en(wrstrb_0011),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0011[9:0]));
dffe_ns #(10)  U_dff_mem0100( .en(wrstrb_0100),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0100[9:0]));
dffe_ns #(10)  U_dff_mem0101( .en(wrstrb_0101),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0101[9:0]));
dffe_ns #(10)  U_dff_mem0110( .en(wrstrb_0110),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0110[9:0]));
dffe_ns #(10)  U_dff_mem0111( .en(wrstrb_0111),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_0111[9:0]));
dffe_ns #(10)  U_dff_mem1000( .en(wrstrb_1000),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1000[9:0]));
dffe_ns #(10)  U_dff_mem1001( .en(wrstrb_1001),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1001[9:0]));
dffe_ns #(10)  U_dff_mem1010( .en(wrstrb_1010),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1010[9:0]));
dffe_ns #(10)  U_dff_mem1011( .en(wrstrb_1011),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1011[9:0]));
dffe_ns #(10)  U_dff_mem1100( .en(wrstrb_1100),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1100[9:0]));
dffe_ns #(10)  U_dff_mem1101( .en(wrstrb_1101),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1101[9:0]));
dffe_ns #(10)  U_dff_mem1110( .en(wrstrb_1110),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1110[9:0]));
dffe_ns #(10)  U_dff_mem1111( .en(wrstrb_1111),
                            .din(di[9:0]), .clk(wr_clk),
                            .q(mem_1111[9:0]));

always@(rd_a
       or  mem_0000 
       or  mem_0001 
       or  mem_0010 
       or  mem_0011 
       or  mem_0100 
       or  mem_0101 
       or  mem_0110 
       or  mem_0111 
       or  mem_1000 
       or  mem_1001 
       or  mem_1010 
       or  mem_1011 
       or  mem_1100 
       or  mem_1101 
       or  mem_1110 
       or  mem_1111 
)
begin
case(rd_a)
 4'b0000 : dout= mem_0000;
 4'b0001 : dout= mem_0001;
 4'b0010 : dout= mem_0010;
 4'b0011 : dout= mem_0011;
 4'b0100 : dout= mem_0100;
 4'b0101 : dout= mem_0101;
 4'b0110 : dout= mem_0110;
 4'b0111 : dout= mem_0111;
 4'b1000 : dout= mem_1000;
 4'b1001 : dout= mem_1001;
 4'b1010 : dout= mem_1010;
 4'b1011 : dout= mem_1011;
 4'b1100 : dout= mem_1100;
 4'b1101 : dout= mem_1101;
 4'b1110 : dout= mem_1110;
 4'b1111 : dout= mem_1111;
// CoverMeter line_off
 default: dout= mem_0000;
// CoverMeter line_on
endcase
end

endmodule
