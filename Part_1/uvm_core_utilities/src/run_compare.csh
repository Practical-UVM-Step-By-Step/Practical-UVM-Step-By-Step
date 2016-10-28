#!/bin/csh
rm -rf csrc* simv*
vcs -sverilog -ntb_opts uvm-1.1 compare2.sv -debug_all
simv
