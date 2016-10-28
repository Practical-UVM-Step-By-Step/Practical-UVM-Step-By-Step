// Class definition

class class_compA extends uvm_component;

 	int cl_int;
	string cl_string;
	int cl_int_arr[];
        longint	unsigned logic_data[*];

	 `uvm_component_utils_begin(class_compA)
			`uvm_field_int(cl_int,UVM_DEFAULT)
			`uvm_field_string(cl_string,UVM_DEFAULT)
			`uvm_field_array_int(cl_int_arr,UVM_DEFAULT)
			`uvm_field_aa_int_longint_unsigned(logic_data,UVM_DEFAULT)
	`uvm_component_utils_end




		
function new(string name="class_compA",uvm_component parent);
			super.new(name,parent);	
endfunction

function void build_phase(uvm_phase phase);
			int idx = 1;
			cl_string = "class A";
			cl_int = idx;
	 		cl_int_arr = new[cl_int];
			for(int i = 0; i < cl_int; i++) begin
				cl_int_arr[i] = i + 1;
			end
			repeat (16) begin
				logic_data[idx] = idx;
				idx = idx << 1;
			end
			$display("Path is %m");
		endfunction

endclass

class class_compB extends class_compA;

 	int cl_int_B;

	 `uvm_component_utils_begin(class_compB)
			`uvm_field_int(cl_int_B,UVM_DEFAULT)
	`uvm_component_utils_end
		
		function new(string name="class_compB",uvm_component parent);
			super.new(name,parent);
		endfunction


endclass

class  class_T extends uvm_test;

// basic datatypes
rand int par_int; 
rand byte par_address;
string par_string;

// Some objects to demonstrate the copy recursion policy

class_compA cl1; // UVM_SHALLOW
class_compA cl3; // UVM_DEEP

	`uvm_component_utils_begin(class_T)
		`uvm_field_int(par_int,UVM_DEFAULT)
		`uvm_field_int(par_address,UVM_DEFAULT | UVM_NOCOPY)
		`uvm_field_string(par_string,UVM_NOCOPY)
		 `uvm_field_object(cl1,UVM_DEFAULT)
		`uvm_field_object(cl3,UVM_DEFAULT|UVM_SHALLOW)
        `uvm_component_utils_end

 function new(string name="class_T",uvm_component parent);
	super.new(name,parent);
	par_string  = name;
  endfunction

function void build_phase(uvm_phase phase);	
	cl1 = class_compA::type_id::create("class_cl1",this);
	cl3 = class_compA::type_id::create("class_cl3",this);
endfunction


task run_phase(uvm_phase phase);
 uvm_coreservice_t cs = uvm_coreservice_t::get();
uvm_factory f = cs.get_factory();
f.print(1);
this.print();
endtask

endclass

	
