module top;
`include "uvm_macros.svh"
import uvm_pkg::*;
typedef class class_A;

`include "class.sv"
	

 class_P  class_P_inst1;
 class_P  class_P_inst2;
 class_A    class_A_inst1;
 class_A    class_A_inst2;
initial begin
	// free children
	class_A_inst1 = new("child_inst1",1);
	class_A_inst2 = new("child_inst3",3);

/*
 	class_P_inst1 = new("first_inst",1);
	class_P_inst1.randomize();
	class_P_inst1.print();
	
 	class_P_inst2 = new("second_inst",2);
	class_P_inst2.randomize();
	class_P_inst2.print();


	class_P_inst2.copy(class_P_inst1);
	class_P_inst2.print();

*/
	class_A_inst1.randomize();
	class_A_inst1.print();
	class_A_inst2.randomize();
	class_A_inst2.print();
	class_A_inst2.copy(class_A_inst1);
	class_A_inst1.print();
	
  	class_A_inst2.compare(class_A_inst1);
	class_A_inst2.cl_int = 2;
 	class_A_inst2.compare(class_A_inst1);

 end 
endmodule
