# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

# ROM linker parameters.
#
# See sw/device/exts/common/flash_link.ld for additional info about these
# parameters.
rom_linkfile = files(['rom_link.ld'])
rom_link_args = [
  '-Wl,-L,@0@'.format(meson.source_root()),
  '-Wl,-T,@0@/@1@'.format(meson.source_root(), rom_linkfile[0]),
  '-Wl,--build-id=none',
]
rom_link_deps = [rom_linkfile]

foreach device_name, device_lib : sw_lib_arch_core_devices
  untrusted_sw_elf = executable(
    'untrusted_sw_' + device_name,
    sources: [
      'untrusted_sw.c',
      'irq_vector.S',
      'rom_crt.S',
    ],
    name_suffix: 'elf',
    link_args: rom_link_args,
    link_depends: rom_link_deps,
    dependencies: [
      sw_lib_crt,
      sw_lib_runtime_hart,
      sw_lib_runtime_print,
      sw_lib_flash_ctrl,
      sw_lib_pinmux,
      sw_lib_dif_gpio,
      sw_lib_dif_spi_device,
      sw_lib_dif_hmac,
      sw_lib_mmio,
      sw_lib_runtime_log,
      sw_lib_dif_uart,
      top_earlgrey,
      device_lib,
      sw_lib_testing_test_status,
    ],
  )

  target_name = 'untrusted_sw_@0@_' + device_name

  untrusted_sw_dis = custom_target(
    target_name.format('dis'),
    input: untrusted_sw_elf,
    kwargs: elf_to_dis_custom_target_args,
  )

  untrusted_sw_bin = custom_target(
    target_name.format('bin'),
    input: untrusted_sw_elf,
    kwargs: elf_to_bin_custom_target_args,
  )

  untrusted_sw_vmem32 = custom_target(
    target_name.format('vmem32'),
    input: untrusted_sw_bin,
    kwargs: bin_to_vmem32_custom_target_args,
  )

  untrusted_sw_vmem64 = custom_target(
    target_name.format('vmem64'),
    input: untrusted_sw_bin,
    kwargs: bin_to_vmem64_custom_target_args,
  )

  untrusted_sw_sim_dv_logs = []
  if device_name == 'sim_dv'
    untrusted_sw_sim_dv_logs = custom_target(
      'untrusted_sw_dv_logs',
      # untrusted_sw has additional RO data sections of interest to DV logging.
      command: extract_sw_logs_sim_dv_command,
      depend_files: [extract_sw_logs_sim_dv_depend_files,],
      input: untrusted_sw_elf,
      output: extract_sw_logs_sim_dv_outputs,
    )
  endif

  custom_target(
    target_name.format('export'),
    command: export_target_command,
    depend_files: [export_target_depend_files,],
    input: [
      untrusted_sw_elf,
      untrusted_sw_dis,
      untrusted_sw_bin,
      untrusted_sw_vmem32,
      untrusted_sw_vmem64,
      untrusted_sw_sim_dv_logs,
    ],
    output: target_name.format('export'),
    build_always_stale: true,
    build_by_default: true,
  )
endforeach
