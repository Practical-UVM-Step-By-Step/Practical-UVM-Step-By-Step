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

`ifndef VGA_DVI_AGENT__SV
 `define VGA_DVI_AGENT__SV

class vga_dvi_agent extends uvm_agent;

   // ToDo: add uvm agent properties here
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   vga_dvi_sqr mast_sqr;
   vga_dvi_drv mast_drv;
   vga_dvi_mon mast_mon;
   typedef virtual wb_vga_disp_if vif;
   vif mast_agt_if; 

   `uvm_component_utils_begin(vga_dvi_agent)
      `uvm_field_object(mast_sqr, UVM_ALL_ON)
      `uvm_field_object(mast_drv, UVM_ALL_ON)
      `uvm_field_object(mast_mon, UVM_ALL_ON)
   `uvm_component_utils_end

   function new(string name = "mast_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mast_mon = vga_dvi_mon::type_id::create("mast_mon", this);
      if (is_active == UVM_ACTIVE) begin
         mast_sqr = vga_dvi_sqr::type_id::create("mast_sqr", this);
         mast_drv = vga_dvi_drv::type_id::create("mast_drv", this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "disp_if", mast_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"mast_drv","drv_if",mast_drv.drv_if);
      uvm_config_db# (vif)::set(this,"mast_mon","mon_if",mast_mon.mon_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
   	 mast_drv.seq_item_port.connect(mast_sqr.seq_item_export);
      end
   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"slv_agt_run");

      //ToDo :: Implement here

      phase.drop_objection(this);
   endtask

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      //ToDo :: Implement here

   endfunction

endclass: vga_dvi_agent

`endif // VGA_DVI_AGENT__SV

