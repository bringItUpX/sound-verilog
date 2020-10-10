`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:39:56 PM
// Design Name: 
// Module Name: control
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

module control(
 input clk_50m,
 //input SD_clk,
 input rst_n,
 
 //input data_come,
 
 
 //output reg [31:0]read_sec,
 
 //output read_SD,
 
 //input [7:0]mydata,
 //input myvalid,
 input wav_rden,
 output reg [15:0] wav_data
    );
    parameter MAX_RAM=43;
    reg [15:0] myram[MAX_RAM:0];
    reg [7:0] ram_raddr;
    //initial $readmemh ("/home/user/Dokumente/ax7015/i2s_sinussignal_1/i2s_sinussignal_1.srcs/sources_1/imports/rtl/sin1kHz1ms.hex", myram);
    initial $readmemh ("sin1kHz1ms.hex", myram);
    /*integer i;
    initial begin
      for (i=0;i<16;i=i+1)
        myram[i] = i+1;
    end*/
    initial ram_raddr<=8'b0;
    always @(posedge clk_50m)
    begin
        if(!rst_n) begin
            ram_raddr<=8'b0;
        end
        else if(wav_rden) 
            if (ram_raddr>MAX_RAM-1)
              ram_raddr<=8'b0;
            else
              ram_raddr<=ram_raddr+8'b1;
    end
    
    //如果rden有效，16bit数据输出
    always @(posedge clk_50m)
    begin
        if(wav_rden)
           wav_data<=myram[ram_raddr];    
        else 
           wav_data<=wav_data;        
        
    end        

endmodule
