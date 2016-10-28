//
// Template for UVM-compliant physical-level transactor
//

`ifndef WB_SLAVE__SV
 `define WB_SLAVE__SV

typedef class wb_transaction;
   typedef class wb_slave_mem_mam;

class wb_slave_mem_mam_callbacks extends uvm_callback;

   // Called before a transaction is executed
   virtual task pre_tx( wb_slave_mem_mam xactor, wb_transaction tr);
      $display("pre tx slave Not implemented yet");
   endtask: pre_tx


   // Called after a transaction has been executed
   virtual task post_tx( wb_slave_mem_mam xactor,
                         wb_transaction tr);
      `uvm_info(get_full_name(), tr.sprint(),UVM_HIGH);

   endtask: post_tx




endclass: wb_slave_mem_mam_callbacks


class wb_slave_mem_mam extends uvm_driver # (wb_transaction);

   protected wb_transaction m_tr; // This is what is captured
   event send_to_get;
   local bit [63:0] ram [*];

   uvm_blocking_get_imp #(wb_transaction,wb_slave_mem_mam) get_export;
   // uvm_blocking_put_port #(wb_transaction,wb_slave_mem_mam) addr_ph_imp;

   wb_config wb_slave_mem_mam_cfg;
   
   typedef virtual  wb_slave_mem_mam_if v_if; 
   v_if drv_if;
   `uvm_register_cb(wb_slave_mem_mam,wb_slave_mem_mam_callbacks); 
   
   extern function new(string name = "wb_slave_mem_mam",
                       uvm_component parent = null); 
   
   `uvm_component_utils_begin(wb_slave_mem_mam)
   `uvm_component_utils_end


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern protected virtual task slave_driver();


   task get(output wb_transaction transaction);
      wait(send_to_get.triggered)
  	transaction = m_tr;
      m_tr = null;
      send_to_get = null;
   endtask: get


   uvm_mem_mam_cfg memory_config;


   function bit [63:0] read(bit [63:0] addr);
      read = (ram.exists(addr)) ? ram[addr] : 64'bx;
   endfunction: read
   function void write(bit [63:0] addr, bit [63:0] data);
      ram[addr] = data;
   endfunction: write

endclass: wb_slave_mem_mam





   function wb_slave_mem_mam::new(string name = "wb_slave_mem_mam",
				  uvm_component parent = null);
      super.new(name, parent);
      get_export = new("slv_get_export",this);
      
   endfunction: new


   function void wb_slave_mem_mam::build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction: build_phase

   function void wb_slave_mem_mam::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(!uvm_config_db#(v_if)::get(this, "", "slv_if", drv_if))
	`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".v_if"}); 
   endfunction: connect_phase

   function void wb_slave_mem_mam::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   function void wb_slave_mem_mam::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
   endfunction: start_of_simulation_phase

   
   task wb_slave_mem_mam::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      this.drv_if.DAT_O <= 64'bz;
      this.drv_if.TGD_O <= 16'bz;
      this.drv_if.ACK_O <=  1'b0;
      this.drv_if.RTY_O  <=  1'b0;
      this.drv_if.ERR_O <=  1'b0;
      phase.drop_objection(this);
   endtask: reset_phase

   task wb_slave_mem_mam::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      //ToDo: Configure your component here
      phase.drop_objection(this);
   endtask:configure_phase


   task wb_slave_mem_mam::main_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      fork 
	 slave_driver();
      join_none
      phase.drop_objection(this);
   endtask: main_phase




   task wb_slave_mem_mam::slave_driver();
      bit [63:0] read_data;
      int 	 repeat_count = this.wb_slave_mem_mam_cfg.max_n_wss;
      forever begin
	 wb_transaction tr;
         process proc;

	 do begin
            if (this.drv_if.CYC_I !== 1'b1 || this.drv_if.STB_I !== 1'b1) begin
               this.drv_if.DAT_O    <= 64'bz;
               this.drv_if.TGD_O    <= 16'bz;
               this.drv_if.ACK_O    <=  1'b0;
               this.drv_if.RTY_O    <=  1'b0;
               this.drv_if.ERR_O     <=  1'b0;
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
	 if(this.wb_slave_mem_mam_cfg.min_addr <= tr.address  && tr.address <=this.wb_slave_mem_mam_cfg.max_addr )
	   begin
	      `uvm_info(get_full_name(),"responding in this cycle",UVM_HIGH)
	      
	      `uvm_do_callbacks(wb_slave_mem_mam,wb_slave_mem_mam_callbacks, pre_tx(this, tr))
	      tr.tga = this.drv_if.TGA_I;
	      if(this.drv_if.WE_I) begin
		 tr.kind = wb_transaction::WRITE;
	   	 `uvm_info("Wb_slave","got a write transaction  from Master ",UVM_HIGH)
		 tr.data  = this.drv_if.DAT_I;
	         tr.tgd  = this.drv_if.TGD_I;
		 write(tr.address,tr.data);
		 tr.status = wb_transaction::ACK;
		 `uvm_info(get_full_name(),$psprintf(" Received write transaction to address %h with data %h",tr.address,tr.data),UVM_HIGH)
              end
	      else begin
		 tr.kind = wb_transaction::READ ;
   		 `uvm_info("Wb_slave","got a read transaction  ",UVM_HIGH)
		 read_data = read(tr.address);

		 this.drv_if.DAT_O = read_data;
		 this.drv_if.TGD_O = tr.tgd;
		 tr.status = wb_transaction::ACK;
		 `uvm_info(get_full_name(),$psprintf(" Received READ transaction to address %h. Responding with data %h",tr.address,tr.data),UVM_HIGH)
      	      end




	      // repeat (this.wb_slave_mem_mam_cfg.max_n_wss) begin
	      repeat (repeat_count) begin
		 @ (this.drv_if.slave_cb);
              end

	      case (tr.status)
		wb_transaction::ACK : this.drv_if.ACK_O <= 1'b1;
		wb_transaction::RTY : this.drv_if.RTY_O <= 1'b1;
		wb_transaction::ERR : this.drv_if.ERR_O <= 1'b1;
              endcase

	      tr.sel = this.drv_if.SEL_I;
	      tr.tgc  = this.drv_if.TGC_I;
	      @(this.drv_if.slave_cb);
	   end
	 `uvm_do_callbacks(wb_slave_mem_mam,wb_slave_mem_mam_callbacks, post_tx(this, tr))
      	 `uvm_info("SLAVE_DRIVER", "Completed transaction...",UVM_HIGH)
      end
   endtask : slave_driver





`endif // WB_SLAVE__SV


