module sinwave_gen(clock_50M,wav_data,dacclk,bclk,dacdat,myvalid);

	input clock_50M;       
    input  [15:0] wav_data;
    input dacclk;   
    input bclk;     
    output dacdat;
    output reg myvalid;
	 
	reg dacdat;
    //reg dacclk;
    //reg [11:0]dacclk_cnt;
    //reg bclk;
    //reg [11:0]bclk_cnt;
	 
    reg [4:0]data_num;
    //reg [15:0]sin_out;
   
   
    parameter CLOCK_REF=50000000;
    parameter CLOCK_SAMPLE=44100;
	 
   reg dacclk_a,dacclk_b;
	
   //检测dacclk信号的跳变
   always@(posedge clock_50M )  
	begin
		dacclk_a<=dacclk;
		dacclk_b<=dacclk_a;
	end
	
   always@(posedge clock_50M )    
    begin
		if(dacclk_a!=dacclk_b)
         begin
				myvalid<=1'b1;      //dacclk跳变时,读ram有效
         end
       else
			begin
				myvalid<=1'b0;
			end
     end  
	  
	//检测bclk时钟跳变  
   reg bclk_a,bclk_b;
     always@(posedge clock_50M ) 
	  begin
		bclk_a<=bclk;
		bclk_b<=bclk_a;
	  end
	  
	/*reg addr_ready;  
	initial addr_ready = 2;*/
	initial data_num = 5'd15;
    always@(posedge clock_50M)    
    begin
		if(dacclk_a!=dacclk_b)             //发送左声道16bit和右声道16bit
		begin
			data_num<=5'd15;
			//dacdat[data_num]<=wav_data[data_num];
	    end
		else if(!bclk_a && bclk_b)           //bclk 下降沿,数据变化    
		begin    
			data_num<=data_num-5'b1;
			//dacdat[data_num]<=wav_data[data_num];
	    end
	end

    //posedge clock_50M
    //assign dacdat[data_num] <= wav_data[data_num];
    always@(posedge clock_50M)
    begin
        dacdat<=wav_data[data_num];     //产生DA转换器数字音频数据
    end
endmodule