`ifndef WB_SLAVE_AGENT__SV
 `define WB_SLAVE_AGENT__SV


class wb_slave_agent extends uvm_agent;
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   wb_slave slv_drv;
   wb_slave_mon slv_mon;
   typedef virtual wb_slave_if vif;
   vif slv_agt_if;

   wb_config slv_agent_cfg;

   `uvm_component_utils_begin(wb_slave_agent)
      `uvm_field_object(slv_drv, UVM_DEFAULT)
      `uvm_field_object(slv_mon, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name = "slv_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (!uvm_config_db#(vif)::get(this, "", "slv_if", slv_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end

      if (!uvm_config_db#(wb_config)::get(this, "", "slave_agent_cfg", slv_agent_cfg)) begin
         `uvm_fatal("AGT/NOCONFIG", "No Config specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"slv_mon","mon_if",slv_agt_if);
      slv_mon = wb_slave_mon::type_id::create("mon", this);
      slv_mon.slv_mon_cfg = slv_agent_cfg;

      if (is_active == UVM_ACTIVE) begin
      	 uvm_config_db# (vif)::set(this,"slv_drv","slv_if",slv_agt_if);
         slv_drv = wb_slave::type_id::create("drv", this);
 	 slv_drv.wb_slave_cfg  = slv_agent_cfg;
      end
   endfunction: build_phase

endclass: wb_slave_agent

`endif // WB_SLAVE_AGENT__SV
