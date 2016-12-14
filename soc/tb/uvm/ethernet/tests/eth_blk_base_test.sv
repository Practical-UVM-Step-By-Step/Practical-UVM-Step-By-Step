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

`ifndef TEST__SV
 `define TEST__SV

typedef class eth_blk_env;

class eth_blk_env_test extends uvm_test;

   `uvm_component_utils(eth_blk_env_test)
   eth_env_cfg env_cfg;

   eth_blk_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_cfg = new("Ethernet ENV Configuration");
      env = eth_blk_env::type_id::create("env", this);

      uvm_config_db #(uvm_active_passive_enum)::set(this, "env.mii_tx_agt", "is_active", UVM_PASSIVE); 
      uvm_config_db #(uvm_active_passive_enum)::set(this, "env.mii_rx_agt", "is_active", UVM_PASSIVE); 
   endfunction

endclass : eth_blk_env_test

`endif //TEST__SV

