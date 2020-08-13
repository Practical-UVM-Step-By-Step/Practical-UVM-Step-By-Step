`ifndef WB_SLAVE_SEQR
 `define WB_SLAVE_SEQR
typedef class wb_transaction;
class wb_slave_seqr extends uvm_sequencer # (wb_transaction);

   uvm_blocking_get_port #(wb_transaction) m_getp;

   local bit [63:0] ram [*];
   `uvm_component_utils(wb_slave_seqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
      m_getp = new("slave_get_port",this);
      set_arbitration(UVM_SEQ_ARB_STRICT_FIFO);

   endfunction:new 

   task wait_for_req(uvm_sequence_base seq, output wb_transaction req);
      wait_for_grant(seq);
      m_getp.get(req);
   endtask


   task send_rsp(uvm_sequence_base seq, wb_transaction rsp);
      rsp.set_item_context(seq);
      seq.finish_item(rsp);
   endtask

   function bit [63:0] read(bit [63:0] addr);
      read = (this.ram.exists(addr)) ? this.ram[addr] : 64'bx;
   endfunction: read


   function void write(bit [63:0] addr,
                       bit [63:0] data);
      this.ram[addr] = data;
   endfunction: write

   function void start_of_simulation_phase(uvm_phase phase);
      integer 			  i;
      super.start_of_simulation_phase(phase);
      `uvm_info("WB_SLAVE_SEQR","Initializing memory",UVM_MEDIUM)
      for(i = 0; i < 1000; i++) begin
	 write(i,i * 10);
      end

      
   endfunction

endclass:wb_slave_seqr
`endif
