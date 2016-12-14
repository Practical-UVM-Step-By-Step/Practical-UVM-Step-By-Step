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

`ifndef ETH_TRANSMIT_BARRIER_TEST__SV
 `define ETH_TRANSMIT_BARRIER_TEST__SV

typedef class eth_blk_env;
   typedef class tx_interrupt_seq_barrier;
   typedef class send_2_packets_barrier;

class eth_transmit_barrier_test extends eth_blk_env_test;

   `uvm_component_utils(eth_transmit_barrier_test)

   // Barriers and other sequences;
   tx_interrupt_seq_barrier  tx_int_bar_seq_inst;
   send_2_packets_barrier        send_2_packets_bar_seq_inst;

   uvm_barrier transmit_barrier = new("transmit_barrier",2);

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

      //       uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_master_agt.mast_sqr.main_phase","default_sequence",send_tx_packet2::get_type()); 
      uvm_config_db #(uvm_active_passive_enum)::set(this, "env.mii_tx_agt","is_active",UVM_PASSIVE); 
      uvm_config_db #(uvm_active_passive_enum)::set(this, "env.mii_rx_agt","is_active",UVM_PASSIVE); 

      // Create the Barrier and send it to the config_db;
      uvm_config_db #(uvm_barrier)::set(null,"","transmit_b",transmit_barrier);
      

   endfunction

   virtual task main_phase(uvm_phase phase);
      super.main_phase(phase); 
      phase.raise_objection(this,"test run");
      tx_int_bar_seq_inst = tx_interrupt_seq_barrier::type_id::create("tx_int_bar_seq_inst",this);
      send_2_packets_bar_seq_inst = send_2_packets_barrier::type_id::create("send_2_packets_bar_seq_inst");

      fork 
	 begin
	    send_2_packets_bar_seq_inst.start(env.wb_master_agt.mast_sqr);
	    send_2_packets_bar_seq_inst.wait_for_sequence_state(UVM_FINISHED);
      	    `uvm_info(get_full_name(), "looking for Interrupt", UVM_MEDIUM);
	 end

	 begin
	    tx_int_bar_seq_inst.start(env.wb_master_agt.mast_sqr);
	    tx_int_bar_seq_inst.wait_for_sequence_state(UVM_FINISHED);
	    `uvm_info(get_full_name(), "Done looking for Interrupt", UVM_MEDIUM);
	 end

      join 
      `uvm_info("TEST","Test Completed",UVM_LOW)
      phase.drop_objection(this,"test run");
   endtask
   

endclass : eth_transmit_barrier_test

`endif //ETH_TRANSMIT_BARRIER_TEST__SV

