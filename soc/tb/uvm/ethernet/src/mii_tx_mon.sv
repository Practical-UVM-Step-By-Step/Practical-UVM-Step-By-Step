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

`ifndef MII_TX_MON__SV
 `define MII_TX_MON__SV

typedef class mii_transaction;
   typedef class mii_tx_mon;

class mii_tx_mon_callbacks extends uvm_callback;

   // Called at start of observed transaction
   virtual function void pre_trans(mii_tx_mon xactor,
                                   mii_transaction tr);
   endfunction: pre_trans

   // Called before acknowledging a transaction
   virtual function pre_ack(mii_tx_mon xactor,
                            mii_transaction tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(mii_tx_mon xactor,
                                    mii_transaction tr);
   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(mii_tx_mon xactor,
                              mii_transaction tr);
   endtask: post_cb_trans

endclass: mii_tx_mon_callbacks

   

class mii_tx_mon extends uvm_monitor;

   uvm_analysis_port #(mii_transaction) mon_analysis_port;  //TLM analysis port
   typedef virtual mii_if v_if;
   v_if mon_if;
   extern function new(string name = "mii_tx_mon",uvm_component parent);
   `uvm_register_cb(mii_tx_mon,mii_tx_mon_callbacks);
   `uvm_component_utils_begin(mii_tx_mon)

   `uvm_component_utils_end

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_monitor();

endclass: mii_tx_mon

   function mii_tx_mon::new(string name = "mii_tx_mon",uvm_component parent);
      super.new(name, parent);
      mon_analysis_port = new ("mon_analysis_port",this);
   endfunction: new

   function void mii_tx_mon::build_phase(uvm_phase phase);
      super.build_phase(phase);

   endfunction: build_phase

   function void mii_tx_mon::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "mii_tx_monitor", mon_if);
   endfunction: connect_phase

   function void mii_tx_mon::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase); 

   endfunction: end_of_elaboration_phase

   function void mii_tx_mon::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);

   endfunction: start_of_simulation_phase

   task mii_tx_mon::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      phase.drop_objection(this);

   endtask: reset_phase

   task mii_tx_mon::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      phase.drop_objection(this);

   endtask:configure_phase

   task mii_tx_mon::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork
	 // tx_monitor();
      join
      phase.drop_objection(this);

   endtask: run_phase

   task mii_tx_mon::tx_monitor();
      forever begin
	 mii_transaction tr;

	 `uvm_do_callbacks(mii_tx_mon,mii_tx_mon_callbacks,
			   pre_trans(this, tr))
	 `uvm_info("mii_tx_mon1_MONITOR", "Starting transaction...",UVM_MEDIUM)

	 `uvm_info("mii_tx_mon1_MONITOR"," User need to add monitoring logic ",UVM_MEDIUM)
	 $finish;
	 `uvm_do_callbacks(mii_tx_mon,mii_tx_mon_callbacks,
			   pre_ack(this, tr))
	 `uvm_info("mii_tx_mon1_MONITOR", "Completed transaction...",UVM_HIGH)
	 `uvm_info("mii_tx_mon1_MONITOR", tr.sprint(),UVM_HIGH)
	 `uvm_do_callbacks(mii_tx_mon,mii_tx_mon_callbacks,
			   post_trans(this, tr))
	 mon_analysis_port.write(tr);
      end
   endtask: tx_monitor

`endif // MII_TX_MON__SV
