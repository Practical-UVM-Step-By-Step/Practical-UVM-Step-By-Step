/******************************************
 * USB PHY Interface
 ******************************************/
interface usb_phy_intf  (input bit clk, rst);

  logic  tx_dp;
  logic  tx_dn;
  logic  tx_oe;
  logic  rx_d;
  logic  rx_dp;
  logic  rx_dn;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout   tx_dp;
     inout   tx_dn;
     inout   tx_oe;
     inout   rx_d;
     inout   rx_dp;
     inout   rx_dn;

  endclocking

  modport MP (clocking cb);

endinterface: usb_phy_intf


/******************************************
 * USB Misc Interface
 ******************************************/
interface usb_misc_intf  (input bit clk, rst);

    logic    phy_tx_mode;
    logic    usb_rst; 

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout    phy_tx_mode;
    inout    usb_rst; 

  endclocking

  modport MP (clocking cb);

endinterface: usb_misc_intf


/******************************************
 * USB Interrupts Interface
 ******************************************/
interface usb_intr_intf  (input bit clk, rst);

   logic    dropped_frame;
   logic    misaligned_frame;
   logic    crc16_err;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout     dropped_frame;
     inout     misaligned_frame;
     inout     crc16_err;

  endclocking

  modport MP (clocking cb);

endinterface: usb_intr_intf

/******************************************
 * USB vendor Interface
 ******************************************/
interface usb_vend_intf  (input bit clk, rst);
   logic 	    v_set_int;
   logic 	    v_set_feature;
   logic [15:0]	wValue;
   logic [15:0]	wIndex;
   logic [15:0]	vendor_data;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
     inout   v_set_int;
     inout   v_set_feature;
     inout   wValue;
     inout   wIndex;
     inout   vendor_data;

  endclocking

  modport MP (clocking cb);

endinterface: usb_vend_intf


/******************************************
 * USB Status Interface
 ******************************************/
interface usb_sta_intf  (input bit clk, rst);

  logic         usb_busy;
  logic  [3:0]	ep_sel;


  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
      inout   usb_busy;
      inout   ep_sel;

  endclocking

  modport MP (clocking cb);

endinterface: usb_sta_intf


/******************************************
 * USB Endpoint Interface
 ******************************************/
interface usb_ep1_intf  (input bit clk, rst);

   logic  [13:0]	ep1_cfg;
   logic   [7:0]	ep1_din;
   logic   [7:0]    ep1_dout;
   logic        	ep1_we;
   logic            ep1_re;
   logic  	        ep1_empty;
   logic            ep1_full;
   logic  	        ep1_bf_en;
   logic  [6:0]	    ep1_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep1_cfg;
    inout     ep1_din;
    inout     ep1_dout;
    inout 	  ep1_we;
    inout     ep1_re;
    inout     ep1_empty;
    inout     ep1_full;
    inout     ep1_bf_en;
    inout     ep1_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep1_intf

interface usb_ep2_intf  (input bit clk, rst);

   logic  [13:0]	ep2_cfg;
   logic   [7:0]	ep2_din;
   logic   [7:0]    ep2_dout;
   logic        	ep2_we;
   logic            ep2_re;
   logic  	        ep2_empty;
   logic            ep2_full;
   logic  	        ep2_bf_en;
   logic  [6:0]	    ep2_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep2_cfg;
    inout     ep2_din;
    inout     ep2_dout;
    inout 	  ep2_we;
    inout     ep2_re;
    inout     ep2_empty;
    inout     ep2_full;
    inout     ep2_bf_en;
    inout     ep2_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep2_intf

interface usb_ep3_intf  (input bit clk, rst);

   logic  [13:0]	ep3_cfg;
   logic   [7:0]	ep3_din;
   logic   [7:0]    ep3_dout;
   logic        	ep3_we;
   logic            ep3_re;
   logic  	        ep3_empty;
   logic            ep3_full;
   logic  	        ep3_bf_en;
   logic  [6:0]	    ep3_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep3_cfg;
    inout     ep3_din;
    inout     ep3_dout;
    inout 	  ep3_we;
    inout     ep3_re;
    inout     ep3_empty;
    inout     ep3_full;
    inout     ep3_bf_en;
    inout     ep3_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep3_intf

interface usb_ep4_intf  (input bit clk, rst);

   logic  [13:0]	ep4_cfg;
   logic   [7:0]	ep4_din;
   logic   [7:0]    ep4_dout;
   logic        	ep4_we;
   logic            ep4_re;
   logic  	        ep4_empty;
   logic            ep4_full;
   logic  	        ep4_bf_en;
   logic  [6:0]	    ep4_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep4_cfg;
    inout     ep4_din;
    inout     ep4_dout;
    inout 	  ep4_we;
    inout     ep4_re;
    inout     ep4_empty;
    inout     ep4_full;
    inout     ep4_bf_en;
    inout     ep4_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep4_intf

interface usb_ep5_intf  (input bit clk, rst);

   logic  [13:0]	ep5_cfg;
   logic   [7:0]	ep5_din;
   logic   [7:0]    ep5_dout;
   logic        	ep5_we;
   logic            ep5_re;
   logic  	        ep5_empty;
   logic            ep5_full;
   logic  	        ep5_bf_en;
   logic  [6:0]	    ep5_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep5_cfg;
    inout     ep5_din;
    inout     ep5_dout;
    inout 	  ep5_we;
    inout     ep5_re;
    inout     ep5_empty;
    inout     ep5_full;
    inout     ep5_bf_en;
    inout     ep5_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep5_intf

interface usb_ep6_intf  (input bit clk, rst);

   logic  [13:0]	ep6_cfg;
   logic   [7:0]	ep6_din;
   logic   [7:0]    ep6_dout;
   logic        	ep6_we;
   logic            ep6_re;
   logic  	        ep6_empty;
   logic            ep6_full;
   logic  	        ep6_bf_en;
   logic  [6:0]	    ep6_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep6_cfg;
    inout     ep6_din;
    inout     ep6_dout;
    inout 	  ep6_we;
    inout     ep6_re;
    inout     ep6_empty;
    inout     ep6_full;
    inout     ep6_bf_en;
    inout     ep6_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep6_intf

interface usb_ep7_intf  (input bit clk, rst);

   logic  [13:0]	ep7_cfg;
   logic   [7:0]	ep7_din;
   logic   [7:0]    ep7_dout;
   logic        	ep7_we;
   logic            ep7_re;
   logic  	        ep7_empty;
   logic            ep7_full;
   logic  	        ep7_bf_en;
   logic  [6:0]	    ep7_bf_size;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    inout     ep7_cfg;
    inout     ep7_din;
    inout     ep7_dout;
    inout 	  ep7_we;
    inout     ep7_re;
    inout     ep7_empty;
    inout     ep7_full;
    inout     ep7_bf_en;
    inout     ep7_bf_size;

  endclocking

  modport MP (clocking cb);

endinterface: usb_ep7_intf
