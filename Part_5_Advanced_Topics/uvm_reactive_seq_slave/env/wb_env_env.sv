//
// Template for UVM-compliant verification environment
//

`ifndef WB_ENV_ENV__SV
`define WB_ENV_ENV__SV
`include "wb_env.sv"
//ToDo: Include required files here
//Including all the required component files here
class wb_env_env extends uvm_env;
   wb_master_agent master_agent;
   wb_slave_agent slave_agent;
   // wb_env_cov cov;
   
   // wb_master_mon_2cov_connect mon2cov;


    `uvm_component_utils(wb_env_env)

   extern function new(string name="wb_env_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern function void start_of_simulation_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: wb_env_env

function wb_env_env::new(string name= "wb_env_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_env_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
   slave_agent = wb_slave_agent::type_id::create("slave_agent",this);
 
   //ToDo: Register other components,callbacks and TLM ports if added by user  

   // cov = wb_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   // mon2cov  = wb_master_mon_2cov_connect::type_id::create("mon2cov", this);
   // mon2cov.cov = cov;
   // ToDo: To enable backdoor access specify the HDL path
   // ToDo: Register any required callbacks
endfunction: build_phase

function void wb_env_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
 //   master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);
endfunction: connect_phase

function void wb_env_env::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo : Implement this phase here 
endfunction: start_of_simulation_phase


task wb_env_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   phase.raise_objection(this,"Resetting the DUT...");
   //ToDo: Reset DUT
   phase.drop_objection(this);
endtask:reset_phase

task wb_env_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
   phase.raise_objection(this,"");
   //ToDo: Configure components here
   phase.drop_objection(this);
endtask:configure_phase

task wb_env_env::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"");
   //ToDo: Run your simulation here
   phase.drop_objection(this);
	$display("Dropping env main_phase objecton");
endtask:main_phase

function void wb_env_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
   //ToDo: Implement this phase here
endfunction:report_phase

task wb_env_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
   //ToDo: Implement this phase here
endtask:shutdown_phase
`endif // WB_ENV_ENV__SV

