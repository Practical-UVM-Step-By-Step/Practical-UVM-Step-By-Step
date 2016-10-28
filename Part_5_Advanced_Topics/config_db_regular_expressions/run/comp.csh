#!/bin/csh -f
rm -rf csrc* simv*
vcs -sverilog -timescale=1ns/1ns -ntb_opts uvm-1.1 +incdir+../src ../src/my_env_pkg.sv ../src/top.sv -l comp.log -debug_all
simv -l simv.log 
