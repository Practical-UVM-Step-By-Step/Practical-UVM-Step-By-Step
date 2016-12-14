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

`ifndef MII_TX_DRV__SV
 `define MII_TX_DRV__SV

typedef class mii_transaction;
   typedef class mii_tx_drv;

class mii_tx_drv_callbacks extends uvm_callback;

   // Called before a transaction is executed
   virtual task pre_tx( mii_tx_drv xactor,
                        mii_transaction tr);
      

   endtask: pre_tx

   // Called after a transaction has been executed
   virtual task post_tx( mii_tx_drv xactor,
                         mii_transaction tr);

   endtask: post_tx

endclass: mii_tx_drv_callbacks

class mii_tx_drv extends uvm_driver # (mii_transaction);

   
   typedef virtual mii_if v_if; 
   v_if tx_drv_if;
   `uvm_register_cb(mii_tx_drv,mii_tx_drv_callbacks); 
   
   extern function new(string name = "mii_tx_drv",
                       uvm_component parent = null); 
   
   `uvm_component_utils_begin(mii_tx_drv)
   `uvm_component_utils_end

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send_trans(mii_transaction tr); 
   extern protected virtual task tx_driver();

   extern function init_signals();

endclass: mii_tx_drv

   function mii_tx_drv::new(string name = "mii_tx_drv",
			    uvm_component parent = null);
      super.new(name, parent);

      
   endfunction: new

   function void mii_tx_drv::build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction: build_phase

   function void mii_tx_drv::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "tx_drv_if", tx_drv_if);
   endfunction: connect_phase

   function void mii_tx_drv::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (tx_drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   function void mii_tx_drv::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
   endfunction: start_of_simulation_phase

   
   task mii_tx_drv::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");

      phase.drop_objection(this);
   endtask: reset_phase

   task mii_tx_drv::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      phase.drop_objection(this);
   endtask:configure_phase

   task mii_tx_drv::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork 
	 tx_driver();
      join
      phase.drop_objection(this);
   endtask: run_phase

   task mii_tx_drv::tx_driver();
      forever begin
	 mii_transaction tr;
	 seq_item_port.get_next_item(tr);
	 `uvm_info("mii_tx_drv1_DRIVER", "Starting Driving MII transaction...",UVM_MEDIUM)
	 `uvm_do_callbacks(mii_tx_drv,mii_tx_drv_callbacks, pre_tx(this, tr))
	 send_trans(tr); 
	 seq_item_port.item_done();
	 `uvm_info("mii_tx_drv1_DRIVER", "Completed driving MII transaction...",UVM_MEDIUM)
	 `uvm_do_callbacks(mii_tx_drv,mii_tx_drv_callbacks, post_tx(this, tr))
      end
   endtask : tx_driver

   task mii_tx_drv::send_trans(mii_transaction tr);
      
   endtask: send_trans

   function void init_signals();
   endfunction 

`endif // MII_TX_DRV__SV

