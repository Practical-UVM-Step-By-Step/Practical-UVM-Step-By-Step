module top;
`include "uvm_macros.svh"
import uvm_pkg::*;
typedef class class_A;

// Class definition
class class_A extends uvm_object;

 	int cl_int;
	string cl_string;
	int cl_int_arr[];
	 `uvm_object_utils_begin(class_A)
			`uvm_field_int(cl_int,UVM_ALL_ON);
			`uvm_field_string(cl_string,UVM_ALL_ON);
			`uvm_field_array_int(cl_int_arr,UVM_ALL_ON);
	`uvm_object_utils_end
		
		function new(string name="");
			super.new(name);	
			cl_string = name;
			cl_int = 10;
	 		cl_int_arr = new[cl_int];
			for(int i = 0; i < cl_int; i++) begin
				cl_int_arr[i] = i + 1;
			end
		endfunction

endclass

		
class  class_P extends uvm_object;

// basic datatypes
rand int par_int; 
rand byte par_address;
string par_string;

// Some objects to demonstrate the copy recursion policy

class_A cl1; // UVM_SHALLOW
class_A cl3; // UVM_DEEP

	`uvm_object_utils_begin(class_P)
		`uvm_field_int(par_int,UVM_ALL_ON)
		`uvm_field_int(par_address,UVM_ALL_ON | UVM_NOCOPY)
		`uvm_field_string(par_string,UVM_NOCOPY)
		 `uvm_field_object(cl1,UVM_ALL_ON|UVM_NOCOPY)
		`uvm_field_object(cl3,UVM_ALL_ON | UVM_NOCOPY)
        `uvm_object_utils_end

 function new(string name="");
	super.new(name);
	cl1 = new(name);
  	cl3 = new(name);
	par_string  = name;
  endfunction
	
    function void do_copy(uvm_object rhs);
	class_P rhs_;
     super.do_copy(rhs);
	$cast(rhs_,rhs);
     par_int = rhs_.par_int;
     par_address = rhs_.par_address;
     par_string = rhs_.par_string;
	cl1 = new rhs_.cl1;
	cl3 = new rhs_.cl3;
	cl1.copy(rhs_.cl1);
        cl3.copy(rhs_.cl3);
   endfunction


endclass

	

 class_P  class_P_inst1;
 class_P  class_P_inst2;
 class_A    class_A_inst1;
 class_A    class_A_inst2;
initial begin
	// free children
	class_A_inst1 = new("child_inst1");
	class_A_inst2 = new("child_inst3");



 	class_P_inst1 = new("first_inst");
	class_P_inst1.randomize();
	class_P_inst1.print();
	
 	class_P_inst2 = new("second_inst");
	class_P_inst2.randomize();
	class_P_inst2.print();


	class_P_inst2.copy(class_P_inst1);
	class_P_inst2.print();

/*	
	class_A_inst1.randomize();
	class_A_inst1.print();
	class_A_inst2.randomize();
	class_A_inst2.print();
	class_A_inst2.copy(class_A_inst1);
	class_A_inst1.print();
*/	 

 end 
endmodule
