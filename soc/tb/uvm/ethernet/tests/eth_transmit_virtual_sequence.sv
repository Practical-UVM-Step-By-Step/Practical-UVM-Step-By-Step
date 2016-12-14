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

`ifndef ETH_TRANSMIT_VIRT_SEQUENCE__SV
 `define ETH_TRANSMIT_VIRT_SEQUENCE__SV

typedef class eth_blk_env;
   typedef class many_to_one_virt_sequence;

class eth_transmit_test_virtual_sequence extends eth_blk_env_test;

   `uvm_component_utils(eth_transmit_test_virtual_sequence)

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase); 
      env_config = new("Ethernet configuration");
      uvm_config_db #(eth_env_cfg)::set(this,"env","config",env_config);
      master_config = wb_config::type_id::create("WB_MASTERConf");
      slave_config = wb_config::type_id::create("WB_SLAVEConf");
      master_config.randomize with {min_addr == 0; max_addr == 32'h0ffffffe; max_n_wss == 5;};
      slave_config.randomize with {min_addr == 0; max_addr == 32'h0ffffffe; max_n_wss == 2;};

      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.wb_master_agt","mstr_agent_cfg",master_config);
      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.wb_slave_agt","slv_agent_cfg",slave_config);

      uvm_config_db #(int)::set(null,"*","include_coverage",0);

      //uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_master_agt.mast_sqr.main_phase","default_sequence",init_tx_seq::get_type()); 
      //	uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_master_agt.mast_sqr.main_phase","default_sequence",send_tx_packet2::get_type()); 
      // uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_virt_seqr.main_phase","default_sequence",send_tx_packet2::get_type()); 
      uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_virt_seqr.main_phase","default_sequence",many_to_one_virt_sequence::get_type()); 
   endfunction

endclass : eth_transmit_test_virtual_sequence

`endif //ETH_TRANSMIT_VIRT_SEQUENCE__SV

