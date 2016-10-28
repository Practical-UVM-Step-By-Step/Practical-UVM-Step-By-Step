
`ifndef SIMPLE_WR_EXTENSION
`define SIMPLE_WR_EXTENSION 
typedef class ral_reg_simple_ral_env_r_RW_register;
typedef class simple_reg_field_cb;
// class simple_WR_extension extends uvm_reg;
class simple_WR_extension extends ral_reg_simple_ral_env_r_RW_register;
        rand uvm_reg_field r_RW_field;

        function new(string name = "simple_ral_env_r_RW_register");
		super.new(name);
        endfunction: new
   virtual function void build();
      this.r_RW_field = uvm_reg_field::type_id::create("r_RW_field",,get_full_name());
      this.r_RW_field.configure(this, 15, 0, "RW", 0, 15'h10, 1, 0, 1);
   endfunction: build

        `uvm_object_utils(simple_WR_extension)


virtual task pre_write(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task pre_write with value %h",rw.value[0]),UVM_LOW)
endtask


virtual task post_write(uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task post_write() with value %h",rw.value[0]),UVM_LOW)
endtask

virtual task pre_read(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task pre_read() with value %h",rw.value[0]),UVM_LOW)
endtask
virtual task post_read(uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task post_read() with value %h",rw.value[0]),UVM_LOW)
endtask

endclass : simple_WR_extension

class simple_WR_extension_wi_cb extends ral_reg_simple_ral_env_r_RW_register;
        rand uvm_reg_field r_RW_field;


        function new(string name = "simple_ral_env_r_RW_register");
		super.new(name);
        endfunction: new
   virtual function void build();
      this.r_RW_field = uvm_reg_field::type_id::create("r_RW_field",,get_full_name());
      this.r_RW_field.configure(this, 15, 0, "RW", 0, 15'h10, 1, 0, 1);
   endfunction: build

        `uvm_object_utils(simple_WR_extension_wi_cb)


virtual task pre_write(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task pre_write with value %h",rw.value[0]),UVM_LOW)
endtask


virtual task post_write(uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task post_write() with value %h",rw.value[0]),UVM_LOW)
endtask

virtual task pre_read(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task pre_read() with value %h",rw.value[0]),UVM_LOW)
endtask
virtual task post_read(uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task post_read() with value %h",rw.value[0]),UVM_LOW)
endtask

endclass : simple_WR_extension_wi_cb





class simple_reg_field_cb extends uvm_reg_cbs; 

virtual task pre_write(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task inside callback pre_write with value %h",rw.value[0]),UVM_LOW)
endtask

virtual task post_write(uvm_reg_item 	rw);
		rw.value[0] = 32'h0000ffff;
	`uvm_info(get_full_name(), $psprintf("calling task inside callback post_write() with value %h",rw.value[0]),UVM_LOW)
endtask

virtual task pre_read(	uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task inside callback pre_read() with value %h",rw.value[0]),UVM_LOW)
endtask
virtual task post_read(uvm_reg_item 	rw);
	`uvm_info(get_full_name(), $psprintf("calling task inside callback post_read() with value %h",rw.value[0]),UVM_LOW)
endtask
virtual function void post_predict( input uvm_reg_field fld, input uvm_reg_data_t previous, 
	inout uvm_reg_data_t value, input uvm_predict_e kind, input uvm_path_e path, input uvm_reg_map map);

	`uvm_info(get_full_name(), $psprintf("calling task inside callback post_predict() with previous value %h , current : %h predict kind %s",value,previous,kind.name()),UVM_LOW)

endfunction
function new(string name="simple_reg_field_cb");
	super.new();
endfunction


endclass

`endif
