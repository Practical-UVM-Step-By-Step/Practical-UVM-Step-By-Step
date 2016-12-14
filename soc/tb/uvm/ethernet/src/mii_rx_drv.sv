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

`ifndef MII_RX_DRV__SV
 `define MII_RX_DRV__SV

typedef class mii_transaction;
   typedef class mii_rx_drv;

class mii_rx_drv_callbacks extends uvm_callback;

   // Called before a transaction is executed
   virtual task pre_tx( mii_rx_drv xactor,
                        mii_transaction tr);
      

   endtask: pre_tx

   // Called after a transaction has been executed
   virtual task post_tx( mii_rx_drv xactor,
                         mii_transaction tr);

   endtask: post_tx

endclass: mii_rx_drv_callbacks

class mii_rx_drv extends uvm_driver # (mii_transaction);

   
   typedef virtual mii_if v_if; 
   v_if rx_drv_if;
   `uvm_register_cb(mii_rx_drv,mii_rx_drv_callbacks); 
   
   extern function new(string name = "mii_rx_drv",
                       uvm_component parent = null); 
   
   `uvm_component_utils_begin(mii_rx_drv)
   `uvm_component_utils_end

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(mii_transaction tr); 
   extern protected virtual task rx_driver();

   extern virtual function init_signals();

endclass: mii_rx_drv

   function mii_rx_drv::new(string name = "mii_rx_drv",
			    uvm_component parent = null);
      super.new(name, parent);

      
   endfunction: new

   function void mii_rx_drv::build_phase(uvm_phase phase);
      super.build_phase(phase);

   endfunction: build_phase

   function void mii_rx_drv::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "rx_drv_if", rx_drv_if);
   endfunction: connect_phase

   function void mii_rx_drv::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (rx_drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   function void mii_rx_drv::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
   endfunction: start_of_simulation_phase

   
   task mii_rx_drv::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      phase.drop_objection(this);
   endtask: reset_phase

   task mii_rx_drv::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      phase.drop_objection(this);
   endtask:configure_phase

   task mii_rx_drv::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork 
	 rx_driver();
      join
      phase.drop_objection(this);
   endtask: run_phase

   task mii_rx_drv::rx_driver();
      init_signals();
      forever begin
	 mii_transaction tr;
	 seq_item_port.get_next_item(tr);
	 `uvm_info("mii_rx_drv_Driver", "Starting transaction...",UVM_MEDIUM)
	 `uvm_do_callbacks(mii_rx_drv,mii_rx_drv_callbacks, pre_tx(this, tr))
	 send(tr); 
	 seq_item_port.item_done();
	 `uvm_info("mii_rx_drv_Driver", "Completed transaction...",UVM_MEDIUM)
	 `uvm_info("mii_rx_drv_Driver", tr.sprint(),UVM_HIGH)
	 `uvm_do_callbacks(mii_rx_drv,mii_rx_drv_callbacks, post_tx(this, tr))
      end
   endtask : rx_driver

   task mii_rx_drv::send(mii_transaction tr);
      for(int i = 0; i < tr.Pkt_Packed.size(); i++) begin
         rx_drv_if.rx_dv = 1;
         rx_drv_if.rxd  = tr.Pkt_Packed[i][7:4];
         @(posedge rx_drv_if.rx_clk);
         rx_drv_if.rxd  = tr.Pkt_Packed[i][3:0];
         @(posedge rx_drv_if.rx_clk);
      end

   endtask: send

   function mii_rx_drv::init_signals();
      $display("Initialing RX signals");
      
      rx_drv_if.rxd = 0;
      rx_drv_if.rx_dv = 0;
      rx_drv_if.crs = 0;
      rx_drv_if.col = 0;
      rx_drv_if.rx_err = 0;
   endfunction

`endif // MII_RX_DRV__SV

