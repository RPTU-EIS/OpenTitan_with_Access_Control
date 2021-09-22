---
title: "Test Bus Control"
author: Dino Mehmedagić
---


## Test Bus Control

This is a demo program meant to run on the main core's flash memory. It uses the SoC's UART 0 peripheral to communicate with the
user. By entering "1", the user commands the core to configure the bus security mechanism to upgrade the UART 1 peripheral to a
secure environment. It can be run with the "untrusted_sw" program running on the untrusted core, which increments an integer
variable and displays its value in a loop via UART 1. However, when UART 1 gets moved to the secure environment, the untrusted core
should no longer have access to it.