`ifndef WB_VGA_DISP_IF
`define  WB_VGA_DISP_IF

interface wb_vga_disp_if();

        logic clk_p;                   // VGA pixel clock output
        logic hsync;               // horizontal sync
        logic vsync;               // vertical sync
        logic csync;               // composite sync
        logic blank;               // blanking signal
        logic [ 7:0] red, green, blue; // RGB color signals


clocking vga_if_out_cb @(posedge clk_p);
        output        clk_p;                   // VGA pixel clock output
        output        hsync;               // horizontal sync
        output        vsync;               // vertical sync
        output        csync;               // composite sync
        output        blank;               // blanking signal
        output  red, green, blue; // RGB color signals
endclocking

clocking vga_if_in_cb @(posedge clk_p);
        input        clk_p;                   // VGA pixel clock output
        input        hsync;               // horizontal sync
        input        vsync;               // vertical sync
        input        csync;               // composite sync
        input        blank;               // blanking signal
        input red, green, blue; // RGB color signals
endclocking


modport  vga_out_p (clocking vga_if_out_cb);
modport  vga_in_p (clocking vga_if_in_cb);

endinterface


`endif
