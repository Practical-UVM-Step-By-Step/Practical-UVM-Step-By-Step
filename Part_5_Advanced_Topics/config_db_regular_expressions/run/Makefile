all: comp run

clean: 
	rm -rf simv* csrc*
comp:
	rm -rf csrc* simv*
	vcs -sverilog -ntb_opts uvm ../src/top.sv -l comp.log +define+UVM_NO_DEPRECATED +incdir+../src

run: 
	./simv  +UVM_NO_RELNOTES  -l run.log
