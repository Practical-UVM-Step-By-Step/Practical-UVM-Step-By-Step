//
// Template for UVM-compliant testcase

`ifndef TEST__SV
`define TEST__SV

typedef class wb_dma_env;

class wb_dma_env_test extends uvm_test;
wb_config master_configs[2];
wb_config slave_configs[2];

int slave_adr_max ;
int slave_adr_min;


  `uvm_component_utils(wb_dma_env_test)

  wb_dma_env env;
  uvm_active_passive_enum is_active;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    slave_adr_max = 32'h0fffffe;
    env = wb_dma_env::type_id::create("env", this);
    is_active=UVM_PASSIVE;

     for(int i = 0; i < 2; i++) begin
     master_configs[i] = wb_config::type_id::create($psprintf("master_configuration[%02d]",i));
     master_configs[i].randomize with {min_addr == 0; max_addr == slave_adr_max; max_n_wss == 10; };
     slave_configs[i] = wb_config::type_id::create($psprintf("slave_configuration[%02d]",i));
     slave_configs[i].randomize with {min_addr == slave_adr_min; max_addr == slave_adr_max; max_n_wss == 10; };

   end

     uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.master_agent0","mstr_agent_cfg",master_configs[0] );
     uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.master_agent1","mstr_agent_cfg",master_configs[1] );
     uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.slave_agent0","slv_agent_cfg",slave_configs[0] );
     uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.slave_agent1","slv_agent_cfg",slave_configs[1] );

    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.master_agent0",is_active,UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.master_agent1",is_active,UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.slave_agent0",is_active,UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.slave_agent1",is_active,UVM_PASSIVE);



  endfunction

   virtual task reset_phase(uvm_phase phase) ;
	super.reset_phase(phase);
    endtask

   virtual task main_phase(uvm_phase phase) ;
   if (phase != null)
       phase.raise_objection( this, get_type_name() );
	wait (test.test_done==1);
       phase.drop_objection( this, get_type_name() );

   endtask

endclass : wb_dma_env_test

`endif //TEST__SV

