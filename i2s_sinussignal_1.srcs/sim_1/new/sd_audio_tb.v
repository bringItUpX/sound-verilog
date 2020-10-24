`timescale 1ns / 1ps
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
    reg clk_125m;           //50Mhz clock output
    reg rst_n;

    reg DACLRC;
    reg BCLK;
    wire DACDAT;

    wire I2C_SCLK;
    wire I2C_SDAT;
    wire input_I2C_SDAT;
    reg output_SDAT_valid;
    reg output_value_SDAT;

//  Unit under Test (UUT)

sd_audio uut(
    .clk_125m (clk_125m),
    .rst_n (rst_n),
    .DACLRC (DACLRC),
    .BCLK (BCLK),
    .DACDAT (DACDAT),
    .I2C_SCLK (I2C_SCLK),
    .I2C_SDAT (I2C_SDAT));

assign input_I2C_SDAT = I2C_SDAT;
assign I2C_SDAT = (output_SDAT_valid==1'b1)? output_value_SDAT : 1'hz;

   initial clk_125m = 0;
   always #4 clk_125m = ! clk_125m;
   
   always
   begin
       BCLK = 0;
       #20000000
   //always #14  BCLK =  ! BCLK;
       DACLRC = 0;
   //always #448  DACLRC = ! DACLRC;
       while (1) begin
           #354  BCLK =  ! BCLK;  // one bit clock period is 708,6ns ->708ns
       end
   end
   
   always
   begin
       DACLRC = 0;
       #20000000
       while (1) begin
           #11328  DACLRC = ! DACLRC;  // 16 bit clocks
       end
   end
   
   
initial
   begin
   rst_n = 0; 
   #448;
   rst_n = 1;
   end


always@(posedge I2C_SCLK)
begin
    if (uut.mywav_inst.reg_config_inst.u1.cyc_count == 12 ||
    uut.mywav_inst.reg_config_inst.u1.cyc_count == 21 ||
    uut.mywav_inst.reg_config_inst.u1.cyc_count == 30) begin
        output_SDAT_valid <= 1'b1;
        output_value_SDAT <= 1'b0;
        end
    else begin
        output_SDAT_valid <= 1'b0;
        output_value_SDAT <= 1'b1;
    end  
end

initial
   begin
   #50000000
   $finish;
   end
endmodule
