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

`ifndef RAL_BRIDGE
 `define RAL_BRIDGE

import uvm_pkg::*;

class ral_reg_xfer extends uvm_reg;
   rand uvm_reg_field data;

   function new(string name = "xfer");
      super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
   endfunction: new
   virtual function void build();
      this.data = uvm_reg_field::type_id::create("data",,get_full_name());
      this.data.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 1);
   endfunction: build

   `uvm_object_utils(ral_reg_xfer)

endclass : ral_reg_xfer

class ral_block_bridge extends uvm_reg_block;
   uvm_reg_map apb;
   rand ral_reg_xfer xfer;
   uvm_reg_map ahb;
   rand uvm_reg_field xfer_data;
   rand uvm_reg_field data;

   function new(string name = "bridge");
      super.new(name, build_coverage(UVM_NO_COVERAGE));
   endfunction: new

   virtual function void build();
      this.apb = create_map("apb", 0, 4, UVM_LITTLE_ENDIAN);
      this.default_map = this.apb;
      this.ahb = create_map("ahb", 0, 4, UVM_LITTLE_ENDIAN);
      this.xfer = ral_reg_xfer::type_id::create("xfer",,get_full_name());
      this.xfer.configure(this, null, "");
      this.xfer.build();
      this.apb.add_reg(this.xfer, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
      this.xfer_data = this.xfer.data;
      this.data = this.xfer.data;
      this.ahb.add_reg(this.xfer, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
   endfunction : build

   `uvm_object_utils(ral_block_bridge)

endclass : ral_block_bridge

`endif
