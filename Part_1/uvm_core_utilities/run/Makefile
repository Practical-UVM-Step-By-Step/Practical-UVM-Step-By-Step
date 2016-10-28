compile_all: compile_packer compile_compare compile_copy compile_print
run_all: run_packer run_compare run_copy run_print

all:   compile_all run_all

help:
	echo "********************************* \
	 make help: This message  \
	compile_(packer|copy|compare|print) \
	compiles the examples \
	run_(packer|copy|compare|print)  \
	runs the examples \
	*********************************" 

	




compile_packer:
	rm -rf csrc* simv_packer*
	vcs -sverilog -ntb_opts uvm-1.2 ../src/new_packer.sv +define+UVM_NO_DEPRECATED -o simv_packer +incdir+../src -l vcs_packer.log
	
run_packer: 
	simv_packer -l simv_packer.log


compile_compare:
	rm -rf csrc* simv_compare*
	vcs -sverilog -ntb_opts uvm-1.2 ../src/compare_ex.sv +define+UVM_NO_DEPRECATED -o simv_compare +incdir+../src -l vcs_compare.log

run_compare: 
	simv_compare -l simv_compare.log


compile_copy:
	rm -rf csrc* simv_copy*
	vcs -sverilog -ntb_opts uvm-1.2 ../src/copy_ex.sv +define+UVM_NO_DEPRECATED -o simv_copy +incdir+../src -l vcs_copy.log

run_copy: 
	simv_copy -l simv_copy.log
clean:
	rm -rf simv*.daidir csrc 

compile_print:
	rm -rf csrc* simv_print*
	vcs -sverilog -ntb_opts uvm-1.2 ../src/print.sv +define+UVM_NO_DEPRECATED -o simv_print +incdir+../src -l vcs_print.log

run_print: 
	simv_print -l simv_print.log
