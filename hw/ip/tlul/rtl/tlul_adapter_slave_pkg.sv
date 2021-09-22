// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić


package tlul_adapter_slave_pkg;
  localparam int WordSize = $clog2(top_pkg::TL_DBW);
  localparam logic [31:0] MASTER_ADDRESS = 32'h40200000;
  localparam logic [31:0] ADAPTER_ADDRESS = tl_main_pkg::ADDR_SPACE_UNTRUSTED_S;
endpackage
