#!/usr/bin/perl

use strict;

use POSIX qw(ceil);


our $PATH_WIDTH;

our $width;
our $height;

our $inst_config_bits;
our $config_bits;



sub GenerateDySERTopLevel {
  print "  Generating dyser.v ...\n";

  print DYSER "//dyser.v\n";
  print DYSER "//\n";
  print DYSER "//  this file was auto-generated\n";
  print DYSER '`include "config.v"' . "\n\n";
  print DYSER "module dyser(\n";

  # inputs
  print DYSER "  /* inputs */\n";
  my @inputs = ();

  
  my $input_data_count = ($width*2) + ($height*2);
  my $output_data_count = ($width*2) + ($height*2);
  
  my $send_port_bits = ceil(log($input_data_count) / log(2)) - 1; # input size = 0 .. $port_bits
  my $recv_port_bits = ceil(log($output_data_count) / log(2)) - 1; # input size = 0 .. $port_bits
  my $inst_config_bits_idx = $inst_config_bits-1;
  
  # dyser_send
  print DYSER "  // dyser_send\n";
  push(@inputs, ("send_data_r0", "[`DATA_WIDTH:0]", "send_data_r1", "[`DATA_WIDTH:0]"));
  print DYSER "  send_data_r0,\n  send_data_r1,\n";
  push(@inputs, ("send_port_r0", "[$send_port_bits:0]", "send_port_r1", "[$send_port_bits:0]"));
  print DYSER "  send_port_r0,\n  send_port_r1,\n";
  push(@inputs, ("send_en0", "", "send_en1", ""));
  print DYSER "  send_en0,\n  send_en1,\n";
  
  # dyser_recv
  print DYSER "  // dyser_recv\n";
  push(@inputs, ("recv_port_r0", "[$recv_port_bits:0]", "recv_port_r1", "[$recv_port_bits:0]"));
  print DYSER "  recv_port_r0,\n  recv_port_r1,\n";
  push(@inputs, ("recv_en0", "", "recv_en1", ""));
  print DYSER "  recv_en0,\n  recv_en1,\n";
  
  # dyser_init
  print DYSER "  // dyser_init\n";
  push(@inputs, ("config_bits", "[$inst_config_bits_idx:0]", "config_en", ""));
  print DYSER "  config_bits,\n  config_en,\n";
  
  # dyser_commit
  print DYSER "  // dyser_commit\n";
  push(@inputs, ("commit", ""));
  print DYSER "  commit,\n";
  
  # --
  print DYSER "  // extra\n";
  push(@inputs, ("clk", "", "rst", ""));
  print DYSER "  clk,\n  rst,\n";
  
  # outputs
  print DYSER "  /* outputs */\n";
  my @outputs = ();

  # dyser_send
  print DYSER "  // dyser_send\n";
  push(@outputs, ("send_stall", ""));
  print DYSER "  send_stall,\n";
  
  # dyser_recv
  print DYSER "  // dyser_recv\n";
  push(@outputs, ("recv_data_r0", "[`DATA_WIDTH:0]", "recv_data_r1", "[`DATA_WIDTH:0]"));
  print DYSER "  recv_data_r0,\n  recv_data_r1,\n";
  push(@outputs, ("recv_stall", ""));
  print DYSER "  recv_stall\n";
  
  print DYSER "  );\n";

  # input definitions
  print DYSER "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print DYSER "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print DYSER "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print DYSER "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # wires
  print DYSER "\n\n";
  print DYSER "////////////////////////////////////////////////\n";
  print DYSER "//\n";
  print DYSER "//    wires\n";
  print DYSER "//\n";
  print DYSER "////////////////////////////////////////////////\n\n";


  # input_bridge - core interface
  for (my $i = 0; $i < $input_data_count; $i++) {
    print DYSER "wire [`PATH_WIDTH:0] d_i_$i;\n";
  }
  for (my $i = 0; $i < $input_data_count; $i++) {
    print DYSER "wire c_i_$i;\n";
  }
  print DYSER "wire busy_i_0;\n";
  print DYSER "wire busy_i_1;\n\n";
  
  
  # core - output_bridge interface
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "wire [`PATH_WIDTH:0] d_o_$i;\n";
  }
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "wire c_o_$i;\n";
  }
  print DYSER "wire done_o_0;\n";
  print DYSER "wire done_o_1;\n\n";

  # stall signals
  print DYSER "// stall signals\n";
  print DYSER "assign send_stall = (send_en0 &  busy_i_0) | (send_en1 &  busy_i_1);\n";
  print DYSER "assign recv_stall = (recv_en0 & \~done_o_0) | (recv_en1 & \~done_o_1);\n\n";
  
  
  # input_bridge
  print DYSER "input_bridge i0(\n";
  print DYSER "  /* inputs */\n";
  print DYSER "  .d_in0(send_data_r0),\n";
  print DYSER "  .d_in1(send_data_r1),\n";
  print DYSER "  .port0(send_port_r0),\n";
  print DYSER "  .port1(send_port_r1),\n";
  print DYSER "  .wr_en0(send_en0),\n";
  print DYSER "  .wr_en1(send_en1),\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print DYSER "  .c_in_$i(c_i_$i),\n";
  }
  print DYSER "  .conf_en(config_en),\n";
  print DYSER "  .clk(clk),\n";
  print DYSER "  .rst(rst),\n";
  print DYSER "  /* outputs */\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print DYSER "  .d_out_$i(d_i_$i),\n";
  }
  print DYSER "  .busy0(busy_i_0),\n";
  print DYSER "  .busy1(busy_i_1)\n";
  print DYSER "  );\n\n";


  # output_bridge
  print DYSER "output_bridge o0(\n";
  print DYSER "  /* inputs */\n";
  print DYSER "  .port0(recv_port_r0),\n";
  print DYSER "  .port1(recv_port_r1),\n";
  print DYSER "  .rd_en0(recv_en0),\n";
  print DYSER "  .rd_en1(recv_en1),\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "  .d_in_$i(d_o_$i),\n";
  }
  print DYSER "  .conf_en(config_en),\n";
  print DYSER "  .clk(clk),\n";
  print DYSER "  .rst(rst),\n";
  print DYSER "  /* outputs */\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "  .c_out_$i(c_o_$i),\n";
  }
  print DYSER "  .d_out0(recv_data_r0),\n";
  print DYSER "  .d_out1(recv_data_r1),\n";
  print DYSER "  .done0(done_o_0),\n";
  print DYSER "  .done1(done_o_1)\n";
  print DYSER "  );\n\n";


  # core
  print DYSER "// Multiplex the configuration bits into the Core's existing data network\n";
  print DYSER "wire   [`PATH_WIDTH:0] di0_or_conf;\n";
  print DYSER "assign di0_or_conf = (config_en ? (`CONF_WIDTH == `PATH_WIDTH ? config_bits[`CONF_WIDTH:0] : {d_i_0[`PATH_WIDTH:`CONF_BITS], config_bits[`CONF_WIDTH:0]}) : d_i_0);\n\n";

  
  print DYSER "core c0(\n";
  print DYSER "  /* inputs */\n";
  print DYSER "  // data from input bridge\n";
  print DYSER "  .d_in_0(di0_or_conf),\n";
  for (my $i = 1; $i < $input_data_count; $i++) {
    print DYSER "  .d_in_$i(d_i_$i),\n";
  }
  print DYSER "  // credit from output bridge\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "  .c_in_$i(c_o_$i),\n";
  }
  print DYSER "  .conf_en(config_en),\n";
  print DYSER "  .clk(clk),\n";
  print DYSER "  .rst(rst),\n";
  print DYSER "  /* outputs */\n";
  print DYSER "  // data to output bridge\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    print DYSER "  .d_out_$i(d_o_$i),\n";
  }
  print DYSER "  // credit to input bridge\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print DYSER "  .c_out_$i(c_i_$i)" . ($i < $input_data_count-1 ? ",\n" : "\n");
  }
  print DYSER "  );\n\n";


  print DYSER "endmodule\n";

  close(DYSER);
}



return 1; # success

