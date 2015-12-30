#!/usr/bin/perl

use strict;

use POSIX;


our $width;
our $height;



sub GenerateOutputBridge {
  print "  Generating output_bridge.v ...\n";

  print OUTPUT_BRIDGE "//output_bridge.v\n";
  print OUTPUT_BRIDGE "//\n";
  print OUTPUT_BRIDGE "//  this file was auto-generated\n";
  print OUTPUT_BRIDGE '`include "config.v"' . "\n\n";
  print OUTPUT_BRIDGE "module output_bridge(\n";

  # inputs
  print OUTPUT_BRIDGE "  /* inputs */\n";
  my @inputs = ();

  my $output_data_count = ($width*2) + ($height*2);
  my $port_bits = ceil(log($output_data_count) / log(2)) - 1; # output size = 0 .. $port_bits

  push(@inputs, ("port0", "[$port_bits:0]", "port1", "[$port_bits:0]"));
  print OUTPUT_BRIDGE "  port0,\n  port1,\n";
  push(@inputs, ("rd_en0", "", "rd_en1", ""));
  print OUTPUT_BRIDGE "  rd_en0,\n  rd_en1,\n";

  print OUTPUT_BRIDGE "  // data from core\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    my $id = "d_in_$i";
    push(@inputs, ($id, "[`PATH_WIDTH:0]"));
    print OUTPUT_BRIDGE "  $id,\n";
  }

  print OUTPUT_BRIDGE "  // --\n";
  push(@inputs, ("clk", "", "rst", "", "conf_en", ""));
  print OUTPUT_BRIDGE "  clk,\n  rst,\n  conf_en,\n";

  # outputs
  print OUTPUT_BRIDGE "  /* outputs */\n";
  my @outputs = ();

  print OUTPUT_BRIDGE "  // credit to core\n";
  for (my $i = 0; $i < $output_data_count; $i++) { # same count as data from core count
    my $id = "c_out_$i";
    push(@outputs, ($id, ""));
    print OUTPUT_BRIDGE "  $id,\n";
  }

  push(@outputs, ("d_out0", "[`DATA_WIDTH:0]", "d_out1", "[`DATA_WIDTH:0]"));
  print OUTPUT_BRIDGE "  d_out0,\n  d_out1,\n";
  push(@outputs, ("done0", "", "done1", ""));
  print OUTPUT_BRIDGE "  done0,\n  done1\n";

  print OUTPUT_BRIDGE "  );\n";

  # input definitions
  print OUTPUT_BRIDGE "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print OUTPUT_BRIDGE "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print OUTPUT_BRIDGE "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print OUTPUT_BRIDGE "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # wires
  print OUTPUT_BRIDGE "\n\n";
  print OUTPUT_BRIDGE "////////////////////////////////////////////////\n";
  print OUTPUT_BRIDGE "//\n";
  print OUTPUT_BRIDGE "//    wires\n";
  print OUTPUT_BRIDGE "//\n";
  print OUTPUT_BRIDGE "////////////////////////////////////////////////\n\n";

  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE "wire [`DATA_WIDTH+1:0] fifo_out_$i;\n"; # Data bits and Valid bit
  }

  print OUTPUT_BRIDGE "wire [" . ($output_data_count-1) . ":0] read0;\n";
  print OUTPUT_BRIDGE "wire [" . ($output_data_count-1) . ":0] read1;\n";
  print OUTPUT_BRIDGE "\n";

  # read 0
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE "assign read0[$i] = (port0 == " . ($port_bits+1) . "'d$i) & rd_en0;\n";
  }
  print OUTPUT_BRIDGE "\n";
  
  # read 1
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE "assign read1[$i] = (port1 == " . ($port_bits+1) . "'d$i) & rd_en1;\n";
  }
  print OUTPUT_BRIDGE "\n";
  
  # data out 0
  print OUTPUT_BRIDGE "assign d_out0 =";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? "  " : "/*");
    print OUTPUT_BRIDGE "(port0 == " . ($port_bits+1) . "'d$i)";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " ? " : "*/ ");
    print OUTPUT_BRIDGE "fifo_out_$i" . "[`DATA_WIDTH+1:1]";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " :\n               " : ";\n\n");
  }
  
  # data out 1
  print OUTPUT_BRIDGE "assign d_out1 =";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? "  " : "/*");
    print OUTPUT_BRIDGE "(port1 == " . ($port_bits+1) . "'d$i)";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " ? " : "*/ ");
    print OUTPUT_BRIDGE "fifo_out_$i" . "[`DATA_WIDTH+1:1]";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " :\n               " : ";\n\n");
  }
  
  # done 0
  print OUTPUT_BRIDGE "assign done0 = ";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE "(fifo_out_$i" . "[0] & read0[$i])";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " |\n               " : ";\n\n");
  }
  
  # done 1
  print OUTPUT_BRIDGE "assign done1 = ";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print OUTPUT_BRIDGE "(fifo_out_$i" . "[0] & read1[$i])";
    print OUTPUT_BRIDGE ($i < $output_data_count-1 ? " |\n               " : ";\n\n");
  }
  
  # FIFO's
  print OUTPUT_BRIDGE "\n\n";
  print OUTPUT_BRIDGE "////////////////////////////////////////////////\n";
  print OUTPUT_BRIDGE "//\n";
  print OUTPUT_BRIDGE "//    FIFO\n";
  print OUTPUT_BRIDGE "//\n";
  print OUTPUT_BRIDGE "////////////////////////////////////////////////\n\n";
  
  for (my $idx = 0; $idx < $output_data_count; $idx++) {
    print OUTPUT_BRIDGE "fifo #($idx) f$idx(\n";
    print OUTPUT_BRIDGE "  /* inputs */\n";
    print OUTPUT_BRIDGE "  .d_in(d_in_$idx" . "[`PATH_WIDTH:`META_BITS]),\n";
    print OUTPUT_BRIDGE "  .enq(~conf_en & d_in_$idx" . "[0]),\n";
    print OUTPUT_BRIDGE "  .deq(read0[$idx] | read1[$idx]),\n";
    print OUTPUT_BRIDGE "  .clk(clk),\n";
    print OUTPUT_BRIDGE "  .rst(rst),\n";
    print OUTPUT_BRIDGE "  /* outputs */\n";
    print OUTPUT_BRIDGE "  .d_out(fifo_out_$idx" . "[`DATA_WIDTH+1:1]),\n";
    print OUTPUT_BRIDGE "  .valid(fifo_out_$idx" . "[0]),\n";
    print OUTPUT_BRIDGE "  .busy(), // NC\n";
    print OUTPUT_BRIDGE "  .c_out(c_out_$idx)\n";
    print OUTPUT_BRIDGE "  );\n\n";
  }
  

  print OUTPUT_BRIDGE "endmodule\n";

  close(OUTPUT_BRIDGE);
}


return 1; # success

