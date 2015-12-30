#!/usr/bin/perl

# 
# Generate a DySER module
#
#  usage:  dyser_gen.pl <width> <height> [output directory]
# 

use strict;

use File::Copy;


require "GenerateCore.pl";
require "GenerateEdgeFabric.pl";
require "GenerateTileFabric.pl";
require "GenerateInputBridge.pl";
require "GenerateOutputBridge.pl";
require "GenerateDySERTopLevel.pl";



our $PATH_WIDTH = 64;

our $width = 1;
our $height = 1;

our $inst_config_bits = 21; # config bits encoded in instruction
our $config_bits = 48; # total bits per Tile



sub ProcessArguments {
  my $argc = $#ARGV + 1;
  my $usage = "usage:  dyser_gen.pl <width> <height> [output directory]\n";
  my $width_error = "  parameter <width> must be between 1 and 16\n";
  my $height_error = "  parameter <height> must be between 1 and 16\n";

  if ($argc < 2 || $argc > 3) {
    die($usage);
  }

  # DySER width
  $width = int($ARGV[0]) or die($usage, $width_error);
  if ($width < 1 || $width > 16) {
    die($usage, $width_error);
  }

  # DySER height
  $height = int($ARGV[1]) or die($usage, $height_error);
  if ($height < 1 || $height > 16) {
    die($usage, $height_error);
  }

  # output directory for auto-generated files
  my $outputDir = ($argc >= 3) ? $ARGV[2] : "dyser_gen";

  mkdir($outputDir) or die($!);

  open(TILE_FABRIC, ">$outputDir/tile_fabric.v") or die($!);
  open(EDGE_FABRIC, ">$outputDir/edge_fabric.v") or die($!);
  open(CORE, ">$outputDir/core.v") or die($!);
  open(INPUT_BRIDGE, ">$outputDir/input_bridge.v") or die($!);
  open(OUTPUT_BRIDGE, ">$outputDir/output_bridge.v") or die($!);
  open(DYSER, ">$outputDir/dyser.v") or die($!);
  
  # copy DySER component files over
  copy("../reference-rtl/comp_logic.v", "$outputDir/comp_logic.v") or die($!);
  copy("../reference-rtl/config.v", "$outputDir/config.v") or die($!);
  copy("../reference-rtl/ff_stage.v", "$outputDir/ff_stage.v") or die($!);
  copy("../reference-rtl/fifo.v", "$outputDir/fifo.v") or die($!);
  copy("../reference-rtl/functional_unit.v", "$outputDir/functional_unit.v") or die($!);
  copy("../reference-rtl/fu_stage.v", "$outputDir/fu_stage.v") or die($!);
  copy("../reference-rtl/switch_output.v", "$outputDir/switch_output.v") or die($!);
  copy("../reference-rtl/switch.v", "$outputDir/switch.v") or die($!);
  copy("../reference-rtl/tile.v", "$outputDir/tile.v") or die($!);
}




&ProcessArguments;

print "Generating DySER ($width, $height) block\n";

&GenerateTileFabric;
&GenerateEdgeFabric;
&GenerateCore;
&GenerateInputBridge;
&GenerateOutputBridge;
&GenerateDySERTopLevel;


print "\n";

