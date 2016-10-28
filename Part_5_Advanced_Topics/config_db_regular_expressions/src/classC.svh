`ifndef CLASSC_SVH
 `define CLASSC_SVH

class C extends uvm_component;
   int v=0;
   int s=0;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction

   `uvm_component_utils_begin(C)
      `uvm_field_int(v, UVM_DEFAULT)
      `uvm_field_int(s, UVM_DEFAULT)
   `uvm_component_utils_end

endclass

`endif
