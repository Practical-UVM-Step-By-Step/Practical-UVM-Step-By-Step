//
// Template for UVM-compliant Coverage Class
//

`ifndef WB_COV_RAL__SV
`define WB_COV_RAL__SV

class wb_dma_predictor extends uvm_component #(wb_transaction) ;


`uvm_component_utils(wb_dma_predictor) 
   function new(string name,uvm_component parent);
      super.new(name,parent);
   endfunction: new


virtual function void pre_predict(uvm_reg_item 	rw	);
	rw.sample();
endfunction

endclass: wb_dma_predictor

`endif // WB_COV_RAL__SV

