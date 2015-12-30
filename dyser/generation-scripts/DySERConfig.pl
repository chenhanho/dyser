#!/usr/bin/perl

# 
# Generate the configuration for DySER module
#
#  usage:  DySERConfig.pl <input-file>
# 

use strict;

use POSIX;
use Switch;



my $width = 1;
my $height = 1;
my $TB = 0;

my $inst_config_bits = 21; # config bits encoded in instruction

my $switch_config_bits = 32; # config bits required per switch
my $funcUnit_config_bits = 16; # config bits required per functional unit

my $const_bits = 8; # number of bits for constant



&ProcessArguments;



sub ProcessArguments {
  my $argc = $#ARGV + 1;
  my $usage = "usage:  DySERConfig.pl <input-file> [--tb]\n";
  my $input_file_error = "  parameter <input-file> must be a valid file\n";
  my $width_error = "  parameter <width> must be between 1 and 16\n";
  my $height_error = "  parameter <height> must be between 1 and 16\n";

  if ($argc != 1 && $argc != 2) {
    die($usage);
  }

  # Input File
  my $input_file = $ARGV[0] or die($usage, $input_file_error);
  open(INPUT_FILE, $input_file) or die($!);
  
  if ($argc == 2 && $ARGV[1] eq "--tb") {
    $TB = 1;
  }
  
  my $line = <INPUT_FILE>;
  my @params = split(/ /, $line);
  if ($#params+1 != 2) {
    die($usage, $input_file_error);
  }
  
  # DySER width
  $width = int($params[0]) or die($usage, $width_error);
  if ($width < 1 || $width > 16) {
    die($usage, $width_error);
  }

  # DySER height
  $height = int($params[1]) or die($usage, $height_error);
  if ($height < 1 || $height > 16) {
    die($usage, $height_error);
  }
}


sub FuncUnitDirectionToBits {
  my $dir = $_[0];
  
  switch ($dir) {
    case 'SW' { return "00"; }
    case 'NW' { return "01"; }
    case 'NE' { return "10"; }
    case 'SE' { return "11"; }
  }
  
  return "00";
}


sub GetFuncUnitConfigBits {
  my $input0 = $_[0];
  my $input1 = $_[1];
  my $predDir = $_[2];
  my $predValue = $_[3];
  my $func = $_[4];
  
  my $bits = '';
  
  # Function
  switch ($func) {
    case '00' { $bits .= "00"; }
    case '01' { $bits .= "01"; }
    case '10' { $bits .= "10"; }
    case '11' { $bits .= "11"; }
    else { $bits .= "00"; }
  }
  
  # Constant or right-operand
  if (substr($input1, 0, 1) eq 'c') {
    $bits .= "1" . substr($input1, 1, length($input1)-1);
  } else {
    $bits .= "0"; # no constant
    my $I1_dir = FuncUnitDirectionToBits($input1);
    for (my $i = 0; $i < $const_bits - length($I1_dir); $i++) {
      $bits .= "0";
    }
    $bits .= $I1_dir;
  }
  
  # left-operand
  $bits .= FuncUnitDirectionToBits($input0);
  
  # predication direction
  if ($predDir eq 'no' || $predDir eq '') {
    $predDir = $input0;
  }
  $bits .= FuncUnitDirectionToBits($predDir);
  
  # predication invert?
  $bits .= ($predValue eq 'T' ? "0" : "1");
  
  return $bits;
}

sub GetSwitchOutputBits {
  my $select = $_[0];
  
  my @arr = split(/ /, $select);
  my $len = @arr;
  
  if ($len == 0) {
    return "0000"; # off
  } elsif ($len == 1) {
    switch ($select) {
      case 'NW' { return "0001"; }
      case 'N'  { return "0011"; }
      case 'E'  { return "0010"; }
      case 'S'  { return "0100"; }
      case 'W'  { return "1000"; }
      else { print "ERROR GetSwitchOutputBits: $select\n"; exit -1; }
    }
  } elsif ($len == 2) {
    @arr = sort(@arr);
    
    switch ($arr[0]." ".$arr[1]) {
      case 'NW S' { return "0101"; }
      case 'E S'  { return "0110"; }
      case 'N S'  { return "0111"; }
      case 'NW W' { return "1001"; }
      case 'E W'  { return "1010"; }
      case 'N W'  { return "1011"; }
      case 'S W'  { return "1100"; }
      case 'N NW' { return "1101"; }
      case 'E NW' { return "1110"; }
      case 'E N'  { return "1111"; }
      else { print "ERROR GetSwitchOutputBits: $select\n"; exit -1; }
    }
  }
  
  return "0000";
}



