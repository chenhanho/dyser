#!/usr/bin/perl

use strict;

use POSIX;


our $width;
our $height;



sub GenerateInputBridge {
  print "  Generating input_bridge.v ...\n";

  print INPUT_BRIDGE "//input_bridge.v\n";
  print INPUT_BRIDGE "//\n";
  print INPUT_BRIDGE "//  this file was auto-generated\n";
  print INPUT_BRIDGE '`include "config.v"' . "\n\n";
  print INPUT_BRIDGE "module input_bridge(\n";

  # inputs
  print INPUT_BRIDGE "  /* inputs */\n";
  my @inputs = ();

  my $input_data_count = ($width*2) + ($height*2);
  my $port_bits = ceil(log($input_data_count) / log(2)) - 1; # input size = 0 .. $port_bits

  push(@inputs, ("d_in0", "[`DATA_WIDTH:0]", "d_in1", "[`DATA_WIDTH:0]"));
  print INPUT_BRIDGE "  d_in0,\n  d_in1,\n";
  push(@inputs, ("port0", "[$port_bits:0]", "port1", "[$port_bits:0]"));
  print INPUT_BRIDGE "  port0,\n  port1,\n";
  push(@inputs, ("wr_en0", "", "wr_en1", ""));
  print INPUT_BRIDGE "  wr_en0,\n  wr_en1,\n";

  print INPUT_BRIDGE "  // credit from core\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    my $id = "c_in_$i";
    push(@inputs, ($id, ""));
    print INPUT_BRIDGE "  $id,\n";
  }

  print INPUT_BRIDGE "  // --\n";
  push(@inputs, ("clk", "", "rst", "", "conf_en", ""));
  print INPUT_BRIDGE "  clk,\n  rst,\n  conf_en,\n";

  # outputs
  print INPUT_BRIDGE "  /* outputs */\n";
  my @outputs = ();

  print INPUT_BRIDGE "  // data to core\n";
  for (my $i = 0; $i < $input_data_count; $i++) { # same count as credit from core count
    my $id = "d_out_$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print INPUT_BRIDGE "  $id,\n";
  }

  push(@outputs, ("busy0", "", "busy1", ""));
  print INPUT_BRIDGE "  busy0,\n  busy1\n";

  print INPUT_BRIDGE "  );\n";

  # input definitions
  print INPUT_BRIDGE "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print INPUT_BRIDGE "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print INPUT_BRIDGE "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print INPUT_BRIDGE "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # wires
  print INPUT_BRIDGE "\n\n";
  print INPUT_BRIDGE "////////////////////////////////////////////////\n";
  print INPUT_BRIDGE "//\n";
  print INPUT_BRIDGE "//    wires\n";
  print INPUT_BRIDGE "//\n";
  print INPUT_BRIDGE "////////////////////////////////////////////////\n\n";

  print INPUT_BRIDGE "wire [" . ($input_data_count-1) . ":0] write0;\n";
  print INPUT_BRIDGE "wire [" . ($input_data_count-1) . ":0] write1;\n";
  print INPUT_BRIDGE "wire [" . ($input_data_count-1) . ":0] busy;\n";
  print INPUT_BRIDGE "\n";

  # write 0
  for (my $i = 0; $i < $input_data_count; $i++) {
    print INPUT_BRIDGE "assign write0[$i] = (port0 == " . ($port_bits+1) . "'d$i) & wr_en0;\n";
  }
  print INPUT_BRIDGE "\n";
  
  # write 1
  for (my $i = 0; $i < $input_data_count; $i++) {
    print INPUT_BRIDGE "assign write1[$i] = (port1 == " . ($port_bits+1) . "'d$i) & wr_en1;\n";
  }
  print INPUT_BRIDGE "\n";
  
  print INPUT_BRIDGE "assign busy0 = | (busy & write0);\n";
  print INPUT_BRIDGE "assign busy1 = | (busy & write1);\n";
  print INPUT_BRIDGE "\n\n";
  
  # read enable
  print INPUT_BRIDGE "reg [" . ($input_data_count-1) . ":0] read_en;\n";
  print INPUT_BRIDGE "\n";

  print INPUT_BRIDGE "always @(posedge clk or posedge rst)\n";
  print INPUT_BRIDGE "begin\n";
  print INPUT_BRIDGE "  if (rst == 1'b1)\n";
  print INPUT_BRIDGE "    read_en <= ~($input_data_count" . "'b0);\n";
  print INPUT_BRIDGE "  else begin\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print INPUT_BRIDGE "    read_en[$i] <= (c_in_$i ? 1'b1 : (d_out_$i" . "[0] ? 1'b0 : read_en[$i]));\n";
  }
  print INPUT_BRIDGE "  end\n";
  print INPUT_BRIDGE "end\n\n";

  
  # FIFO's
  print INPUT_BRIDGE "\n\n";
  print INPUT_BRIDGE "////////////////////////////////////////////////\n";
  print INPUT_BRIDGE "//\n";
  print INPUT_BRIDGE "//    FIFO\n";
  print INPUT_BRIDGE "//\n";
  print INPUT_BRIDGE "////////////////////////////////////////////////\n\n";
  
  for (my $idx = 0; $idx < $input_data_count; $idx++) {
    print INPUT_BRIDGE "assign d_out_$idx" . "[1] = 1'b1;\n"; # Predicate bit always 1 at this stage
    print INPUT_BRIDGE "fifo #($idx) f$idx(\n";
    print INPUT_BRIDGE "  /* inputs */\n";
    print INPUT_BRIDGE "  .d_in(write0[$idx] ? d_in0 : d_in1),\n";
    print INPUT_BRIDGE "  .enq(write0[$idx] | write1[$idx]),\n";
    print INPUT_BRIDGE "  .deq(~conf_en & read_en[$idx]),\n";
    print INPUT_BRIDGE "  .clk(clk),\n";
    print INPUT_BRIDGE "  .rst(rst),\n";
    print INPUT_BRIDGE "  /* outputs */\n";
    print INPUT_BRIDGE "  .d_out(d_out_$idx" . "[`PATH_WIDTH:`META_BITS]),\n";
    print INPUT_BRIDGE "  .valid(d_out_$idx" . "[0]),\n";
    print INPUT_BRIDGE "  .busy(busy[$idx]),\n";
    print INPUT_BRIDGE "  .c_out() // NC\n";
    print INPUT_BRIDGE "  );\n\n";
  }
  

  print INPUT_BRIDGE "endmodule\n";

  close(INPUT_BRIDGE);
}


return 1; # success

