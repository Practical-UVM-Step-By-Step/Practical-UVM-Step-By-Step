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
   typedef class eth_env_cfg;

class eth_blk_env_test extends uvm_test;

   `uvm_component_utils(eth_blk_env_test)

   eth_blk_env env;
   eth_env_cfg env_config;
   wb_config master_config;
   wb_config  slave_config;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase); 

      env_config = new("Ethernet configuration");
      uvm_config_db #(eth_env_cfg)::set(this,"env","config",env_config);
      master_config = wb_config::type_id::create("WB_MASTERConf");
      slave_config = wb_config::type_id::create("WB_SLAVEConf");
      master_config.randomize with {min_addr == 0; max_addr == 32'h0ffffffe; max_n_wss == 2;};
      slave_config.randomize with {min_addr == 0; max_addr == 32'h0ffffffe; max_n_wss == 2;};

      uvm_config_db #(wb_config)::set(null,"env.master_agent","mstr_agent_cfg",master_config);
      uvm_config_db #(wb_config)::set(null,"env.slave_agent","slv_agent_cfg",slave_config);

      uvm_config_db #(int)::set(null,"*","include_coverage",0);
      
      env = eth_blk_env::type_id::create("env", this);
      
   endfunction

   virtual function void connect_phase(uvm_phase phase);
      env.wb_master_agt.mast_sqr.regmodel = env.regmodel;
   endfunction

endclass : eth_blk_env_test

`endif //TEST__SV

