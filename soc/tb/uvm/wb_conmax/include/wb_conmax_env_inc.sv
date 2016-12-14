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

`ifndef WB_CONMAX_ENV__SV
 `define WB_CONMAX_ENV__SV

 `include "mstr_slv_src.incl"
 `include "wb_conmax_env_cfg.sv"

 `include "wb_conmax_scoreboard.sv"
 `include "wb_conmax_virtual_sequencer.sv"
 `include "wb_conmax_virtual_sequence.sv"

 `include "wb_conmax_env_cov.sv"
 `include "wb_master_agent_n.sv"

 `include "mon_2cov.sv"
 `include "wb_conmax_env.sv"

`endif // WB_CONMAX_ENV__SV
