/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

//
//

`ifndef WB_ENV__SV
 `define WB_ENV__SV

 `include "mstr_slv_src.incl"

 `include "wb_env_cfg.sv"
 `include "wb_conmax_virtual_sequencer.sv"
 `include "wb_conmax_virtual_sequence.sv"

 `include "wb_env_cov.sv"

 `include "mon_2cov.sv"

// ToDo: Add additional required `include directives

`endif // WB_ENV__SV
