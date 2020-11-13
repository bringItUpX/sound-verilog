#different clock examples:

#form Alinx Board led example 
#set_property PACKAGE_PIN Y14 [get_ports sys_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
#create_clock -period 20.000 -name sys_clk -waveform {0.000 10.000} [get_ports sys_clk]


#created in my Artix Projekt
#set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];

#created with Clock Wizard for this Zynq-7000 Alinx Board project
#create_clock -period 20.000 -name clk_50m -waveform {0.000 10.000} [get_ports clk_50m]
#create_generated_clock -name mywav_inst/reg_config_inst/clock_20k_reg_0 -source [get_ports clk_50m] -divide_by 2500 [get_pins mywav_inst/reg_config_inst/clock_20k_reg/Q]

#clock definitions:

set_property PACKAGE_PIN Y14 [get_ports clk_50m]
set_property IOSTANDARD LVCMOS33 [get_ports clk_50m]
create_clock -period 20.000 -name clk_50m -waveform {0.000 10.000} [get_ports clk_50m]

create_generated_clock -name mywav_inst/reg_config_inst/clock_20k_reg_0 -source [get_ports clk_50m] -divide_by 2500 [get_pins mywav_inst/reg_config_inst/clock_20k_reg/Q]

#Pin definitions for the AN831 I2S DAC from Alinx with the WM8731 dac chip from wolfson:
set_property PACKAGE_PIN Y13 [get_ports DACDAT]
set_property IOSTANDARD LVCMOS33 [get_ports DACDAT]

set_property PACKAGE_PIN P3 [get_ports DACLRC]
set_property IOSTANDARD LVCMOS33 [get_ports DACLRC]

set_property PACKAGE_PIN Y12 [get_ports BCLK]
set_property IOSTANDARD LVCMOS33 [get_ports BCLK]

set_property PACKAGE_PIN M2 [get_ports I2C_SDAT]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SDAT]

set_property PACKAGE_PIN M1 [get_ports I2C_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SCLK]

#switch of the Alinx AX7015 FPGA board with a Xilinx Zynq 7015 FPGA: 
set_property PACKAGE_PIN AB12 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

#LED's of the AX7015 board:
set_property PACKAGE_PIN A5 [get_ports debugLED1]
set_property IOSTANDARD LVCMOS33 [get_ports debugLED1]
set_property PACKAGE_PIN A7 [get_ports debugLED2]
set_property IOSTANDARD LVCMOS33 [get_ports debugLED2]
