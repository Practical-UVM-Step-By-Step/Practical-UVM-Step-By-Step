
/******************************************
 * WB MASTER 0 Interface
 ******************************************/
interface wb_m0_intf  (input bit clk, rst);
   // Master 0 Interface
   logic  [`dw-1:0]   m0_dat_i;
   logic  [`dw-1:0]   m0_dat_o;
   logic  [`aw-1:0]   m0_adr_i;
   logic  [`sw-1:0]   m0_sel_i;
   logic              m0_we_i;
   logic              m0_cyc_i;
   logic              m0_stb_i;
   logic              m0_cab_i;
   logic              m0_ack_o;
   logic              m0_err_o;
   logic              m0_rty_o;


  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout    m0_dat_i;
     inout    m0_dat_o;
     inout    m0_adr_i;
     inout    m0_sel_i;
     inout    m0_we_i;
     inout    m0_cyc_i;
     inout    m0_stb_i;
     inout    m0_cab_i;
     inout    m0_ack_o;
     inout    m0_err_o;
     inout    m0_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m0_intf


/******************************************
 * WB MASTER 1 Interface
 ******************************************/
interface wb_m1_intf  (input bit clk, rst);
   // Master 1 Interface
   logic [`dw-1:0] 	m1_dat_i;
   logic [`dw-1:0] 	m1_dat_o;
   logic [`aw-1:0] 	m1_adr_i;
   logic [`sw-1:0] 	m1_sel_i;
   logic 		m1_we_i;
   logic 		m1_cyc_i;
   logic 		m1_stb_i;
   logic 		m1_cab_i;
   logic  		m1_ack_o;
   logic  		m1_err_o;
   logic  		m1_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout  	m1_dat_i;
      inout  	m1_dat_o;
      inout  	m1_adr_i;
      inout  	m1_sel_i;
      inout     m1_we_i;
      inout     m1_cyc_i;
      inout     m1_stb_i;
      inout     m1_cab_i;
      inout     m1_ack_o;
      inout     m1_err_o;
      inout     m1_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m1_intf

/******************************************
 * WB MASTER 2 Interface
 ******************************************/
interface wb_m2_intf  (input bit clk, rst);
   // Master 2 Interface
   logic [`dw-1:0] 	m2_dat_i;
   logic [`dw-1:0] 	m2_dat_o;
   logic [`aw-1:0] 	m2_adr_i;
   logic [`sw-1:0] 	m2_sel_i;
   logic    		m2_we_i;
   logic    		m2_cyc_i;
   logic    		m2_stb_i;
   logic    		m2_cab_i;
   logic     		m2_ack_o;
   logic     		m2_err_o;
   logic     		m2_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout    m2_dat_i;
     inout    m2_dat_o;
     inout    m2_adr_i;
     inout    m2_sel_i;
     inout    m2_we_i;
     inout    m2_cyc_i;
     inout    m2_stb_i;
     inout    m2_cab_i;
     inout    m2_ack_o;
     inout    m2_err_o;
     inout    m2_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m2_intf

/******************************************
 * WB MASTER 3 Interface
 ******************************************/
interface wb_m3_intf  (input bit clk, rst);

   // Master 3 Interface
   logic  [`dw-1:0] 	m3_dat_i;
   logic  [`dw-1:0] 	m3_dat_o;
   logic  [`aw-1:0] 	m3_adr_i;
   logic  [`sw-1:0] 	m3_sel_i;
   logic        		m3_we_i;
   logic        		m3_cyc_i;
   logic        		m3_stb_i;
   logic        		m3_cab_i;
   logic         		m3_ack_o;
   logic         		m3_err_o;
   logic         		m3_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout	m3_dat_i;
       inout	m3_dat_o;
       inout	m3_adr_i;
       inout	m3_sel_i;
       inout	m3_we_i;
       inout	m3_cyc_i;
       inout	m3_stb_i;
       inout	m3_cab_i;
       inout	m3_ack_o;
       inout	m3_err_o;
       inout	m3_rty_o;


  endclocking

  modport MP (clocking cb);

endinterface: wb_m3_intf