sub GenerateConfiguration {
  # configuration data structures
  my @switches = (); # 2D array of switches
  my @switch_keys = ('W', 'SW', 'S', 'SE', 'E', 'NE', 'N', 'NW');
  for (my $row = 0; $row <= $height; $row++) {
    my @S_row = ();
    
    for (my $col = 0; $col <= $width; $col++) {
      my %dict = {};
      
      foreach my $key ( @switch_keys ) {
        $dict{$key} = ''; # initially disabled
      }
      
      push(@S_row, { %dict }); # dictionary for each switch
    }
    push(@switches, [ @S_row ]);
  }

  my @funcUnits = (); # 2D array of functional-units
  my @funcUnit_keys = ('I0', 'I1', 'pred-dir', 'pred-value', 'func');
  for (my $row = 0; $row < $height; $row++) {
    my @FU_row = ();
    
    for (my $col = 0; $col < $width; $col++) {
      my %dict = {};
      
      foreach my $key ( @funcUnit_keys ) {
        $dict{$key} = ''; # initially disabled
      }
      
      push(@FU_row, { %dict });
    }
    push(@funcUnits, [ @FU_row ]);
  }

  # read DySER configuration
  my $line_num = 1;
  while (<INPUT_FILE>) {
    $line_num++;
    
    my $line = $_;
    chomp($line);
    #print "$line_num: $line\n";
    
    my @tokens = split(/ /, $line);
    my $tokenCount = @tokens;
    if ($tokenCount < 1) {
      next;
    }
    
    my $type = $tokens[0];
    
    if ($type eq "S") { # Parse Switch
      if (($tokenCount != 5 && $tokenCount != 6) || 
           !isdigit($tokens[1]) || !isdigit($tokens[2])) {
        print "ERROR (bad format) on line $line_num: $line\n";
        next;
      }
      
      my $col = int($tokens[1]);
      my $row = int($tokens[2]);
      
      my $output = ConvertOutput($tokens[3]);
      my $input = ConvertInput($tokens[4]);
      if ($tokenCount > 5) {
        $input .= " " . ConvertInput($tokens[5]);
      }
      
      if ($row < 0 || $row > $height || $col < 0 || $col > $width ||
          CheckSwitchOutput($row, $col, $tokens[3]) != 1 || 
          CheckSwitchInput($row, $col, $tokens[4]) != 1 ||
          ($tokenCount > 5 &&
            (CheckSwitchInput($row, $col, $tokens[5]) != 1)
          )) {
        print "ERROR (bad parameters) on line $line_num: $line\n";
        next;
      }
      
      $switches[$row][$col]{$output} = $input;
    } elsif ($type eq 'FU') { # Parse Functional Unit
      if ($tokenCount != 8 ||
          !isdigit($tokens[1]) || !isdigit($tokens[2])) {
        print "ERROR (bad format) on line $line_num: $line\n";
        next;
      }
      
      my $col = int($tokens[1]);
      my $row = int($tokens[2]);
      
      if ($row < 0 || $row >= $height || $col < 0 || $col >= $width ||
          CheckFuncUnitInput($tokens[3]) != 1 || 
          CheckFuncUnitInputOrConst($tokens[4]) != 1 ||
          CheckFuncUnitPredDir($tokens[5]) != 1 ||
          CheckFuncUnitPredValue($tokens[6]) != 1 ||
          CheckFuncUnitFunction($tokens[7]) != 1) {
        print "ERROR (bad parameters) on line $line_num: $line\n";
        next;
      }
      
      $funcUnits[$row][$col]{'I0'} = $tokens[3];
      $funcUnits[$row][$col]{'I1'} = $tokens[4];
      $funcUnits[$row][$col]{'pred-dir'} = $tokens[5];
      $funcUnits[$row][$col]{'pred-value'} = $tokens[6];
      $funcUnits[$row][$col]{'func'} = $tokens[7];
    } else {
      print "ERROR (unknown type) on line $line_num: $line\n";
    }
  }
  
  # Order the configuration bits
  my $config = "";
  for (my $row = $height; $row >= 0; $row--) {
    for (my $col = 0; $col <= $width; $col++) {
      if ($col > 0 && $row > 0) {
        my $I0 = $funcUnits[$row-1][$col-1]{'I0'};
        my $I1 = $funcUnits[$row-1][$col-1]{'I1'};
        my $predDir = $funcUnits[$row-1][$col-1]{'pred-dir'};
        my $predValue = $funcUnits[$row-1][$col-1]{'pred-value'};
        my $func = $funcUnits[$row-1][$col-1]{'func'};
        
        $config .= GetFuncUnitConfigBits($I0, $I1, $predDir, $predValue, $func);
      }
      
      foreach my $key ( @switch_keys ) {
        $config .= GetSwitchOutputBits($switches[$row][$col]{$key});
      }
    }
    
    if (--$row < 0) { last; }
    
    for (my $col = $width; $col >= 0; $col--) {
      if ($col > 0 && $row > 0) {
        my $I0 = $funcUnits[$row-1][$col-1]{'I0'};
        my $I1 = $funcUnits[$row-1][$col-1]{'I1'};
        my $predDir = $funcUnits[$row-1][$col-1]{'pred-dir'};
        my $predValue = $funcUnits[$row-1][$col-1]{'pred-value'};
        my $func = $funcUnits[$row-1][$col-1]{'func'};
        
        $config .= GetFuncUnitConfigBits($I0, $I1, $predDir, $predValue, $func);
      }
      
      foreach my $key ( @switch_keys ) {
        $config .= GetSwitchOutputBits($switches[$row][$col]{$key});
      }
    }
  }

  my $len = length($config);
  my $expected_len = $switch_config_bits*($width+1)*($height+1) + $funcUnit_config_bits*$width*$height;
  if ($len != $expected_len) {
    print "ERROR:  config length=$len  expected=$expected_len\n";
    exit;
  }

  my $instructions = ceil($len / $inst_config_bits);
  
  for (my $p = 0; $p < ($instructions * $inst_config_bits) - $len; $p++) {
    $config .= "0";
  }
  
  my $bit_padding = "";
  for (my $p = 0; $p < 4*ceil($inst_config_bits / 4) - $inst_config_bits; $p++) {
    $bit_padding .= "0";
  }
  
  # Output the final configuration bits (as assembly instructions)
  my $index = 0;
  for (my $i = $instructions-1; $i >= 0; $i--) {
    my $bits = substr($config, $i*$inst_config_bits, $inst_config_bits);
    my $hex = unpack("H*", pack("B*", $bit_padding . $bits));
    
    if ($TB == 1) {
      print "    conf_all[$index] = $inst_config_bits\'h$hex;\n";
    } else {
      print "dyser_init 0x$hex\n";
    }
    
    $index++;
  }
  
  if ($TB == 1) {
    print "\n\n";
  }
}



