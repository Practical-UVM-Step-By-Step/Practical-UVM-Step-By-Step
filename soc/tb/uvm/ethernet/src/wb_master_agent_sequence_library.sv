/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

typedef class wb_transaction;
   typedef class ral_reg_ethernet_blk_TxBD_TxBD_CTRL;
class wb_master_seqr_sequence_library extends uvm_sequence_library # (wb_transaction);
   `uvm_sequence_library_utils(wb_master_seqr_sequence_library)

   function new(string name = "simple_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class base_sequence extends uvm_sequence #(wb_transaction);
   `uvm_object_utils(base_sequence)
   `uvm_declare_p_sequencer(wb_master_seqr)

   function new(string name = "base_seq");
      super.new(name);
   endfunction:new
   virtual task pre_body(); 
      uvm_phase phase_=get_starting_phase();

      if (get_starting_phase()!= null)
	phase_.raise_objection(this);

   endtask:pre_body
   virtual task post_body(); uvm_phase phase_=get_starting_phase();

      if (get_starting_phase()!= null)
	phase_.drop_objection(this);
   endtask:post_body
endclass

class sequence_0 extends base_sequence;
   `uvm_object_utils(sequence_0)
   
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      
      repeat(2) begin
	 `uvm_do(req);
      end
      start_item(req);
      finish_item(req);
   endtask
   virtual task pre_body();
      if (get_starting_phase()!=null) begin
	 uvm_phase phase_=get_starting_phase();
	 `uvm_info(get_type_name(),
                   $sformatf("%s pre_body() raising %s objection", get_sequence_path(),
                             phase_.get_name()), UVM_MEDIUM);
	 phase_.raise_objection(this);
      end
   endtask

   // Drop the objection in the post_body so the objection is removed when
   // the root sequence is complete. 
   virtual task post_body();
      if (get_starting_phase()!=null) begin
	 uvm_phase phase_=get_starting_phase();
	 `uvm_info(get_type_name(),
                   $sformatf("%s post_body() dropping %s objection", get_sequence_path(),
                             phase_.get_name()), UVM_MEDIUM);
	 phase_.drop_objection(this);
      end
   endtask

endclass

class sequence_1 extends base_sequence;
   byte sa;
   `uvm_object_utils(sequence_1)
  
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual task body();

      `uvm_do_with(req, {address == 3; kind == wb_transaction::READ ;} )
      `uvm_do_with(req, {address == 4; kind == wb_transaction::READ;} )
      `uvm_do_with(req, {address == 5; kind == wb_transaction::READ;} ) 
   endtask
endclass

class repeated_read_sequence extends base_sequence;
   `uvm_object_utils(repeated_read_sequence)


   function new(string name="my_repeated_read_sequence");
      super.new(name);
   endfunction

   virtual task body();
      `uvm_do_with(req, {address == 0; kind == wb_transaction::READ; } )
      `uvm_do_with(req, {address == 1; kind == wb_transaction::READ; } )
      `uvm_do_with(req, {address == 2; kind == wb_transaction::READ; } )
      `uvm_do_with(req, {address == 3; kind == wb_transaction::READ; } )
   endtask

endclass
   
class write_master_single extends base_sequence;
   bit [31:0] write_data;
   bit [31:0] write_address;
   `uvm_object_utils(write_master_single)

   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual    task body();
      `uvm_do_with(req, {address == write_address; kind == wb_transaction::WRITE; data == write_data;} )
   endtask
endclass

class read_master_single extends base_sequence;
   bit [31:0] read_data;
   bit [31:0] read_address;
   `uvm_object_utils(read_master_single)
   
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual    task body();
      `uvm_do_with(req, {address == read_address; kind == wb_transaction::READ; } )
   endtask
endclass

class heir_sequence_w extends base_sequence;
   `uvm_object_utils(heir_sequence_w)
   
   write_master_single single_seq;

   
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      single_seq = write_master_single::type_id::create("my_sequence");
      single_seq.write_address  = 10;
      single_seq.write_data = 32'h12345678;
      repeat(2) begin
	 single_seq.start(p_sequencer);
      end
   endtask
endclass

class init_tx_seq extends base_sequence;
   `uvm_object_utils(init_tx_seq)
   

   function new(string name = "init_tx_seq");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;

      // Set the Mac's address. 

      p_sequencer.regmodel.MODER.PAD.set(1);
      p_sequencer.regmodel.MODER.RXEN.set(1);
      p_sequencer.regmodel.MODER.TXEN.set(1);
      p_sequencer.regmodel.MODER.FULLD.set(1);
      p_sequencer.regmodel.MODER.CRCEN.set(1);
      p_sequencer.regmodel.MODER.update(.status(reg_status),  .path(UVM_FRONTDOOR), .parent(this));
   endtask

