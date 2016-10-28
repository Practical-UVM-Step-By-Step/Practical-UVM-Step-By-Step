


`ifndef WB_SCOREBOARD__SV
`define WB_SCOREBOARD__SV

class wb_scoreboard extends uvm_component;
   `uvm_component_utils( wb_scoreboard)
 
//   uvm_analysis_export  #( wb_transaction ) expected_analysis_export;
 //  uvm_analysis_export  #( wb_transaction )   actual_analysis_export;
   uvm_tlm_analysis_fifo#( wb_transaction ) expected_wb_transaction_fifo;
   uvm_tlm_analysis_fifo#( wb_transaction ) actual_wb_transaction_fifo;
 
   // Constructor

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

    // Build all the components ..

   virtual function void build_phase( uvm_phase phase );
      super.build_phase( phase );
// 
 //     expected_analysis_export = new( "expected_analysis_export", this );
  //      actual_analysis_export = new(   "actual_analysis_export", this );
      expected_wb_transaction_fifo = new( "expected_wb_transaction_fifo", this );
      actual_wb_transaction_fifo  = new(   "actual_wb_transaction_fifo", this );
   endfunction: build_phase
 
   // Function: connect_phase
    // Connect the components

   virtual function void connect_phase( uvm_phase phase );
      super.connect_phase( phase );
 
//      expected_analysis_export.connect( expected_wb_transaction_fifo.analysis_export );
 //       actual_analysis_export.connect(   actual_wb_transaction_fifo.analysis_export );
   endfunction: connect_phase
 
   // Task: main_phase. All the heavy lifting takes place here.
   
   virtual task run_phase( uvm_phase phase );
      wb_transaction expected_transaction;
      wb_transaction   actual_transaction;
 
      super.run_phase( phase ); // THis should do nothing
      forever begin
         expected_wb_transaction_fifo.get_peek_export.get( expected_transaction);
         actual_wb_transaction_fifo.get_peek_export.get(actual_transaction);
		expected_transaction.print(uvm_default_printer);
		actual_transaction.print(uvm_default_printer);
         if ( expected_transaction.compare( actual_transaction) != 0 ) begin
            `uvm_error( "WB Scoreboard", "wb_transaction mismatch") 
		expected_transaction.print(uvm_default_printer);
		actual_transaction.print(uvm_default_printer);
         end
	else begin
	`uvm_info("WB SCOREBOARD", "TRANSACTIONS MATCH", UVM_LOW)
	end
      end
   endtask: run_phase
 
endclass: wb_scoreboard

`endif // WB_SCOREBOARD__SV
