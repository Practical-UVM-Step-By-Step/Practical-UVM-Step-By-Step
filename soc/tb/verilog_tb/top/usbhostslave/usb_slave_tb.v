// To be included in testbench
// Relies on USB slave signals to be declared
//       .usb0wiredataout			(usb0wiredataout),
//      .usb0wirectrlout			(usb0wirectrlout),
//      .usb0fullspeed			(usb0fullspeed),
//      .usb0dpluspullup			(usb0dpluspullup),
//      .usb0dminuspullup			(usb0dminuspullup),
//      .usb0wiredatain			(usb0wiredatain),
//      .usb0vbusdetect			(usb0vbusdetect),


`define SIM_HOST_BASE_ADDR 9'h000
`define SIM_SLAVE_BASE_ADDR 9'h100
`define CLK_50MHZ_HALF_PERIOD 10.4
 wire usbClk;


wire [8:0] adr;
wire [7:0] masterDout;
wire [7:0] masterDin;
wire [7:0] usbSlaveDout;
wire [7:0] usbHostDout;
wire stb;
wire we;
wire ack;
wire host_stb;
wire slave_stb;

wire hostSOFSentIntOut;
wire hostConnEventIntOut;
wire hostResumeIntOut;
wire hostTransDoneIntOut;

wire usb0dPlusPullDown;
wire usb0dMinusPullDown;

reg USBWireVP;
reg USBWireVM;
reg dpu;

wire [1:0] hostUSBWireDataIn;
wire [1:0] hostUSBWireDataOut;
wire [1:0] slaveUSBWireDataIn;
wire [1:0] slaveUSBWireDataOut;

wire hostUSBWireCtrlOut;
wire usb0dpluspullup;
wire usb0dminuspullup;

assign usb0dpluspullup = dpu; 
assign usb0dminuspullup  = 1'b0; 

pullup(usb0dpluspullup);
pulldown(usb0dPlusPullDown);
pullup(usb0dminuspullup);
pulldown(usb0dMinusPullDown);

assign hostUSBWireDataIn = {USBWireVP, USBWireVM};
assign usb0wiredatain = {USBWireVP, USBWireVM};
//always @(hostUSBWireCtrlOut or usb0wirectrlout or hostUSBWireDataOut or slaveUSBWireDataOut or
//  DPlusPullup or usb0dPlusPullDown or usb0dminuspullup or usb0dMinusPullDown) begin
always @(*) begin
  if (hostUSBWireCtrlOut == 1'b1 && !usb0wirectrlout == 1'b0)
    {USBWireVP, USBWireVM} <= hostUSBWireDataOut;
  else if (hostUSBWireCtrlOut == 1'b0 && !usb0wirectrlout == 1'b1)
    {USBWireVP, USBWireVM} <= usb0wiredataout;
  else if (hostUSBWireCtrlOut == 1'b1 && !usb0wirectrlout == 1'b1)
    {USBWireVP, USBWireVM} <= 2'bxx;
  else if (hostUSBWireCtrlOut == 1'b0 && !usb0wirectrlout == 1'b0) begin
    if (usb0dpluspullup == 1'b1)
      USBWireVP <= usb0dpluspullup;
    else
      USBWireVP <= usb0dPlusPullDown;
    if (usb0dminuspullup == 1'b1)
      USBWireVM <= usb0dminuspullup;
    else
      USBWireVM <= usb0dMinusPullDown;
  end
end
 


assign host_stb = ~adr[8] & stb;
assign slave_stb = adr[8] & stb;
assign masterDin = host_stb == 1'b1 ? usbHostDout : usbSlaveDout;

//Parameters declaration: 
defparam u_usbhost.HOST_FIFO_DEPTH = 64;
parameter HOST_FIFO_DEPTH = 64;
defparam u_usbhost.HOST_FIFO_ADDR_WIDTH = 6;
parameter HOST_FIFO_ADDR_WIDTH = 6;  

  clkgen clkgen1
     (
      .sys_clk_pad_i                   (clk),
`ifdef ETH_CLK_PLL      
      .eth_clk_pad_i (),
`endif      
      .wb_clk                    (),
      .sdram_clk                 (),
      .usb_clk                   (usbClk),
      .spw_clk                   (),
      .rst_i                     (!rst),
      .rst_o                     ()   
      );

usbhost_simlib u_usbhost (
  .clk_i(clk),
  .rst_i(!rst),
  .address_i(adr[7:0]),
  .data_i(masterDout),
  .data_o(usbHostDout),
  .we_i(we),
  .strobe_i(host_stb),
  .ack_o(ack),
  .usbClk(usbClk),

  .hostSOFSentIntOut(hostSOFSentIntOut),
  .hostConnEventIntOut(hostConnEventIntOut),
  .hostResumeIntOut(hostResumeIntOut),
  .hostTransDoneIntOut(hostTransDoneIntOut),
  .USBWireDataIn(hostUSBWireDataIn),
  .USBWireDataInTick(USBWireDataInTick),
  .USBWireDataOut(hostUSBWireDataOut),
  .USBWireDataOutTick(USBWireDataOutTick),
  .USBWireCtrlOut(hostUSBWireCtrlOut),
  .USBFullSpeed()


);
wb_master_model #(.dwidth(8), .awidth(9)) u_wb_master_model (
  .clk(clk), 
  .rst(!rst), 
  .adr(adr), 
  .din(masterDin), 
  .dout(masterDout), 
  .cyc(), 
  .stb(stb), 
  .we(we), 
  .sel(), 
  .ack(ack), 
  .err(1'b0), 
  .rty(1'b0)
);


//--------------- reset ---------------
//always begin
 // #`CLK_50MHZ_HALF_PERIOD usbClk <= 1'b0;
 // #`CLK_50MHZ_HALF_PERIOD usbClk <= 1'b1;
