//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010-2011 Synopsys, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

package my_env_pkg;
   import uvm_pkg::*;

`include "uvm_macros.svh"
`include "classA.svh"
`include "classB.svh"
`include "classD.svh"
   
class my_env extends uvm_env;
   bit debug = 0;
   B instB;
   A inst_arr[75];
   D instD;
   
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      set_config_int("instB.u1", "v", 3);

      set_config_int("inst_arr.*", "s", 'h10);
      set_config_int("instB.*", "s", 'h20);
      instB = new("instB", this);
      instD = new("instD",this);

      for(int i = 0; i < 5; i++) begin
	 inst_arr[i] = new($sformatf("inst%02d",i),this);
      end
      for(int i = 5; i < 10; i++) begin
	 inst_arr[i] = new($sformatf("tom%02d",i),this);
      end
      for(int i = 10; i < 12; i++) begin
	 inst_arr[i] = new($sformatf("tomm%02d",i),this);
      end
      for(int i = 12; i < 14; i++) begin
	 inst_arr[i] = new($sformatf("tommm%02d",i),this);
      end
      for(int i = 14; i < 15; i++) begin
	 inst_arr[i] = new($sformatf("tommmm%02d",i),this);
      end
      
      inst_arr[15] = new($sformatf("tomm%02d",15),this);
      inst_arr[16] = new($sformatf("tommommomm%02d",16),this);
      inst_arr[17] = new($sformatf("tommommommomm%02d",17),this);
      for(int i = 18; i <20 ; i++) begin
	 inst_arr[i] = new($sformatf("TOMMMM%02d",i),this);
      end
      for(int i = 20; i <25 ; i++) begin
	 inst_arr[i] = new($sformatf("tom%02d",i),this);
      end

      inst_arr[25] =  new($sformatf("a"),this);
      inst_arr[26] =  new($sformatf("aa"),this);
      inst_arr[27] =  new($sformatf("aaa"),this);
      inst_arr[28] =  new($sformatf("aaaaa"),this);
      inst_arr[29] =  new($sformatf("b"),this);
      inst_arr[30] =  new($sformatf("ab"),this);
      inst_arr[31] =  new($sformatf("aaaaab"),this);
      inst_arr[32] =  new($sformatf("abc"),this);
      inst_arr[33] =  new($sformatf("abbc"),this);
      inst_arr[34] =  new($sformatf("abbbc"),this);
      inst_arr[35] =  new($sformatf("aaaaabbbb"),this);
      inst_arr[36] =  new($sformatf("aaabbbccc"),this);
      inst_arr[37] =  new($sformatf("abd"),this);
      inst_arr[38] =  new($sformatf("abcdef"),this);
      inst_arr[39] =  new($sformatf("abcdefabc"),this);
      inst_arr[40] =  new($sformatf("cab"),this);
      inst_arr[41] =  new($sformatf("caab"),this);
      inst_arr[42] =  new($sformatf("cb"),this);
      inst_arr[43] =  new($sformatf("def"),this);


   endfunction

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      // print_config(1,0);
      //       uvm_top.print_topology();
      #10;
      phase.drop_objection(this);
   endtask

   `uvm_component_utils_begin(my_env)
      `uvm_field_int(debug, UVM_DEFAULT)
   `uvm_component_utils_end

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);
      
      $display("value of V in %s is %d", $sformatf("B.u1.v"),instB.u1.v);
      $display("value of V in %s is %d", $sformatf("D.u1.v"),instD.u1.v);

      $display("value of S in %s is %d", $sformatf("B.u1.s"),instB.u1.s);
      $display("value of S in %s is %d", $sformatf("D.u1.s"),instD.u1.s);

      for(int i = 0; i <25 ; i++) begin
	 $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[i].get_name()),inst_arr[i].u1.v);
      end


      for(int i = 0; i <25 ; i++) begin
	 $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[i].get_name()),inst_arr[i].u1.s);
      end

      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[25].get_name()),inst_arr[25].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[26].get_name()),inst_arr[26].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[27].get_name()),inst_arr[27].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[28].get_name()),inst_arr[28].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[29].get_name()),inst_arr[29].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[30].get_name()),inst_arr[30].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[31].get_name()),inst_arr[31].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[32].get_name()),inst_arr[32].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[33].get_name()),inst_arr[33].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[34].get_name()),inst_arr[34].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[35].get_name()),inst_arr[35].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[36].get_name()),inst_arr[36].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[37].get_name()),inst_arr[37].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[38].get_name()),inst_arr[38].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[39].get_name()),inst_arr[39].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[40].get_name()),inst_arr[40].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[41].get_name()),inst_arr[41].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[42].get_name()),inst_arr[42].u1.s);
      $display("value of s in %s is %d", $sformatf("%s.u1.s",inst_arr[43].get_name()),inst_arr[43].u1.s);


      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[25].get_name()),inst_arr[25].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[26].get_name()),inst_arr[26].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[27].get_name()),inst_arr[27].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[28].get_name()),inst_arr[28].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[29].get_name()),inst_arr[29].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[30].get_name()),inst_arr[30].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[31].get_name()),inst_arr[31].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[32].get_name()),inst_arr[32].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[33].get_name()),inst_arr[33].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[34].get_name()),inst_arr[34].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[35].get_name()),inst_arr[35].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[36].get_name()),inst_arr[36].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[37].get_name()),inst_arr[37].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[38].get_name()),inst_arr[38].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[39].get_name()),inst_arr[39].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[40].get_name()),inst_arr[40].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[41].get_name()),inst_arr[41].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[42].get_name()),inst_arr[42].u1.v);
      $display("value of v in %s is %d", $sformatf("%s.u1.v",inst_arr[43].get_name()),inst_arr[43].u1.v);


   endfunction
   
endclass
   
endpackage : my_env_pkg
