`ifndef WB_SLAVE_MON__SV
 `define WB_SLAVE_MON__SV


typedef class wb_transaction;
   typedef class wb_slave_mon;
   typedef class wb_config;

class wb_slave_mon_callbacks extends uvm_callback;


   // Called at start of observed transaction
   virtual function void pre_trans(wb_slave_mon xactor,
                                   wb_transaction tr);
   endfunction: pre_trans


   // Called before acknowledging a transaction
   virtual function pre_ack(wb_slave_mon xactor,
                            wb_transaction tr);
      `uvm_info(get_full_name,$psprintf("Slave Mon TRansaction pre-ack %s",tr.sprint()), UVM_HIGH)
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(wb_slave_mon xactor,
                                    wb_transaction tr);

   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(wb_slave_mon xactor,
                              wb_transaction tr);
   endtask: post_cb_trans

endclass: wb_slave_mon_callbacks

   

class wb_slave_mon extends uvm_monitor;

   uvm_analysis_port #(wb_transaction) mon_analysis_port;  //TLM analysis port
   typedef virtual wb_slave_if v_if;
   v_if mon_if;

   wb_config slv_mon_cfg;
   extern function new(string name = "wb_slave_mon",uvm_component parent);
   `uvm_register_cb(wb_slave_mon,wb_slave_mon_callbacks);

   `uvm_component_utils(wb_slave_mon)

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern protected virtual task slave_monitor_task();

endclass: wb_slave_mon


   function wb_slave_mon::new(string name = "wb_slave_mon",uvm_component parent);
      super.new(name, parent);
      mon_analysis_port = new ("mon_analysis_port",this);
   endfunction: new

   function void wb_slave_mon::build_phase(uvm_phase phase);
      super.build_phase(phase);

   endfunction: build_phase

   function void wb_slave_mon::connect_phase(uvm_phase phase);
      super.connect_phase(phase);

      uvm_config_db#(v_if)::get(this, "", "slv_if", mon_if);
   endfunction: connect_phase





   task wb_slave_mon::main_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      fork
	 slave_monitor_task();
      join_none
      phase.drop_objection(this);
   endtask: main_phase


   task wb_slave_mon::slave_monitor_task();

      forever begin
	 wb_transaction tr;

	 do begin

            @(this.mon_if.CYC_I or
              this.mon_if.STB_I or
              this.mon_if.ADR_I or
              this.mon_if.SEL_I or
              this.mon_if.WE_I  or
              this.mon_if.TGA_I or
              this.mon_if.TGC_I);
	 end while (this.mon_if.CYC_I !== 1'b1 ||
                    this.mon_if.STB_I !== 1'b1);
	 tr= wb_transaction::type_id::create("tr", this);
	 tr.address = this.mon_if.ADR_I;
	 // Are we supposed to respond to this cycle?
	 if(this.slv_mon_cfg.min_addr <= tr.address  && tr.address <=this.slv_mon_cfg.max_addr )
	   begin
	      `uvm_do_callbacks(wb_slave_mon,wb_slave_mon_callbacks,
				pre_trans(this, tr))

	      tr.tga = this.mon_if.TGA_I;
	      tr.tgc = this.mon_if.TGC_I;
	      tr.tgd  = this.mon_if.TGD_I;
	      tr.lock = this.mon_if.LOCK_I;
	      if(this.mon_if.WE_I) begin
		 tr.kind = wb_transaction::WRITE;
	   	 `uvm_info("WB slave Monitor","got a write transaction  from Master ",UVM_HIGH)
		 tr.data  = this.mon_if.DAT_I;
		 tr.status = wb_transaction::ACK;
      		 tr.sel = this.mon_if.SEL_I;
              end
	      else begin
		 tr.kind = wb_transaction::READ ;
   		 `uvm_info("Wb_slave Monitor","got a read transaction  ",UVM_HIGH)
		 tr.data  = this.mon_if.DAT_I;
		 tr.status = wb_transaction::ACK;
      		 tr.sel = this.mon_if.SEL_I;
      	      end

	      `uvm_do_callbacks(wb_slave_mon,wb_slave_mon_callbacks,
				pre_ack(this, tr))

	      repeat (this.slv_mon_cfg.max_n_wss) begin
		 @ (this.mon_if.slave_mon_cb);
              end

	      `uvm_do_callbacks(wb_slave_mon,wb_slave_mon_callbacks,
				post_trans(this, tr))
              `uvm_info(get_full_name,$psprintf("SLAVE Mon Transaction post cb trans \n %s",tr.sprint()), UVM_HIGH)

	      mon_analysis_port.write(tr);
	   end
      end

   endtask: slave_monitor_task




`endif // WB_SLAVE_MON__SV
