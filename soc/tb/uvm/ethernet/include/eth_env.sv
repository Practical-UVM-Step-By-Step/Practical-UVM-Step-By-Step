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

`ifndef ETH_ENV__SV
 `define ETH_ENV__SV

 `include "mstr_slv_src.incl"
 `include "eth_env_cfg.sv"
// `include "wb_eth_scoreboard.sv"
 `include "wb_eth_virt_seqr.sv"
 `include "wb_virt_sequence.sv"

 `include "ral_single.sv"
 `include "ral_ethernet_blk.sv"

`endif // ETH_ENV__SV