endclass

   // This class is the actual interrupt sequence.

class tx_interrupt_seq extends base_sequence;
   `uvm_object_utils(tx_interrupt_seq)
  

   function new(string name = "tx_interrupt_seq");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      
      `uvm_info(get_full_name(),$sformatf("waiting for Interrupt %d",$time),UVM_MEDIUM)
      p_sequencer.int_if.wait_for_intr_pos();
      `uvm_info(get_full_name(),$sformatf("Got Interrupt %d",$time),UVM_MEDIUM)
      grab();
      p_sequencer.regmodel.INT_MASK.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.INT_SOURCE.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_SOURCE.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      `uvm_info(get_full_name(),$sformatf("Completed interrupt sequence %d",$time),UVM_MEDIUM)
      ungrab();
   endtask
endclass

class setup_txbd_sequence extends base_sequence;
   `uvm_object_utils(setup_txbd_sequence)
   

   int packet_lenght;
   int buffer_num;
   int mem_addr ;
   function new(string name = "setup_txbd_sequence");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;

      p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(buffer_num));

      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.CS.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.DF.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.LC.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.RL.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.RTRY.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.UR.set(0);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.CRC.set(1);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.PAD.set(1);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.WR.set(1);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.IRQ.set(1);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.RD.set(1);
      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.LEN.set(packet_lenght);

      p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.update(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.TxBD[buffer_num].TxPNT_val.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this), .value(mem_addr));

      $display("CTRL Time is %d %d %h\n",$time,packet_lenght,p_sequencer.regmodel.TxBD[buffer_num].TxBD_CTRL.get());
      $display("VALUE Time is %d %d %h\n",$time,packet_lenght,p_sequencer.regmodel.TxBD[buffer_num].TxPNT_val.get());

   endtask
endclass

class initialize_txbd_rxbd_sequence extends base_sequence;
   `uvm_object_utils(initialize_txbd_rxbd_sequence)
   

   function new(string name = "initialize_rxbd_sequence");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      `uvm_info(get_full_name(),$sformatf("Began cleaning up descriptors %d",$time),UVM_MEDIUM)
      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      for(int i = 0; i < 64; i = i+1) begin
	 p_sequencer.regmodel.TxBD[i].TxBD_CTRL.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this), .value(0));
	 p_sequencer.regmodel.TxBD[i].TxPNT_val.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this), .value(0));
      end
      `uvm_info(get_full_name(),$sformatf("End cleaning up descriptors %d",$time),UVM_MEDIUM)
   endtask
endclass

class send_tx_packet extends base_sequence;

   init_tx_seq tx_seq;
   setup_txbd_sequence  txbd_sequence;
   tx_interrupt_seq  tx_int_sequence;
   initialize_txbd_rxbd_sequence  initialize_desc_seq;
   write_master_single single_seq;
   read_master_single single_seq_read;

   `uvm_object_utils(send_tx_packet)
   

   function new(string name = "send_tx_packet");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR0.write(.status(reg_status), .value(32'h03040506), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR1.write(.status(reg_status), .value(32'h00001020), .path(UVM_FRONTDOOR), .parent(this));
      tx_seq = init_tx_seq::type_id::create("tx seq");
      txbd_sequence = setup_txbd_sequence::type_id::create("TXBD data Sequence");
      initialize_desc_seq = initialize_txbd_rxbd_sequence::type_id::create("initialize_desc_sequence");
      tx_int_sequence = tx_interrupt_seq::type_id::create("tx_init_sequence");
      single_seq_read = read_master_single::type_id::create("single_seq");
      single_seq = write_master_single::type_id::create("simple seq read");
      // Clean up descriptors
      initialize_desc_seq.start(p_sequencer);
      p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));
      single_seq.write_address = 32'h00000400;
      single_seq.write_data = 32'h007c5800;
      single_seq.start(p_sequencer);
      single_seq.write_address = 32'h00000404;
      single_seq.write_data = 32'h00002000;
      single_seq.start(p_sequencer);
      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));
      p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));
      single_seq.write_address = 32'h00000404;
      single_seq.write_data = 32'h00002000;
      single_seq.start(p_sequencer);
      p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));
      single_seq.write_address = 32'h00000404;
      single_seq.write_data = 32'h00002000;
      single_seq.start(p_sequencer);
      single_seq.write_address = 32'h00000400;
      single_seq.write_data = 32'h007c5800;
      single_seq.start(p_sequencer);
      single_seq.write_address = 32'h00000400;
      single_seq.write_data = 32'h003cd800;
      single_seq.start(p_sequencer);

      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;
      single_seq_read.start(p_sequencer);

      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);

      tx_int_sequence.start(p_sequencer);
   endtask
endclass

class send_2_packets extends base_sequence;

   init_tx_seq tx_seq;
   setup_txbd_sequence  txbd_sequence;
   tx_interrupt_seq  tx_int_sequence;
   initialize_txbd_rxbd_sequence  initialize_desc_seq;
   write_master_single single_seq;
   read_master_single single_seq_read;

   `uvm_object_utils(send_2_packets)
   

   function new(string name = "send_2_packets");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR0.write(.status(reg_status), .value(32'h03040506), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR1.write(.status(reg_status), .value(32'h00001020), .path(UVM_FRONTDOOR), .parent(this));
      tx_seq = init_tx_seq::type_id::create("tx seq");
      txbd_sequence = setup_txbd_sequence::type_id::create("TXBD data Sequence");
      initialize_desc_seq = initialize_txbd_rxbd_sequence::type_id::create("initialize_desc_sequence");
      tx_int_sequence = tx_interrupt_seq::type_id::create("tx_init_sequence");
      single_seq_read = read_master_single::type_id::create("single_seq");
      single_seq = write_master_single::type_id::create("simple seq read");
      // Clean up descriptors
      initialize_desc_seq.start(p_sequencer);
      // p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));

      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));

      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 0;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 1;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 2;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      // tx_int_sequence.start(p_sequencer);
      single_seq_read.start(p_sequencer);
   endtask