sub Contains {
  my $array = $_[0];
  my $val = $_[1];
  
  foreach my $elt ( @{$array} ) {
    if ($elt eq $val) {
      return 1;
    }
  }
  
  return 0;
}

sub ConvertToHex {
  my $binary = $_[0];
  return unpack("H*", pack("B*", $binary));
}


# Valid Switch Parameters
my @S_valid_inputs = ('NW', 'N', 'E', 'S', 'W');
my @S_valid_outputs = ('NW', 'N', 'NE', 'E', 'SE', 'S', 'SW', 'W');
my $ports = 2*$width + 2*$height - 1;
my @S_valid_ports = (0..$ports);


sub CheckSwitchInput {
  my $row = $_[0];
  my $col = $_[1];
  my $input = $_[2];
  
  if (Contains(\@S_valid_inputs, $input)) {
    return 1;
  } elsif (isdigit($input) && ($row == 0 || $col == 0) && Contains(\@S_valid_ports, $input)) {
    my $port_low = ($height-$row)*2 + $col*2;
    my $port_high = $port_low + 1;
    
    my $input_port = int($input);
    if ($input_port >= $port_low && $input_port <= $port_high) {
      return 1;
    }
  }
  
  return 0;
}

sub CheckSwitchOutput {
  my $row = $_[0];
  my $col = $_[1];
  my $output = $_[2];
  
  if (Contains(\@S_valid_outputs, $output)) {
    return 1;
  } elsif (isdigit($output) && ($row == $height || $col == $width) && Contains(\@S_valid_ports, $output)) {
    my $port_low = ($col-1)*2 + ($height-$row)*2;
    my $port_high = $port_low + 1;
    
    my $output_port = int($output);
    if ($output_port >= $port_low && $output_port <= $port_high) {
      return 1;
    }
  }
  
  return 0;
}



