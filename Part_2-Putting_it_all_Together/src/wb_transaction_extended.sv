`ifndef WB_TRANSACTION_EXTENDED__SV
 `define WB_TRANSACTION_EXTENDED__SV

class wb_transaction_extended extends wb_transaction;

   constraint my_new_constraint {
      address  inside {32'h01, 32'h03, 32'h07, 32'h0F, 32'h1F, 32'h3F, 32'h7F, 32'hFF};
   }

   `uvm_object_utils(wb_transaction_extended) 

   function new(string name="" );
      super.new(name);
   endfunction: new

endclass: wb_transaction_extended

`endif // WB_TRANSACTION_EXTENDED__SV
