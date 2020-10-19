`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mywav(
	clk50M,
	
	wav_data,
	myvalid,
	
	DACLRC,
	BCLK,
	DACDAT,
	
	I2C_SCLK,
	I2C_SDAT
);


input 	clk50M;

input [15:0] wav_data;
output myvalid;


input 	DACLRC;
input 	BCLK;
output 	DACDAT;

output 	I2C_SCLK;
inout 	I2C_SDAT;


wire	rst_n;



//�?�?延时65536*20ns
reset_delay	reset_delay_inst(
	.clock_50m(clk50M),
	.rst_n(rst_n));

//�?置WM8731的寄存器
reg_config	reg_config_inst(
	.clock_50m(clk50M),
	.i2c_sclk(I2C_SCLK),
	.i2c_sdat(I2C_SDAT),
	.reset_n(rst_n)
	);

//�?��?音频数�?�,right justified, 16bits
sinwave_gen sinwave_gen_inst(
	.clock_50M(clk50M),
	.wav_data(wav_data),
	.dacclk(DACLRC),
	.bclk(BCLK),
	.dacdat(DACDAT),
	.myvalid(myvalid)
	);

endmodule
