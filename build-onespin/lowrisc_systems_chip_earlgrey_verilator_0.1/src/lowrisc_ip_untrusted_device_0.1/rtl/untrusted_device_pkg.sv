// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić


package untrusted_device_pkg;
  localparam logic [31:0] UNTRUSTED_ROM_ADDRESS = 32'h00000000;
  localparam logic [31:0] UNTRUSTED_ROM_MASK    = 32'h00003fff;
  localparam logic [31:0] UNTRUSTED_RAM_ADDRESS = 32'h50000000;
  localparam logic [31:0] UNTRUSTED_RAM_MASK    = 32'h0001ffff;
endpackage