/******************************************
 * WB MASTER 4 Interface
 ******************************************/
interface wb_m4_intf  (input bit clk, rst);
   // Master 4 Interface
   logic  [`dw-1:0] 	m4_dat_i;
   logic  [`dw-1:0] 	m4_dat_o;
   logic  [`aw-1:0] 	m4_adr_i;
   logic  [`sw-1:0] 	m4_sel_i;
   logic        		m4_we_i;
   logic        		m4_cyc_i;
   logic        		m4_stb_i;
   logic        		m4_cab_i;
   logic         		m4_ack_o;
   logic         		m4_err_o;
   logic         		m4_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout  	m4_dat_i;
     inout  	m4_dat_o;
     inout  	m4_adr_i;
     inout  	m4_sel_i;
     inout  	m4_we_i;
     inout  	m4_cyc_i;
     inout  	m4_stb_i;
     inout  	m4_cab_i;
     inout  	m4_ack_o;
     inout  	m4_err_o;
     inout  	m4_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m4_intf

/******************************************
 * WB MASTER 5 Interface
 ******************************************/
interface wb_m5_intf  (input bit clk, rst);
   // Master 5 Interface
   logic  [`dw-1:0] 	m5_dat_i;
   logic  [`dw-1:0] 	m5_dat_o;
   logic  [`aw-1:0] 	m5_adr_i;
   logic  [`sw-1:0] 	m5_sel_i;
   logic        		m5_we_i;
   logic        		m5_cyc_i;
   logic        		m5_stb_i;
   logic        		m5_cab_i;
   logic         		m5_ack_o;
   logic         		m5_err_o;
   logic         		m5_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout 	m5_dat_i;
       inout 	m5_dat_o;
       inout 	m5_adr_i;
       inout 	m5_sel_i;
       inout 	m5_we_i;
       inout 	m5_cyc_i;
       inout 	m5_stb_i;
       inout 	m5_cab_i;
       inout 	m5_ack_o;
       inout 	m5_err_o;
       inout 	m5_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m5_intf

/******************************************
 * WB MASTER 6 Interface
 ******************************************/
interface wb_m6_intf  (input bit clk, rst);
   // Master 6 Interface
   logic  [`dw-1:0] 	m6_dat_i;
   logic  [`dw-1:0] 	m6_dat_o;
   logic  [`aw-1:0] 	m6_adr_i;
   logic  [`sw-1:0] 	m6_sel_i;
   logic        		m6_we_i;
   logic        		m6_cyc_i;
   logic        		m6_stb_i;
   logic        		m6_cab_i;
   logic         		m6_ack_o;
   logic         		m6_err_o;
   logic         		m6_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout 	m6_dat_i;
      inout 	m6_dat_o;
      inout 	m6_adr_i;
      inout 	m6_sel_i;
      inout 	m6_we_i;
      inout 	m6_cyc_i;
      inout 	m6_stb_i;
      inout 	m6_cab_i;
      inout 	m6_ack_o;
      inout 	m6_err_o;
      inout 	m6_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m6_intf

/******************************************
 * WB MASTER 7 Interface
 ******************************************/
interface wb_m7_intf  (input bit clk, rst);
   // Master 7 Interface
   logic  [`dw-1:0] 	m7_dat_i;
   logic  [`dw-1:0] 	m7_dat_o;
   logic  [`aw-1:0] 	m7_adr_i;
   logic  [`sw-1:0] 	m7_sel_i;
   logic        		m7_we_i;
   logic        		m7_cyc_i;
   logic        		m7_stb_i;
   logic        		m7_cab_i;
   logic         		m7_ack_o;
   logic         		m7_err_o;
   logic         		m7_rty_o;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout 	m7_dat_i;
       inout 	m7_dat_o;
       inout 	m7_adr_i;
       inout 	m7_sel_i;
       inout 	m7_we_i;
       inout 	m7_cyc_i;
       inout 	m7_stb_i;
       inout 	m7_cab_i;
       inout 	m7_ack_o;
       inout 	m7_err_o;
       inout 	m7_rty_o;

  endclocking

  modport MP (clocking cb);

