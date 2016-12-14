#!/bin/csh
################################################################################
#  Copyright (c) 2010-2012 by Cisco Systems Inc.    All Rights Reserved.
################################################################################
#
#  File           : run.csh
#  Creator        : nsiva
#  Owner          : nsiva
#  Creation_date  : Thu Dec  2 10:51:33 PST 2010
#  Description    : 
#
#
#  =Keyword       :
#  =attr          :
#  =status        :
#
################################################################################
#
#  $Author: nsiva $
#  $Id: run.csh,v 1.23 2011/04/13 21:35:57 nsiva Exp $
#  $Source: /nfs/ca_cvs/tigershark/ivoq/modsim/vtf/scripts/run.csh,v $
#  $Revision: 1.23 $
#  $Date: 2011/04/13 21:35:57 $
#  
################################################################################

setenv PROJECT_ROOT /scratch/ts_ius/tigershark
#setenv LM_LICENSE_FILE 1730@issg-lmgr1:6055@ls-na-west

#$PROJECT_ROOT/ivoq/modsim/vtf/scripts/vf_gen.pl

if ($1 == "vcs") then
  # setenv vcs_version v2010.06
  setenv vcs_version v2011.03-2
  setenv vcs_home  /auto/edatools/
  echo "Running with VCS..."
  \rm -rf svlib_path simv simv.daidir
  mkdir svlib_path
  $vcs_home/bin/vcs --v $vcs_version \
  -Mdir=svlib_path \
  -R   \
  -ntb_opts dtm+rvm \
  +v2k -sverilog \
  -line +cli -debug_all \
  +define+VCS \
  +define+FUNCTIONAL \
  +define+MODULE_ENV \
  +define+VSF_MODULE_ENV \
  +dump_on \
  +vmm_log_default=DEBUG \
  +vmm_log_nowarn_at_200 \
  +vmm_log_nofatal_at_1000 \
  +vtf_internal_debug=1 \
  +vmm_force_verbosity=DEBUG \
  +vcs+lic+wait +nospecify \
  #+vcdpluson +vpdfile+$2.vpd \
  fifo4.v \
  spi_defines.v \
  spi_flash_clgen.v \
  spi_flash_shift.v \
  spi_flash_top.v \
  simple_spi_top.v \
  spi_intf.sv \
  spi_wrap_top.sv \
  $3 $4 $5 $6 $7 $8 $9 -l sim.log 
else
  source $PROJECT_ROOT/ivoq/modsim/vtf/scripts/IUS_92s36/setup.csh
  setenv VMM_HOME /auto/star_lifter/jiyoo/vmm-1.2-modius
  #setenv ius_version v9.20.022
  #setenv ius_version v9.20E900
  #setenv ius_version v9.20.031_eng_ius
  echo "Running with IUS..."
  #irun --v $ius_version -clean \
  irun -clean \
  +incdir+$VMM_HOME/sv $VMM_HOME/sv/vmm.sv \
  $PROJECT_ROOT/sim/sc/get_projectroot.cpp \
  $VMM_HOME/sv/std_lib/vmm_str_dpi.c -loadpli1 \
  `ncroot --v v9.20.022`/tools/ovm/lib/libovmpli:ovm_pli_boot \
  +define+VMM_12 \
  +define+INCA   \
  +define+FUNCTIONAL \
  +define+MODULE_ENV \
  +define+VSF_MODULE_ENV \
  +define+BRG_VMM_MODE \
  +define+IVOQ \
  +define+IP_IF_FIFO_CHK_DIS \
  +define+TS_AVAGO_MEM \
  +define+AV_MEM28_NO_CONTENTION_CHECK \
  +define+AV_MEM28_NO_DATA_X_CHECK \
  +define+AV_MEM28_NO_CONTEN_DATA_X_CHECK \
  +define+AV_MEM28_NO_DATA_X_PROP \
  -access rwc \
  -timescale 1ns/10ps \
  -sysv_ext +.vh +.svh -sv \
  $PROJECT_ROOT/common/sim/methodology/common/sim/sv/cdns_pkg.sv  \
  -f env_cmn_exp.vf \
  -f vtf_env_exp.vf \
  $PROJECT_ROOT/ivoq/modsim/vtf/tests/vtf_sample_test.sv \
  +vmm_log_default=DEBUG \
  +vmm_log_nowarn_at_200 \
  +vmm_log_nofatal_at_1000 \
  +vtf_internal_debug=1 \
  +vmm_force_verbosity=DEBUG
endif
