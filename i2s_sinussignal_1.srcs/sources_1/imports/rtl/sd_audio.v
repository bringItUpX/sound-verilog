`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    sd_audio 
//////////////////////////////////////////////////////////////////////////////////
module sd_audio(
					input  clk_50m,           //50Mhz clock input
					input rst_n,
					output SD_clk,
					
					
					input DACLRC,
					input BCLK,
					output DACDAT,
					
					output I2C_SCLK,
					inout I2C_SDAT
				   
					
    );

wire [15:0] wav_data = 16'hABCD;
wire wav_rden;

wire [31:0]read_sec;
wire read_SD;

wire [7:0]mydata_o;
wire myvalid_o;

wire [7:0]rx_o;
wire init_o;
wire read_o;



//����wm8731�Ĳ���
mywav	mywav_inst(
	.clk50M(clk_50m),
	
	.wav_data(wav_data),
	.myvalid(wav_rden),
	
	.DACLRC(DACLRC),
	.BCLK(BCLK),
	.DACDAT(DACDAT),
	
	.I2C_SCLK(I2C_SCLK),
	.I2C_SDAT(I2C_SDAT)
);

endmodule
