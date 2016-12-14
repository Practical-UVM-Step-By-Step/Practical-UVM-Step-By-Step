#
# Template for Makefile

################################################################################
PROJECT_NAME = eth_env
################################################################################

INCL      = +incdir+../include+../src+../env+../tests+../hdl+../../../../rtl/ethernet+../../../../rtl/common+../../../../rtl/include+../src+include+../hdl

################################################################################

DEFINES   = 
RUN_OPTS  = -l simv.log
TEST = eth_env_test 
# ToDo: Top level dut file
DUT = 
#Checking the VCS version
VCS_VERSION = $(shell vcs -id > vcs_version ; grep "Compiler version" vcs_version | awk -F " " '{print $$5}')
#This variable contains all the UVM-1.0 supported VCS tool versions.
UVM10_SUPP_VCS_VERSNS = E-2011.03 
SEED      = 1 # Default seed set to 1
VERBOSITY = debug
MODE      = NORMAL # Default configuration record-replay mode set to NORMAL
# UVM_TEST  = eth_blk_env_test
UVM_TEST  = eth_transmit_event_sync_test

#### VCS and UVM checking
ifdef VCS_HOME
 ifneq ($(VCS_VERSION),$(filter $(VCS_VERSION),$(UVM10_SUPP_VCS_VERSNS)))
  VCS_VERS_WARNING = 1
 endif  
 ifndef UVM_HOME
  UVM = -ntb_opts uvm-1.2
 else
  UVM = -debug_pp +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv {UVM_HOME}/src/dpi/uvm_dpi.cc -CFLAGS -DVCS 
 endif
else
 ERR_STATUS = 1
endif

COMP_OPTS =  -sverilog -l vcs.log $(UVM) $(INCL) $(DEFINES) -timescale=1ns/1ps -debug_all +UVM_TR_RECORDING   +UVM_NO_DEPRECATED


all default: check clean comp run

check:
ifdef VCS_VERS_WARNING
	@echo ""
	@echo "VCS version is ${VCS_VERSION}"
	@echo "WARNING: VCS version should be atleast E-2011.03 or greater"
	@echo ""
endif
ifdef ERR_STATUS
	@echo ""
	@echo "ERROR : VCS_HOME is not set"
	@echo "Please set VCS_HOME to run this Makefile"
	@echo ""
endif

comp: check
ifndef ERR_STATUS
	cd ../env; ralgen -uvm -l sv -t ethernet_blk  ethernet_blk.ralf;cd -
ifeq ($(MODE), RECORD)
		vcs $(COMP_OPTS)  \
        	 -debug_all ../tests/eth_env_tb_mod.sv ../hdl/eth_env_top.sv  -f ../../../../rtl/ethernet/filelist -timescale=1ns/1ns
else		 
ifeq ($(MODE), DEBUG)
		vcs $(COMP_OPTS)  \
        	 -debug_all ../tests/eth_env_tb_mod.sv ../hdl/eth_env_top.sv  -f ../../../../rtl/ethernet/filelist -timescale=1ns/1ns
else			 
		vcs $(COMP_OPTS)  \
        	 ../tests/eth_env_tb_mod.sv ../hdl/eth_env_top.sv  -f ../../../../rtl/ethernet/filelist -timescale=1ns/1ps +incdir+../../common
endif			 
endif		 
endif

run: check
ifndef ERR_STATUS
ifeq ($(MODE), RECORD)
	./simv  $(RUN_OPTS) \
        +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(UVM_TEST) +UVM_TR_RECORD +UVM_LOG_RECORD 
else	
	./simv  $(RUN_OPTS) \
        +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(UVM_TEST)  +UVM_CONFIG_DB_TRACE +UVM_OBJECTION_TRACE
endif	
endif

clean:
	rm -rf simv* csrc
	rm -rf vc_hdrs.h .vcsmx_rebuild *.log
	rm -rf work/* *.svshell vcs_version

help:
	@echo "****************************************************************"
	@echo "***   Makefile Help for eth_env VIP :  					    ***"
	@echo "****************************************************************"
	@echo "*  Usage:                                                      *"
	@echo "*  ------                                                      *"
	@echo "*  make       Compile and Run the testcase                     *"
	@echo "*                                                              *"
	@echo "*  Available targets:                                          *"
	@echo "*  make help  [To see the Help]                                *"
	@echo "*  make clean [Remove simulation generated files/directories]  *"
	@echo "*  make comp  [Compile the testcase]                           *"
	@echo "*  UVM_TEST   [To pass the name of the UVM test]               *"
#	@echo "*                                                              *"
	@echo "*  Optional Arguments                                          *"
#	@echo "*  VERBOSITY         [Message severity to be display]          *"
#	@echo "*  make VERBOSITY=<sev> [example make VERBOSITY=note]          *"
	@echo "*  MODE = RECORD/DEBUG                                         *"
	@echo "*  make MODE=RECORD  [To enable UVM TR Record mechanism]       *"
	@echo "*  make MODE=DEBUG  [To enable -debug_all]                     *"
	@echo "****************************************************************"
	@echo "      AVAILABLE TESTS                                           "

all_tests:
	./simv +UVM_TESTNAME=eth_transmit_barrier_test -l eth_transmit_barrier_test.log
	./simv +UVM_TESTNAME=eth_transmit_event_sync_test -l eth_transmit_event_sync_test.log
	./simv +UVM_TESTNAME=eth_transmit_virt_sequence_test -l eth_transmit_virt_sequence_test.log
