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

`ifndef SPI_DRV__SV
 `define SPI_DRV__SV

typedef class spi_transaction;
   typedef class spi_drv;

class spi_drv_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( spi_drv xactor,
                        spi_transaction tr);
      
      // ToDo: Add relevant code

   endtask: pre_tx

   // Called after a transaction has been executed
   virtual task post_tx( spi_drv xactor,
                         spi_transaction tr);
      // ToDo: Add relevant code

   endtask: post_tx

endclass: spi_drv_callbacks

class spi_drv extends uvm_driver # (spi_transaction);

   
   typedef virtual spi_if v_if; 
   v_if drv_if;
   `uvm_component_utils(spi_drv)
   `uvm_register_cb(spi_drv,spi_drv_callbacks); 
   
   extern function new(string name = "spi_drv",
                       uvm_component parent = null); 
   

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(spi_transaction tr); 
   extern protected virtual task tx_driver();

endclass: spi_drv

   function spi_drv::new(string name = "spi_drv",
			 uvm_component parent = null);
      super.new(name, parent);

      
   endfunction: new

   function void spi_drv::build_phase(uvm_phase phase);
      super.build_phase(phase);
      //ToDo : Implement this phase here

   endfunction: build_phase

   function void spi_drv::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "spi_if", drv_if);
   endfunction: connect_phase

   function void spi_drv::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   function void spi_drv::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      //ToDo: Implement this phase here
   endfunction: start_of_simulation_phase

   
   task spi_drv::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      // ToDo: Reset output signals
      phase.drop_objection(this);
   endtask: reset_phase

   task spi_drv::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      //ToDo: Configure your component here
      phase.drop_objection(this);
   endtask:configure_phase

   task spi_drv::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork 
	 tx_driver();
      join
      phase.drop_objection(this);
   endtask: run_phase

   task spi_drv::tx_driver();
      forever begin
	 spi_transaction tr;
	 // ToDo: Set output signals to their idle state
	 // this.drv_if.master.async_en      <= 0;
	 `uvm_info("wb_spi_env_DRIVER", "Starting transaction...",UVM_LOW)
	 seq_item_port.get_next_item(tr);
	 case (tr.kind) 
           spi_transaction::READ: begin
              // ToDo: Implement READ transaction

           end
           spi_transaction::WRITE: begin
              // ToDo: Implement READ transaction

           end
	 endcase
	 `uvm_do_callbacks(spi_drv,spi_drv_callbacks,
			   pre_tx(this, tr))
	 send(tr); 
	 seq_item_port.item_done();
	 `uvm_info("wb_spi_env_DRIVER", "Completed transaction...",UVM_LOW)
	 `uvm_info("wb_spi_env_DRIVER", tr.sprint(),UVM_HIGH)
	 `uvm_do_callbacks(spi_drv,spi_drv_callbacks,
			   post_tx(this, tr))

      end
   endtask : tx_driver

   task spi_drv::send(spi_transaction tr);
      // ToDo: Drive signal on interface
      
   endtask: send

`endif // SPI_DRV__SV

