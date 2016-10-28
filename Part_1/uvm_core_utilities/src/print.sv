
module top;
import uvm_pkg::*;
`include "class2.sv"

	uvm_line_printer local_line_printer = new;
	uvm_tree_printer local_tree_printer = new;
	uvm_table_printer local_table_printer = new;
	UVM_FILE myfile;

	class_A cl1 = new("Child Class");
	initial begin
		myfile = $fopen("Data","w");
		//uvm_default_printer = uvm_default_table_printer; //default, so not needed.
		cl1.print();
		uvm_default_printer = uvm_default_line_printer;
		cl1.print();
		uvm_default_printer = uvm_default_tree_printer;
		cl1.print();
		local_table_printer.knobs.type_width = 20;
		local_table_printer.knobs.header = 1;
		local_table_printer.knobs.value_width = 20;
		local_table_printer.knobs.mcd = myfile;
		cl1.print(local_table_printer);
	end
endmodule


