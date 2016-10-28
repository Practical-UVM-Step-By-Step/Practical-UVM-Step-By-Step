
all:	sim
SHELL = /bin/sh
MS=-s

##########################################################################
#
# DUT Sources
#
##########################################################################
DUT_SRC_DIR=../rtl/verilog
_TARGETS_=	$(DUT_SRC_DIR)/wb_dma_ch_pri_enc.v	\
		$(DUT_SRC_DIR)/wb_dma_ch_arb.v		\
		$(DUT_SRC_DIR)/wb_dma_pri_enc_sub.v	\
		$(DUT_SRC_DIR)/wb_dma_ch_sel.v		\
		$(DUT_SRC_DIR)/wb_dma_top.v		\
		$(DUT_SRC_DIR)/wb_dma_ch_rf.v		\
		$(DUT_SRC_DIR)/wb_dma_rf.v		\
		$(DUT_SRC_DIR)/wb_dma_wb_if.v		\
		$(DUT_SRC_DIR)/wb_dma_wb_mast.v		\
		$(DUT_SRC_DIR)/wb_dma_wb_slv.v		\
		$(DUT_SRC_DIR)/wb_dma_de.v		\
		$(DUT_SRC_DIR)/wb_dma_inc30r.v

##########################################################################
#
# Test Bench Sources
#
##########################################################################
_TOP_=test
TB_SRC_DIR=../bench/verilog
_TB_=		$(TB_SRC_DIR)/test_bench_top.sv		\
		$(TB_SRC_DIR)/wb_slv_model.v		\
		$(TB_SRC_DIR)/wb_mast_model.v

##########################################################################
#
# Misc Variables
#
##########################################################################

#INCDIR="-INCDIR ./$(DUT_SRC_DIR)/ -INCDIR ./$(TB_SRC_DIR)/"
#LOGF=-LOGFILE .nclog
#NCCOMMON=-CDSLIB ncwork/cds.lib -HDLVAR ncwork/hdl.var -NOCOPYRIGHT

INCDIR=+incdir+./$(DUT_SRC_DIR)/ +incdir+./$(TB_SRC_DI../bench/commonbench/wb_dma_uvm/srcbench/wb_dma_uvm/testsbench/wb_dma_uvm/envbench/wb_dma_uvm/include
LOGF=-l .nclog

UMC_LIB=/tools/dc_libraries/virtual_silicon/umc_lib.v
GATE_NETLIST = ../syn/out/wb_dma_top_ps.v

##########################################################################
#
# Make Targets
#
##########################################################################
help: 
	make comp sim


comp:
	vcs -ntb_opts uvm +incdir+$(DUT_SRC_DIR) +incdir+$(TB_SRC_DIR)	\
	$(_TARGETS_) $(_TB_) -debug_all -l vcs.log \
       	 -debug_pp  +incdir+../bench/common +systemverilogext+.sv -extinclude \
	+systemverilogext+.svh \
	+incdir+../bench/common+../bench/wb_dma_uvm/src+../bench/wb_dma_uvm/tests+../bench/wb_dma_uvm/env+../bench/wb_dma_uvm/include  -timescale=1ns/1ps -kdb -lca


sim:
	simv +UVM_TESTNAME=wb_dma_env_test -l simv.log +pt10_wr +UVM_VERBOSITY=UVM_HIGH  
	urg -dir simv.vdb -report cov -format text

clean:
	rm -rf	./waves/*.dsn ./waves/*.trn *.vpd simv.log *.fsdb *.vdb\ 
	rm -rf ./verilog.* .nclog hal.log INCA_libs simv* csrc* *.log *.vpd DVEfiles* 

##########################################################################
