// USB stimulus

// Adam Edvardsson, adam.edvardsson@orsoc.se
// Julius Baxter, julius.baxter@orsoc.se
// Adapted from testbench for usbhostslave project on Opencores by 
// Steve Fielding: http://opencores.org/project,usbhostslave

// To enable USB host tests, enable core USB0 or USB1 in host-only mode.

// To enable USB slave tests, enable USB1 in slave only mode

wire usbClk;

// We'll hook up the host to these wires
wire [1:0] usbhostwiredataout;
wire [1:0] usbhostwiredatain;
wire usbhostwirectrlout;
wire usbhostfullspeed;

// We'll hook up the host to these wires
wire [1:0] usbslavewiredataout;
wire [1:0] usbslavewiredatain;
wire usbslavewirectrlout;
wire usbslavefullspeed;

// Depending on which USB core is enabled, and if it's got slave compatibility, 
// we assign the host wires
`ifdef USB0
// USB0 can either be host, or hostslave, either way it's got host capability
// if it's defined
assign usbhostwiredataout = usb0dat_pad_o;
assign usbhostwirectrlout = usb0ctrl_pad_o;
assign usbhostfullspeed = usb0fullspeed_pad_o;
assign usb0dat_pad_i = usbhostwiredatain;

 `define USB_HOST_TESTS_ENABLE

`endif //  `ifdef USB0


// check if USB1 should be used as a HOST if USB0 isn't enable
`ifndef USB_HOST_TESTS_ENABLE
 `ifdef USB1
  `ifndef USB1_ONLY_SLAVE
// ... and that it's in slave-only configuration
// then we can use USB1 host instead
assign usbhostwiredataout = usb1dat_pad_o;
assign usbhostwirectrlout = usb1ctrl_pad_o;
assign usbhostfullspeed = usb1fullspeed_pad_o;
assign usb1dat_pad_i = usbhostwiredatain;

   `define USB_HOST_TESTS_ENABLE

  `endif //  `ifndef USB1_ONLY_SLAVE
 `endif //  `ifdef USB1
`endif //  `ifndef USB_HOST_TESTS_ENABLE

`ifdef USB1
 `ifdef USB1_ONLY_SLAVE

// USB1 is slave only, so we can do the slave tests
assign usbslavewiredataout = usb1dat_pad_o;
assign usbslavewirectrlout = usb1ctrl_pad_o;
assign usbslavefullspeed = usb1fullspeed_pad_o;
assign usb1dat_pad_i = usbslavewiredatain;

  `define USB_SLAVE_TESTS_ENABLE

 `endif //  `ifdef USB1_ONLY_SLAVE
`endif //  `ifdef USB1


`define SIM_SLAVE_BASE_ADDR 9'h100
`define CLK_48MHZ_HALF_PERIOD 10.4167



wire DPlusPullup;
wire DPlusPullDown;
wire DMinusPullup;
wire DMinusPullDown;

pullup(DPlusPullup);
pulldown(DPlusPullDown);
pullup(DMinusPullup);
pulldown(DMinusPullDown);

// USB clock generation
reg 				     usb_clk_generated = 0;
always
  begin
     #(`CLK_48MHZ_HALF_PERIOD) usb_clk_generated <=  !rst_n ? 0 : ~usb_clk_generated;
  end
   
   assign usbClk = usb_clk_generated;
   
   

   // Did we detect a USB host in the design?
