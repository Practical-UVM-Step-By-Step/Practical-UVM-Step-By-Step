
module usb_phy (
		clk,
		rst,
		phy_tx_mode,
		usb_rst,
		rxd,
		rxdp,
		rxdn,
		txdp,
		txdn,
		txoe,
		DataIn_o,
		RxValid_o,
		RxActive_o,
		RxError_o,
		DataOut_i,
		TxValid_i,
		TxReady_o,
		LineState_o
		);

input    clk;
input    rst;
input       phy_tx_mode;
output      usb_rst;

output      txdp, txdn, txoe;
input       rxd, rxdp, rxdn;

inout [7:0]  DataIn_o;
inout       RxValid_o;
inout 	    RxActive_o;
inout       RxError_o;
inout [7:0] DataOut_i;
inout       TxValid_i;
inout       TxReady_o;
inout  [1:0] 	LineState_o;




endmodule
        
