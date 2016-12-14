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

`ifndef ETH_ENV_RAL_ENV__SV
 `define ETH_ENV_RAL_ENV__SV
 `include "eth_env.sv"

class eth_blk_env extends uvm_env;
   // eth_blk_scoreboard sb;
   ral_block_ethernet_blk regmodel;
   // Master side Agents
   wb_master_agent wb_master_agt;
   wb_slave_agent  wb_slave_agt;

   // MII Side Agents
   mii_tx_agent mii_tx_agt;
   mii_rx_agent mii_rx_agt;
   
   //  Virtual Sequencers and other stuff
   
   // Ethernet Environment Configuration
   
   eth_env_cfg  env_cfg;
   wb_eth_virt_seqr  virt_seqr;
   
   eth_blk_adapter reg2host;
   
   // This is where all the main sequencers come in
   // wb_ethernet_mac_sequencer wb_ethernet_mac_sqr;
   
   
   `uvm_component_utils(eth_blk_env)
   
   extern function new(string name="eth_blk_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass: eth_blk_env

function eth_blk_env::new(string name= "eth_blk_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void eth_blk_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   wb_master_agt = wb_master_agent::type_id::create("wb_master_agt",this); 
   wb_slave_agt = wb_slave_agent::type_id::create("wb_slave_agt",this);
   
   mii_tx_agt = mii_tx_agent::type_id::create("mii_tx_agt",this);
   mii_rx_agt = mii_rx_agent::type_id::create("mii_rx_agt",this);
   
   
   virt_seqr = wb_eth_virt_seqr::type_id::create("virt_seqr",this); 
   uvm_config_db #(eth_env_cfg)::get(null,"config","env_cfg",env_cfg);
   
   this.regmodel = ral_block_ethernet_blk::type_id::create("regmodel",this);
   regmodel.build();
   regmodel.lock_model();
   reg2host = new("reg2host");
   
   uvm_top.enable_print_topology = 1;
   
endfunction: build_phase

function void eth_blk_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
	virt_seqr.seqr1 = wb_master_agt.mast_sqr;
   
   // mii_tx_agt.mii_tx_monitor.mon_analysis_port.connect(sb.mii_transmit); 
   // mii_rx_agt.mii_rx_monitor.mon_analysis_port.connect(sb.mii_receive); 
   // mii_tx_agt.mac_tx_mon.   (sb.mac_transmit); 
   // mii_tx_agt.mac_rx_mon.   (sb.mac_receive); 
   
   regmodel.default_map.set_sequencer(wb_master_agt.mast_sqr,reg2host);
   
endfunction: connect_phase

`endif // ETH_ENV_RAL_ENV__SV