# Valid Function Unit Parameters
my @FU_valid_inputs = ('NW', 'NE', 'SE', 'SW');
my @FU_valid_pred_dir = ('NW', 'NE', 'SE', 'SW', 'no');
my @FU_valid_pred_val = ('T', 'F');
my @FU_valid_funcs = ('00', '01', '10', '11');

sub CheckFuncUnitInput {
  return Contains(\@FU_valid_inputs, $_[0]);
}

sub CheckFuncUnitInputOrConst {
  if (substr($_[0], 0, 1) eq 'c') {
    my $const = substr($_[0], 1, length($_[0])-1);
    if (length($const) != $const_bits) {
      return 0;
    }
    
    for (my $i = 0; $i < length($const); $i++) {
      my $char = substr($const, $i, 1);
      if ($char ne '0' && $char ne '1') {
        return 0;
      }
    }
    
    return 1;
  }
  
  return Contains(\@FU_valid_inputs, $_[0]);
}

sub CheckFuncUnitPredDir {
  return Contains(\@FU_valid_pred_dir, $_[0]);
}

sub CheckFuncUnitPredValue {
  return Contains(\@FU_valid_pred_val, $_[0]);
}

sub CheckFuncUnitFunction {
  return Contains(\@FU_valid_funcs, $_[0]);
}


sub ConvertInput {
  my $input = $_[0];
  
  if (isdigit($input)) {
    my $digit = int($input);
    
    if ($digit < ($height+1)*2) {
      return ($digit % 2 == 0 ? 'W' : 'NW');
    } else {
      return ($digit % 2 == 0 ? 'NW' : 'N');
    }
  }
  
  return $input;
}

sub ConvertOutput {
  my $output = $_[0];
  
  if (isdigit($output)) {
    my $digit = int($output);
    
    if ($digit < ($width-1)*2) {
      return ($digit % 2 == 0 ? 'S' : 'SE');
    } else {
      return ($digit % 2 == 0 ? 'SE' : 'E');
    }
  }
  
  return $output;
}



