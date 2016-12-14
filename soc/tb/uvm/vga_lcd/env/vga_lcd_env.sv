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

`ifndef VGA_LCD_ENV__SV
 `define VGA_LCD_ENV__SV
 `include "vga_lcd_env_inc.sv"

class vga_lcd_env extends uvm_env;
   //vga_lcd_scbd sb;
   ral_block_vga_lcd ral_regmodel;
   wb_slave_agent slave_agent;
   wb_master_agent master_agent;
   vga_lcd_env_cov cov;
   
   uvm_reg_predictor #(wb_transaction) wishbone_reg_predictor;

   vga_ral_adapter reg2host;
   vga_drv_mon_2cov_connect mon2cov;

   `uvm_component_utils(vga_lcd_env)

   extern function new(string name="vga_lcd_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);

endclass: vga_lcd_env

function vga_lcd_env::new(string name= "vga_lcd_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void vga_lcd_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
   slave_agent = wb_slave_agent::type_id::create("slave_agent",this);

   
   cov = vga_lcd_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = vga_drv_mon_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   
   this.ral_regmodel = ral_block_vga_lcd::type_id::create("ral_regmodel",this);
   ral_regmodel.build();
   reg2host = new("reg2host");
   this.ral_regmodel.lock_model();

   wishbone_reg_predictor = uvm_reg_predictor #(wb_transaction)::type_id::create("wishbone_reg_predictor",this);
endfunction: build_phase

function void vga_lcd_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   //Connecting the monitor's analysis ports with vga_lcd_scbd's expected analysis exports.
   //master_agent.mast_mon.mon_analysis_port.connect(sb.before_export);
   //slave_agent.slv_mon.mon_analysis_port.connect(sb.after_export);
   //Other monitor element will be connected to the after export of the scoreboard
   ral_regmodel.default_map.set_sequencer(master_agent.mast_sqr,reg2host);
   // ral_regmodel.add_hdl_path("vga_lcd_env_top.vga_enh_top.u0","RTL");
   // master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);

   wishbone_reg_predictor.map = ral_regmodel.default_map;
   wishbone_reg_predictor.adapter = reg2host;

   master_agent.mast_mon.mon_analysis_port.connect(wishbone_reg_predictor.bus_in);
endfunction: connect_phase



`endif // VGA_LCD_ENV__SV

