class  classB_cl extends uvm_object;

   // basic datatypes
   rand int par_int; 
   rand byte par_address;
   string par_string;

   // Some objects to demonstrate the copy recursion policy

   classA_cl cl1; // UVM_SHALLOW
   classA_cl cl3; // UVM_DEEP

   function new(string name="");
      super.new(name);
      cl1 = new("cl1_inst");
      cl3 = new("cl3_inst")	;
      par_string  = name;
   endfunction
   
endclass


