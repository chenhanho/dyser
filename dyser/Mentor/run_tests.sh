#!/bin/bash

TB_DIR="../testbenches"
TESTBENCHES="comp_logic_tb ff_stage_tb functional_unit_tb switch_tb fifo_tb core_tb dyser_tb"
RTL_DIR="../reference-rtl"
RTL_FILES=`ls ${RTL_DIR}/*`

OUTPUTDIR="validation-results"
rm -rf $OUTPUTDIR
mkdir $OUTPUTDIR


function run_tb {
  COMPILE="$OUTPUTDIR/$1.compile"
  RESULTS="$OUTPUTDIR/$1.results"
  rm -f $COMPILE
  rm -f $RESULTS
  
  echo "Running Testbench:  $1"
  vlog $RTL_FILES $TB_DIR/$1.v +incdir+$RTL_DIR +incdir+$TB_DIR -work ./work| tee $COMPILE
  vsim -c -do opensplyser.do $1 | tee $RESULTS
  
  grep "TEST" $RESULTS  
}


echo "-------------------"
echo "RUNNING TESTBENCHES"
echo "  (script by: Jesse Benson)"
echo "  To see the compilation output and testbench output, see: $OUTPUTDIR"
echo "-------------------"
echo ""


echo "Cleanup work directory"
rm -rf work
echo "Creating work directory"

vlib work
vmap work work

# if a specific testbench is specified, execute only that testbench
if [ $1 ]; then
  run_tb $1
else
  # otherwise, execute every testbench
  for tb in $TESTBENCHES
  do
    run_tb $tb
  done
fi
