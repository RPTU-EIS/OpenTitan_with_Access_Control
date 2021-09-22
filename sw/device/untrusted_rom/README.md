---
title: "Test Untrusted ROM"
author: Dino Mehmedagić
---


## Untrusted core software

This is a demo program meant to run on the untrusted core's own ROM memory. It uses the SoC's UART 1 peripheral to display messages
sent to it by the main core (char by char). It can be run with the "test_slave" program running on the main core to demonstrate the
slave functionality of the added core. Alternatively, it can be run with the "test_bus_ctrl" program running on the main core,
demonstrating the ability of the main core to block access of the untrusted core to selected peripherals (in this case UART 1).