endinterface: wb_m7_intf


/******************************************
 * WB SLAVE 0 Interface
 ******************************************/
interface wb_s0_intf  (input bit clk, rst);
   // Slave 0 Interface
   logic  [`dw-1:0] 	s0_dat_i;
   logic  [`dw-1:0] 	s0_dat_o;
   logic  [`aw-1:0] 	s0_adr_o;
   logic  [`sw-1:0] 	s0_sel_o;
   logic         		s0_we_o;
   logic         		s0_cyc_o;
   logic         		s0_stb_o;
   logic         		s0_cab_o;
   logic        		s0_ack_i;
   logic        		s0_err_i;
   logic        		s0_rty_i;


  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout 	s0_dat_i;
      inout 	s0_dat_o;
      inout 	s0_adr_o;
      inout 	s0_sel_o;
      inout 	s0_we_o;
      inout 	s0_cyc_o;
      inout 	s0_stb_o;
      inout 	s0_cab_o;
      inout 	s0_ack_i;
      inout 	s0_err_i;
      inout 	s0_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s0_intf


/******************************************
 * WB SLAVE 1 Interface
 ******************************************/
interface wb_s1_intf  (input bit clk, rst);
   // Slave 1 Interface
   logic  [`dw-1:0] 	s1_dat_i;
   logic  [`dw-1:0] 	s1_dat_o;
   logic  [`aw-1:0] 	s1_adr_o;
   logic  [`sw-1:0] 	s1_sel_o;
   logic         		s1_we_o;
   logic         		s1_cyc_o;
   logic         		s1_stb_o;
   logic         		s1_cab_o;
   logic        		s1_ack_i;
   logic        		s1_err_i;
   logic        		s1_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout 	s1_dat_i;
      inout 	s1_dat_o;
      inout 	s1_adr_o;
      inout 	s1_sel_o;
      inout 	s1_we_o;
      inout 	s1_cyc_o;
      inout 	s1_stb_o;
      inout 	s1_cab_o;
      inout 	s1_ack_i;
      inout 	s1_err_i;
      inout 	s1_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s1_intf

/******************************************
 * WB SLAVE 2 Interface
 ******************************************/
interface wb_s2_intf  (input bit clk, rst);
   // Slave 2 Interface
   logic  [`dw-1:0] 	s2_dat_i;
   logic  [`dw-1:0] 	s2_dat_o;
   logic  [`aw-1:0] 	s2_adr_o;
   logic  [`sw-1:0] 	s2_sel_o;
   logic         		s2_we_o;
   logic         		s2_cyc_o;
   logic         		s2_stb_o;
   logic         		s2_cab_o;
   logic        		s2_ack_i;
   logic        		s2_err_i;
   logic        		s2_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout 	s2_dat_i;
      inout 	s2_dat_o;
      inout 	s2_adr_o;
      inout 	s2_sel_o;
      inout 	s2_we_o;
      inout 	s2_cyc_o;
      inout 	s2_stb_o;
      inout 	s2_cab_o;
      inout 	s2_ack_i;
      inout 	s2_err_i;
      inout 	s2_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s2_intf

/******************************************
 * WB SLAVE 3 Interface
 ******************************************/
interface wb_s3_intf  (input bit clk, rst);
   // Slave 3 Interface
   logic [`dw-1:0] 	s3_dat_i;
   logic [`dw-1:0] 	s3_dat_o;
   logic [`aw-1:0] 	s3_adr_o;
   logic [`sw-1:0] 	s3_sel_o;
   logic     		s3_we_o;
   logic     		s3_cyc_o;
   logic     		s3_stb_o;
   logic     		s3_cab_o;
   logic    		s3_ack_i;
   logic    		s3_err_i;
   logic    		s3_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout      s3_dat_i;
       inout      s3_dat_o;
       inout      s3_adr_o;
       inout      s3_sel_o;
       inout      s3_we_o;
       inout      s3_cyc_o;
       inout      s3_stb_o;
       inout      s3_cab_o;
       inout      s3_ack_i;
       inout      s3_err_i;
       inout      s3_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s3_intf

