`ifndef TEST__SV1_simple_RC_register
`define TEST__SV1_simple_RC_register


class simple_RC_register_test extends simple_ral_env_test;

  `uvm_component_utils(simple_RC_register_test)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;



  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase) ;
	value_w = 32'h12345678;

    phase.raise_objection(this);


/*
  rg = env.regmodel.CHIP_DATA;
        rg.read(status, value_r);
  $display("1:%x\n",value_r);
        rg.write(status, value_w);
        rg.read(status, value_r);
  $display("2:%x\n",value_r);

	  rg = env.regmodel.CHIP_DATA2;
        rg.read(status, value_r);
  $display("3:%x\n",value_r);
        rg.write(status, value_w);
        rg.read(status, value_r);
  $display("4:%x\n",value_r);
*/

  rg = env.regmodel.r_RC_register;
        rg.read(status, value_r);
  $display("1:%x\n",value_r);
        // rg.write(status, value_w);
 value_r = 32'hffffffff;
        rg.read(status, value_r);
  $display("2:%x\n",value_r);
         rg.write(status, value_w);
 value_r = 32'hffffffff;
        rg.read(status, value_r);
  $display("3:%x\n",value_r);
 value_r = 32'hffffffff;
        rg.read(status, value_r);
  $display("4:%x\n",value_r);

   

/*
 seq = uvm_reg_hw_reset_seq::type_id::create("ral_uvm_reg_hw_reset_seq",this);
        seq.model = env.regmodel;
        seq.start(null);
        seq.wait_for_sequence_state(UVM_FINISHED);
*/
phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : simple_RC_register_test

`endif //TEST__SV1

