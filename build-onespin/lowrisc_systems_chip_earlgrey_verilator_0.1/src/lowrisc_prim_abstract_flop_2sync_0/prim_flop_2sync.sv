// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file is auto-generated.
// Used parser: Verible v0.0-1213-g9e5c085


// This is to prevent AscentLint warnings in the generated
// abstract prim wrapper. These warnings occur due to the .*
// use. TODO: we may want to move these inline waivers
// into a separate, generated waiver file for consistency.
//ri lint_check_off OUTPUT_NOT_DRIVEN INPUT_NOT_READ
module prim_flop_2sync

#(
parameter int               Width      = 16,
  parameter logic [Width-1:0] ResetValue = '0
) (
  input                    clk_i,
  input                    rst_ni,
  input        [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

  if (1) begin : gen_generic
    prim_generic_flop_2sync #(
      .Width(Width),
      .ResetValue(ResetValue)
    ) u_impl_generic (
      .*
    );

  end

endmodule
//ri lint_check_on OUTPUT_NOT_DRIVEN INPUT_NOT_READ
