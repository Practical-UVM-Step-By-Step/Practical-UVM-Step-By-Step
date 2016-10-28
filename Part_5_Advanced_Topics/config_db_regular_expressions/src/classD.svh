`ifndef CLASSD_SVH
 `define CLASSD_SVH


class D extends uvm_component;
   bit debug = 0;
   C u1;

   `uvm_component_utils_begin(D)
      `uvm_field_int(debug, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);


      u1 = new("u1", this);
   endfunction

endclass

`endif

