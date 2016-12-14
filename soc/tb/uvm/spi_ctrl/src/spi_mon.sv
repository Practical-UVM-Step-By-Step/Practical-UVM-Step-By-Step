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

`ifndef SPI_MON__SV
 `define SPI_MON__SV

typedef class spi_transaction;
   typedef class spi_mon;

class spi_mon_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use a task if callbacks can be blocking

   // Called at start of observed transaction
   virtual function void pre_trans(spi_mon xactor,
                                   spi_transaction tr);
   endfunction: pre_trans

   // Called before acknowledging a transaction
   virtual function pre_ack(spi_mon xactor,
                            spi_transaction tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(spi_mon xactor,
                                    spi_transaction tr);
   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(spi_mon xactor,
                              spi_transaction tr);
   endtask: post_cb_trans

endclass: spi_mon_callbacks

   

class spi_mon extends uvm_monitor;

   uvm_analysis_port #(spi_transaction) mon_analysis_port;  //TLM analysis port
   typedef virtual spi_if v_if;
   v_if mon_if;
   // ToDo: Add another class property if required
   extern function new(string name = "spi_mon",uvm_component parent);
   `uvm_register_cb(spi_mon,spi_mon_callbacks);
   `uvm_component_utils(spi_mon)

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_monitor();

endclass: spi_mon

   function spi_mon::new(string name = "spi_mon",uvm_component parent);
      super.new(name, parent);
      mon_analysis_port = new ("mon_analysis_port",this);
   endfunction: new

   function void spi_mon::build_phase(uvm_phase phase);
      super.build_phase(phase);
      //ToDo : Implement this phase here

   endfunction: build_phase

   function void spi_mon::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "mon_if", mon_if);
   endfunction: connect_phase

   function void spi_mon::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase); 
      //ToDo: Implement this phase here

   endfunction: end_of_elaboration_phase

   function void spi_mon::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      //ToDo: Implement this phase here

   endfunction: start_of_simulation_phase

   task spi_mon::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      // ToDo: Implement reset here
      phase.drop_objection(this);

   endtask: reset_phase

   task spi_mon::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      //ToDo: Configure your component here
      phase.drop_objection(this);

   endtask:configure_phase

   task spi_mon::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork
	 // tx_monitor();
      join_none
      phase.drop_objection(this);

   endtask: run_phase

   task spi_mon::tx_monitor();
      forever begin
	 spi_transaction tr;
	 // ToDo: Wait for start of transaction

	 `uvm_do_callbacks(spi_mon,spi_mon_callbacks,
			   pre_trans(this, tr))
	 `uvm_info("wb_spi_env_MONITOR", "Starting transaction...",UVM_LOW)
	 // ToDo: Observe first half of transaction

	 // ToDo: User need to add monitoring logic and remove $finish
	 `uvm_info("wb_spi_env_MONITOR"," User need to add monitoring logic ",UVM_LOW)
	 $finish;
	 `uvm_do_callbacks(spi_mon,spi_mon_callbacks,
			   pre_ack(this, tr))
	 // ToDo: React to observed transaction with ACK/NAK
	 `uvm_info("wb_spi_env_MONITOR", "Completed transaction...",UVM_HIGH)
	 `uvm_info("wb_spi_env_MONITOR", tr.sprint(),UVM_HIGH)
	 `uvm_do_callbacks(spi_mon,spi_mon_callbacks,
			   post_trans(this, tr))
	 mon_analysis_port.write(tr);
      end
   endtask: tx_monitor

`endif // SPI_MON__SV
