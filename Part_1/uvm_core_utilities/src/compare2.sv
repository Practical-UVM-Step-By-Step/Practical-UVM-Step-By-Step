module top;
`include "uvm_macros.svh"
   import uvm_pkg::*;

`include "class2_1.sv"
   

   class_B  class_B_inst1;
   class_B  class_B_inst2;
   class_A    class_A_inst1;
   class_A    class_A_inst2;

class custom_comparer extends uvm_comparer;

   int 	   unsigned show_max = 10;
   int 	   unsigned verbosity = UVM_WARNING;
   string  miscompares  = "srivatsa %m";
   
endclass

   custom_comparer c_comp = new();
   initial begin
      // free children
      class_A_inst1 = new("A_inst1");
      class_A_inst2 = new("A_inst2");

      // Custom Comparison:

      class_A_inst1.randomize();
      
      class_A_inst2.randomize();
      class_A_inst2.copy(class_A_inst1);
      `uvm_info("Compare 1","comparison of identical classes",UVM_LOW)
      class_A_inst1.compare(class_A_inst2, c_comp);
      
      class_A_inst1.logic_data[16 ] = 2;
      class_A_inst1.logic_data[32 ] = 2;
      // class_A_inst1.logic_data[64] = 2;
      class_A_inst1.logic_data[128] = 1;
      `uvm_info("Compare 2","comparison of nonidentical classes",UVM_LOW)
      class_A_inst1.compare(class_A_inst2, c_comp);

   end 
endmodule
