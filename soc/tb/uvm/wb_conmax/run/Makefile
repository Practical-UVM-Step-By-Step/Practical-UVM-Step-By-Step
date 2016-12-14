# Template for Makefile

################################################################################
PROJECT_NAME = wb_conmax_env
################################################################################

INCL      = +incdir+../include+../src+../env+../tests+../hdl+../../common+../src+../env+../../../../rtl/wb_conmax

################################################################################

DEFINES   = 
RUN_OPTS  = -l simv.log  -lca
TEST = wb_conmax_env_test 
# ToDo: Top level dut file
DUT = 
#Checking the VCS version
VCS_VERSION = $(shell vcs -id > vcs_version ; grep "Compiler version" vcs_version | awk -F " " '{print $$5}')
#This variable contains all the UVM-1.0 supported VCS tool versions.
UVM10_SUPP_VCS_VERSNS = E-2011.03 
SEED      = 1 # Default seed set to 1
VERBOSITY = debug
#MODE      = NORMAL # Default configuration record-replay mode set to NORMAL
# UVM_TEST  = wb_conmax_env_test
 UVM_TEST  = wb_conmax_flat_seq_test
# UVM_TEST = 
# UVM_TEST = wb_conmax_report_hook_test

#### VCS and UVM checking
ifdef VCS_HOME
 ifneq ($(VCS_VERSION),$(filter $(VCS_VERSION),$(UVM10_SUPP_VCS_VERSNS)))
  VCS_VERS_WARNING = 1
 endif  
 ifndef UVM_HOME
  UVM = -ntb_opts uvm-1.2
 else
  UVM = -debug_all +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv {UVM_HOME}/src/dpi/uvm_dpi.cc -CFLAGS -DVCS +define+UVM_NO_DEPRECATED
 endif
else
 ERR_STATUS = 1
endif

COMP_OPTS =  -sverilog -l vcs.log $(UVM) $(INCL) $(DEFINES) -override_timescale=1ns/1ps -f ../../../../rtl/wb_conmax/filelist +define+UVM_NO_DEPRECATED -debug_all -lca

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
	cd ../env; ralgen -uvm -l sv -t wb_conmax_env_ral_block -c b -c a -c f wb_conmax_env.ralf;cd -
ifeq ($(MODE), RECORD)
		vcs $(COMP_OPTS)  \
        	 -debug_all ../tests/wb_conmax_env_tb_mod.sv ../hdl/wb_conmax_tb_top.sv  ../hdl/wb_conmax_wrap.sv 
else		 
ifeq ($(MODE), DEBUG)
		vcs $(COMP_OPTS)  \
        	 -debug_all ../tests/wb_conmax_env_tb_mod.sv ../hdl/wb_conmax_tb_top.sv  ../hdl/wb_conmax_wrap.sv 
else			 
		vcs $(COMP_OPTS)  \
        	 ../tests/wb_conmax_env_tb_mod.sv ../hdl/wb_conmax_tb_top.sv  ../hdl/wb_conmax_wrap.sv -debug
endif			 
endif		 
endif

run: check
ifndef ERR_STATUS
ifeq ($(MODE), RECORD)
	./simv  $(RUN_OPTS) \
        +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(UVM_TEST) +UVM_TR_RECORD +UVM_LOG_RECORD
else
ifeq ($(MODE), DEBUG)
	./simv  $(RUN_OPTS) -gui \
        +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(UVM_TEST) +UVM_TR_RECORD +UVM_LOG_RECORD
else	
	./simv  $(RUN_OPTS) \
        +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(UVM_TEST) 
endif	
endif
endif

clean:
	rm -rf simv* csrc ucli.key
	rm -rf vc_hdrs.h .vcsmx_rebuild *.log
	rm -rf work/* *.svshell vcs_version

help:
	@echo "****************************************************************"
	@echo "***   Makefile Help for wb_conmax_env VIP :  					    ***"
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


all_tests:
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_alter_message_test -l wb_conmax_alter_message_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_alter_verbosity_test -l wb_conmax_alter_verbosity_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_commandline_test_1 -l wb_conmax_commandline_test_1.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_factory_instance_override_test_cmdline -l wb_conmax_factory_instance_override_test_cmdline.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_factory_instance_override_test -l wb_conmax_factory_instance_override_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_factory_type_override_test -l wb_conmax_factory_type_override_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_flat_seq_test -l wb_conmax_flat_seq_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_instance_callback_test -l wb_conmax_instance_callback_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_parallel_seq_test -l wb_conmax_parallel_seq_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_report_file_test -l wb_conmax_report_file_test.log
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_simple_cmdline_proc -l wb_conmax_simple_cmdline_proc.log +slave_adr_max=1234567
	 ./simv  $(RUN_OPTS) +UVM_TESTNAME=wb_conmax_typewide_callback_test -l wb_conmax_typewide_callback_test.log
	 ./simv -l inst_override.dat +uvm_set_inst_override=wb_master_agent,wb_master_agent_n,uvm_test_top.env.master_agent[00] +UVM_TESTNAME=wb_conmax_base_test
	./simv -l uvm_inst_override_cmdline.log  +uvm_set_inst_override=wb_master_agent,wb_master_agent_n,uvm_test_top.env.master_agent[00] +UVM_TESTNAME=wb_conmax_factory_instance_override_test_cmdline uvm_set_default_sequence.dat:Command: ./simv -l uvm_set_default_sequence.dat +uvm_set_default_sequence=uvm_test_top.env.master_agent[00].mast_sqr,main_phase,sequence_1 +uvm_set_default_sequence=uvm_test_top.env.master_agent[00].mast_sqr,main_phase,sequence_0 +UVM_TESTNAME=wb_conmax_base_test
	./simv -l uvm_set_inst_severity.log  +uvm_set_severity=uvm_test_top.env.master_agent[00].mast_drv,Wb master,UVM_INFO,UVM_FATAL +UVM_TESTNAME=wb_conmax_flat_seq_test +uvm_set_action=uvm_test_top.env.master_agent[00].mast_drv,Wb master,UVM_FATAL,UVM_NO_ACTION
	./simv -l uvm_set_inst_severity_no_action.dat:Command: ./simv -l uvm_set_inst_severity_no_action.dat +uvm_set_severity=uvm_test_top.env.master_agent[00].mast_drv,Wb master,UVM_INFO,UVM_FATAL +UVM_TESTNAME=wb_conmax_flat_seq_test +uvm_set_action=uvm_test_top.env.master_agent[00].mast_drv,Wb master,UVM_FATAL,UVM_NO_ACTION
	./simv -l uvm_set_inst_verbosity.dat +uvm_set_verbosity=uvm_test_top.env.master_agent[00].mast_drv,_ALL_,UVM_DEBUG,run +UVM_TESTNAME=wb_conmax_flat_seq_test
	./simv -l uvm_set_inst_verbosity_time.dat +uvm_set_verbosity=uvm_test_top.env.master_agent[00].mast_drv,_ALL_,UVM_DEBUG,time,250,330 +UVM_TESTNAME=wb_conmax_flat_seq_test
	./simv -l uvm_set_type_override.dat  +uvm_set_type_override=wb_master_agent,wb_master_agent_n +UVM_TESTNAME=wb_conmax_factory_instance_override_test_cmdline
