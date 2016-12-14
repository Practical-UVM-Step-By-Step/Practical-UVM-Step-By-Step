/******************************************
 * WB Slave Interface
 ******************************************/
interface wb_slv_intf  (input bit clk, rst);
  logic                    cyc_i;	// cycle valid input
  logic   [7:0]	           adr_i;	// address bus inputs
  logic   [31:0]	       dat_i;	// input data bus
  logic	  [3:0]            sel_i;	// byte select inputs
  logic                    we_i;	// indicates write transfer
  logic                    stb_i;	// strobe input
  logic   [31:0]           dat_o;	// logic data bus
  logic                    ack_o;	// normal termination
  logic                    err_o;	// termination w/ error
  logic                    inta_o;	// Interrupt request logic
  
  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;

    inout      cyc_i;
    inout      adr_i;
    inout      dat_i;
    inout	   sel_i;
    inout      we_i;
    inout      stb_i;
    inout      dat_o;
    inout      ack_o;
    inout      err_o;
    inout      inta_o;
    
  endclocking

  modport MP (clocking cb);

endinterface: wb_slv_intf

/******************************************
 * WB Master Interface
 ******************************************/
interface wb_mstr_intf  (input bit clk, rst);
  logic   [31:0]  adr_o;
  logic    [3:0]  sel_o;
  logic           we_o;
  logic   [31:0]  dat_i;
  logic   [31:0]  dat_o;
  logic           cyc_o;
  logic           stb_o;
  logic           ack_i;
  logic           err_i;
  logic    [2:0]  cti_o;
  logic    [1:0]  bte_o; 
  
  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;

    inout  adr_o;
    inout  sel_o;
    inout  we_o;
    inout  dat_i;
    inout  dat_o;
    inout  cyc_o;
    inout  stb_o;
    inout  ack_i;
    inout  err_i;
    inout  cti_o;
    inout  bte_o; 
  endclocking

  modport MP (clocking cb);

endinterface: wb_mstr_intf


/******************************************
 * ETH  Interface
 ******************************************/
interface eth_intf  (input bit clk);
  logic           mtx_clk_pad_i; // Transmit clock (from PHY)
  logic    [3:0]  mtxd_pad_o;    // Transmit nibble (to PHY)
  logic           mtxen_pad_o;   // Transmit enable (to PHY)
  logic           mtxerr_pad_o;  // Transmit error (to PHY)
  logic           mrx_clk_pad_i; // Receive clock (from PHY)
  logic    [3:0]  mrxd_pad_i;    // Receive nibble (from PHY)
  logic           mrxdv_pad_i;   // Receive data valid (from PHY)
  logic           mrxerr_pad_i;  // Receive data error (from PHY)
  logic           mcoll_pad_i;   // Collision (from PHY)
  logic           mcrs_pad_i;    // Carrier sense (from PHY)
  logic           md_pad_i;      // MII data input (from I/O cell)
  logic           mdc_pad_o;     // MII Management data clock (to PHY)
  logic           md_pad_o;      // MII data output (to I/O cell)
  logic           md_padoe_o;    // MII data output enable (to I/O cell)
  logic           int_o;         // Interrupt output
  logic           mbist_si_i;    // bist scan serial in
  logic           mbist_so_o;    // bist scan serial out
  logic [2:0]     mbist_ctrl_i;  // bist chain shift control
  

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;

    inout mtx_clk_pad_i;
    inout mtxd_pad_o;
    inout mtxen_pad_o;
    inout mtxerr_pad_o;
    inout mrx_clk_pad_i;
    inout mrxd_pad_i;
    inout mrxdv_pad_i;
    inout mrxerr_pad_i;
    inout mcoll_pad_i;
    inout mcrs_pad_i;
    inout md_pad_i;
    inout mdc_pad_o;
    inout md_pad_o;
    inout md_padoe_o;
    inout int_o;
    inout mbist_si_i;
    inout mbist_so_o;
    inout mbist_ctrl_i;

  endclocking

  modport MP (clocking cb);

endinterface: eth_intf


