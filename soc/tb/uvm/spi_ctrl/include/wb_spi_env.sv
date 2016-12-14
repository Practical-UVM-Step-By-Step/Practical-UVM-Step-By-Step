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

`ifndef WB_SPI_ENV__SV
 `define WB_SPI_ENV__SV

 `include "mstr_slv_src.incl"

 `include "wb_spi_env_cfg.sv"

 `include "spi_scbd.sv"

 `include "wb_spi_env_cov.sv"

 `include "mon_2cov.sv"

 `include "ral_single.sv"
 `include "ral_wb_spi_env.sv"
// ToDo: Add additional required `include directives

`endif // WB_SPI_ENV__SV
