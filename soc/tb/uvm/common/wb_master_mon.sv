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

`ifndef WB_MASTER_MON__SV
 `define WB_MASTER_MON__SV

typedef class wb_transaction;
   typedef class wb_master_mon;
   typedef class wb_config;

class wb_master_mon_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use a task if callbacks can be blocking

   // Called at start of observed transaction
   virtual function void pre_trans(wb_master_mon xactor,
                                   wb_transaction tr);
   endfunction: pre_trans

   // Called before acknowledging a transaction
   virtual function pre_ack(wb_master_mon xactor,
                            wb_transaction tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(wb_master_mon xactor,
                                    wb_transaction tr);
      `uvm_info("WB_MASTER_MON",tr.sprint(),UVM_DEBUG);

   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(wb_master_mon xactor,
                              wb_transaction tr);
   endtask: post_cb_trans

endclass: wb_master_mon_callbacks

   

class wb_master_mon extends uvm_monitor;

   uvm_analysis_port #(wb_transaction) mon_analysis_port;  //TLM analysis port
   typedef virtual wb_master_if v_if;
   v_if mon_if;

   wb_config mstr_mon_cfg;

   extern function new(string name = "wb_master_mon",uvm_component parent);
   `uvm_register_cb(wb_master_mon,wb_master_mon_callbacks);
   `uvm_component_utils_begin(wb_master_mon)
   `uvm_component_utils_end

   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task master_monitor_task();

endclass: wb_master_mon

   function wb_master_mon::new(string name = "wb_master_mon",uvm_component parent);
      super.new(name, parent);
      mon_analysis_port = new ("mon_analysis_port",this);
   endfunction: new

   function void wb_master_mon::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "mon_if", mon_if);
   endfunction: connect_phase

   function void wb_master_mon::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase); 
      if (mon_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");
   endfunction: end_of_elaboration_phase


   task wb_master_mon::run_phase(uvm_phase phase);
      phase.raise_objection(this,"");
      fork
	 master_monitor_task();
      join_none
      phase.drop_objection(this);

   endtask: run_phase

   task wb_master_mon::master_monitor_task();
      int repeat_count = this.mstr_mon_cfg.max_n_wss + 1;
      int timeout_count = 0;

      integer master_transaction_timeout;

      forever begin
	 wb_transaction tr;

	 do begin

            @(this.mon_if.CYC_O or
              this.mon_if.STB_O or
              this.mon_if.ADR_O or
              this.mon_if.SEL_O or
              this.mon_if.WE_O  or
              this.mon_if.TGA_O or
              this.mon_if.TGC_O);
	 end while (this.mon_if.CYC_O !== 1'b1 ||
                    this.mon_if.STB_O !== 1'b1);
	 tr= wb_transaction::type_id::create("tr", this);
	 tr.address = this.mon_if.ADR_O;
	 // Are we supposed to respond to this cycle?
	 if(this.mstr_mon_cfg.min_addr <= tr.address  && tr.address <=this.mstr_mon_cfg.max_addr )

	   begin
	      `uvm_do_callbacks(wb_master_mon,wb_master_mon_callbacks,
				pre_trans(this, tr))
	      timeout_count = 0;

	      tr.tga = this.mon_if.TGA_O;
	      if(this.mon_if.WE_O) begin
		 tr.kind = wb_transaction::WRITE;
		 tr.data  = this.mon_if.DAT_I;
	         tr.tgd  = this.mon_if.TGD_O;
		 tr.status = wb_transaction::ACK;
              end
	      else begin
		 tr.kind = wb_transaction::READ ;
		 tr.data  = this.mon_if.DAT_O;
	         tr.tgd  = this.mon_if.TGD_O;

		 tr.status = wb_transaction::ACK;
      	      end
      	      tr.sel = this.mon_if.SEL_O;
      	      tr.tgc  =this.mon_if.TGC_O;

	      `uvm_do_callbacks(wb_master_mon,wb_master_mon_callbacks,
				pre_ack(this, tr))

	      // Edge 1
	      tr.status = wb_transaction::TIMEOUT ;
	      while(!this.mon_if.ACK_I) begin
		 @(this.mon_if.monitor_cb);
		 timeout_count = timeout_count + 1;
		 // Wait states
		 case (1'b1)
		   this.mon_if.ERR_I: tr.status = wb_transaction::ERR ;
		   this.mon_if.RTY_I: tr.status = wb_transaction::RTY ;
		   this.mon_if.ACK_I: tr.status = wb_transaction::ACK ;
		   default: continue;
		 endcase
	      end
	      tr.data  = this.mon_if.DAT_O;
	      if ((timeout_count >  repeat_count )|| tr.status == wb_transaction::TIMEOUT ) begin
		 `uvm_info("wb_master_monitor ", "Timeout waiting for ACK_I, RTY_I or ERR_I",UVM_HIGH);
	      end
	      `uvm_do_callbacks(wb_master_mon,wb_master_mon_callbacks,
				post_trans(this, tr))
	      mon_analysis_port.write(tr);
	   end
      end // forever
   endtask: master_monitor_task

`endif // WB_MASTER_MON__SV

