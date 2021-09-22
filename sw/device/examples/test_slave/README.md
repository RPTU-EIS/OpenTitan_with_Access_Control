---
title: "Test Slave"
author: Dino Mehmedagić
---


## Slave Test program

This is a demo program meant to run on the main core's flash memory. It uses the SoC's UART 0 peripheral to prompt the user to
enter a character that will then be sent to the untrusted core. It can be run with the "untrusted_sw" program running on the 
untrusted core to demonstrate the slave functionality of the added core.