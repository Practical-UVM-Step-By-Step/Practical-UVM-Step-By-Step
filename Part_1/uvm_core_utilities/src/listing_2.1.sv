class classA_cl extends uvm_object;

   int addr;
   int cl_int;
   string cl_string;
   int 	  cl_int_arr[];
   
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
