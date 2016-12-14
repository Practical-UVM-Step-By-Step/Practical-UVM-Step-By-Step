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

`ifndef SPI_AGENT__SV
 `define SPI_AGENT__SV

class spi_agent extends uvm_agent;
   // ToDo: add sub environment properties here
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   spi_drv slv_drv;
   spi_mon slv_mon;
   spi_seqr slv_seqr;
   typedef virtual spi_if vif;
   vif slv_agt_if;
   `uvm_component_utils(spi_agent)

   function new(string name = "slv_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      slv_mon = spi_mon::type_id::create("mon", this);
      if (is_active == UVM_ACTIVE) begin
         slv_drv = spi_drv::type_id::create("drv", this);
         slv_seqr = spi_seqr::type_id::create("slv_seqr",this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "spi_if", slv_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"slv_drv","spi_if",slv_drv.drv_if);
      uvm_config_db# (vif)::set(this,"mast_mon","spi_if",slv_mon.mon_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
	 
	 slv_drv.seq_item_port.connect(slv_seqr.seq_item_export);
      end
   endfunction

   virtual function void start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);

      //ToDo :: Implement here

   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"slv_agt_main");

      //ToDo :: Implement here

      phase.drop_objection(this);
   endtask

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      //ToDo :: Implement here

   endfunction

endclass: spi_agent

`endif // SPI_AGENT__SV
