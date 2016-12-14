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

//
// Template for UVM Scoreboard

`ifndef WB_ETH_SCOREBOARD__SV
 `define WB_ETH_SCOREBOARD__SV

class map_mac_mii_transaction  extends uvm_object;
   `uvm_object_utils(map_mac_mii_transaction)

   function mii_transaction transform(mac_transaction tr);

   endfunction

   function new(string name="");
      super.new(name);
   endfunction

endclass
class map_mii_mac_transaction  extends uvm_object;

   `uvm_object_utils(map_mii_mac_transaction)

   function mac_transaction transform(mii_transaction tr);

   endfunction

endclass

typedef uvm_algorithmic_comparator #(mac_transaction,mii_transaction,map_mac_mii_transaction) mac_comparator;
typedef uvm_algorithmic_comparator #(mii_transaction,mac_transaction,map_mii_mac_transaction) mii_comparator;

class eth_blk_scoreboard extends uvm_scoreboard;

   uvm_analysis_export #(mac_transaction) mac_transmit;
   uvm_analysis_export #(mac_transaction) mac_receive;
   uvm_analysis_export #(mii_transaction) mii_transmit;
   uvm_analysis_export #(mii_transaction) mii_receive;

   map_mac_mii_transaction Xform;
   map_mii_mac_transaction Xform2;
   mac_comparator comp;
   mii_comparator comp2;

   `uvm_component_utils(eth_blk_scoreboard)
   extern function new(string name = "eth_blk_scoreboard",
                       uvm_component parent = null); 
   extern virtual function void build_phase (uvm_phase phase);
   extern virtual function void connect_phase (uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);

endclass: eth_blk_scoreboard

function eth_blk_scoreboard::new(string name = "eth_blk_scoreboard",
				 uvm_component parent);
   super.new(name,parent);
endfunction: new

function void eth_blk_scoreboard::build_phase(uvm_phase phase);
   super.build_phase(phase);
   mac_transmit = new("mac_transmit", this);
   mac_receive = new("mac_receive", this);
   mii_transmit = new("mii_transmit", this);
   mii_receive = new("mii_receive", this);
   // create a new transformer
   Xform = map_mac_mii_transaction::type_id::create("Transformer",this);

   // create the comparator
   // comp = mac_comparator::type_id::create("Comp",this,Xform);
   comp = new("Comp",this,Xform);
   comp2 = new("Comp2",this,Xform2);

   
endfunction:build_phase

function void eth_blk_scoreboard::connect_phase(uvm_phase phase);

   mac_transmit.connect(comp.before_export);
   mii_transmit.connect(comp.after_export);
   mii_receive.connect(comp2.before_export);
   mac_receive.connect(comp2.after_export);

endfunction:connect_phase

task eth_blk_scoreboard::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"scbd..");
   phase.drop_objection(this);
endtask: main_phase 

function void eth_blk_scoreboard::report_phase(uvm_phase phase);
   super.report_phase(phase);
   //    `uvm_info("SBRPT", $sformatf("Matches = %0d, Mismatches = %0d", comp.m_matches, comp.m_mismatches), UVM_MEDIUM);

endfunction:report_phase

`endif // WB_ETH_SCOREBOARD__SV