endclass

class send_tx_packet2 extends base_sequence;

   init_tx_seq tx_seq;
   setup_txbd_sequence  txbd_sequence;
   tx_interrupt_seq  tx_int_sequence;
   initialize_txbd_rxbd_sequence  initialize_desc_seq;
   write_master_single single_seq;
   read_master_single single_seq_read;

   `uvm_object_utils(send_tx_packet2)
   

   function new(string name = "send_tx_packet2");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR0.write(.status(reg_status), .value(32'h03040506), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR1.write(.status(reg_status), .value(32'h00001020), .path(UVM_FRONTDOOR), .parent(this));
      tx_seq = init_tx_seq::type_id::create("tx seq");
      txbd_sequence = setup_txbd_sequence::type_id::create("TXBD data Sequence");
      initialize_desc_seq = initialize_txbd_rxbd_sequence::type_id::create("initialize_desc_sequence");
      tx_int_sequence = tx_interrupt_seq::type_id::create("tx_init_sequence");
      single_seq_read = read_master_single::type_id::create("single_seq");
      single_seq = write_master_single::type_id::create("simple seq read");
      // Clean up descriptors
      initialize_desc_seq.start(p_sequencer);
      // p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));

      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));

      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 0;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 1;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 2;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
   endtask
endclass
   // BARRIER Class tests

class send_2_packets_barrier extends base_sequence;

   init_tx_seq tx_seq;
   setup_txbd_sequence  txbd_sequence;
   tx_interrupt_seq  tx_int_sequence;
   initialize_txbd_rxbd_sequence  initialize_desc_seq;
   write_master_single single_seq;
   read_master_single single_seq_read;
   uvm_barrier send_2_pkt_barrier;

   `uvm_object_utils(send_2_packets_barrier)
   

   function new(string name = "send_2_packets_barrier");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;

      uvm_config_db #(uvm_barrier)::get(null,"","transmit_b",send_2_pkt_barrier);

      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR0.write(.status(reg_status), .value(32'h03040506), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR1.write(.status(reg_status), .value(32'h00001020), .path(UVM_FRONTDOOR), .parent(this));
      tx_seq = init_tx_seq::type_id::create("tx seq");
      txbd_sequence = setup_txbd_sequence::type_id::create("TXBD data Sequence");
      initialize_desc_seq = initialize_txbd_rxbd_sequence::type_id::create("initialize_desc_sequence");
      tx_int_sequence = tx_interrupt_seq::type_id::create("tx_init_sequence");
      single_seq_read = read_master_single::type_id::create("single_seq");
      single_seq = write_master_single::type_id::create("simple seq read");
      // Clean up descriptors
      initialize_desc_seq.start(p_sequencer);
      // p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));

      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));

      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 0;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 1;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 2;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      // tx_int_sequence.start(p_sequencer);
      single_seq_read.start(p_sequencer);
      send_2_pkt_barrier.wait_for();
   endtask
