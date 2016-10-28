module top;
`include "uvm_macros.svh"
import uvm_pkg::*;
typedef class class_A;

`include "class4.sv"
	

 class_P  class_P_inst1;
 class_P  class_P_inst2;
 class_A    class_A_inst1;
 class_A    class_A_inst2;

class custom_comparer extends uvm_comparer;

	int unsigned show_max = 10;
	int unsigned  verbosity = UVM_MEDIUM;
	uvm_severity sev = UVM_FATAL;
	string miscompares  = " this is a extended miscompare:";
endclass

custom_comparer c_comp = new();
initial begin
	// free children


	 class_P_inst1 = new ("class_Pass1",1);
	 class_P_inst2 = new ("class_Pass2",3);

	// Custom Comparison:

	class_P_inst1.randomize();
	class_P_inst2.randomize();

	class_P_inst2.copy(class_P_inst1);
	
 	class_P_inst2.compare(class_P_inst1);


 end 
endmodule
