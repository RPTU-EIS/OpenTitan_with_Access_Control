# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

foreach device_name, device_lib : sw_lib_arch_core_devices
  test_bus_ctrl_elf = executable(
    'test_bus_ctrl_' + device_name,
    sources: ['test_bus_ctrl.c'],
    name_suffix: 'elf',
    dependencies: [
      sw_examples_demos,
      sw_lib_runtime_hart,
      sw_lib_runtime_print,
      sw_lib_runtime_log,
      sw_lib_pinmux,
      sw_lib_dif_gpio,
      sw_lib_irq,
      sw_lib_dif_spi_device,
      sw_lib_dif_uart,
      riscv_crt,
      sw_lib_irq_handlers,
      device_lib,
      sw_lib_testing_test_status,
    ],
  )

  target_name = 'test_bus_ctrl_@0@_' + device_name

  test_bus_ctrl_dis = custom_target(
    target_name.format('dis'),
    input: test_bus_ctrl_elf,
    kwargs: elf_to_dis_custom_target_args,
  )

  test_bus_ctrl_bin = custom_target(
    target_name.format('bin'),
    input: test_bus_ctrl_elf,
    kwargs: elf_to_bin_custom_target_args,
  )

  test_bus_ctrl_vmem32 = custom_target(
    target_name.format('vmem32'),
    input: test_bus_ctrl_bin,
    kwargs: bin_to_vmem32_custom_target_args,
  )

  test_bus_ctrl_vmem64 = custom_target(
    target_name.format('vmem64'),
    input: test_bus_ctrl_bin,
    kwargs: bin_to_vmem64_custom_target_args,
  )

  custom_target(
    target_name.format('export'),
    command: export_target_command,
    depend_files: [export_target_depend_files,],
    input: [
      test_bus_ctrl_elf,
      test_bus_ctrl_dis,
      test_bus_ctrl_bin,
      test_bus_ctrl_vmem32,
      test_bus_ctrl_vmem64,
    ],
    output: target_name.format('export'),
    build_always_stale: true,
    build_by_default: true,
  )
endforeach