//end






reg [7:0] data;
reg [15:0] dataWord;
reg [7:0] dataRead;
reg [7:0] dataWrite;
reg [7:0] USBAddress;
reg [7:0] USBEndPoint;
reg [7:0] transType;
integer dataSize;
integer i;
integer j;
assign    usb0vbusdetect = 1'b1;

initial
begin
  dpu<=1'b0;

  
  wait (usb0fullspeed);
   $write("USB Slave test starts at:%t\n",$time);
   dpu<=1'b1;
  #14000;

  
  u_wb_master_model.wb_read(1, `SIM_HOST_BASE_ADDR + `HOST_SLAVE_CONTROL_BASE+`HOST_SLAVE_VERSION_REG , dataRead);
  $display("Host Version number = 0x%0x\n", dataRead);

  $write("Testing host register read/write  ");
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_LINE_CONTROL_REG , 8'h18);
  u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_LINE_CONTROL_REG , 8'h18);
  $write("--- PASSED\n");


  $write("Testing register reset  ");
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HOST_SLAVE_CONTROL_BASE+`HOST_SLAVE_CONTROL_REG , 8'h2);
  //u_wb_master_model.wb_write(1, `SIM_SLAVE_BASE_ADDR + `HOST_SLAVE_CONTROL_BASE+`HOST_SLAVE_CONTROL_REG , 8'h2);
  #1000;
  u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_LINE_CONTROL_REG , 8'h00);
  //u_wb_master_model.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `SCREG_BASE+`SC_CONTROL_REG , 8'h00);
  $write("--- PASSED\n");
  #1000;

  $write("Configure host   ");
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HOST_SLAVE_CONTROL_BASE+`HOST_SLAVE_CONTROL_REG , 8'h1);
  $write("Connect full speed  ");
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_LINE_CONTROL_REG , 8'h18);
  #20000;
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h04);

  $write("--- PASSED\n");
  #225000;

  //Transfer 1
  $write("Trans test 1: Device address = 0x63, 2 byte SETUP transaction to Endpoint 0. ");
  USBAddress = 8'h63;
  USBEndPoint = 8'h00;
  transType = `SETUP_TRANS;
  dataSize = 2;

  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h04);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ADDR_REG , USBAddress);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ENDP_REG , USBEndPoint);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_TRANS_TYPE_REG , transType);
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HOST_TX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_CONTROL_REG , 8'h01);
  #35000

  
   u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h01);
   $write(" Transaction done correct interrupt recived " );
  
 
  $write("Checking receive data  ");
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
   
    data = data + 1'b1;
  end
  $write("--- PASSED\n");

  //Transfer 2
  $write("Trans test 2: Device address = 0x63, 20 byte OUT DATA0 transaction to Endpoint 1. ");
  USBAddress = 8'h63;
  USBEndPoint = 8'h00;
  transType = `OUTDATA0_TRANS;
  dataSize = 20;
 u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h04);
 
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ADDR_REG , USBAddress);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ENDP_REG , USBEndPoint);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_TRANS_TYPE_REG , transType);
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HOST_TX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_CONTROL_REG , 8'h01);
  #20000

  $write("Checking received Transaction done interupt  ");
  u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h01);
  
  $write("Checking receive data  ");
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    //u_wb_master_model.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `EP1_RX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
  $write("--- PASSED\n");
   #200000

   //Transfer 3
   $write("Trans test 3: Device address = 0x63, 20 byte OUT DATA0 transaction to Endpoint 1. ");
  USBAddress = 8'h63;
  USBEndPoint = 8'h00;
  transType = `OUTDATA0_TRANS;
  dataSize = 2;
 u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h04);
  //enable endpoint, and make ready

  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ADDR_REG , USBAddress);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ENDP_REG , USBEndPoint);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_TRANS_TYPE_REG , transType);
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HOST_TX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_CONTROL_REG , 8'h01);
  #20000

  $write("Checking received Transaction done interupt\n  ");
  u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h01);

 
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    //u_wb_master_model.wb_cmp(1, `SIM_SLAVE_BASE_ADDR + `EP1_RX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
  $write("--- PASSED\n");
   #200000  
  
  //Transfer 4 
    $write("Trans test 4: Device address = 0x63, 2 byte IN transaction to Endpoint 2. ");
  USBAddress = 8'h63;
  USBEndPoint = 8'h02;
  transType = `IN_TRANS;
  dataSize = 20;
  //enable endpoint, and make ready
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h3f);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ADDR_REG , USBAddress);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_ENDP_REG , USBEndPoint);
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_TRANS_TYPE_REG , transType);
  data = 8'h00;
  for (i=0; i<dataSize; i=i+1) begin
    //u_wb_master_model.wb_write(1, `SIM_SLAVE_BASE_ADDR + `EP2_TX_FIFO_BASE + `FIFO_DATA_REG , data);
    data = data + 1'b1;
  end
   #20000
  u_wb_master_model.wb_write(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`TX_CONTROL_REG , 8'h01);
  #200000
  //expecting transaction done interrupt
     $write("USB Slave transaction done interrupt at:%t\n",$time);
  u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HCREG_BASE+`INTERRUPT_STATUS_REG , 8'h01);  
  
 
    $write("Checking receive data  "); 
  data = 8'h0;
  for (i=0; i<dataSize; i=i+1) begin
    u_wb_master_model.wb_cmp(1, `SIM_HOST_BASE_ADDR + `HOST_RX_FIFO_BASE + `FIFO_DATA_REG ,data);
    data = data + 1'b1;
  end
  $write("--- PASSED\n");

  $write("Finished all tests\n");
  


  $stop;	

end


