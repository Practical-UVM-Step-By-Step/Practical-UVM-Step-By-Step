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

`ifndef MII_RX_AGENT__SV
 `define MII_RX_AGENT__SV

class mii_rx_agent extends uvm_agent;
   mii_rx_drv mii_rx_driv;
   mii_rx_mon mii_rx_monitor;
   mii_rx_seqr rx_seqr;
   typedef virtual mii_if vif;
   vif rx_mii_if;

   `uvm_component_utils_begin(mii_rx_agent)
   `uvm_component_utils_end

   function new(string name = "slv_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mii_rx_monitor = mii_rx_mon::type_id::create("mon", this);
      if (is_active == UVM_ACTIVE) begin
         mii_rx_driv = mii_rx_drv::type_id::create("mii_rx_driv", this);
         rx_seqr = mii_rx_seqr::type_id::create("rx_seqr",this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "mii_if", rx_mii_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"mii_rx_driv","rx_drv_if",rx_mii_if);
      uvm_config_db# (vif)::set(this,"mii_rx_monitor","rx_mon_if",rx_mii_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
	 mii_rx_driv.seq_item_port.connect(rx_seqr.seq_item_export);
      end
   endfunction

endclass: mii_rx_agent

`endif // MII_RX_AGENT__SV
