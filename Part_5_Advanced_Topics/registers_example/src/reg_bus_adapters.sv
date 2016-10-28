`ifndef REGBUS_ADAPTERS
`define REGBUS_ADAPTERS

class wb_ral_reg_adapter extends uvm_reg_adapter;
function new(string name = "wb_ral_reg_adapter");
super.new(name);
endfunction

virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
wb_transaction w_trans;
w_trans = wb_transaction::type_id::create("w_trans");
w_trans.address = rw.addr;
w_trans.data = rw.data;
w_trans.sel = 4'hf;
w_trans.kind = (rw.kind == UVM_READ)? wb_transaction::READ:wb_transaction::WRITE;
return w_trans;
endfunction

virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
wb_transaction trans;
if(!$cast(trans,bus_item))  
	`uvm_fatal("BUS2REF","Wrong type received");

rw.addr = trans.address;
rw.data = trans.data;
rw.kind = (trans.kind == wb_transaction::READ)?UVM_READ:UVM_WRITE;
rw.status = UVM_IS_OK;
endfunction



endclass



`endif
