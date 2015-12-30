#!/usr/bin/perl

use strict;

our $width;
our $height;



sub GenerateCore {
  print "  Generating core.v ...\n";
  
  print CORE "//core.v\n";
  print CORE "//\n";
  print CORE "//  this file was auto-generated\n";
  print CORE '`include "config.v"' . "\n\n";
  print CORE "module core(\n";

  # inputs
  print CORE "  /* inputs */\n";
  my @inputs = ();

  print CORE "  // data from input bridge\n";
  my $input_data_count = ($width*2) + ($height*2);
  for (my $i = 0; $i < $input_data_count; $i++) {
    my $id = "d_in_$i";
    push(@inputs, ($id, "[`PATH_WIDTH:0]"));
    print CORE "  $id,\n";
  }

  print CORE "  // credit from output bridge\n";
  my $output_data_count = ($width*2) + ($height*2);
  for (my $i = 0; $i < $output_data_count; $i++) {
    my $id = "c_in_$i";
    push(@inputs, ($id, ""));
    print CORE "  $id,\n";
  }

  print CORE "  // --\n";
  push(@inputs, ("conf_en", "", "clk", "", "rst", ""));
  print CORE "  conf_en,\n  clk,\n  rst,\n";

  # outputs
  print CORE "  /* outputs */\n";
  my @outputs = ();

  print CORE "  // data to output bridge\n";
  for (my $i = 0; $i < $output_data_count; $i++) {
    my $id = "d_out_$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print CORE "  $id,\n";
  }

  print CORE "  // credit to input bridge\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    my $id = "c_out_$i";
    push(@outputs, ($id, ""));
    print CORE "  $id" . ($i < $input_data_count-1 ? ",\n" : "\n");
  }

  print CORE "  );\n";

  # input definitions
  print CORE "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print CORE "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print CORE "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print CORE "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # wires
  print CORE "\n\n";
  print CORE "////////////////////////////////////////////////\n";
  print CORE "//\n";
  print CORE "//    wires\n";
  print CORE "//\n";
  print CORE "////////////////////////////////////////////////\n\n";

  my $data_edge_tile_count = ($width-1)*3 + ($height-1)*3 + 1 + 2 + 2; # also credit_tile_edge_count
  my $data_tile_edge_count = $width + $height; # also credit_edge_tile_count

  print CORE "// wires from edge to tile\n";
  print CORE "wire [`PATH_WIDTH:0] ";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "d_et_$i" . ($i < $data_edge_tile_count-1 ? ", " : ";\n");
  }
  print CORE "wire ";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "c_et_$i" . ($i < $data_tile_edge_count-1 ? ", " : ";\n\n");
  }
  print CORE "// wires from tile to edge\n";
  print CORE "wire ";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "c_te_$i" . ($i < $data_edge_tile_count-1 ? ", " : ";\n");
  }
  print CORE "wire [`PATH_WIDTH:0] ";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "d_te_$i" . ($i < $data_tile_edge_count-1 ? ", " : ";\n\n");
  }

  # edge_fabric connections
  print CORE "edge_fabric e0(\n";
  print CORE "  /* inputs */\n";
  print CORE "  // data from input bridge\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print CORE "  .d_in_i$i(d_in_$i),\n";
  }

  print CORE "  // data from tile fabric\n";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "  .d_in_t$i(d_te_$i),\n";
  }

  print CORE "  // credit from output bridge\n";
  my $edge_credit_count = 2;
  my $edge_credit_idx = ($width*2) + ($height*2) - $edge_credit_count;
  for (my $i = 0; $i < $edge_credit_count; $i++) {
    print CORE "  .c_in_o$i(c_in_" . ($edge_credit_idx+$i) . "),\n";
  }

  print CORE "  // credit from tile fabric\n";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "  .c_in_t$i(c_te_$i),\n";
  }

  print CORE "  //--\n";
  print CORE "  .clk(clk),\n";
  print CORE "  .rst(rst),\n";
  print CORE "  .conf_en(conf_en),\n";

  print CORE "  /* outputs */\n";
  print CORE "  // data to tile fabric\n";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "  .d_out_t$i(d_et_$i),\n";
  }

  print CORE "  // data to output bridge\n";
  for (my $i = 0; $i < $edge_credit_count; $i++) {
		print CORE "  .d_out_o$i(d_out_" . ($edge_credit_idx+$i) . "),\n";  
  }

  print CORE "  // credit to tile fabric\n";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "  .c_out_t$i(c_et_$i),\n";
  }

  print CORE "  // credit to input bridge\n";
  for (my $i = 0; $i < $input_data_count; $i++) {
    print CORE "  .c_out_i$i(c_out_$i)" . ($i < $input_data_count-1 ? ",\n" : "\n");
  }
  print CORE "  );\n\n";


  # tile_fabric connections
  print CORE "tile_fabric t0(\n";
  print CORE "  /* inputs */\n";
  print CORE "  // data from edge fabric\n";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "  .d_in_e$i(d_et_$i),\n";
  }

  print CORE "  // credit from output bridge\n";
  for (my $i = 0; $i < $output_data_count - $edge_credit_count; $i++) { # top edge switch receives some credits
    print CORE "  .c_in_o$i(c_in_$i),\n";
  }

  print CORE "  // credit from edge fabric\n";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "  .c_in_e$i(c_et_$i),\n";
  }

  print CORE "  //--\n";
  print CORE "  .clk(clk),\n";
  print CORE "  .rst(rst),\n";
  print CORE "  .conf_en(conf_en),\n";

  print CORE "  /* outputs */\n";
  print CORE "  // data to edge fabric\n";
  for (my $i = 0; $i < $data_tile_edge_count; $i++) {
    print CORE "  .d_out_e$i(d_te_$i),\n";
  }

  print CORE "  // data to output bridge\n";
  for (my $i = 0; $i < $output_data_count - $edge_credit_count; $i++) { # top edge switch outputs some data
    print CORE "  .d_out_o$i(d_out_$i),\n";
  }

  print CORE "  // credit to edge fabric\n";
  for (my $i = 0; $i < $data_edge_tile_count; $i++) {
    print CORE "  .c_out_e$i(c_te_$i)" . ($i < $data_edge_tile_count-1 ? ",\n" : "\n");
  }
  print CORE "  );\n\n";


  print CORE "endmodule\n";

  close(CORE);
}


return 1; # success

