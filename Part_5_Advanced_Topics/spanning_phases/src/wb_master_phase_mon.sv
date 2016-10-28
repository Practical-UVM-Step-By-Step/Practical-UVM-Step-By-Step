`ifndef WB_MASTER_MON_PHASE_MON_SV
`define WB_MASTER_MON_PHASE_MON_SV


typedef class wb_transaction;
typedef class wb_master_phase_mon;
typedef class wb_config;


   

class wb_master_phase_mon extends uvm_monitor;

   uvm_analysis_port #(wb_transaction) mon_analysis_port;  //TLM analysis port
   typedef virtual wb_master_if v_if;
   v_if mon_if;

   wb_config mstr_mon_cfg;
   process m_span_phases_process;

   local uvm_phase m_pre_reset;
   local uvm_phase m_post_run;
   uvm_domain m_domain ;

   extern function new(string name = "wb_master_phase_mon",uvm_component parent);
   `uvm_component_utils_begin(wb_master_phase_mon)
   `uvm_component_utils_end

   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern protected virtual task multiple_phase_task(uvm_phase phase);
   extern function void phase_started(uvm_phase phase);
   extern function void phase_ended(uvm_phase phase);


endclass: wb_master_phase_mon

function void wb_master_phase_mon::phase_started(uvm_phase phase);
     if (phase == m_pre_reset) begin
       fork
         begin
           m_span_phases_process = process::self();
           multiple_phase_task(phase);
         end
       join_none
     end
endfunction

 

function void wb_master_phase_mon::phase_ended(uvm_phase phase);

     if (phase == m_post_run) begin
	$display("I am killing this process in this %s phase", phase.get_name());
        m_span_phases_process.kill();
     end
    
endfunction


function wb_master_phase_mon::new(string name = "wb_master_phase_mon",uvm_component parent);
   super.new(name, parent);
   mon_analysis_port = new ("mon_analysis_port",this);
   m_domain  = uvm_domain::get_uvm_domain();
       m_pre_reset= m_domain.find(uvm_pre_reset_phase::get());
      m_post_run = m_domain.find(uvm_post_main_phase::get());
endfunction: new


function void wb_master_phase_mon::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
  $display("getting the monitor if");
   uvm_config_db#(v_if)::get(this, "", "mon_if", mon_if);

endfunction: connect_phase

function void wb_master_phase_mon::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase); 
   if (mon_if == null)
       `uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");
endfunction: end_of_elaboration_phase




task wb_master_phase_mon::multiple_phase_task(uvm_phase phase);
int repeat_count = this.mstr_mon_cfg.max_n_wss + 1;
int timeout_count = 0;

integer master_transaction_timeout;

     `uvm_info(get_full_name(),"This should occur before reset goes high", UVM_LOW);
     wait(this.mon_if.rst);
     `uvm_info(get_full_name(),"Reset asserted!!!!", UVM_LOW);
    wait(!this.mon_if.rst);
     `uvm_info(get_full_name(),"Reset deasserted!!", UVM_LOW);

  // This should be running in the RUN phase.
 $display("cfg addr min %d max = %d",this.mstr_mon_cfg.min_addr,this.mstr_mon_cfg.max_addr); 



 forever begin
	wb_transaction tr;

	    do begin

         @(this.mon_if.CYC_O or
           this.mon_if.STB_O or
           this.mon_if.ADR_O or
           this.mon_if.SEL_O or
           this.mon_if.WE_O  or
           this.mon_if.TGA_O or
           this.mon_if.TGC_O);
      end while (this.mon_if.CYC_O !== 1'b1 ||
                 this.mon_if.STB_O !== 1'b1);
	tr= wb_transaction::type_id::create("tr", this);
	tr.address = this.mon_if.ADR_O;
	// Are we supposed to respond to this cycle?
	if(this.mstr_mon_cfg.min_addr <= tr.address  && tr.address <=this.mstr_mon_cfg.max_addr )
	$display("WHoo hoo");

	begin
		timeout_count = 0;

	  	tr.tga = this.mon_if.TGA_O;
      		tr.tgc  =this.mon_if.TGC_O;
      		tr.sel = this.mon_if.SEL_O;
		tr.lock = this.mon_if.LOCK_O;

		if(this.mon_if.WE_O) begin
			tr.kind = wb_transaction::WRITE;
			tr.data  = this.mon_if.DAT_I;
	        	tr.tgd  = this.mon_if.TGD_O;
			tr.status = wb_transaction::ACK;
     			`uvm_info(get_full_name(), $sformatf("WRITE Transaction observed in Phase !!"), UVM_LOW);
			$display("phase 2:%s",phase.get_name());
                end
		else begin
		 	tr.kind = wb_transaction::READ ;

			tr.status = wb_transaction::ACK;
     			`uvm_info(get_full_name(), $sformatf("READ Transaction observed in Phase !!"), UVM_LOW);
      		end


		// Edge 1
		   tr.status = wb_transaction::TIMEOUT ;
		  while(!this.mon_if.ACK_I) begin
		      @(this.mon_if.monitor_cb);
		     timeout_count = timeout_count + 1;
		      // Wait states
		      case (1'b1)
		        this.mon_if.ERR_I: tr.status = wb_transaction::ERR ;
		        this.mon_if.RTY_I: tr.status = wb_transaction::RTY ;
		        this.mon_if.ACK_I: tr.status = wb_transaction::ACK ;
		        default: continue;
		      endcase
		   end
			tr.data  = this.mon_if.DAT_O;
	        	tr.tgd  = this.mon_if.TGD_I;
		   if ((timeout_count >  repeat_count )|| tr.status == wb_transaction::TIMEOUT ) begin
		      `uvm_info("wb_master_phase_monitor ", "Completed waiting for ACK_I, RTY_I or ERR_I",UVM_HIGH);
		   end
   end
  end // forever
endtask: multiple_phase_task




`endif // WB_MASTER_MON_PHASE_MON_SV

