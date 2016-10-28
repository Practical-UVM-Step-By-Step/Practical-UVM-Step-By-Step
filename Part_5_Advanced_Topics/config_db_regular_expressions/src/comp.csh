#!/bin/csh -f

vcs -sverilog -ntb_opts uvm top.sv -l comp.log +define+UVM_NO_DEPRECATED
