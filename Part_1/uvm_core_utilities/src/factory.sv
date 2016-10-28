module top;
import uvm_pkg::*;

`include "class_factory.sv"
	
initial begin
	// free children


	// class_A::type_id::set_type_override(class_B::get_type(),1);
	class_compA::type_id::set_inst_override(class_compB::get_type(),"uvm_test_top.class_cl1",null);
        run_test();
	

 end 
endmodule
