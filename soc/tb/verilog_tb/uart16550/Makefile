include include.mk

compile: 
	vcs +v2k -f ${TB_FILELIST} +incdir+${TB_INCDIR} -f ${RTL_FILELIST} +incdir+${RTL_INCDIR} -debug_pp +incdir+${RTL_COMMON}  +incdir+${TB_COMMON} -l vcs.log  +systemverilogext+.sv

run:
	simv -l run.log -gui

clean:
	rm -rf csrc simv* *.log

all: clean compile run
	

