`ifndef WB_SLAVE__SV
 `define WB_SLAVE__SV

typedef class wb_transaction;
   typedef class wb_slave;

class wb_slave_callbacks extends uvm_callback;

   // Called before a transaction is executed
   virtual task pre_tx( wb_slave xactor, wb_transaction tr);
      `uvm_info("WB_SLAVE",$sformatf("pre tx slave Not implemented yet"),UVM_LOW)
   endtask: pre_tx

   // Called after a transaction has been executed
   virtual task post_tx( wb_slave xactor,
                         wb_transaction tr);
      `uvm_info("WB_SLAVE",$sformatf("post tx slave Not implemented yet"),UVM_LOW)

   endtask: post_tx

endclass: wb_slave_callbacks


class wb_slave extends uvm_driver # (wb_transaction);

   wb_transaction m_tr; // This is what is captured
   local bit [63:0] ram [*];

   uvm_blocking_get_imp #(wb_transaction,wb_slave) getp;

   wb_config wb_slave_cfg;
   
   typedef virtual  wb_slave_if v_if; 
   v_if drv_if;
   `uvm_register_cb(wb_slave,wb_slave_callbacks); 
   
   extern function new(string name = "wb_slave",
                       uvm_component parent = null); 
   
   `uvm_component_utils(wb_slave)

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task slave_driver();

   task get(output wb_transaction transaction);
      wait(m_tr != null )
  	transaction = m_tr;
      m_tr = null;
   endtask: get

endclass: wb_slave





   function wb_slave::new(string name = "wb_slave",
			  uvm_component parent = null);
      super.new(name, parent);
      getp= new("slv_get_export",this);
      
   endfunction: new


   function void wb_slave::build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction: build_phase

   function void wb_slave::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(!uvm_config_db#(v_if)::get(this, "", "slv_if", drv_if))
	`uvm_fatal("NOVIF SLV DRIVER",{"virtual interface must be set for: ","WB_SLAVE",".v_if"}); 
   endfunction: connect_phase

   function void wb_slave::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase


   
   task wb_slave::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      this.drv_if.DAT_O <= 64'bz;
      this.drv_if.TGD_O <= 16'bz;
      this.drv_if.ACK_O <=  1'bz;
      this.drv_if.RTY_O  <=  1'bz;
      this.drv_if.ERR_O <=  1'bz;
      phase.drop_objection(this);
   endtask: reset_phase

   task wb_slave::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");

      phase.drop_objection(this);
   endtask:configure_phase


   task wb_slave::run_phase(uvm_phase phase);
      super.configure_phase(phase);
      //phase.raise_objection(this,"");
      fork 
	 slave_driver();
      join_none
      //phase.drop_objection(this);
   endtask: run_phase




   task wb_slave::slave_driver();
      bit [63:0] read_data;
      wb_slave_cfg.print();
      forever begin
	 wb_transaction tr;

	 do begin
            if (this.drv_if.CYC_I !== 1'b1 || this.drv_if.STB_I !== 1'b1) begin
               this.drv_if.DAT_O    <= 64'bz;
               this.drv_if.TGD_O    <= 16'bz;
               this.drv_if.ACK_O    <=  1'bz;
               this.drv_if.RTY_O    <=  1'bz;
               this.drv_if.ERR_O     <=  1'bz;
            end

            @(this.drv_if.CYC_I or
              this.drv_if.STB_I or
              this.drv_if.ADR_I or
              this.drv_if.SEL_I or
              this.drv_if.WE_I  or
              this.drv_if.TGA_I or
              this.drv_if.TGC_I);
	 end while (this.drv_if.CYC_I !== 1'b1 ||
                    this.drv_if.STB_I !== 1'b1);
	 tr= wb_transaction::type_id::create("tr", this);
	 tr.address = this.drv_if.ADR_I;
	 // Are we supposed to respond to this cycle?
	 if(this.wb_slave_cfg.min_addr <= tr.address  && tr.address <=this.wb_slave_cfg.max_addr )
	   begin
	      tr.sel = this.drv_if.SEL_I;
	      tr.tgc  = this.drv_if.TGC_I;
	      `uvm_do_callbacks(wb_slave,wb_slave_callbacks, pre_tx(this, tr))
	      tr.tga = this.drv_if.TGA_I;
	      if(this.drv_if.WE_I) begin
		 tr.kind = wb_transaction::WRITE;
	   	 `uvm_info("Wb_slave","got a write transaction  from Master ",UVM_LOW)
		 tr.data  = this.drv_if.DAT_I;
	         tr.tgd  = this.drv_if.TGD_I;
	      end
	      else  begin
		 tr.kind = wb_transaction::READ ;
   		 `uvm_info("Wb_slave","got a read transaction  ",UVM_LOW)
	      end
	      m_tr = tr;
	      seq_item_port.get_next_item(tr);
              this.drv_if.DAT_O    = 64'bz;
 	      if(tr.kind == wb_transaction::READ) begin
		 this.drv_if.DAT_O = tr.data;
	      end

	      repeat (this.wb_slave_cfg.max_n_wss) begin
		 @ (this.drv_if.slave_cb);
              end
	      this.drv_if.ACK_O <= 1'b1;
  	      this.drv_if.RTY_O <= 1'b0;
	      this.drv_if.ERR_O <= 1'b0;
	      @ (this.drv_if.slave_cb);
	      this.drv_if.ACK_O <= 1'b0;
	      @(this.drv_if.slave_cb);
              this.drv_if.DAT_O    <= 64'bz;
	      `uvm_do_callbacks(wb_slave,wb_slave_callbacks, post_tx(this, tr))
      	      `uvm_info("SLAVE_DRIVER", "Completed transaction...",UVM_LOW)
	      seq_item_port.item_done(tr);
	   end // if 
      end //forever
   endtask : slave_driver

`endif // WB_SLAVE__SV


