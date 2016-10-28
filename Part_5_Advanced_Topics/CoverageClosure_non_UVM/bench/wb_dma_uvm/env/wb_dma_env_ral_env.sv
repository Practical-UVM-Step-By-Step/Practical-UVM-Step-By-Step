//
// Template for UVM-compliant verification environment
//

`ifndef WB_DMA_ENV__SV
`define WB_DMA_ENV__SV
`include "wb_dma_env.inc"
//ToDo: Include required files here
class wb_dma_env extends uvm_env;
   ral_block_wb_dma regmodel;
   wb_master_agent master_agent0;
   wb_master_agent master_agent1;
   wb_slave_agent slave_agent0;
   wb_slave_agent slave_agent1;
   wb_dma_env_cov cov;
   
   wb_dma_ral_adapter ral_adapter;
   wb_master_mon_2cov_connect mon2cov;
 

   // Explict reg predictor
    uvm_reg_predictor #(wb_transaction) wb_reg_predictor;
//     wb_dma_predictor   wb_reg_predictor;
    `uvm_component_utils(wb_dma_env)

   extern function new(string name="wb_dma_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern function void start_of_simulation_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: wb_dma_env

function wb_dma_env::new(string name= "wb_dma_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_dma_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   // uvm_reg::include_coverage("*",UVM_CVR_ADDR_MAP);
   uvm_reg::include_coverage("*",UVM_CVR_ALL);

   master_agent0 = wb_master_agent::type_id::create("master_agent0",this); 
   master_agent1 = wb_master_agent::type_id::create("master_agent1",this); 
   slave_agent0 = wb_slave_agent::type_id::create("slave_agent0",this);
   slave_agent1 = wb_slave_agent::type_id::create("slave_agent1",this);
 
   cov = wb_dma_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = wb_master_mon_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   this.regmodel = ral_block_wb_dma::type_id::create("regmodel",this);
   regmodel.build();
   void'(regmodel.set_coverage(UVM_CVR_ALL));
   regmodel.default_map.set_auto_predict(0);

   regmodel.lock_model();
   ral_adapter = new("reg2host");

   wb_reg_predictor = uvm_reg_predictor #(wb_transaction)::type_id::create("Explicit Reg predictor",this);
   // wb_reg_predictor = wb_dma_predictor::type_id::create("Explicit Reg predictor",this);


endfunction: build_phase

function void wb_dma_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
// Only the master0 agent is connected. 
   master_agent0.mast_mon.mon_analysis_port.connect(cov.cov_export);

// Explicit Reg predictor connections
   wb_reg_predictor.map = regmodel.default_map;
   wb_reg_predictor.adapter = ral_adapter;
   master_agent0.mast_mon.mon_analysis_port.connect(wb_reg_predictor.bus_in);

endfunction: connect_phase

function void wb_dma_env::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
endfunction: start_of_simulation_phase


task wb_dma_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   phase.raise_objection(this,"Resetting the DUT...");
   phase.drop_objection(this);
endtask:reset_phase

task wb_dma_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
endtask:configure_phase

task wb_dma_env::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this,"");
   phase.drop_objection(this);
endtask:run_phase

function void wb_dma_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
endfunction:report_phase

task wb_dma_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
endtask:shutdown_phase
`endif // WB_DMA_ENV__SV