sub GenerateTestbench {
  my $port_width = ceil(log($width*2 + $height*2) / log(2)) - 1;
  my $conf_width = $inst_config_bits - 1;
  my $conf_cycles = ceil((($width+1)*($height+1)*$switch_config_bits + $width*$height*$funcUnit_config_bits) / $inst_config_bits) - 1;
  
	print "`include \"config.v\"\n\n";
	
	print "module dyser_tb();\n\n";
	
	print "`include \"check_error.v\"\n\n";
	
	print "// INPUTS\n";
	print "                     // dyser_send\n";
  print "reg  [`DATA_WIDTH:0] send_data_r0;\n";
  print "reg  [`DATA_WIDTH:0] send_data_r1;\n";
  print "reg            [$port_width:0] send_port_r0;\n";
  print "reg            [$port_width:0] send_port_r1;\n";
  print "reg                  send_en0;\n";
  print "reg                  send_en1;\n";
  print "                     // dyser_recv\n";
  print "reg            [$port_width:0] recv_port_r0;\n";
  print "reg            [$port_width:0] recv_port_r1;\n";
  print "reg                  recv_en0;\n";
  print "reg                  recv_en1;\n";
  print "                     // dyser_init\n";
  print "reg           [$conf_width:0] config_bits;\n";
  print "reg                  config_en;\n";
  print "                     // dyser_commit\n";
  print "reg                  commit;\n";
  print "                     // extra\n";
  print "reg                  clk, rst;\n\n";
  
  print "// OUTPUTS\n";
  print "                     // dyser_send\n";
  print "wire                 send_stall;\n";
  print "                     // dyser_recv\n";
  print "wire [`DATA_WIDTH:0] recv_data_r0;\n";
  print "wire [`DATA_WIDTH:0] recv_data_r1;\n";
  print "wire                 recv_stall;\n\n\n";

  print "// INTERNAL\n";
  print "reg                  ERR;\n";
  print "reg  [`DATA_WIDTH:0] expected;\n";
  print "reg  [`DATA_WIDTH:0] received;\n";
  print "integer              x;\n\n\n";

  print "dyser d0(\n";
  print "    /* inputs */\n";
  print "    .send_data_r0(send_data_r0),\n";
  print "    .send_data_r1(send_data_r1),\n";
  print "    .send_port_r0(send_port_r0),\n";
  print "    .send_port_r1(send_port_r1),\n";
  print "    .send_en0(send_en0),\n";
  print "    .send_en1(send_en1),\n";
  print "    .recv_port_r0(recv_port_r0),\n";
  print "    .recv_port_r1(recv_port_r1),\n";
  print "    .recv_en0(recv_en0),\n";
  print "    .recv_en1(recv_en1),\n";
  print "    .config_bits(config_bits),\n";
  print "    .config_en(config_en),\n";
  print "    .commit(commit),\n";
  print "    .clk(clk),\n";
  print "    .rst(rst),\n";
  print "    /* outputs */\n";
  print "    .send_stall(send_stall),\n";
  print "    .recv_data_r0(recv_data_r0),\n";
  print "    .recv_data_r1(recv_data_r1),\n";
  print "    .recv_stall(recv_stall)\n";
  print "    );\n\n\n";

  print "  // Clock\n";
  print "  initial clk = 0;\n";
  print "  always #10 clk = ~clk;\n\n";

  print "  // Clock cycle\n";
  print "  integer cycle;\n";
  print "  initial cycle = 0;\n";
  print "  always \@(posedge clk)\n";
  print "    cycle = cycle + 1;\n\n\n";

  print "  initial begin\n";
  print "    \$display(\"Beginning DySER tests...\");\n\n";
    
  print "    // RESET\n";
  print "    clear_inputs;\n";
  print "    ERR = 0;\n";
  print "    reset;\n\n\n";
  
  print "    \$display(\"[%0d] Configuring DySER...\", cycle);\n";
  print "    dyser_configure;\n";
  print "    \$display(\"[%0d] Configuration done.\", cycle);\n\n\n";
  
  print "    // Put your dyser_send's and dyser_recv's here:\n\n\n\n";
  
  print "    // DONE\n";
  print "    check_error(ERR, cycle);\n";
  print "    \$stop;\n";
  print "  end\n\n\n";

  print "task reset;\n\n";

  print "  begin\n";
  print "    rst = 1;\n";
  print "    \@(posedge clk);\n";
  print "    \@(negedge clk);\n";
  print "    rst = 0;\n";
  print "  end\n";
  print "endtask\n\n\n";

  print "task clear_inputs;\n\n";
  
  print "  begin\n";
  print "    send_data_r0 = 0;\n";
  print "    send_data_r1 = 0;\n";
  print "    send_port_r0 = 0;\n";
  print "    send_port_r1 = 0;\n";
  print "    send_en0     = 0;\n";
  print "    send_en1     = 0;\n\n";
  
  print "    recv_port_r0 = 0;\n";
  print "    recv_port_r1 = 0;\n";
  print "    recv_en0     = 0;\n";
  print "    recv_en1     = 0;\n\n";
  
  print "    config_bits = 0;\n";
  print "    config_en   = 0;\n\n";
  
  print "    commit = 0;\n";
  print "  end\n";
  print "endtask\n\n\n";

  print "task dyser_send1;\n";
  print "  input            [$port_width:0] port0;\n";
  print "  input  [`DATA_WIDTH:0] data0;\n\n";

  print "  begin\n";
  print "    send_data_r0 = data0;\n";
  print "    send_port_r0 = port0;\n";
  print "    send_en0 = 1;\n\n";
  
  print "    send_en1 = 0;\n\n";
  
  print "    #1;\n";
  print "    while (send_stall) begin\n";
  print "      @(negedge clk);\n";
  print "    end\n\n";
  
  print "    \$display(\"  dyser_send P[%d]=%8h\", port0, data0);\n";
  print "    @(negedge clk);\n\n";
  
  print "    send_en0 = 0;\n";
  print "    send_en1 = 0;\n";
  print "  end\n";
  print "endtask\n\n\n";

  print "task dyser_send;\n";
  print "  input            [$port_width:0] port0;\n";
  print "  input  [`DATA_WIDTH:0] data0;\n";
  print "  input            [$port_width:0] port1;\n";
  print "  input  [`DATA_WIDTH:0] data1;\n\n";

  print "  begin\n";
  print "    send_data_r0 = data0;\n";
  print "    send_port_r0 = port0;\n";
  print "    send_en0 = 1;\n\n";
  
  print "    send_data_r1 = data1;\n";
  print "    send_port_r1 = port1;\n";
  print "    send_en1 = 1;\n\n";
  
  print "    #1;\n";
  print "    while (send_stall) begin\n";
  print "      @(negedge clk);\n";
  print "    end\n\n";
  
  print "    \$display(\"  dyser_send P[%d]=%8h  P[%d]=%8h\", port0, data0, port1, data1);\n";
  print "    @(negedge clk);\n\n";
  
  print "    send_en0 = 0;\n";
  print "    send_en1 = 0;\n";
  print "  end\n";
  print "endtask\n\n\n";

  print "task dyser_recv;\n";
  print "  input            [$port_width:0] port;\n";
  print "  output [`DATA_WIDTH:0] data;\n\n";

  print "  begin\n";
  print "    recv_port_r0 = port;\n";
  print "    recv_en0     = 1;\n\n";
    
  print "    #1 data = recv_data_r0;\n";
  print "    while (recv_stall) begin\n";
  print "      \@(negedge clk);\n";
  print "      data = recv_data_r0;\n";
  print "    end\n\n";
  
  print "    \$display(\"  dyser_recv P[%d]=%8h\", recv_port_r0, recv_data_r0);\n";
  print "    \@(negedge clk);\n";
  print "    recv_en0 = 0;\n";
  print "  end\n";
  print "endtask\n\n\n";

  print "task dyser_configure;\n";
  print "  integer i;\n";
  print "  reg   [$conf_width:0] conf_all  [$conf_cycles:0];\n\n";
  
  print "  begin\n";
  print "    clear_inputs;\n\n";
  
  &GenerateConfiguration;
  
  print "    for (i=0; i <= $conf_cycles; i=i+1) begin\n";
  print "      config_bits = conf_all[i];\n";
  print "      config_en = 1;\n";
  print "      \$display(\"dyser_init 0x%h\", config_bits);\n\n";
  
  print "      \@(negedge clk);\n";
  print "    end\n\n";
  
  print "    config_en = 0;\n";
  print "  end\n";
  print "endtask\n\n";

  print "endmodule\n";
}



if ($TB == 1) {
  &GenerateTestbench;
} else {
  &GenerateConfiguration;
}


print "\n";

