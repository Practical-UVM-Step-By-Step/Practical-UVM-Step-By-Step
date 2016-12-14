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

`ifndef WB_MASTER__SV
 `define WB_MASTER__SV

typedef class wb_transaction;
   typedef class wb_config;
   typedef class wb_master;
   typedef class wb_config;

class wb_master_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( wb_master xactor,
                        wb_transaction tr);
      
      `uvm_info(this.get_full_name(),	tr.sprint(),UVM_HIGH)

   endtask: pre_tx

   // Called after a transaction has been executed
   virtual task post_tx( wb_master xactor,
                         wb_transaction tr);
      // ToDo: Add relevant code

   endtask: post_tx

   // New code
   function new(string name="wb_master_callbacks");
      super.new(name);
   endfunction

   static string type_name = "wb_master_callbacks";

   virtual 	 function string get_type_name();
      return type_name;
   endfunction

endclass: wb_master_callbacks

class wb_master extends uvm_driver # (wb_transaction);

   wb_config mstr_drv_cfg;

   
   typedef virtual wb_master_if v_if; 
   v_if drv_if;
   `uvm_register_cb(wb_master,wb_master_callbacks); 
   
   extern function new(string name = "wb_master",
                       uvm_component parent = null); 
   
   `uvm_component_utils_begin(wb_master)
   `uvm_component_utils_end

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_task();
   extern virtual task run_phase(uvm_phase phase);
   extern virtual function void final_phase(uvm_phase phase);
   extern protected virtual task main_driver();

   extern protected virtual task read(wb_transaction trans);
   extern protected virtual task write(wb_transaction trans);
   extern protected virtual task blockRead(wb_transaction trans);
   extern protected virtual task blockWrite( wb_transaction trans);  
   extern protected virtual task ReadModifyWrite(wb_transaction trans);

   

