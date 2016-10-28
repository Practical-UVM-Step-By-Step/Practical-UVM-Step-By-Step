class my_env extends uvm_env;
   A inst_arr[30];
   B instB;
   D instD;
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      //    uvm_config_db #(int)::set(this,"inst1.u2", "v", 5);
      //     uvm_config_db #(int)::set(this,"inst1.u2", "v", 7);
      uvm_config_db #(int)::set(this,"instB.u1", "v", 3);
      uvm_config_db #(int)::set(this,"instB.*", "s", 'h20);

      uvm_config_db #(int)::set(this,"instD.u?", "s", 'h40);
      uvm_config_db #(int)::set(this,"instD.u*", "s", 'h80);

      
      instB = new("instB", this);
      instD = new("instD",this);

      for(int i = 0; i < 5; i++) begin
	 inst_arr[i] = new($sformatf("inst%02d",i),this);
      end
      for(int i = 5; i < 10; i++) begin
	 inst_arr[i] = new($sformatf("tom%02d",i),this);
      end
      for(int i = 10; i < 15; i++) begin
	 inst_arr[i] = new($sformatf("tomm%02d",i),this);
      end
      for(int i = 15; i <18 ; i++) begin
	 inst_arr[i] = new($sformatf("tommm%02d",i),this);
      end
      for(int i = 18; i <20 ; i++) begin
	 inst_arr[i] = new($sformatf("tommmm%02d",i),this);
      end

      for(int i = 20; i <22 ; i++) begin
	 inst_arr[i] = new($sformatf("TOMM%02d",i),this);
      end
      for(int i = 22; i <25 ; i++) begin
	 inst_arr[i] = new($sformatf("TOMMM%02d",i),this);
      end

      for(int i = 25; i <28 ; i++) begin
	 inst_arr[i] = new($sformatf("tmmm%02d",i),this);
      end
      for(int i = 28; i <30 ; i++) begin
	 inst_arr[i] = new($sformatf("tmmm%02d",i),this);
      end

   endfunction

   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      // print_config("v",this,0);
      #10;
      phase.drop_objection(this);
   endtask

   `uvm_component_utils(my_env)


   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);
      
      $display("value of V in %s is %d", $sformatf("B.u1.v"),instB.u1.v);
      $display("value of V in %s is %d", $sformatf("D.u1.v"),instD.u1.v);

      $display("value of S in %s is %d", $sformatf("B.u1.s"),instB.u1.s);
      $display("value of S in %s is %d", $sformatf("D.u1.s"),instD.u1.s);

      for(int i = 0; i <25 ; i++) begin
	 $display("value of V in %s is %d", $sformatf("%s: inst_arr[%02d].u1.v",inst_arr[i].get_name(),i),inst_arr[i].u1.v);
      end


      for(int i = 0; i <25 ; i++) begin
	 $display("value of S in %s is %d", $sformatf("%s: inst_arr[%02d].u1.s",inst_arr[i].get_name(),i),inst_arr[i].u1.s);
      end


   endfunction
   






endclass

