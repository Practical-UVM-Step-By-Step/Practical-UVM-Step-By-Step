// Class definition
class class_A extends uvm_object;

 	int cl_int;
	string cl_string;
	int cl_int_arr[];
        longint	unsigned logic_data[*];

	 `uvm_object_utils_begin(class_A)
			`uvm_field_int(cl_int,UVM_ALL_ON)
			`uvm_field_string(cl_string,UVM_ALL_ON)
			`uvm_field_array_int(cl_int_arr,UVM_ALL_ON)
			`uvm_field_aa_int_longint_unsigned(logic_data,UVM_ALL_ON)
	`uvm_object_utils_end
		
		function new(string name="");
			int idx = 1;
			super.new(name);	
			cl_string = name;
			cl_int = 10;
	 		cl_int_arr = new[cl_int];
			for(int i = 0; i < cl_int; i++) begin
				cl_int_arr[i] = i + 1;
			end
			repeat (16) begin
				logic_data[idx] = idx;
				idx = idx << 1;
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
		`uvm_field_int(par_address,UVM_ALL_ON  )
		`uvm_field_string(par_string,UVM_NOCOPY)
		 `uvm_field_object(cl1,UVM_ALL_ON|UVM_NOCOPY)
		`uvm_field_object(cl3,UVM_ALL_ON|UVM_REFERENCE)
        `uvm_object_utils_end

 function new(string name="");
	super.new(name);
	cl1 = new(name);
  	cl3 = new(name )	;
	par_string  = name;
  endfunction
	

    function void do_copy(uvm_object rhs);
	class_P rhs_;
     super.do_copy(rhs);
	$cast(rhs_,rhs);
	cl1 = new rhs_.cl1;
	cl3 = new rhs_.cl3;
   endfunction

     virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);


	endfunction
endclass

class  class_Pass2 extends uvm_object;

// basic datatypes
rand int par_int; 
rand byte par_address;
string par_string;

// Some objects to demonstrate the copy recursion policy

class_A cl1; // UVM_SHALLOW
class_A cl3; // UVM_DEEP

	`uvm_object_utils_begin(class_Pass2)
		`uvm_field_int(par_int,UVM_ALL_ON)
		`uvm_field_int(par_address,UVM_ALL_ON | UVM_NOCOPY)
		`uvm_field_string(par_string,UVM_NOCOPY)
		 `uvm_field_object(cl1,UVM_ALL_ON)
		`uvm_field_object(cl3,UVM_ALL_ON|UVM_SHALLOW)
        `uvm_object_utils_end

 function new(string name="");
	super.new(name);
	cl1 = new(name);
  	cl3 = new(name)	;
	par_string  = name;
  endfunction
	

    function void do_copy(uvm_object rhs);
	class_Pass2 rhs_;
     super.do_copy(rhs);
	$cast(rhs_,rhs);
     par_int = rhs_.par_int;
     par_address = rhs_.par_address;
     par_string = rhs_.par_string;
	cl1 = new rhs_.cl1;
	cl3 = new rhs_.cl3;
   endfunction
	
     virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	class_P rhs_;	
	do_compare = super.do_compare(rhs,comparer);
	$cast(rhs_,rhs);
	do_compare &= comparer.compare_field_int("par_int",par_int,rhs_.par_int,32,UVM_NORADIX);
	do_compare &= comparer.compare_field_int("par_address",par_int,rhs_.par_int,32,UVM_NORADIX);
	do_compare &= comparer.compare_string("par_string",par_string,rhs_.par_string);
	do_compare &= comparer.compare_object("cl1",cl1,rhs_.cl1);
	do_compare &= comparer.compare_object("cl1",cl3,rhs_.cl3);
	endfunction


endclass

	
