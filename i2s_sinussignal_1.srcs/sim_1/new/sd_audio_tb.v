`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 12:07:34
// Design Name: 
// Module Name: sd_audio_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sd_audio_tb(

    );
    reg clk_50m;           //50Mhz clock input
    reg rst_n;

    reg DACLRC;
    reg BCLK;
    wire DACDAT;

    wire I2C_SCLK;
    wire I2C_SDAT;


//  Unit under Test (UUT)

sd_audio uut(
    .clk_50m (clk_50m),
    .rst_n (rst_n),
    .DACLRC (DACLRC),
    .BCLK (BCLK),
    .DACDAT (DACDAT),
    .I2C_SCLK (I2C_SCLK),
    .I2C_SDAT (I2C_SDAT));
    
initial 
   begin
   clk_50m = 0;
   BCLK = 0;
   rst_n = 0; 
   DACLRC = 0;  
   end 

   always
   #1 clk_50m = ! clk_50m;
     
   always 
   #14  BCLK =  ! BCLK;
   
   always 
   #448  DACLRC = ! DACLRC;
   
initial
   begin
   #448;
   rst_n = 1;
   end

initial
   begin
   #1000
   $finish;
   end
endmodule