endclass: wb_master

   function wb_master::new(string name = "wb_master",
			   uvm_component parent = null);
      super.new(name, parent);

      
   endfunction: new

   function void wb_master::build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction: build_phase

	function void wb_master::final_phase(uvm_phase phase);
	super.final_phase(phase);
	$display("\n\n Thank you for using examples from the book Practical UVM. Book ISBN 0997789603 on www.amazon.com\n\n ");
	endfunction
   function void wb_master::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "mst_if", drv_if);

   endfunction: connect_phase

   function void wb_master::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   
   task wb_master::reset_task();
      // Driving the signals as per the spec.
      this.drv_if.master_cb.DAT_O <= 'b0;
      this.drv_if.master_cb.TGD_O <= 'b0;
      this.drv_if.master_cb.ADR_O  <= 'b0;
      this.drv_if.master_cb.WE_O   <= 'b0;
      this.drv_if.master_cb.CYC_O <= 'b0;
      this.drv_if.master_cb.LOCK_O <= 'b0;
      this.drv_if.master_cb.SEL_O <= 'b0;
      this.drv_if.master_cb.STB_O <= 'b0;
      this.drv_if.master_cb.TGA_O <= 'b0;
      this.drv_if.master_cb.TGC_O <= 'b0;
      repeat (4) @(this.drv_if.master_cb);
      wait(this.drv_if.rst);
      
      wait(!this.drv_if.rst);
      // Done setting signals. Now we can drop objections and move on.

   endtask: reset_task

   task wb_master::run_phase(uvm_phase phase);
      super.configure_phase(phase);
      fork 
	reset_task();
	 main_driver();
      join_none
   endtask: run_phase

   task wb_master::main_driver();
      int count;
      count = 0;
      forever begin
	 wb_transaction tr;
	 bit drop = 0;
	 // Set output signals to their idle state

	 this.drv_if.master_cb.DAT_O <= 'b0; 
         this.drv_if.master_cb.TGD_O <= 'b0;
         this.drv_if.master_cb.ADR_O <= 'b0;
         this.drv_if.master_cb.CYC_O <= 'b0;
         this.drv_if.master_cb.LOCK_O <= 'b0;
         this.drv_if.master_cb.SEL_O <= 'b0;
         this.drv_if.master_cb.STB_O <= 'b0;
         this.drv_if.master_cb.TGA_O <= 'b0;
         this.drv_if.master_cb.TGC_O <= 'b0;

	 seq_item_port.get_next_item(tr);
	 `uvm_info("wb_env_DRIVER", "Starting transaction...",UVM_LOW)
	 `uvm_do_callbacks(wb_master,wb_master_callbacks, pre_tx(this, tr))
	 // Since we are just beginning the transaction, we dont know what state it's in yet. 

	 // This is not recommended! phase.raise_objection(this,"mast drv starting TXN ");
         tr.status = wb_transaction::UNKNOWN;

	 case (tr.kind)  
           wb_transaction::READ: begin
	      read(tr);
           end
           wb_transaction::WRITE: begin
              // ToDo: Implement DISPLAY transaction
	      write(tr);
           end
           wb_transaction::BLK_RD: begin
              // ToDo: Implement BLK_RD transaction
           end
           wb_transaction::BLK_WR: begin
              // ToDo: Implement BLK_RD transaction
           end
           wb_transaction::RMW: begin
              // ToDo: Implement RMW transaction
           end
	 endcase
	 
	 seq_item_port.item_done();
	 `uvm_do_callbacks(wb_master,wb_master_callbacks, post_tx(this, tr))
	 `uvm_info("wb_env_DRIVER", "Completed transaction...",UVM_LOW)
	 count = count + 1;
      end
   endtask : main_driver

   task wb_master::read(wb_transaction trans);
      int repeat_count = this.mstr_drv_cfg.max_n_wss + 1;
      int timeout_count = 0;
      @(this.drv_if.master_cb);

      `uvm_info("Wb master","Got a read transaction",UVM_LOW)

      // Edge 0
      this.drv_if.master_cb.ADR_O <= trans.address;
      this.drv_if.master_cb.TGA_O <= trans.tga;
      this.drv_if.master_cb.WE_O  <= 1'b0;
      this.drv_if.master_cb.SEL_O <= trans.sel;
      this.drv_if.master_cb.CYC_O <= 1'b1;
      this.drv_if.master_cb.TGC_O <= trans.tgc;
      this.drv_if.master_cb.STB_O <= 1'b1;
      this.drv_if.master_cb.LOCK_O <= trans.lock;

      // Edge 1
      trans.status = wb_transaction::TIMEOUT ;
      while(!this.drv_if.master_cb.ACK_I) begin 
	 @(this.drv_if.master_cb);
	 timeout_count = timeout_count + 1;
	 case (1'b1)
	   this.drv_if.master_cb.ERR_I: trans.status = wb_transaction::ERR ;
	   this.drv_if.master_cb.RTY_I: trans.status = wb_transaction::RTY ;
	   this.drv_if.master_cb.ACK_I: trans.status = wb_transaction::ACK ;
	   default: continue;
	 endcase

	 break;
      end
      trans.data = this.drv_if.master_cb.DAT_I;
      trans.tgd  = this.drv_if.master_cb.TGD_I;

      this.drv_if.master_cb.CYC_O  <= 1'b0;
      @(this.drv_if.master_cb);

   endtask	
   
   task wb_master::write( wb_transaction trans);
      int repeat_count = this.mstr_drv_cfg.max_n_wss + 2;
      int timeout_count = 0;

      // Section 3.2.2 of Wishbone B3 Specification
      @(this.drv_if.master_cb);
      `uvm_info("Wb master","Got a write transaction",UVM_LOW)

      // Edge 0
      this.drv_if.master_cb.ADR_O <= trans.address;
      this.drv_if.master_cb.TGA_O  <= trans.tga;
      this.drv_if.master_cb.DAT_O <= trans.data;
      this.drv_if.master_cb.TGD_O <= trans.tgd;
      this.drv_if.master_cb.WE_O    <= 1'b1;
      this.drv_if.master_cb.SEL_O  <= trans.sel;
      this.drv_if.master_cb.CYC_O  <= 1'b1;
      this.drv_if.master_cb.TGC_O  <= trans.tgc;
      this.drv_if.master_cb.STB_O  <= 1'b1;

      // Edge 1
      trans.status = wb_transaction::TIMEOUT ;
      while(!this.drv_if.master_cb.ACK_I) begin 
	 @(this.drv_if.master_cb);
	 timeout_count = timeout_count + 1;
	 // Wait states
	 case (1'b1)
      	   this.drv_if.master_cb.ERR_I: trans.status = wb_transaction::ERR ;
     	   this.drv_if.master_cb.RTY_I: trans.status = wb_transaction::RTY ;
      	   this.drv_if.master_cb.ACK_I: trans.status = wb_transaction::ACK ;
      	   default: continue;
	 endcase
      end

      this.drv_if.master_cb.LOCK_O <= trans.lock;
      this.drv_if.master_cb.CYC_O  <= 1'b0;
      @(this.drv_if.master_cb);
      `uvm_info("WB_MASTER",trans.sprint(),UVM_HIGH);
   endtask	

   task wb_master::blockRead(wb_transaction trans);
      $display ("not implemented yet");
   endtask	

   task wb_master::blockWrite(wb_transaction trans);
      $display ("not implemented yet");
   endtask	
   
   task wb_master::ReadModifyWrite(wb_transaction trans);
      $display ("not implemented yet");
   endtask	


`endif // WB_MASTER__SV