/******************************************
 * WB SLAVE 4 Interface
 ******************************************/
interface wb_s4_intf  (input bit clk, rst);
   // Slave 4 Interface
   logic  [`dw-1:0] 	s4_dat_i;
   logic  [`dw-1:0] 	s4_dat_o;
   logic  [`aw-1:0] 	s4_adr_o;
   logic  [`sw-1:0] 	s4_sel_o;
   logic         		s4_we_o;
   logic         		s4_cyc_o;
   logic         		s4_stb_o;
   logic         		s4_cab_o;
   logic        		s4_ack_i;
   logic        		s4_err_i;
   logic        		s4_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout  	s4_dat_i;
      inout  	s4_dat_o;
      inout  	s4_adr_o;
      inout  	s4_sel_o;
      inout  	s4_we_o;
      inout  	s4_cyc_o;
      inout  	s4_stb_o;
      inout  	s4_cab_o;
      inout  	s4_ack_i;
      inout  	s4_err_i;
      inout  	s4_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s4_intf

/******************************************
 * WB SLAVE 5 Interface
 ******************************************/
interface wb_s5_intf  (input bit clk, rst);
   // Slave 5 Interface
   logic [`dw-1:0] 	s5_dat_i;
   logic [`dw-1:0] 	s5_dat_o;
   logic [`aw-1:0] 	s5_adr_o;
   logic [`sw-1:0] 	s5_sel_o;
   logic      		s5_we_o;
   logic      		s5_cyc_o;
   logic      		s5_stb_o;
   logic      		s5_cab_o;
   logic     		s5_ack_i;
   logic     		s5_err_i;
   logic     		s5_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout    s5_dat_i;
       inout    s5_dat_o;
       inout    s5_adr_o;
       inout    s5_sel_o;
       inout    s5_we_o;
       inout    s5_cyc_o;
       inout    s5_stb_o;
       inout    s5_cab_o;
       inout    s5_ack_i;
       inout    s5_err_i;
       inout    s5_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s5_intf

/******************************************
 * WB SLAVE 6 Interface
 ******************************************/
interface wb_s6_intf  (input bit clk, rst);
   // Slave 6 Interface
   logic [`dw-1:0] 	s6_dat_i;
   logic [`dw-1:0] 	s6_dat_o;
   logic [`aw-1:0] 	s6_adr_o;
   logic [`sw-1:0] 	s6_sel_o;
   logic       		s6_we_o;
   logic       		s6_cyc_o;
   logic       		s6_stb_o;
   logic       		s6_cab_o;
   logic      		s6_ack_i;
   logic      		s6_err_i;
   logic      		s6_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout    s6_dat_i;
       inout    s6_dat_o;
       inout    s6_adr_o;
       inout    s6_sel_o;
       inout    s6_we_o;
       inout    s6_cyc_o;
       inout    s6_stb_o;
       inout    s6_cab_o;
       inout    s6_ack_i;
       inout    s6_err_i;
       inout    s6_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s6_intf

/******************************************
 * WB SLAVE 7 Interface
 ******************************************/
interface wb_s7_intf  (input bit clk, rst);
   // Slave 7 Interface
   logic  [`dw-1:0] 	s7_dat_i;
   logic  [`dw-1:0] 	s7_dat_o;
   logic  [`aw-1:0] 	s7_adr_o;
   logic  [`sw-1:0] 	s7_sel_o;
   logic          		s7_we_o;
   logic          		s7_cyc_o;
   logic          		s7_stb_o;
   logic          		s7_cab_o;
   logic         		s7_ack_i;
   logic         		s7_err_i;
   logic         		s7_rty_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout  	s7_dat_i;
      inout  	s7_dat_o;
      inout  	s7_adr_o;
      inout  	s7_sel_o;
      inout  	s7_we_o;
      inout  	s7_cyc_o;
      inout  	s7_stb_o;
      inout  	s7_cab_o;
      inout  	s7_ack_i;
      inout  	s7_err_i;
      inout  	s7_rty_i;

  endclocking

  modport MP (clocking cb);

endinterface: wb_s7_intf

