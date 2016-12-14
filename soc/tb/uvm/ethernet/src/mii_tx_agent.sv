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

`ifndef MII_TX_AGENT__SV
 `define MII_TX_AGENT__SV

class mii_tx_agent extends uvm_agent;
   mii_tx_seqr mii_tx_sqr;
   mii_tx_drv mii_tx_driv;
   mii_tx_mon mii_tx_monitor;
   typedef virtual mii_if vif;
   vif mii_tx_if; 

   `uvm_component_utils(mii_tx_agent)

   function new(string name = "mast_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mii_tx_monitor = mii_tx_mon::type_id::create("mii_tx_monitor", this);
      if (is_active == UVM_ACTIVE) begin
         mii_tx_sqr = mii_tx_seqr::type_id::create("mii_tx_sqr", this);
         mii_tx_driv = mii_tx_drv::type_id::create("mii_tx_driv", this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "mii_if", mii_tx_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"mii_tx_driv","tx_drv_if",mii_tx_if);
      uvm_config_db# (vif)::set(this,"mii_tx_monitor","mon_if",mii_tx_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
   	 mii_tx_driv.seq_item_port.connect(mii_tx_sqr.seq_item_export);
      end
   endfunction
endclass: mii_tx_agent

`endif // MII_TX_AGENT__SV

