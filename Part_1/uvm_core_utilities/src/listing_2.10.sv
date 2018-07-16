class  class_B2 extends uvm_object;

   // basic datatypes
   rand int par_int; 
   rand byte par_address;
   string par_string;
   logic [3:0] bits_field;

   // Some objects to demonstrate the copy recursion policy

   child_cl cl1; // UVM_SHALLOW
   child_cl cl3; // UVM_DEEP

   `uvm_object_utils_begin(class_B2)
      `uvm_field_int(par_int,UVM_DEFAULT|UVM_NOPACK)
      `uvm_field_int(par_address,UVM_DEFAULT | UVM_NOCOPY|UVM_NOPACK)
      `uvm_field_string(par_string,UVM_NOCOPY|UVM_NOPACK)
      `uvm_field_object(cl1,UVM_DEFAULT|UVM_NOPACK)
      `uvm_field_object(cl3,UVM_DEFAULT|UVM_SHALLOW|UVM_NOPACK)
      `uvm_field_int(bits_field,UVM_DEFAULT|UVM_NOPACK)
   `uvm_object_utils_end

   function new(string name="");
      super.new(name);
      cl1 = new(name);
      cl3 = new(name )	;
      par_string  = name;
      bits_field = inst_id;
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

