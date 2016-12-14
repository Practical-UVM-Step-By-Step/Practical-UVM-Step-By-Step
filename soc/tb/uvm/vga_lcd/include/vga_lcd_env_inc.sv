/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

//
//

`ifndef VGA_LCD_ENV_INC_SV
 `define VGA_LCD_ENV_INC_SV

 `include "mstr_slv_src.incl"

 `include "vga_lcd_scbd.sv"

 `include "vga_lcd_env_cov.sv"

 `include "mon_2cov.sv"

 `include "ral_single.sv"
// `include "ral_vga_lcd.sv"
 `include "ral_vga_lcd_env.sv"

`endif // VGA_LCD_ENV_INC_SV
