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

`ifndef WB_ENV_ENV__SV
 `define WB_ENV_ENV__SV

class wb_conmax_env extends uvm_env;

   wb_master_agent master_agent[8];
   wb_slave_agent slave_agent[16]; 
   wb_conmax_scoreboard conmax_scbd;
   wb_conmax_virtual_sequencer wb_conmax_virt_seqr;

   // This is the RAL Model.
   wb_conmax_env_ral_block ral_regmodel;
   // This is the adapter
   wb_conmax_ral_adapter   ral_adapter[8];
   

   // wb_env_cov cov;
   // wb_master_mon_2cov_connect mon2cov;

   `uvm_component_utils(wb_conmax_env)

   // Function declarations
   extern function new(string name="wb_conmax_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: wb_conmax_env

function wb_conmax_env::new(string name= "wb_conmax_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_conmax_env::build_phase(uvm_phase phase);
   super.build_phase(phase);

   // Build Masters
   for(integer i = 0; i < 8; i++) begin
      master_agent[i] = wb_master_agent::type_id::create($sformatf("master_agent[%02d]",i),this); 
      uvm_config_db #(uvm_object_wrapper)::set(this, {master_agent[i].get_name(), ".", "seqr.main_phase"}, "default_sequence", sequence_0::get_type());
   end
   // Build Slaves
   for(integer i = 0; i < 16; i++) begin
      slave_agent[i] = wb_slave_agent::type_id::create($sformatf("slave_agent[%02d]",i),this); 
      uvm_config_db #(uvm_object_wrapper)::set(this, {slave_agent[i].get_name(), ".", "seqr.main_phase"}, "default_sequence",sequence_0::get_type());
   end
   
   // Scoreboard
   conmax_scbd  = wb_conmax_scoreboard::type_id::create("Scoreboard",this);

   // Build the RAL Model
   if(ral_regmodel == null) begin
      ral_regmodel = wb_conmax_env_ral_block::type_id::create("ral_regmodel",this);
      ral_regmodel.build;
      ral_regmodel.lock_model();
   end

   // Build the virtual Sequencer
   wb_conmax_virt_seqr = wb_conmax_virtual_sequencer::type_id::create("wb_conmax_virt_seqr",this);
   // Now print the entire topology.
   //    uvm_top.enable_print_topology= 1;
endfunction: build_phase

function void wb_conmax_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);

   for(integer i = 0; i < 8; i++) begin
      ral_adapter[i] = new($sformatf("reg2agent_ral_adapter[%d]",i));
   end
   // Set up the domain sequencers

   ral_regmodel.wb_conmax_domain0.set_sequencer(master_agent[0].mast_sqr,ral_adapter[0]);
   ral_regmodel.wb_conmax_domain1.set_sequencer(master_agent[1].mast_sqr,ral_adapter[1]);
   ral_regmodel.wb_conmax_domain2.set_sequencer(master_agent[2].mast_sqr,ral_adapter[2]);
   ral_regmodel.wb_conmax_domain3.set_sequencer(master_agent[3].mast_sqr,ral_adapter[3]);
   ral_regmodel.wb_conmax_domain4.set_sequencer(master_agent[4].mast_sqr,ral_adapter[4]);
   ral_regmodel.wb_conmax_domain5.set_sequencer(master_agent[5].mast_sqr,ral_adapter[5]);
   ral_regmodel.wb_conmax_domain6.set_sequencer(master_agent[6].mast_sqr,ral_adapter[6]);
   ral_regmodel.wb_conmax_domain7.set_sequencer(master_agent[7].mast_sqr,ral_adapter[7]);

   for(integer i = 0; i < 8; i++) begin
      master_agent[i].mast_mon.mon_analysis_port.connect(conmax_scbd.master_export[i]);

   end
   for(integer i = 0; i < 16; i++) begin
      slave_agent[i].slv_mon.mon_analysis_port.connect(conmax_scbd.slave_export[i]);
   end

   wb_conmax_virt_seqr.seqr0 = master_agent[00].mast_sqr;
   wb_conmax_virt_seqr.seqr1 = master_agent[01].mast_sqr;
   wb_conmax_virt_seqr.seqr2 = master_agent[02].mast_sqr;
   wb_conmax_virt_seqr.seqr3 = master_agent[03].mast_sqr;
   wb_conmax_virt_seqr.seqr4 = master_agent[04].mast_sqr;
   wb_conmax_virt_seqr.seqr5 = master_agent[05].mast_sqr;
   wb_conmax_virt_seqr.seqr6 = master_agent[06].mast_sqr;
   wb_conmax_virt_seqr.seqr7 = master_agent[07].mast_sqr;

endfunction: connect_phase

task wb_conmax_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   phase.raise_objection(this,"Resetting the DUT...");
   //Reset DUT
   phase.drop_objection(this);
endtask:reset_phase

task wb_conmax_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
   phase.raise_objection(this,"");
   //components Configuration happens on this phase
   phase.drop_objection(this);
endtask:configure_phase

task wb_conmax_env::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"");
   // Main simulation kicks off here.
   phase.drop_objection(this);
endtask:main_phase

function void wb_conmax_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
endfunction:report_phase

task wb_conmax_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
endtask:shutdown_phase
`endif // WB_ENV_ENV__SV

