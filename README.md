# FPGA project to generate a sin signal with a i2s sound chip and it's line out.

This is a project with Vivado 2017.4 and a Zynq FPGA (xc7z015clg485-2). This Zynq FPGA is assembled on the board AX7015 from the chinese company ALINX. This board is order able on amazon.com .

This AX7015 board has a 40 pin header and at which header the 40 pin sound card (AN831) from ALINX is attached. This attached sound card has an WM8731 DAC and ADC chip with microphone in jack, line in jack and line out jack. In this i2s_sinussignal_1 project we put an 1 kHz sin wave in the FPGA (a Verilog command load the file sin1kHz1ms.hex, this file is created through the adapted samples of a Windows .wav audio file) and this sin wave is outputed as i2s signal (DACDAT) to the attached sound card. Before the sound can be played (repeated over and over), the sound card need to be configured with the i2c bus. After this the sound chip knows that it is the i2s master (therefore the sound chip create the i2s clock) and has the right volume on the line out jack.

The verilog files for i2s communication (sinwave_gen.v) and i2c communication (reg_config.v, i2c_com.v) and most other files are created with the help of the example code from Alinx. They have many example projects. For example the AX7015 board has HDMI out / HDMI in and a PCI Express connector for using the card in the PCIe slot of a PC (personal computer). Therefore you can play for example with Linux and create a Linux PCIe driver for your own card. Fortunately Vivado contains a free PCIe IP which you can use (this IP translate from PCIe to AXI - a Bus from the company ARM). Vivado also helps you to create your own AXI IP and therefore you can connect your own AXI IP with the PCIe IP easily and then automaically you can reach the registers of your AXI IP from your PC CPU then the card is plugged in your PC (with an own driver).

To programm the AX7015 board you need the JTAG adapter (ALINX named this: USB cable). To install the JTAG USB Adapter the file "Vivado/2017.4/data/xicom/cable_drivers/lin64/install_script/install_drivers/install_digilent.sh" in your Vivado installation must be executed with "sudo install_digilent.sh"

Hints: The FPGA Development Environment Vivado is freely available from Xilinx for this lower end FPGAs like the Zynq 7z015. If you have no other licence, you need to install the free Webpack Version of Vivado.
If you wish to play with AXI and Vivado take a look to the Youtube Videos of Mohamed Sadri a post doctoral student of the TU Kaiserslautern in Germany. With these Videos it is really far more easy to do.
