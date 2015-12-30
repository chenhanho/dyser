#!/usr/bin/perl

use strict;

our $width;
our $height;



sub GenerateEdgeFabric {
  print "  Generating edge_fabric.v ...\n";
  
  print EDGE_FABRIC "//edge_fabric.v\n";
  print EDGE_FABRIC "//\n";
  print EDGE_FABRIC "//  this file was auto-generated\n";
  print EDGE_FABRIC '`include "config.v"' . "\n\n";
  print EDGE_FABRIC "module edge_fabric(\n";

  # inputs
  print EDGE_FABRIC "  /* inputs */\n";
  my @inputs = ();

  print EDGE_FABRIC "  // data from input bridge\n";
  my $input_data_count = ($width*2) + ($height*2);
  for (my $i = 0; $i < $input_data_count; $i++) {
    my $id = "d_in_i$i";
    push(@inputs, ($id, "[`PATH_WIDTH:0]"));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // data from tile fabric\n";
  my $tile_data_count = $width + $height;
  for (my $i = 0; $i < $tile_data_count; $i++) {
    my $id = "d_in_t$i";
    push(@inputs, ($id, "[`PATH_WIDTH:0]"));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // credit from output bridge\n";
  my $output_credit_count = 2;
  for (my $i = 0; $i < $output_credit_count; $i++) {
    my $id = "c_in_o$i";
    push(@inputs, ($id, ""));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // credit from tile fabric\n";
  my $tile_credit_count = ($width-1)*3 + ($height-1)*3 + 1 + 2 + 2;
  for (my $i = 0; $i < $tile_credit_count; $i++) {
    my $id = "c_in_t$i";
    push(@inputs, ($id, ""));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // --\n";
  push(@inputs, ("clk", "", "rst", "", "conf_en", ""));
  print EDGE_FABRIC "  clk,\n  rst,\n  conf_en,\n";

  # outputs
  print EDGE_FABRIC "  /* outputs */\n";
  my @outputs = ();

  print EDGE_FABRIC "  // data to tile fabric\n";
  for (my $i = 0; $i < $tile_credit_count; $i++) { # data to tile count is same as credit from tile count
    my $id = "d_out_t$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // data to core output bridge\n";
  for (my $i = 0; $i < $output_credit_count; $i++) { # same count as credit from output bridge count
    my $id = "d_out_o$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // credit to tile fabric\n";
  for (my $i = 0; $i < $tile_data_count; $i++) { # same count as data from tile count
    my $id = "c_out_t$i";
    push(@outputs, ($id, ""));
    print EDGE_FABRIC "  $id,\n";
  }

  print EDGE_FABRIC "  // credit to input bridge\n";
  for (my $i = 0; $i < $input_data_count; $i++) { # same count as data from input bridge count
    my $id = "c_out_i$i";
    push(@outputs, ($id, ""));
    print EDGE_FABRIC "  $id" . ($i < $input_data_count-1 ? ",\n" : "\n");
  }

  print EDGE_FABRIC "  );\n";

  # input definitions
  print EDGE_FABRIC "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print EDGE_FABRIC "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print EDGE_FABRIC "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print EDGE_FABRIC "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # switches
  print EDGE_FABRIC "\n\n";
  print EDGE_FABRIC "////////////////////////////////////////////////\n";
  print EDGE_FABRIC "//\n";
  print EDGE_FABRIC "//    wires and switches\n";
  print EDGE_FABRIC "//\n";
  print EDGE_FABRIC "////////////////////////////////////////////////\n\n";

  for (my $idx = 0; $idx < $width + $height + 1; $idx++) {
    my $x = ($idx > $width ? 0 : $idx);
    my $y = ($idx < $width ? 0 : $idx - $width);
    
    my $idxE = $idx+1;
    my $idxW = $idx-1;
    my $idxS = ($x==0 && $y==0 ? $width+1 : $idx+1); # special case for corner switch
    my $idxN = ($x==0 && $y==1 ? 0 : $idx-1); # special case to handle corner switch
    
    # generate wires
    #  d/c = data/credit lines
    #  numbers:  <from>_<to>
    #  eg. d_0_9  data line from switch 0 to switch 9
    print EDGE_FABRIC "/* switch $idx wires */\n";
    if ($x < $width && $y < $height) {
      my $hasEast = ($y == 0 && $x < $width);
      my $hasSouth = ($x == 0 && $y < $height);
      my $comma = ($hasEast && $hasSouth) ? ", " : "";
      print EDGE_FABRIC "wire [`PATH_WIDTH:0] " . ($hasEast ? "d_$idx\_$idxE, d_$idxE\_$idx" : "") . $comma . ($hasSouth ? "d_$idx\_$idxS, d_$idxS\_$idx" : "") . ";\n";
      print EDGE_FABRIC "wire " . ($hasEast ? "c_$idx\_$idxE, c_$idxE\_$idx" : "") . $comma . ($hasSouth ? "c_$idx\_$idxS, c_$idxS\_$idx" : "") . ";\n";
    }  

    # generate parameters
		my $d_in_NW = ($x == 0) ? "d_in_i" . (($height-$y)*2 + 1) : ($x < $width ? "d_in_i" . ($height*2 + $x*2) : "{`PATH_BITS{1'b0}}"); # Not Connected (top-right corner)
    my $d_in_N = ($x == 0) ? ($y > 0 ? "d_$idxN\_$idx" : "{`PATH_BITS{1'b0}}") : ($x < $width ? "d_in_i" . ($height*2 + $x*2 + 1) : "{`PATH_BITS{1'b0}}"); # Not Connected (top-left + top-right corner)
    my $d_in_E = ($x == $width) ? "{`PATH_BITS{1'b0}}" : ($y > 0 ? "d_in_t" . ($idx-1) : "d_$idxE\_$idx"); # NC
    my $d_in_S = ($y == $height) ? "{`PATH_BITS{1'b0}}" : ($x > 0 ? "d_in_t" . ($idx-1) : "d_$idxS\_$idx"); # NC
    my $d_in_W = ($x == 0) ? "d_in_i" . ($height-$y)*2 : "d_$idxW\_$idx";

    my $c_in_NW = "1'b0"; # NC
    my $c_in_N = ($y > 0) ? "c_$idxN\_$idx" : "1'b0"; # NC
    my $c_in_NE = ($x == $width) ? "1'b0" : ($y > 0 ? "c_in_t" . (1+($width-1)*3+2 + ($y-1)*3) : "1'b0"); # NC
    my $c_in_E = ($x == $width) ? "c_in_o1" : ($y > 0 ? "c_in_t" . (1+($width-1)*3+2 + ($y-1)*3+1) : "c_$idxE\_$idx");
    my $c_in_SE = ($x == $width) ? "c_in_o0" : ($y == $height ? "1'b0" : "c_in_t" . ($y == 0 ? $x*3 : (1+($width-1)*3+2 + ($y-1)*3+2))); # NC
    my $c_in_S = ($y == $height) ? "1'b0" : ($x > 0 ? "c_in_t" . ($x*3 - 1) : "c_$idxS\_$idx"); # NC
    my $c_in_SW = ($x > 0) ? "c_in_t" . ($x*3 - 2) : "1'b0"; # NC
    my $c_in_W = ($x > 0) ? "c_$idxW\_$idx" : "1'b0"; # NC

    my $d_out_NW = ""; # NC
    my $d_out_N = ($y > 0) ? "d_$idx\_$idxN" : ""; # NC
    my $d_out_NE = ($x == $width) ? "" : ($y > 0 ? "d_out_t" . (1+($width-1)*3+2 + ($y-1)*3) : ""); # NC
    my $d_out_E = ($x == $width) ? "d_out_o1" : ($y > 0 ? "d_out_t" . (1+($width-1)*3+2 + ($y-1)*3+1) : "d_$idx\_$idxE");
    my $d_out_SE = ($x == $width) ? "d_out_o0" : ($y == $height ? "" : "d_out_t" . ($y == 0 ? $x*3 : (1+($width-1)*3+2 + ($y-1)*3+2))); # NC
    my $d_out_S = ($y == $height) ? "" : ($x > 0 ? "d_out_t" . ($x*3 - 1) : "d_$idx\_$idxS"); # NC
    my $d_out_SW = ($x > 0) ? "d_out_t" . ($x*3 - 2) : ""; # NC
    my $d_out_W = ($x > 0) ? "d_$idx\_$idxW" : ""; # NC

		my $c_out_NW = ($x == 0) ? "c_out_i" . (($height-$y)*2 + 1) : ($x < $width ? "c_out_i" . ($height*2 + $x*2) : ""); # Not Connected (top-right corner)
    my $c_out_N = ($x == 0) ? ($y > 0 ? "c_$idx\_$idxN" : "") : ($x < $width ? "c_out_i" . ($height*2 + $x*2 + 1) : ""); # Not Connected (top-left + top-right corner)
    my $c_out_E = ($x == $width) ? "" : ($y > 0 ? "c_out_t" . ($idx-1) : "c_$idx\_$idxE"); # NC
    my $c_out_S = ($y == $height) ? "" : ($x > 0 ? "c_out_t" . ($idx-1) : "c_$idx\_$idxS"); # NC
    my $c_out_W = ($x == 0) ? "c_out_i" . ($height-$y)*2 : "c_$idx\_$idxW";

    my $conf_in_direction = ($y == $height) ? "`WEST" : ($y%2 == $height%2 ? ($x == 0 ? "`SOUTH" : "`WEST") : ($x == $width ? "`SOUTH" : "`EAST"));
    my $conf_out_direction = ($y%2 == $height%2) ? "`EAST" : ($y == 0 ? "`WEST" : "`NORTH");

    # generate tile
    print EDGE_FABRIC "\nswitch #(" . (100+$idx) . ", 1, $conf_in_direction, $conf_out_direction) s$idx(\n";
    print EDGE_FABRIC "  /* inputs */\n";
    print EDGE_FABRIC "  .d_in_NW($d_in_NW),\n";
    print EDGE_FABRIC "  .d_in_N($d_in_N),\n";
    print EDGE_FABRIC "  .d_in_E($d_in_E),\n";
    print EDGE_FABRIC "  .d_in_S($d_in_S),\n";
    print EDGE_FABRIC "  .d_in_W($d_in_W),\n";
    print EDGE_FABRIC "  .c_in_NW($c_in_NW),\n";
    print EDGE_FABRIC "  .c_in_N($c_in_N),\n";
    print EDGE_FABRIC "  .c_in_NE($c_in_NE),\n";
    print EDGE_FABRIC "  .c_in_E($c_in_E),\n";
    print EDGE_FABRIC "  .c_in_SE($c_in_SE),\n";
    print EDGE_FABRIC "  .c_in_S($c_in_S),\n";
    print EDGE_FABRIC "  .c_in_SW($c_in_SW),\n";
    print EDGE_FABRIC "  .c_in_W($c_in_W),\n";
    print EDGE_FABRIC "  .clk(clk),\n";
    print EDGE_FABRIC "  .rst(rst),\n";
    print EDGE_FABRIC "  .conf_en(conf_en),\n";

    print EDGE_FABRIC "  /* outputs */\n";
    print EDGE_FABRIC "  .d_out_NW($d_out_NW),\n";
    print EDGE_FABRIC "  .d_out_N($d_out_N),\n";
    print EDGE_FABRIC "  .d_out_NE($d_out_NE),\n";
    print EDGE_FABRIC "  .d_out_E($d_out_E),\n";
    print EDGE_FABRIC "  .d_out_SE($d_out_SE),\n";
    print EDGE_FABRIC "  .d_out_S($d_out_S),\n";
    print EDGE_FABRIC "  .d_out_SW($d_out_SW),\n";
    print EDGE_FABRIC "  .d_out_W($d_out_W),\n";
    print EDGE_FABRIC "  .c_out_NW($c_out_NW),\n";
    print EDGE_FABRIC "  .c_out_N($c_out_N),\n";
    print EDGE_FABRIC "  .c_out_E($c_out_E),\n";
    print EDGE_FABRIC "  .c_out_S($c_out_S),\n";
    print EDGE_FABRIC "  .c_out_W($c_out_W),\n";
    print EDGE_FABRIC "  .fu_conf()\n"; # NC
    print EDGE_FABRIC "  );\n\n";
  }

  print EDGE_FABRIC "endmodule\n";

  close(EDGE_FABRIC);
}


return 1; # success

