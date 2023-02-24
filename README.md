# OpenTitan

![OpenTitan logo](https://docs.opentitan.org/doc/opentitan-logo.png)


## Regarding UPEC-OI

This is a copy of the original OpenTitan repo which can be found [here](https://github.com/lowRISC/opentitan).
This repo contains a modified OpenTitan
HW design with a primitive SoC-level access control mechanism, as well as added
dummy components which model malicious IPs. Several scripts were added to help the
verification process:
1) open_earlgrey_upec.tcl can be used to load a miter model of the design into
OneSpin and run the property check.
2) rerun_earlgrey_upec.tcl can rerun a property check on an already loaded HW model.
3) extract_signal_sva.tcl can extract all state signals from the miter model, which
is useful when constructing the UPEC-OI property macros.

The RTL files for the design are located in the hw folder. These are the files used
by the Verilator simulation environment. However, OneSpin loads RTL files from the
build-onespin/lowrisc_systems_chip_earlgrey_verilator_0.1/src directory, due to a
nicer folder structure there. Therefore, when modifying an RTL file, first change
it in the hw folder, confirm design functionality with simulation, and then replace
the corresponding file in the build-onespin directory. The new design can then be
loaded into OneSpin for formal verification.

The already existing UPEC-OI verification files are in the hw/upec/ directory.

## About the project

[OpenTitan](https://opentitan.org) is an open source silicon Root of Trust
(RoT) project.  OpenTitan will make the silicon RoT design and implementation
more transparent, trustworthy, and secure for enterprises, platform providers,
and chip manufacturers.  OpenTitan is administered by [lowRISC
CIC](https://www.lowrisc.org) as a collaborative project to produce high
quality, open IP for instantiation as a full-featured product. See the
[OpenTitan site](https://opentitan.org/) and [OpenTitan
docs](https://docs.opentitan.org) for more information about the project.

## About this repository

This repository contains hardware, software and utilities written as part of the
OpenTitan project. It is structured as monolithic repository, or "monorepo",
where all components live in one repository. It exists to enable collaboration
across partners participating in the OpenTitan project.

## Documentation

The project contains comprehensive documentation of all IPs and tools. You can
access it [online at docs.opentitan.org](https://docs.opentitan.org/).

## How to contribute

Have a look at [CONTRIBUTING](./CONTRIBUTING.md) and our [documentation on
project organization and processes](https://docs.opentitan.org/doc/project/)
for guidelines on how to contribute code to this repository.

## Licensing

Unless otherwise noted, everything in this repository is covered by the Apache
License, Version 2.0 (see [LICENSE](./LICENSE) for full text).
