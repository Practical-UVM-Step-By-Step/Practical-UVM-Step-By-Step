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

`ifndef WB_SPI_ENV_RAL_ENV__SV
 `define WB_SPI_ENV_RAL_ENV__SV
 `include "wb_spi_env.sv"
//ToDo: Include required files here
class reg_seq extends uvm_reg_sequence;
   ral_block_wb_spi_env regmodel;

   `uvm_object_utils(reg_seq)

   function new(string name = "");
      super.new(name);
   endfunction:new

   task pre_body();
      $cast(regmodel,model);
   endtask

   task body;
      uvm_status_e status;
      uvm_reg_data_t data;
      //ToDo :Define the user sequence here
   endtask
endclass
//Including all the required component files here
class wb_spi_env_ral_env extends uvm_env;
   spi_scbd sb;
   ral_block_wb_spi_env regmodel;
   reg_seq ral_sequence; 
   wb_master_agent master_agent;
   spi_agent slave_agent;
   wb_spi_env_cov cov;
   
   spi_reg_adapter reg2host;
   mstr_mon_2cov_connect mon2cov;

   `uvm_component_utils(wb_spi_env_ral_env)

   extern function new(string name="wb_spi_env_ral_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern function void start_of_simulation_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: wb_spi_env_ral_env

function wb_spi_env_ral_env::new(string name= "wb_spi_env_ral_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_spi_env_ral_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
   slave_agent = spi_agent::type_id::create("slave_agent",this);
   
   //ToDo: Register other components,callbacks and TLM ports if added by user  

   cov = wb_spi_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = mstr_mon_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   sb = spi_scbd::type_id::create("sb",this);
   
   this.regmodel = ral_block_wb_spi_env::type_id::create("regmodel",this);
   regmodel.build();
   ral_sequence = reg_seq::type_id::create("ral_sequence");
   ral_sequence.model = regmodel; 
   reg2host = new("reg2host");
   // ToDo: To enable backdoor access specify the HDL path
   // ToDo: Register any required callbacks
endfunction: build_phase

function void wb_spi_env_ral_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   //Connecting the monitor's analysis ports with spi_scbd's expected analysis exports.
   master_agent.mast_mon.mon_analysis_port.connect(sb.before_export);
   slave_agent.slv_mon.mon_analysis_port.connect(sb.after_export);
   //Other monitor element will be connected to the after export of the scoreboard
   regmodel.default_map.set_sequencer(master_agent.mast_sqr,reg2host);
   master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);
endfunction: connect_phase

function void wb_spi_env_ral_env::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo : Implement this phase here 
endfunction: start_of_simulation_phase

task wb_spi_env_ral_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   phase.raise_objection(this,"Resetting the DUT...");
   //ToDo: Reset DUT
   phase.drop_objection(this);
endtask:reset_phase

task wb_spi_env_ral_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
   phase.raise_objection(this,"");
   //ToDo: Configure components here
   phase.drop_objection(this);
endtask:configure_phase

task wb_spi_env_ral_env::run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this,"");
   //ToDo: Run your simulation here
   phase.drop_objection(this);
endtask:run_phase

function void wb_spi_env_ral_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
   //ToDo: Implement this phase here
endfunction:report_phase

task wb_spi_env_ral_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
   //ToDo: Implement this phase here
endtask:shutdown_phase
`endif // WB_SPI_ENV_RAL_ENV__SV