`ifdef USB_HOST_TESTS_ENABLE

   wire [8:0] 			     usbslave_wbmaster_adr;
   wire [7:0] 			     usbslave_wbmaster_din;
   wire [7:0] 			     usbslave_wbmaster_dout;
   wire 			     usbslave_wbmaster_stb;
   wire 			     usbslave_wbmaster_we;
   wire 			     usbslave_wbmaster_ack;


   wire 			     usbhostwirectrlout_oe;
   wire [1:0] 			     usbtbslaveWireDataIn;
   wire [1:0] 			     usbtbslaveWireDataOut;
   wire 			     usbtbslaveDPlusPullup;
   wire 			     usbtbslaveDMinusPullup;
   wire 			     usbtbslaveWireCtrlOut;

   reg 				     USBSlaveWireVP;
   reg 				     USBSlaveWireVM;


   assign usbhostwirectrlout_oe = ~usbhostwirectrlout;

   assign usbhostwiredatain = {USBSlaveWireVP, USBSlaveWireVM};
   assign usbtbslaveWireDataIn = {USBSlaveWireVP, USBSlaveWireVM};

   always @(*) begin
      if (usbhostwirectrlout_oe == 1'b1 && usbtbslaveWireCtrlOut == 1'b0)
	{USBSlaveWireVP, USBSlaveWireVM} <= usbhostwiredataout;
      else if (usbhostwirectrlout_oe == 1'b0 && usbtbslaveWireCtrlOut == 1'b1)
	{USBSlaveWireVP, USBSlaveWireVM} <= usbtbslaveWireDataOut;
      else if (usbhostwirectrlout_oe == 1'b1 && usbtbslaveWireCtrlOut == 1'b1)
	{USBSlaveWireVP, USBSlaveWireVM} <= 2'bxx;
      else if (usbhostwirectrlout_oe == 1'b0 && usbtbslaveWireCtrlOut == 1'b0) 
	begin
	   if (usbtbslaveDPlusPullup == 1'b1)
	     USBSlaveWireVP <= DPlusPullup;
	   else
	     USBSlaveWireVP <= DPlusPullDown;
	   if (usbtbslaveDMinusPullup == 1'b1)
	     USBSlaveWireVM <= DMinusPullup;
	   else
	     USBSlaveWireVM <= DMinusPullDown;
	end
   end


   //Parameters declaration: 
   defparam u_slave.EP0_FIFO_DEPTH = 64;
   parameter EP0_FIFO_DEPTH = 64;
   defparam u_slave.EP0_FIFO_ADDR_WIDTH = 6;
   parameter EP0_FIFO_ADDR_WIDTH = 6;
   defparam u_slave.EP1_FIFO_DEPTH = 64;
   parameter EP1_FIFO_DEPTH = 64;
   defparam u_slave.EP1_FIFO_ADDR_WIDTH = 6;
   parameter EP1_FIFO_ADDR_WIDTH = 6;
   defparam u_slave.EP2_FIFO_DEPTH = 64;
   parameter EP2_FIFO_DEPTH = 64;
   defparam u_slave.EP2_FIFO_ADDR_WIDTH = 6;
   parameter EP2_FIFO_ADDR_WIDTH = 6;
   defparam u_slave.EP3_FIFO_DEPTH = 64;
   parameter EP3_FIFO_DEPTH = 64;
   defparam u_slave.EP3_FIFO_ADDR_WIDTH = 6;
   parameter EP3_FIFO_ADDR_WIDTH = 6;

   wire 			     usb_tbslavesofrxed_irq;
   wire 			     usb_tbslaveresetevent_irq;
   wire 			     usb_tbslaveresume_irq;
   wire 			     usb_tbslavetransdone_irq;
   wire 			     usb_tbslavenaksent_irq;
   wire 			     usb_tbslavevbusdet_irq;

   wire 			     usb_tboe, usb_tboe_n;

   
   // USB slave instantiation
   usbslave_simlib u_slave 
     (
      // USB PHY lines
      // In
      .clk_i        (clk), // Board clock
      .rst_i        (!rst_n),
      .address_i    (usbslave_wbmaster_adr[7:0]),
      .data_i       (usbslave_wbmaster_dout),
      .data_o       (usbslave_wbmaster_din),
      .we_i         (usbslave_wbmaster_we),
      .strobe_i     (usbslave_wbmaster_stb),
      .ack_o        (usbslave_wbmaster_ack),

      .usbClk	     (usbClk), // logic clock,48MHz +/-0.25%
      

      // Interrupt lines

      .slaveSOFRxedIntOut		(usb_tbslavesofrxed_irq),
      .slaveResetEventIntOut		(usb_tbslaveresetevent_irq),
      .slaveResumeIntOut		(usb_tbslaveresume_irq),
      .slaveTransDoneIntOut		(usb_tbslavetransdone_irq),
      .slaveNAKSentIntOut		(usb_tbslavenaksent_irq),
      .slaveVBusDetIntOut		(usb_tbslavevbusdet_irq),

      .USBWireDataIn(usbtbslaveWireDataIn),
      .USBWireDataInTick(),
      .USBWireDataOut(usbtbslaveWireDataOut),
      .USBWireDataOutTick(),
      .USBWireCtrlOut(usbtbslaveWireCtrlOut),
      .USBFullSpeed(),
      .USBDPlusPullup(usbtbslaveDPlusPullup),
      .USBDMinusPullup(usbtbslaveDMinusPullup),
      .vBusDetect(1'b1)


      );

   // Wishbone bus master, for controlling USB slave
   wb_master_model 
     #(
       .dwidth(8), 
       .awidth(9)
       ) 
   usbslave_wbm 
     (
      .clk(clk), 

      .rst(!rst_n), 
      .adr(usbslave_wbmaster_adr), 
      .din(usbslave_wbmaster_din), 
      .dout(usbslave_wbmaster_dout), 
      .cyc(), 
      .stb(usbslave_wbmaster_stb), 
      .we(usbslave_wbmaster_we), 
      .sel(), 
      .ack(usbslave_wbmaster_ack), 
      .err(1'b0), 
      .rty(1'b0)
      );

   

   reg [7:0] 			     hostTestData;
   reg [15:0] 			     hostTestDataWord;
   reg [7:0] 			     hostTestDataRead;
   reg [7:0] 			     hostTestDataWrite;
   reg [7:0] 			     hostTestUSBAddress;
   integer 			     hostTestDataSize;
   integer 			     hostTestDataItr;
   // Don't have vbus detect in this system...
   //assign    usbhostvbusdetect = 1'b1;



   // Perform transactions and tests through a USB slave to the USB host in the
   // the DUT
   
   initial
     begin

	wait (usbhostfullspeed);
	$write("USB host tb: USB Host test starts at:%t\n",$time);
	
	usbslave_wbm.wb_read(1, 
			     `SIM_SLAVE_BASE_ADDR + 
			     `HOST_SLAVE_CONTROL_BASE +
			     `HOST_SLAVE_VERSION_REG , hostTestDataRead);
	$write("USB host tb: Slave Version number = 0x%0x\n", hostTestDataRead);
	

	$write("USB host tb: Configure host and slave mode\n");  
	usbslave_wbm.wb_write(1,8'he0,8'h0);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_CONTROL_REG , 8'h70);
	#30000;
	//expecting connection event interrupt
	//expecting change in reset state event, and change in vbus state event
	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR + 
			    `SCREG_BASE +
			    `SC_INTERRUPT_STATUS_REG , 8'h24);
	
	//expecting full speed connect and vbus present
	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR + 
			    `SCREG_BASE +
			    `SC_LINE_STATUS_REG , 8'h06);
	$write("USB host tb: :USB slave connected and fullspeed enabled\n");  
	
	hostTestUSBAddress = 8'h00;
	#200;
	$write("USB host tb: Slave ENABLE Transport tO EP1\n");  
	//enable endpoint, and make ready
	usbslave_wbm.wb_write(1, `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_CONTROL_REG , 8'h71);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_ADDRESS , 8'h00);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `EP0_CTRL_REG , 8'h03);
	//cancel interrupt
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_INTERRUPT_STATUS_REG , 8'hff);

	usbslave_wbm.wb_read(1, 
			     `SIM_SLAVE_BASE_ADDR + 
			     `SCREG_BASE +
			     `SC_INTERRUPT_STATUS_REG , hostTestData);
	while (hostTestData != 8'h01) begin
  	   usbslave_wbm.wb_read(1, 
				`SIM_SLAVE_BASE_ADDR + 
				`SCREG_BASE +
				`SC_INTERRUPT_STATUS_REG , hostTestData);
	end

	
	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR + 
			    `SCREG_BASE +
			    `SC_INTERRUPT_STATUS_REG , 8'h01);
	//endpoint enabled, and endpoint ready cleared
	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR + 
			    `SCREG_BASE +
			    `EP0_CTRL_REG , 8'h01);
	$write("USB host tb: Checking receive hostTestData ");
	hostTestData = 8'h00;
	for (hostTestDataItr=0; 
	     hostTestDataItr<hostTestDataSize; 
	     hostTestDataItr=hostTestDataItr+1) begin
	   usbslave_wbm.wb_cmp(1, 
			       `SIM_SLAVE_BASE_ADDR + 
			       `EP0_RX_FIFO_BASE + 
			       `FIFO_DATA_REG , hostTestData);
	   hostTestData = hostTestData + 1'b1;
	end
	$write("- PASSED T4\n");
	
	$write("USB host tb: Trans test: Device address = 0x5a, 64 byte OUT DATA0 transaction to Endpoint 1\n");
	hostTestUSBAddress = 8'h5a;
	hostTestDataSize = 64;

	//enable endpoint, and make ready
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_CONTROL_REG , 8'h71);
	usbslave_wbm.wb_write(1, `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_ADDRESS , hostTestUSBAddress);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `EP1_CTRL_REG , 8'h03);
	//cancel interrupt
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR + 
			      `SCREG_BASE +
			      `SC_INTERRUPT_STATUS_REG , 8'hff);

	usbslave_wbm.wb_read(1, 
			     `SIM_SLAVE_BASE_ADDR +
			     `SCREG_BASE +
			     `SC_INTERRUPT_STATUS_REG , hostTestData);
	while (hostTestData != 8'h01) begin
  	   usbslave_wbm.wb_read(1, 
				`SIM_SLAVE_BASE_ADDR +
				`SCREG_BASE +
				`SC_INTERRUPT_STATUS_REG , hostTestData);
	end

	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR +
			    `SCREG_BASE +
			    `SC_INTERRUPT_STATUS_REG , 8'h01);
	//endpoint enabled, and endpoint ready cleared
	usbslave_wbm.wb_cmp(1, 
			    `SIM_SLAVE_BASE_ADDR +
			    `SCREG_BASE +
			    `EP0_CTRL_REG , 8'h01);
	$write("USB host tb: Checking receive hostTestData ");
	hostTestData = 8'h00;
	for (hostTestDataItr=0; 
	     hostTestDataItr<hostTestDataSize; 
	     hostTestDataItr=hostTestDataItr+1) begin
	   usbslave_wbm.wb_cmp(1, 
			       `SIM_SLAVE_BASE_ADDR +
			       `EP1_RX_FIFO_BASE  +
			       `FIFO_DATA_REG , hostTestData);
	   hostTestData = hostTestData + 1'b1;
	end
	$write("- PASSED T5\n");
	
	#2000;
	$write("USB host tb: Trans test: Device address = 0x01, 2 byte IN transaction to Endpoint 2\n"); 
	hostTestUSBAddress = 8'h01;
	hostTestDataSize = 64;
	$write("USB host tb: USB Host test starts at:%t\n",$time);
	//enable endpoint, and make ready
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR +
			      `SCREG_BASE +
			      `SC_CONTROL_REG , 8'h71);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR +
			      `SCREG_BASE +
			      `SC_ADDRESS , hostTestUSBAddress);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR +
			      `SCREG_BASE +
			      `EP2_CTRL_REG , 8'h03);
	usbslave_wbm.wb_write(1, 
			      `SIM_SLAVE_BASE_ADDR +
			      `SCREG_BASE +
			      `SC_INTERRUPT_STATUS_REG , 8'hff);
	hostTestData = 8'hC0;
	for (hostTestDataItr=64; 
	     hostTestDataItr>0; 
	     hostTestDataItr=hostTestDataItr-1) begin
	   usbslave_wbm.wb_write(1, 
				 `SIM_SLAVE_BASE_ADDR +
				 `EP2_TX_FIFO_BASE  +
				 `FIFO_DATA_REG , hostTestData);
	   hostTestData = hostTestData - 3'b011;
	end
	
	usbslave_wbm.wb_read(1, 
			     `SIM_SLAVE_BASE_ADDR +
			     `SCREG_BASE +
			     `SC_INTERRUPT_STATUS_REG , hostTestData);
	while (hostTestData != 8'h01) begin
  	   usbslave_wbm.wb_read(1, 
				`SIM_SLAVE_BASE_ADDR +
				`SCREG_BASE +
				`SC_INTERRUPT_STATUS_REG , hostTestData);
	end
	#3500;

	$write("USB host tb: PASSED USB test\n");
	$write("USB host tb: Finished all tests\n");
	
     end


`endif //  `ifdef USB_HOST_TESTS_ENABLE


`ifdef USB_SLAVE_TESTS_ENABLE
   
 `define SIM_HOST_BASE_ADDR 9'h000


   wire [8:0] usbhost_wbmaster_adr;
   wire [7:0] usbhost_wbmaster_dout;
   wire [7:0] usbhost_wbmaster_din;
   wire       usbhost_wbmaster_we;
   wire       usbhost_wbmaster_ack;
   wire       usbhost_wbmaster_stb;

   wire       usb_tbhostSOFSentIntOut;
   wire       usb_tbhostConnEventIntOut;
   wire       usb_tbhostResumeIntOut;
   wire       usb_tbhostTransDoneIntOut;
   
   reg 	      USBHostWireVP;
   reg 	      USBHostWireVM;
   
   wire       hostUSBWireCtrlOut;

   
   wire [1:0] hostUSBWireDataIn;
   wire [1:0] hostUSBWireDataOut;
   
   
   assign hostUSBWireDataIn = {USBHostWireVP, USBHostWireVM};
   assign usbslavewiredatain = {USBHostWireVP, USBHostWireVM};

   always @(*) begin
      if (hostUSBWireCtrlOut == 1'b1 && !usbslavewirectrlout == 1'b0)
	{USBHostWireVP, USBHostWireVM} <= hostUSBWireDataOut;
      else if (hostUSBWireCtrlOut == 1'b0 && !usbslavewirectrlout == 1'b1)
	{USBHostWireVP, USBHostWireVM} <= usbslavewiredataout;
      else if (hostUSBWireCtrlOut == 1'b1 && !usbslavewirectrlout == 1'b1)
	{USBHostWireVP, USBHostWireVM} <= 2'bxx;
      else if (hostUSBWireCtrlOut == 1'b0 && !usbslavewirectrlout == 1'b0) begin
	 // No indication of pullup/downs in our design...
	 // assume VP pullup and VM pull down(!?)
	 USBHostWireVP <= DPlusPullup;
	 USBHostWireVM <= DMinusPullDown;
      end
   end
   


   //Parameters declaration: 
   defparam u_usbhost.HOST_FIFO_DEPTH = 64;
   parameter HOST_FIFO_DEPTH = 64;
   defparam u_usbhost.HOST_FIFO_ADDR_WIDTH = 6;
   parameter HOST_FIFO_ADDR_WIDTH = 6;  

   usbhost_simlib u_usbhost 
     (
      .clk_i(clk),
      .rst_i(!rst_n),
      .address_i(usbhost_wbmaster_adr[7:0]),
      .data_i(usbhost_wbmaster_dout),
      .data_o(usbhost_wbmaster_din),
      .we_i(usbhost_wbmaster_we),
      .strobe_i(usbhost_wbmaster_stb),
      .ack_o(usbhost_wbmaster_ack),
      .usbClk(usbClk),

      .hostSOFSentIntOut(usb_tbhostSOFSentIntOut),
      .hostConnEventIntOut(usb_tbhostConnEventIntOut),
      .hostResumeIntOut(usb_tbhostResumeIntOut),
      .hostTransDoneIntOut(usb_tbhostTransDoneIntOut),
      .USBWireDataIn(hostUSBWireDataIn),
      .USBWireDataInTick(),
      .USBWireDataOut(hostUSBWireDataOut),
      .USBWireDataOutTick(),
      .USBWireCtrlOut(hostUSBWireCtrlOut),
      .USBFullSpeed()


      );
   wb_master_model 
     #(
       .dwidth(8), 
       .awidth(9)
       ) 
   usbhost_wbm 
     (
      .clk(clk), 
      .rst(!rst_n), 
      .adr(usbhost_wbmaster_adr), 
      .din(usbhost_wbmaster_din), 
      .dout(usbhost_wbmaster_dout), 
      .cyc(), 
      .stb(usbhost_wbmaster_stb), 
      .we(usbhost_wbmaster_we), 
      .sel(), 
      .ack(usbhost_wbmaster_ack), 
      .err(1'b0), 
      .rty(1'b0)
      );


   reg [7:0] slaveTestData;
   reg [15:0] slaveTestDataWord;
   reg [7:0]  slaveTestDataRead;
   reg [7:0]  slaveTestDataWrite;
   reg [7:0]  slaveTestUSBAddress;
   reg [7:0]  slaveTestUSBEndPoint;
   reg [7:0]  slaveTestTransType;
   integer    slaveTestDataSize;
   integer    slaveTestDataItr;
   
   // Don't have vbusdetect in this system
   //assign    usbslavevbusdetect = 1'b1;

   initial
     begin
	
	wait (usbslavefullspeed);
	$write("USB Slave test starts at:%t\n",$time);

	#14000;

	usbhost_wbm.wb_read(1, 
			    `SIM_HOST_BASE_ADDR +
			    `HOST_SLAVE_CONTROL_BASE +
			    `HOST_SLAVE_VERSION_REG , slaveTestDataRead);
	$display("Host Version number = 0x%0x\n", slaveTestDataRead);

	$write("USB slave tb: Testing host register read/write ");
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_LINE_CONTROL_REG , 8'h18);
	usbhost_wbm.wb_cmp(1, 
			   `SIM_HOST_BASE_ADDR +
			   `HCREG_BASE +
			   `TX_LINE_CONTROL_REG , 8'h18);
	$write("- PASSED\n");


	$write("USB slave tb: Testing register reset ");
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HOST_SLAVE_CONTROL_BASE +
			     `HOST_SLAVE_CONTROL_REG , 8'h2);
	//usbhost_wbm.wb_write(1, `SIM_SLAVE_BASE_ADDR + `HOST_SLAVE_CONTROL_BASE+`HOST_SLAVE_CONTROL_REG , 8'h2);
	#1000;
	usbhost_wbm.wb_cmp(1, 
			   `SIM_HOST_BASE_ADDR +
			   `HCREG_BASE +
			   `TX_LINE_CONTROL_REG , 8'h00);
	//usbhost_wbm.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `SCREG_BASE+`SC_CONTROL_REG , 8'h00);
	$write("- PASSED\n");
	#1000;

	$write("USB slave tb: Configuring host\n");
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HOST_SLAVE_CONTROL_BASE +
			     `HOST_SLAVE_CONTROL_REG , 8'h1);
	$write("USB slave tb: Connect full speed ");
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_LINE_CONTROL_REG , 8'h18);
	#20000;
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h04);

	$write("- PASSED\n");
	#225000;

	//Transfer 1
	$write("USB slave tb: Trans test 1: Device address = 0x63, 2 byte SETUP transaction to Endpoint 0\n");
	slaveTestUSBAddress = 8'h63;
	slaveTestUSBEndPoint = 8'h00;
	slaveTestTransType = `SETUP_TRANS;
	slaveTestDataSize = 2;

	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h04);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ADDR_REG , slaveTestUSBAddress);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ENDP_REG , slaveTestUSBEndPoint);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_TRANS_TYPE_REG , slaveTestTransType);
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   usbhost_wbm.wb_write(1, 
				`SIM_HOST_BASE_ADDR +
				`HOST_TX_FIFO_BASE  +
				`FIFO_DATA_REG , slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_CONTROL_REG , 8'h01);
	#35000

	   
	  usbhost_wbm.wb_cmp(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h01);
	$write("USB slave tb: Transaction done correct interrupt recived\n" );
	
	
	$write("USB slave tb: Checking receive slaveTestData ");
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   
	   slaveTestData = slaveTestData + 1'b1;
	end
	$write("- PASSED\n");

	//Transfer 2
	$write("USB slave tb: Trans test 2: Device address = 0x63, 20 byte OUT DATA0 transaction to Endpoint 1\n");
	slaveTestUSBAddress = 8'h63;
	slaveTestUSBEndPoint = 8'h00;
	slaveTestTransType = `OUTDATA0_TRANS;
	slaveTestDataSize = 20;
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h04);
	
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ADDR_REG , slaveTestUSBAddress);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ENDP_REG , slaveTestUSBEndPoint);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_TRANS_TYPE_REG , slaveTestTransType);
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   usbhost_wbm.wb_write(1, 
				`SIM_HOST_BASE_ADDR +
				`HOST_TX_FIFO_BASE  +
				`FIFO_DATA_REG , slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_CONTROL_REG , 8'h01);
	#20000

	  $write("USB slave tb: Checking received Transaction done interupt\n");
	usbhost_wbm.wb_cmp(1, 
			   `SIM_HOST_BASE_ADDR +
			   `HCREG_BASE +
			   `INTERRUPT_STATUS_REG , 8'h01);
	
	$write("USB slave tb: Checking receive slaveTestData ");
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   //usbhost_wbm.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `EP1_RX_FIFO_BASE + `FIFO_DATA_REG , data);
	   slaveTestData = slaveTestData + 1'b1;
	end
	$write("- PASSED\n");
	#200000

	  //Transfer 3
	  $write("USB slave tb: Trans test 3: Device address = 0x63, 20 byte OUT DATA0 transaction to Endpoint 1\n");
	slaveTestUSBAddress = 8'h63;
	slaveTestUSBEndPoint = 8'h00;
	slaveTestTransType = `OUTDATA0_TRANS;
	slaveTestDataSize = 2;
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h04);
	//enable endpoint, and make ready

	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ADDR_REG , slaveTestUSBAddress);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ENDP_REG , slaveTestUSBEndPoint);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_TRANS_TYPE_REG , slaveTestTransType);
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   usbhost_wbm.wb_write(1, 
				`SIM_HOST_BASE_ADDR +
				`HOST_TX_FIFO_BASE  +
				`FIFO_DATA_REG , slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_CONTROL_REG , 8'h01);
	#20000

	  $write("USB slave tb: Checking received Transaction done interupt ");
	usbhost_wbm.wb_cmp(1, 
			   `SIM_HOST_BASE_ADDR +
			   `HCREG_BASE +
			   `INTERRUPT_STATUS_REG , 8'h01);

	
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   //usbhost_wbm.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `EP1_RX_FIFO_BASE + `FIFO_DATA_REG , slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	$write("- PASSED\n");
	#200000  
	   
	  //Transfer 4 
	  $write("USB slave tb: Trans test 4: Device address = 0x63, 2 byte IN transaction to Endpoint 2\n");
	slaveTestUSBAddress = 8'h63;
	slaveTestUSBEndPoint = 8'h02;
	slaveTestTransType = `IN_TRANS;
	slaveTestDataSize = 20;
	//enable endpoint, and make ready
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `INTERRUPT_STATUS_REG , 8'h3f);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ADDR_REG , slaveTestUSBAddress);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_ENDP_REG , slaveTestUSBEndPoint);
	usbhost_wbm.wb_write(1, 
			     `SIM_HOST_BASE_ADDR +
			     `HCREG_BASE +
			     `TX_TRANS_TYPE_REG , slaveTestTransType);
	slaveTestData = 8'h00;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   //usbhost_wbm.wb_write(1, `SIM_SLAVE_BASE_ADDR + `EP2_TX_FIFO_BASE + `FIFO_DATA_REG , slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	#20000
	  usbhost_wbm.wb_write(1, 
			       `SIM_HOST_BASE_ADDR +
			       `HCREG_BASE +
			       `TX_CONTROL_REG , 8'h01);
	#200000
	  //expecting transaction done interrupt
	  $write("USB slave tb: USB Slave transaction done interrupt at:%t\n",$time);
	usbhost_wbm.wb_cmp(1, 
			   `SIM_HOST_BASE_ADDR +
			   `HCREG_BASE +
			   `INTERRUPT_STATUS_REG , 8'h01);  
	
	
	$write("USB slave tb: Checking receive slaveTestData  "); 
	slaveTestData = 8'h0;
	for (slaveTestDataItr=0; 
	     slaveTestDataItr<slaveTestDataSize; 
	     slaveTestDataItr=slaveTestDataItr+1) begin
	   usbhost_wbm.wb_cmp(1, 
			      `SIM_HOST_BASE_ADDR +
			      `HOST_RX_FIFO_BASE  +
			      `FIFO_DATA_REG ,slaveTestData);
	   slaveTestData = slaveTestData + 1'b1;
	end
	$write("-PASSED\n");

	$write("Finished all tests\n");

     end
   


   

`endif
   
   
   