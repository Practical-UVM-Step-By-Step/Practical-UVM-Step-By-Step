module top;
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
		
		function new(string name="",int value);
			super.new(name);	
			cl_string = name;
			cl_int = value;
	 		cl_int_arr = new[cl_int];
			for(int i = 0; i < cl_int; i++) begin
				cl_int_arr[i] = i + 1;
			end
		endfunction

endclass

 class_A    class_A_inst1;
 class_A    class_A_inst2;
initial begin
	// free children
	class_A_inst1 = new("child_inst1",1);

	class_A_inst1.randomize();
	class_A_inst1.print();
	$cast(class_A_inst2,class_A_inst1.clone());
	class_A_inst1.print();

 end 
endmodule
