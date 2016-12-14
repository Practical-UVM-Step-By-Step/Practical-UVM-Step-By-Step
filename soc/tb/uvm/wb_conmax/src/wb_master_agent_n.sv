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

`ifndef WB_MASTER_AGENT_N_SV
 `define WB_MASTER_AGENT_N_SV

class wb_master_agent_n extends wb_master_agent;

   `uvm_component_utils(wb_master_agent_n)
   function new(string name = "mast_agt_n", uvm_component parent = null);
      super.new(name, parent);
   endfunction
endclass: wb_master_agent_n

`endif // WB_MASTER_AGENT_N_SV

