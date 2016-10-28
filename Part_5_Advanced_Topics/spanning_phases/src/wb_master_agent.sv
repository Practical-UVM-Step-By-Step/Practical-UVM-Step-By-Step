`ifndef WB_MASTER_AGENT__SV
 `define WB_MASTER_AGENT__SV


class wb_master_agent extends uvm_agent;
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   wb_master_seqr mast_sqr;
   wb_master mast_drv;
   wb_master_mon mast_mon;
   typedef virtual wb_master_if vif;
   vif mast_agt_if; 
   wb_config mstr_agent_cfg;


   `uvm_component_utils_begin(wb_master_agent)
      `uvm_field_object(mast_sqr, UVM_DEFAULT)
      `uvm_field_object(mast_drv, UVM_DEFAULT)
      `uvm_field_object(mast_mon, UVM_DEFAULT)
      `uvm_field_object (mstr_agent_cfg,UVM_DEFAULT)
   `uvm_component_utils_end


   function new(string name = "mast_agt", uvm_component parent = null);
      super.new(name, parent);
      mstr_agent_cfg = new;
   endfunction

   virtual 	   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Create the Monitor`
      // Get the Interface
      if (!uvm_config_db#(vif)::get(this, "", "mst_if", mast_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      // Get the Config
      if (!uvm_config_db#(wb_config)::get(this, "", "mstr_agent_cfg", mstr_agent_cfg)) begin
         `uvm_fatal("AGT/NOCONFIG", "No Config specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"mast_mon","mon_if",mast_agt_if);
      mast_mon = wb_master_mon::type_id::create("mast_mon", this);
      mast_mon.mstr_mon_cfg = mstr_agent_cfg;

      // If Active, Build the sequencer and Driver

      if (is_active == UVM_ACTIVE) begin
	 uvm_config_db# (vif)::set(this,"mast_drv","mst_if",mast_agt_if);
         mast_sqr = wb_master_seqr::type_id::create("mast_sqr", this);
         mast_drv = wb_master::type_id::create("mast_drv", this);
	 mast_drv.mstr_drv_cfg = mstr_agent_cfg;
         mast_sqr.cfg = mstr_agent_cfg;
      end

   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
   	 mast_drv.seq_item_port.connect(mast_sqr.seq_item_export);
      end
   endfunction

endclass: wb_master_agent

`endif // WB_MASTER_AGENT__SV

