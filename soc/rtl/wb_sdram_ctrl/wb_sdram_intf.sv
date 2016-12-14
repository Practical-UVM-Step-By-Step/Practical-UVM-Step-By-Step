/******************************************
 * WB Master Interface
 ******************************************/
interface wb_mstr_intf  (input bit clk, rst);
   // wishbone i/f
    logic         [31:0]  wb_dat_i;
    logic         [31:0]  wb_dat_o;
    logic         [3:0]   wb_sel_i;
    logic [`WB_ADR_HI:2]  wb_adr_i;
    logic        	      wb_we_i;
    logic         [2:0]   wb_cti_i;
    logic        	      wb_stb_i;
    logic        	      wb_cyc_i;
    logic         	      wb_ack_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout   wb_dat_i;
      inout   wb_dat_o;
      inout   wb_sel_i;
      inout   wb_adr_i;
      inout   wb_we_i;
      inout   wb_cti_i;
      inout   wb_stb_i;
      inout   wb_cyc_i;
      inout   wb_ack_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_mstr_intf

/******************************************
 * SDRAM Interface
 ******************************************/
interface sdram_intf  (input bit clk, rst);
    logic 	                         sdr_cke_o;   
    logic    	                     sdr_cs_n_o;  
    logic    	                     sdr_ras_n_o; 
    logic    	                     sdr_cas_n_o; 
    logic    	                     sdr_we_n_o;  
    logic                    [12:0]  sdr_a_o;
    logic                     [1:0]  sdr_ba_o;
    logic   [`SDRAM_DATA_WIDTH-1:0]  sdr_dq_io;
    logic  [`SDRAM_DATA_WIDTH/8-1:0] sdr_dqm_o;
    logic                            sdram_clk;
    logic                            wb_clk;
    logic                            wb_rst;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout    sdr_cke_o;   
      inout    sdr_cs_n_o;  
      inout    sdr_ras_n_o; 
      inout    sdr_cas_n_o; 
      inout    sdr_we_n_o;  
      inout    sdr_a_o;
      inout    sdr_ba_o;
      inout    sdr_dq_io;
      inout    sdr_dqm_o;
      inout    sdram_clk;

  endclocking

  modport MP (clocking cb);

endinterface: sdram_intf
