`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    sd_audio 
//////////////////////////////////////////////////////////////////////////////////
module sd_audio(
					input  clk_50m,           //50Mhz clock input
					input rst_n,
					//output SD_clk,
					
					
					input DACLRC,
					input BCLK, //BCLK posedge -> new DACDAT, else constant DACDAT
					output DACDAT, // input for I2S DAC
					
					output I2C_SCLK, // to control I2C DAC
					inout I2C_SDAT // serial data
				   
					
    );

reg [15:0] wav_data = 16'hABCD;
wire wav_rden;

wire [31:0]read_sec;
//wire read_SD;

wire [7:0]mydata_o;
wire myvalid_o;

wire [7:0]rx_o;
wire init_o;
wire read_o;
reg [15:0] myram[43:0];
reg [12:0] ram_raddr;

initial $readmemh ("1kHz1ms.hex", myram);

always @(posedge clk_50m)
begin
	if(!rst_n) begin
		ram_raddr<=0;
	end
	else if(wav_rden) 
    	if (ram_raddr>43)
	      ram_raddr<=0;
	    else
	      ram_raddr<=ram_raddr+1;
end

//如果rden有效，16bit数据输出
always @(posedge clk_50m)
begin
	if(wav_rden)
	   wav_data<=myram[ram_raddr];	
	else 
	   wav_data<=wav_data;		
end		

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