endclass

class tx_interrupt_seq_barrier extends base_sequence;
   `uvm_object_utils(tx_interrupt_seq_barrier)
   
   uvm_barrier int_barrier;

   function new(string name = "tx_interrupt_seq_barrier");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      uvm_config_db #(uvm_barrier)::get(null,"","transmit_b",int_barrier);
      `uvm_info(get_full_name(),$sformatf("waiting for Interrupt %d",$time),UVM_MEDIUM)
      p_sequencer.int_if.wait_for_intr_pos();
      `uvm_info(get_full_name(),$sformatf("Got Interrupt %d",$time),UVM_MEDIUM)
      grab();
      p_sequencer.regmodel.INT_MASK.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.INT_SOURCE.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_SOURCE.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      ungrab();
      $display("number of waiting %d threshold %d",int_barrier.get_num_waiters(),int_barrier.get_threshold());
      int_barrier.wait_for();

      `uvm_info(get_full_name(),$sformatf("Completed interrupt sequence %d",$time),UVM_MEDIUM)
   endtask
endclass

class tx_interrupt_event_seq extends base_sequence;
   `uvm_object_utils(tx_interrupt_event_seq)
   
   uvm_event int_event;

   function new(string name = "tx_interrupt_event_seq");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;
      uvm_config_db #(uvm_event)::get(null,"","transmit_b",int_event);
      `uvm_info(get_full_name(),$sformatf("waiting for Interrupt at start of Sequence %d",$time),UVM_MEDIUM)
      int_event.wait_ptrigger();
      `uvm_info(get_full_name(),$sformatf("waiting for Interrupt trigger %d",$time),UVM_MEDIUM)
      p_sequencer.int_if.wait_for_intr_pos();
      `uvm_info(get_full_name(),$sformatf("Got Interrupt finally %d",$time),UVM_MEDIUM)
      grab();
      p_sequencer.regmodel.INT_MASK.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.INT_SOURCE.read(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      p_sequencer.regmodel.INT_SOURCE.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(reg_data));
      ungrab();
      `uvm_info(get_full_name(),$sformatf("Completed interrupt sequence %d",$time),UVM_MEDIUM)
   endtask
endclass

class send_2_packets_event_sync_sequence extends base_sequence;

   init_tx_seq tx_seq;
   setup_txbd_sequence  txbd_sequence;
   tx_interrupt_seq  tx_int_sequence;
   initialize_txbd_rxbd_sequence  initialize_desc_seq;
   write_master_single single_seq;
   read_master_single single_seq_read;
   uvm_event send_2_pkt_event;

   `uvm_object_utils(send_2_packets_event_sync_sequence)
   

   function new(string name = "send_2_packets_event_sync_sequence");
      super.new(name);
   endfunction:new

   virtual task body();
      uvm_reg_data_t reg_data;
      uvm_status_e reg_status;

      uvm_config_db #(uvm_event)::get(null,"","transmit_b",send_2_pkt_event);

      p_sequencer.regmodel.MODER.write(.status(reg_status), .value(0), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR0.write(.status(reg_status), .value(32'h03040506), .path(UVM_FRONTDOOR), .parent(this));
      p_sequencer.regmodel.MAC_ADDR1.write(.status(reg_status), .value(32'h00001020), .path(UVM_FRONTDOOR), .parent(this));
      tx_seq = init_tx_seq::type_id::create("tx seq");
      txbd_sequence = setup_txbd_sequence::type_id::create("TXBD data Sequence");
      initialize_desc_seq = initialize_txbd_rxbd_sequence::type_id::create("initialize_desc_sequence");
      tx_int_sequence = tx_interrupt_seq::type_id::create("tx_init_sequence");
      single_seq_read = read_master_single::type_id::create("single_seq");
      single_seq = write_master_single::type_id::create("simple seq read");
      // Clean up descriptors
      initialize_desc_seq.start(p_sequencer);
      // p_sequencer.regmodel.TX_BD_NUM.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(1));

      p_sequencer.regmodel.INT_MASK.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h0000007f));
      p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));

      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 0;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 1;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.packet_lenght = 80;
      txbd_sequence.buffer_num = 2;
      txbd_sequence.mem_addr = 1000;
      txbd_sequence.start(p_sequencer);

      single_seq_read.read_address = 32'h00000400;
      single_seq_read.read_data = 32'h007c5800;

      repeat (5)  // Apparently this is a magic number that kicks off the machine
	single_seq_read.start(p_sequencer);
      send_2_pkt_event.trigger();
   endtask
endclass

