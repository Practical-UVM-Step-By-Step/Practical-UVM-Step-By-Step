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

`ifndef BASE_TEST__SV
 `define BASE_TEST__SV

typedef class vga_lcd_env;
typedef class wb_config;
typedef class ral_block_vga_lcd;

class vga_lcd_env_base_test extends uvm_test;
   wb_config master_config;
   wb_config slave_config;

   `uvm_component_utils(vga_lcd_env_base_test)

   vga_lcd_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      int  slave_adr_max ;
      int  slave_adr_min;
      super.build_phase(phase);

      slave_adr_min = 0;
      slave_adr_max = 32'hffff_fffe;
      
      env = vga_lcd_env::type_id::create("env", this);
      master_config = wb_config::type_id::create($sformatf("master_configuration[%02d]",0));
      slave_config = wb_config::type_id::create($sformatf("slave_configuration[%02d]",0));

      master_config.randomize with {min_addr == 0; max_addr == slave_adr_max; max_n_wss == 10; };
      slave_config.randomize with {min_addr == 0; max_addr == slave_adr_max; max_n_wss == 10; };

      // All this line does is to shut off the default sequences
      uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase", "default_sequence", null);

      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.master_agent","mstr_agent_cfg",master_config);
      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.slave_agent","mstr_agent_cfg",slave_config);

   endfunction

endclass : vga_lcd_env_base_test

`endif //TEST__SV

