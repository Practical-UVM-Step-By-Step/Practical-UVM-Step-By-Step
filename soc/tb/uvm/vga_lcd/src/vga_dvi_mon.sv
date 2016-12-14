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

`ifndef VGA_DRV_MON__SV
 `define VGA_DRV_MON__SV

typedef class vga_disp_txn;
   typedef class vga_dvi_mon;

class vga_dvi_mon_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use a task if callbacks can be blocking

   // Called at start of observed transaction
   virtual function void pre_trans(vga_dvi_mon xactor,
                                   vga_disp_txn tr);
   endfunction: pre_trans

   // Called before acknowledging a transaction
   virtual function pre_ack(vga_dvi_mon xactor,
                            vga_disp_txn tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(vga_dvi_mon xactor,
                                    vga_disp_txn tr);
   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(vga_dvi_mon xactor,
                              vga_disp_txn tr);
   endtask: post_cb_trans

endclass: vga_dvi_mon_callbacks

   

class vga_dvi_mon extends uvm_monitor;

   uvm_analysis_port #(vga_disp_txn) mon_analysis_port;  //TLM analysis port
   typedef virtual wb_vga_disp_if v_if;
   v_if mon_if;
   // ToDo: Add another class property if required
   extern function new(string name = "vga_dvi_mon",uvm_component parent);
   `uvm_register_cb(vga_dvi_mon,vga_dvi_mon_callbacks);
   `uvm_component_utils_begin(vga_dvi_mon)
      // ToDo: Add uvm monitor member if any class property added later through field macros

   `uvm_component_utils_end
   // ToDo: Add required short hand override method

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_monitor();

endclass: vga_dvi_mon

   function vga_dvi_mon::new(string name = "vga_dvi_mon",uvm_component parent);
      super.new(name, parent);
      mon_analysis_port = new ("mon_analysis_port",this);
   endfunction: new

   function void vga_dvi_mon::build_phase(uvm_phase phase);
      super.build_phase(phase);
      //ToDo : Implement this phase here

   endfunction: build_phase

   function void vga_dvi_mon::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      uvm_config_db#(v_if)::get(this, "", "disp_if", mon_if);
   endfunction: connect_phase

   function void vga_dvi_mon::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase); 
      //ToDo: Implement this phase here

   endfunction: end_of_elaboration_phase

   function void vga_dvi_mon::start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      //ToDo: Implement this phase here

   endfunction: start_of_simulation_phase

   task vga_dvi_mon::reset_phase(uvm_phase phase);
      super.reset_phase(phase);
      phase.raise_objection(this,"");
      // ToDo: Implement reset here
      phase.drop_objection(this);

   endtask: reset_phase

   task vga_dvi_mon::configure_phase(uvm_phase phase);
      super.configure_phase(phase);
      phase.raise_objection(this,"");
      //ToDo: Configure your component here
      phase.drop_objection(this);

   endtask:configure_phase

   task vga_dvi_mon::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this,"");
      fork
	 tx_monitor();
      join
      phase.drop_objection(this);

   endtask: run_phase

   task vga_dvi_mon::tx_monitor();
      forever begin
	 vga_disp_txn tr;
	 // ToDo: Wait for start of transaction

	 `uvm_do_callbacks(vga_dvi_mon,vga_dvi_mon_callbacks,
			   pre_trans(this, tr))
	 `uvm_info("vga_lcd_env_MONITOR", "Starting transaction...",UVM_MEDIUM)
	 // ToDo: Observe first half of transaction

	 // ToDo: User need to add monitoring logic and remove $finish
	 `uvm_info("vga_lcd_env_MONITOR"," User need to add monitoring logic ",UVM_MEDIUM)
	 `uvm_do_callbacks(vga_dvi_mon,vga_dvi_mon_callbacks,
			   pre_ack(this, tr))
	 // ToDo: React to observed transaction with ACK/NAK
	 `uvm_info("vga_lcd_env_MONITOR", "Completed transaction...",UVM_HIGH)
	 `uvm_info("vga_lcd_env_MONITOR", tr.sprint(),UVM_HIGH)
	 `uvm_do_callbacks(vga_dvi_mon,vga_dvi_mon_callbacks,
			   post_trans(this, tr))
	 mon_analysis_port.write(tr);
      end
   endtask: tx_monitor

`endif // VGA_DRV_MON__SV

   /*

    `timescale 1ns / 10ps
    `include "vga_defines.v"

    module sync_check(	pclk, rst, enable, hsync, vsync, csync, blanc,
    hpol, vpol, cpol, bpol,
    thsync, thgdel, thgate, thlen,
    tvsync, tvgdel, tvgate, tvlen);

    input		pclk, rst, enable, hsync, vsync, csync, blanc;
    input		hpol, vpol, cpol, bpol;
    input	[7:0]	thsync, thgdel;
    input	[15:0]	thgate, thlen;
    input	[7:0]	tvsync, tvgdel;
    input	[15:0]	tvgate, tvlen;

    time		last_htime;
    reg		hvalid;
    time		htime;
    time		hhtime;

    time		last_vtime;
    reg		vvalid;
    time		vtime;
    time		vhtime;

    wire	[31:0]	htime_exp;
    wire	[31:0]	hhtime_exp;
    wire	[31:0]	vtime_exp;
    wire	[31:0]	vhtime_exp;

    wire		hcheck;
    wire		vcheck;

    wire	[31:0]	bh_start;
    wire	[31:0]	bh_end;
    wire	[31:0]	bv_start;
    wire	[31:0]	bv_end;

    integer		bdel1;
    reg		bval1;
    reg		bval;
    integer		bdel2;
    wire		bcheck;

    //initial hvalid=0;
    //initial vvalid=0;

    parameter	clk_time = 40;

    assign hcheck = enable;
    assign vcheck = enable;
    assign hhtime_exp = (thsync +1) * clk_time;
    assign htime_exp  = (thlen +1) * clk_time;
    assign vhtime_exp = (htime_exp * (tvsync +1));
    assign vtime_exp  = htime_exp * (tvlen +1);

    always @(posedge pclk)
    if(!rst | !enable)
    begin
    hvalid = 0;
    vvalid = 0;
	   end

    // Verify HSYNC Timing
    always @(hsync)
    if(hcheck)
    begin
    if(hsync == ~hpol)
    begin
    htime = $time - last_htime;
    //if(hvalid)	$display("HSYNC length time: %0t", htime);
    if(hvalid & (htime != htime_exp))
    $display("HSYNC length ERROR: Expected: %0d Got: %0d (%0t)",
    htime_exp, htime, $time);
    last_htime = $time;
    hvalid = 1;
	   end

    if(hsync == hpol)
    begin
    hhtime = $time - last_htime;
    //if(hvalid)	$display("HSYNC pulse time: %0t", hhtime);
    if(hvalid & (hhtime != hhtime_exp))
    $display("HSYNC Pulse ERROR: Expected: %0d Got: %0d (%0t)",
    hhtime_exp, hhtime, $time);
	   end
      end

    // Verify VSYNC Timing
    always @(vsync)
    if(vcheck)
    begin
    if(vsync == ~vpol)
    begin
    vtime = $time - last_vtime;
    //if(vvalid)	$display("VSYNC length time: %0t", vtime);
    if(vvalid & (vtime != vtime_exp))
    $display("VSYNC length ERROR: Expected: %0d Got: %0d (%0t)",
    vtime_exp, vtime, $time);
    last_vtime = $time;
    vvalid = 1;
	   end

    if(vsync == vpol)
    begin
    vhtime = $time - last_vtime;
    //if(vvalid)	$display("VSYNC pulse time: %0t", vhtime);
    if(vvalid & (vhtime != vhtime_exp))
    $display("VSYNC Pulse ERROR: Expected: %0d Got: %0d (%0t)",
    vhtime_exp, vhtime, $time);
	   end
      end

    `ifdef VGA_12BIT_DVI
    `else
    // Verify BLANC Timing
    //assign bv_start = tvsync   + tvgdel + 2;
    //assign bv_end   = bv_start + tvgate + 2;

    //assign bh_start = thsync   + thgdel + 1;
    //assign bh_end   = bh_start + thgate + 2;
    assign bv_start = tvsync   + tvgdel + 1;
    assign bv_end   = bv_start + tvgate + 2;

    assign bh_start = thsync   + thgdel + 1;
    assign bh_end   = bh_start + thgate + 2;

    assign bcheck = enable;

    always @(vsync)
    if(vsync == ~vpol)
    bdel1 = 0;

    always @(hsync)
    if(hsync == ~hpol)
    bdel1 = bdel1 + 1;

    always @(bdel1)
    bval1 = (bdel1 > bv_start) & (bdel1 < bv_end);

    always @(hsync)
    if(hsync == ~hpol)
    bdel2 = 0;

    always @(posedge pclk)
    bdel2 = bdel2 + 1;

    initial bval = 1;
    always @(bdel2)
    bval = #1 !(bval1 & (bdel2 > bh_start) & (bdel2 < bh_end));

    always @(bval or blanc)
    #0.01
    if(enable)
    if(( (blanc ^ bpol) != bval) & bcheck)
    $display("BLANK ERROR: Expected: %0d Got: %0d (%0t)",
    bval, (blanc ^ bpol), $time);

    // verify CSYNC
    always @(csync or vsync or hsync)
    if(enable)
    if( (csync ^ cpol) != ( (vsync ^ vpol) | (hsync ^ hpol) ) )
    $display("CSYNC ERROR: Expected: %0d Got: %0d (%0t)",
    ( (vsync ^ vpol) | (hsync ^ hpol) ), (csync ^ cpol), $time);
    `endif

    endmodule

    */
