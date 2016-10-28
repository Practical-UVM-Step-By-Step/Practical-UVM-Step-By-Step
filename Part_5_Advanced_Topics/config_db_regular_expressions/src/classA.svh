`ifndef CLASSA_SVH
 `define CLASSA_SVH
 `include "classC.svh"
class A extends uvm_component;
   bit debug = 0;
   C u1;
   C u2;
   C u3;
   C u4;
   int s;
   `uvm_component_utils_begin(A)
      `uvm_field_int(debug, UVM_DEFAULT)
      `uvm_field_int(s, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      uvm_config_db #(uvm_bitstream_t)::set(this,"*","v",7);

      u1 = new("u1", this); 
      u2 = new("u2", this);
      u3 = new("u3", this);
      u4 = new("u4", this);
   endfunction
endclass

`endif

