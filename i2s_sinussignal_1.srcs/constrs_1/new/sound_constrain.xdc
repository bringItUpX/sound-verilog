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

#clock definition:

set_property PACKAGE_PIN Y14 [get_ports clk_50m]
set_property IOSTANDARD LVCMOS33 [get_ports clk_50m]
create_clock -period 20.000 -name clk_50m -waveform {0.000 10.000} [get_ports clk_50m]
create_generated_clock -name mywav_inst/reg_config_inst/clock_20k_reg_0 -source [get_ports clk_50m] -divide_by 2500 [get_pins mywav_inst/reg_config_inst/clock_20k_reg/Q]

set_property PACKAGE_PIN Y13 [get_ports DACDAT]
set_property IOSTANDARD LVCMOS33 [get_ports DACDAT]
