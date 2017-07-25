
module top;
   import uvm_pkg::*;

   // Class definition
class class_A extends uvm_object;

   int cl_int;
   string cl_string;
   int 	  cl_int_arr[];
   int 	  logic_data[int];

   `uvm_object_utils_begin(class_A)
      `uvm_field_int(cl_int,UVM_ALL_ON)
      `uvm_field_string(cl_string,UVM_ALL_ON)
      `uvm_field_array_int(cl_int_arr,UVM_ALL_ON)
      `uvm_field_aa_int_int(logic_data,UVM_ALL_ON)
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

class  class_B extends uvm_object;

   // basic datatypes
   rand int par_int; 
   rand byte par_address;
   string par_string;
   logic [3:0] bits_field;

   // Some objects to demonstrate the copy recursion policy

   class_A cl1; // UVM_SHALLOW
   class_A cl3; // UVM_DEEP

   `uvm_object_utils_begin(class_B)
      `uvm_field_int(par_int,UVM_ALL_ON|UVM_NOPACK)
      `uvm_field_int(par_address,UVM_ALL_ON | UVM_NOCOPY|UVM_NOPACK)
      `uvm_field_string(par_string,UVM_NOCOPY|UVM_NOPACK)
      `uvm_field_object(cl1,UVM_ALL_ON|UVM_NOPACK)
      `uvm_field_object(cl3,UVM_ALL_ON|UVM_SHALLOW|UVM_NOPACK)
      `uvm_field_int(bits_field,UVM_ALL_ON|UVM_NOPACK)
   `uvm_object_utils_end

   function new(string name="");
      super.new(name);
      cl1 = new(name,10);
      cl3 = new(name,11 )	;
      par_string  = name;
      bits_field = inst_id;
   endfunction
   

   function void do_copy(uvm_object rhs);
      class_B rhs_;
      super.do_copy(rhs);
      $cast(rhs_,rhs);
      par_int = rhs_.par_int;
      par_address = rhs_.par_address;
      par_string = rhs_.par_string;
      cl1 = new rhs_.cl1;
      cl3 = new rhs_.cl3;
      bits_field = rhs_.bits_field;
   endfunction
   
   virtual     function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      class_B rhs_;	
      do_compare = super.do_compare(rhs,comparer);
      $cast(rhs_,rhs);
      do_compare &= comparer.compare_field_int("par_int",par_int,rhs_.par_int,32,UVM_NORADIX);
      do_compare &= comparer.compare_field_int("par_address",par_int,rhs_.par_int,32,UVM_NORADIX);
      do_compare &= comparer.compare_string("par_string",par_string,rhs_.par_string);
      do_compare &= comparer.compare_object("cl1",cl1,rhs_.cl1);
      do_compare &= comparer.compare_object("cl1",cl3,rhs_.cl3);
      do_compare &= comparer.compare_field("bits_field",bits_field,rhs_.bits_field,$bits(bits_field),UVM_NORADIX);
   endfunction

   function void do_pack (uvm_packer packer);
      super.do_pack(packer);
      packer.pack_field_int(par_int,32);
      packer.pack_field_int(par_address,8);
      packer.pack_string(par_string);
      packer.pack_object(cl1);
      packer.pack_object(cl3);
      packer.pack_field(bits_field,$bits(bits_field));
   endfunction

   function void do_unpack (uvm_packer packer);
      super.do_unpack(packer);
      par_int = packer.unpack_field_int(32);
      par_address = packer.unpack_field_int(8);
      par_string = packer.unpack_string(-1);
      packer.unpack_object(cl1);
      packer.unpack_object(cl3);
      bits_field = packer.unpack_field($bits(bits_field));
   endfunction
endclass

   bit 	       pack_bytes[];
   class_B  class_B_inst1;
   class_B  class_B_inst2;
   initial begin
      // free children

      class_B_inst1 = new("first_inst");
      class_B_inst1.randomize();
      `uvm_info("top", "Printing class_B_inst1",UVM_LOW)	
      class_B_inst1.print();

      uvm_default_packer.use_metadata = 1;
      class_B_inst1.pack(pack_bytes);

      class_B_inst2 = new("second_inst");
      //      class_B_inst2.randomize();
      `uvm_info("top", "Printing class_B_inst2",UVM_LOW)	
      class_B_inst2.print();

      class_B_inst2.unpack(pack_bytes);
      `uvm_info("top", "Printing class_B_inst2 after unpack",UVM_LOW)	
      class_B_inst2.print();

   end
endmodule


