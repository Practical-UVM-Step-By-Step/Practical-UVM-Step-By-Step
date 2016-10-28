`ifndef SIMPLE_RAL_ENV_RAL_ENV__SV
`define SIMPLE_RAL_ENV_RAL_ENV__SV

`include "mstr_slv_src.incl"

`include "simple_ral_env_cfg.sv"

`include "simple_ral_env_cov.sv"
`include "mon_2cov.sv"

`include "ral_simple_ral_env.sv"

//Including all the required component files here
class simple_ral_env extends uvm_env;
   ral_block_simple_ral_env regmodel;
   wb_master_agent master_agent;
   
   wb_ral_reg_adapter reg2host;
   uvm_reg_predictor #(wb_transaction) wishbone_reg_predictor;




    `uvm_component_utils(simple_ral_env)

   extern function new(string name="simple_ral_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);

endclass: simple_ral_env

function simple_ral_env::new(string name= "simple_ral_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void simple_ral_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
 
   this.regmodel = ral_block_simple_ral_env::type_id::create("regmodel",this);
   regmodel.build();
   regmodel.print();
   reg2host = new("reg2host");
   regmodel.add_hdl_path("simple_ral_env_top.dut","RTL");
   wishbone_reg_predictor = uvm_reg_predictor #(wb_transaction)::type_id::create("wishbone_reg_predictor",this);
   regmodel.lock_model();
endfunction: build_phase

function void simple_ral_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
	regmodel.default_map.set_sequencer(master_agent.mast_sqr,reg2host);
	wishbone_reg_predictor.map = regmodel.default_map;
	wishbone_reg_predictor.adapter = reg2host;
	master_agent.mast_mon.mon_analysis_port.connect(wishbone_reg_predictor.bus_in);

endfunction: connect_phase

`endif // SIMPLE_RAL_ENV_RAL_ENV__SV

