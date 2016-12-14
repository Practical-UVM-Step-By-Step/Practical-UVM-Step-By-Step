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

`ifndef VGA_DVI_DRV__SV
 `define VGA_DVI_DRV__SV

typedef class vga_disp_txn;
   typedef class vga_dvi_drv;

class vga_dvi_drv extends uvm_driver # (vga_disp_txn);

   
   typedef virtual wb_vga_disp_if v_if; 
   v_if drv_if;
   
   extern function new(string name = "vga_dvi_drv",
                       uvm_component parent = null); 
   
   `uvm_component_utils_begin(vga_dvi_drv)
      // ToDo: Add uvm driver member
   `uvm_component_utils_end
   // ToDo: Add required short hand override method

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(vga_disp_txn tr); 
   extern protected virtual task tx_driver();

endclass: vga_dvi_drv

   function vga_dvi_drv::new(string name = "vga_dvi_drv",
			     uvm_component parent = null);
      super.new(name, parent);

      
   endfunction: new

   function void vga_dvi_drv::build_phase(uvm_phase phase);
      super.build_phase(phase);
      //ToDo : Implement this phase here

   endfunction: build_phase

   function void vga_dvi_drv::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "disp_if", drv_if);
   endfunction: connect_phase

   function void vga_dvi_drv::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      if (drv_if == null)
	`uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
   endfunction: end_of_elaboration_phase

   function void vga_dvi_drv::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      //ToDo: Implement this phase here
   endfunction: start_of_simulation_phase

   
   task vga_dvi_drv::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      // ToDo: Reset output signals
      phase.drop_objection(this);
   endtask: reset_phase

   task vga_dvi_drv::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      //ToDo: Configure your component here
      phase.drop_objection(this);
   endtask:configure_phase

   task vga_dvi_drv::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork 
	 //      tx_driver();
      join
      phase.drop_objection(this);
   endtask: run_phase

   task vga_dvi_drv::tx_driver();
      forever begin
	 vga_disp_txn tr;
	 // ToDo: Set output signals to their idle state
	 `uvm_info("vga_lcd_env_DRIVER", "Starting transaction...",UVM_MEDIUM)
	 seq_item_port.get_next_item(tr);
	 case (tr.kind) 
           vga_disp_txn::READ: begin
              // ToDo: Implement READ transaction

           end
           vga_disp_txn::WRITE: begin
              // ToDo: Implement READ transaction

           end
	 endcase
	 send(tr); 
	 seq_item_port.item_done();
	 `uvm_info("vga_lcd_env_DRIVER", "Completed transaction...",UVM_MEDIUM)
	 `uvm_info("vga_lcd_env_DRIVER", tr.sprint(),UVM_HIGH)

      end
   endtask : tx_driver

   task vga_dvi_drv::send(vga_disp_txn tr);
      // ToDo: Drive signal on interface
      
   endtask: send

`endif // VGA_DVI_DRV__SV

