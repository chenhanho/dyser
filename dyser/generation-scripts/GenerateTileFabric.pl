#!/usr/bin/perl

use strict;

our $width;
our $height;



sub GenerateTileFabric {
  print "  Generating tile_fabric.v ...\n";
  
  print TILE_FABRIC "//tile_fabric.v\n";
  print TILE_FABRIC "//\n";
  print TILE_FABRIC "//  this file was auto-generated\n";
  print TILE_FABRIC '`include "config.v"' . "\n\n";
  print TILE_FABRIC "module tile_fabric(\n";

  # inputs
  print TILE_FABRIC "  /* inputs */\n";
  my @inputs = ();

  print TILE_FABRIC "  // data from edge fabric\n";
  my $edge_data_count = ($width-1)*3 + ($height-1)*3 + 1 + 2 + 2;
  for (my $i = 0; $i < $edge_data_count; $i++) {
    my $id = "d_in_e$i";
    push(@inputs, ($id, "[`PATH_WIDTH:0]"));
    print TILE_FABRIC "  $id,\n";
  }

  print TILE_FABRIC "  // credit from output bridge\n";
  my $edge_output_count = 2; # Edge switch outputs 2 data
  my $output_credit_count = ($width*2) + ($height*2) - $edge_output_count;
  for (my $i = 0; $i < $output_credit_count; $i++) {
    my $id = "c_in_o$i";
    push(@inputs, ($id, ""));
    print TILE_FABRIC "  $id,\n";
  }

  print TILE_FABRIC "  // credit from edge fabric\n";
  my $edge_credit_count = $width + $height;
  for (my $i = 0; $i < $edge_credit_count; $i++) {
    my $id = "c_in_e$i";
    push(@inputs, ($id, ""));
    print TILE_FABRIC "  $id,\n";
  }

  print TILE_FABRIC "  // --\n";
  push(@inputs, ("clk", "", "rst", "", "conf_en", ""));
  print TILE_FABRIC "  clk,\n  rst,\n  conf_en,\n";

  # outputs
  print TILE_FABRIC "  /* outputs */\n";
  my @outputs = ();

  print TILE_FABRIC "  // data to edge fabric\n";
  for (my $i = 0; $i < $edge_credit_count; $i++) { # data to edge count is same as credit from edge count
    my $id = "d_out_e$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print TILE_FABRIC "  $id,\n";
  }

  print TILE_FABRIC "  // data to core output bridge\n";
  for (my $i = 0; $i < $output_credit_count; $i++) { # same count as credit from output bridge count
    my $id = "d_out_o$i";
    push(@outputs, ($id, "[`PATH_WIDTH:0]"));
    print TILE_FABRIC "  $id,\n";
  }

  print TILE_FABRIC "  // credit to edge fabric\n";
  for (my $i = 0; $i < $edge_data_count; $i++) { # same count as data from edge count
    my $id = "c_out_e$i";
    push(@outputs, ($id, ""));
    print TILE_FABRIC "  $id" . ($i < $edge_data_count-1 ? ",\n" : "\n");
  }

  print TILE_FABRIC "  );\n";

  # input definitions
  print TILE_FABRIC "\n/* inputs */\n";
  for (my $i = 0; $i < $#inputs; $i+=2) {
    print TILE_FABRIC "input " . $inputs[$i+1] . " " . $inputs[$i] . ";\n";
  }

  # output definitions
  print TILE_FABRIC "\n/* outputs */\n";
  for (my $i = 0; $i < $#outputs; $i+=2) {
    print TILE_FABRIC "output " . $outputs[$i+1] . " " . $outputs[$i] . ";\n";
  }

  # tiles
  print TILE_FABRIC "\n\n";
  print TILE_FABRIC "////////////////////////////////////////////////\n";
  print TILE_FABRIC "//\n";
  print TILE_FABRIC "//    tiles and wires\n";
  print TILE_FABRIC "//\n";
  print TILE_FABRIC "////////////////////////////////////////////////\n\n";

  for (my $y = 0; $y < $height; $y++) {
    for (my $x = 0; $x < $width; $x++) {
      my $idx = ($y * $width) + $x;
      my $idxN = $idx - $width;
      my $idxS = $idx + $width;
      my $idxW = $idx - 1;
      my $idxE = $idx + 1;
      my $idxNW = $idxN - 1;
      my $idxNE = $idxN + 1;
      my $idxSW = $idxS - 1;
      my $idxSE = $idxS + 1;
      
      # generate wires
      #  o = orthogonal channels
      #  format:  d_<from>_<to>
      print TILE_FABRIC "/* tile $idx output wires (data and credit lines) */\n";
      if ($x < $width-1 || $y < $height-1) {
        # Data wires
        my $hasEast = ($x < $width-1);
        my $hasSouth = ($y < $height-1);
        my $hasSouthEast = $hasEast && $hasSouth;
        my $comma1 = ($hasEast && ($hasSouthEast || $hasSouth)) ? ", " : "";
        my $comma2 = ($hasSouthEast && $hasSouth) ? ", " : "";
        print TILE_FABRIC "wire [`PATH_WIDTH:0] " . ($hasEast ? "d_$idx\_$idxE, d_o_$idx\_$idxE" : "") . $comma1 . ($hasSouthEast ? "d_$idx\_$idxSE" : "") . $comma2 . ($hasSouth ? "d_$idx\_$idxS, d_o_$idx\_$idxS" : "") . ";\n";
      	
      	# Credit wires
        my $comma = ($x < $width-1 && $y < $height-1) ? ", " : "";
        print TILE_FABRIC "wire " . ($y < $height-1 ? "c_o_$idx\_$idxS" : "") . $comma . ($x < $width-1 ? "c_o_$idx\_$idxE" : "") . ";\n";
      }
      print TILE_FABRIC "/* tile $idx input wires (credit and data lines) */\n";
      if ($x < $width-1 || $y < $height-1) {
        # Credit wires
        my $hasEast = ($x < $width-1);
        my $hasSouth = ($y < $height-1);
        my $hasSouthEast = $hasEast && $hasSouth;
        my $comma1 = ($hasEast && ($hasSouthEast || $hasSouth)) ? ", " : "";
        my $comma2 = ($hasSouthEast && $hasSouth) ? ", " : "";
        print TILE_FABRIC "wire " . ($hasEast ? "c_$idxE\_$idx, c_o_$idxE\_$idx" : "") . $comma1 . ($hasSouthEast ? "c_$idxSE\_$idx" : "") . $comma2 . ($hasSouth ? "c_$idxS\_$idx, c_o_$idxS\_$idx" : "") . ";\n";
      	
      	# Data wires
        my $comma = ($x < $width-1 && $y < $height-1) ? ", " : "";
        print TILE_FABRIC "wire [`PATH_WIDTH:0] " . ($y < $height-1 ? "d_o_$idxS\_$idx" : "") . $comma . ($x < $width-1 ? "d_o_$idxE\_$idx" : "") . ";\n";
      }      
      
      # generate parameters
      my $d_in_f_NW = ($x > 0 && $y > 0) ? "d_$idxNW\_$idx" : ("d_in_e" . ($x*3 + $y*3 + ($y > 0 ? $width*3 - 1 : 0)));
      my $d_in_f_NE = ($y > 0) ? "d_$idxN\_$idx" : ("d_in_e" . ($x*3 + 1));
      my $d_in_f_SW = ($x > 0) ? "d_$idxW\_$idx" : ("d_in_e" . ($y*3 + $width*3));
      my $d_in_s_N = ($y > 0) ? "d_o_$idxN\_$idx" : ("d_in_e" . ($x*3 + 2));
      my $d_in_s_E = ($x < $width-1) ? "d_o_$idxE\_$idx" : "{`PATH_BITS{1'b0}}"; # Not Connected
      my $d_in_s_S = ($y < $height-1) ? "d_o_$idxS\_$idx" : "{`PATH_BITS{1'b0}}"; # NC
      my $d_in_s_W = ($x > 0) ? "d_o_$idxW\_$idx" : ("d_in_e" . ($y*3 + $width*3 + 1));

      my $c_in_s_N = ($y > 0) ? "c_o_$idxN\_$idx" : ("c_in_e" . $x);
      my $c_in_s_NE = ($x < $width-1) ? "c_$idxE\_$idx" : ""; # NC
      my $c_in_s_E = ($x < $width-1) ? "c_o_$idxE\_$idx" : "c_in_o" . (($width-1)*2 + ($height-1-$y)*2 + 1);
      my $c_in_s_SE = ($x < $width-1) ? ($y < $height-1 ? "c_$idxSE\_$idx" : "c_in_o" . ($x*2+1)) : "c_in_o" . (($width-1)*2 + ($height-1-$y)*2);
      my $c_in_s_S = ($y < $height-1) ? "c_o_$idxS\_$idx" : ($x < $width-1 ? "c_in_o" . ($x*2) : "1'b0"); # NC
      my $c_in_s_SW = ($y < $height-1) ? "c_$idxS\_$idx" : "1'b0"; # NC
      my $c_in_s_W = ($x > 0) ? "c_o_$idxW\_$idx" : ("c_in_e" . ($y + $width));

      my $d_out_s_N = ($y > 0) ? "d_o_$idx\_$idxN" : ("d_out_e" . $x);
      my $d_out_s_NE = ($x < $width-1) ? "d_$idx\_$idxE" : ""; # NC
      my $d_out_s_E = ($x < $width-1) ? "d_o_$idx\_$idxE" : "d_out_o" . (($width-1)*2 + ($height-1-$y)*2 + 1);
      my $d_out_s_SE = ($x < $width-1) ? ($y < $height-1 ? "d_$idx\_$idxSE" : "d_out_o" . ($x*2+1)) : "d_out_o" . (($width-1)*2 + ($height-1-$y)*2);
      my $d_out_s_S = ($y < $height-1) ? "d_o_$idx\_$idxS" : ($x < $width-1 ? "d_out_o" . ($x*2) : ""); # NC
      my $d_out_s_SW = ($y < $height-1) ? "d_$idx\_$idxS" : ""; # NC
      my $d_out_s_W = ($x > 0) ? "d_o_$idx\_$idxW" : ("d_out_e" . ($y + $width));

      my $c_out_f_NW = ($x > 0 && $y > 0) ? "c_$idx\_$idxNW" : ("c_out_e" . ($x*3 + $y*3 + ($y > 0 ? $width*3 - 1 : 0)));
      my $c_out_f_NE = ($y > 0) ? "c_$idx\_$idxN" : ("c_out_e" . ($x*3 + 1));
      my $c_out_f_SW = ($x > 0) ? "c_$idx\_$idxW" : ("c_out_e" . ($y*3 + $width*3));
      my $c_out_s_N = ($y > 0) ? "c_o_$idx\_$idxN" : ("c_out_e" . ($x*3 + 2));
      my $c_out_s_E = ($x < $width-1) ? "c_o_$idx\_$idxE" : ""; # NC
      my $c_out_s_S = ($y < $height-1) ? "c_o_$idx\_$idxS" : ""; # NC
      my $c_out_s_W = ($x > 0) ? "c_o_$idx\_$idxW" : ("c_out_e" . ($y*3 + $width*3 + 1));

      # Types: ALU=0  LOGIC=1
      my $comp_type = 0;
      
      my $conf_in_direction = ($y%2 != $height%2) ? "`WEST" : ($x == $width-1 ? "`SOUTH" : "`EAST");
      my $conf_out_direction = ($y%2 != $height%2) ? ($x == $width-1 ? "`NORTH" : "`EAST") : "`WEST";

      # generate tile
      print TILE_FABRIC "\ntile #($idx, $comp_type, $conf_in_direction, $conf_out_direction) t$idx(\n";
      print TILE_FABRIC "  /* inputs */\n";
      print TILE_FABRIC "  .d_in_f_NW($d_in_f_NW),\n";
      print TILE_FABRIC "  .d_in_f_NE($d_in_f_NE),\n";
      print TILE_FABRIC "  .d_in_f_SW($d_in_f_SW),\n";
      print TILE_FABRIC "  .d_in_s_N($d_in_s_N),\n";
      print TILE_FABRIC "  .d_in_s_E($d_in_s_E),\n";
      print TILE_FABRIC "  .d_in_s_S($d_in_s_S),\n";
      print TILE_FABRIC "  .d_in_s_W($d_in_s_W),\n";
      print TILE_FABRIC "  .c_in_s_N($c_in_s_N),\n";
      print TILE_FABRIC "  .c_in_s_NE($c_in_s_NE),\n";
      print TILE_FABRIC "  .c_in_s_E($c_in_s_E),\n";
      print TILE_FABRIC "  .c_in_s_SE($c_in_s_SE),\n";
      print TILE_FABRIC "  .c_in_s_S($c_in_s_S),\n";
      print TILE_FABRIC "  .c_in_s_SW($c_in_s_SW),\n";
      print TILE_FABRIC "  .c_in_s_W($c_in_s_W),\n";
      print TILE_FABRIC "  .clk(clk),\n";
      print TILE_FABRIC "  .rst(rst),\n";
      print TILE_FABRIC "  .conf_en(conf_en),\n";

      print TILE_FABRIC "  /* outputs */\n";
      print TILE_FABRIC "  .d_out_s_N($d_out_s_N),\n";
      print TILE_FABRIC "  .d_out_s_NE($d_out_s_NE),\n";
      print TILE_FABRIC "  .d_out_s_E($d_out_s_E),\n";
      print TILE_FABRIC "  .d_out_s_SE($d_out_s_SE),\n";
      print TILE_FABRIC "  .d_out_s_S($d_out_s_S),\n";
      print TILE_FABRIC "  .d_out_s_SW($d_out_s_SW),\n";
      print TILE_FABRIC "  .d_out_s_W($d_out_s_W),\n";
      print TILE_FABRIC "  .c_out_f_NW($c_out_f_NW),\n";
      print TILE_FABRIC "  .c_out_f_NE($c_out_f_NE),\n";
      print TILE_FABRIC "  .c_out_f_SW($c_out_f_SW),\n";
      print TILE_FABRIC "  .c_out_s_N($c_out_s_N),\n";
      print TILE_FABRIC "  .c_out_s_E($c_out_s_E),\n";
      print TILE_FABRIC "  .c_out_s_S($c_out_s_S),\n";
      print TILE_FABRIC "  .c_out_s_W($c_out_s_W)\n";
      print TILE_FABRIC "  );\n\n";
    }
  }

  print TILE_FABRIC "endmodule\n";

  close(TILE_FABRIC);
}


return 1; # success

