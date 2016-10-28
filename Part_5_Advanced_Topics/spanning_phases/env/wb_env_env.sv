
`ifndef WB_ENV_ENV__SV
 `define WB_ENV_ENV__SV
 `include "wb_env.sv"
class wb_env_env extends uvm_env;
   wb_master_agent master_agent;
   wb_slave_agent slave_agent;
   wb_env_cov cov;
   wb_master_mon_2cov_connect mon2cov;
   wb_scoreboard sb;

   // This is the multiple phase monitor in TB.
   typedef virtual wb_master_if vif;
   vif multi_phase_mon_if;

   wb_master_phase_mon multi_phase_mon;


   `uvm_component_utils(wb_env_env)

   extern function new(string name="wb_env_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);

endclass: wb_env_env

function wb_env_env::new(string name= "wb_env_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_env_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
   slave_agent = wb_slave_agent::type_id::create("slave_agent",this);
   
   cov = wb_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = wb_master_mon_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   sb = wb_scoreboard::type_id::create("sb",this);
   if (!uvm_config_db#(vif)::get(this, "", "mst_if", multi_phase_mon_if)) begin
      `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this multi phase agent instance")
   end
   uvm_config_db# (vif)::set(this,"multi_phase_mon","mon_if",multi_phase_mon_if);
   multi_phase_mon = wb_master_phase_mon::type_id::create("multi_phase_mon",this);
   multi_phase_mon.mstr_mon_cfg  = master_agent.mstr_agent_cfg;


endfunction: build_phase

function void wb_env_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);
   master_agent.mast_mon.mon_analysis_port.connect(sb.before_export);
   slave_agent.slv_mon.mon_analysis_port.connect(sb.after_export);
endfunction: connect_phase


`endif // WB_ENV_ENV__SV

