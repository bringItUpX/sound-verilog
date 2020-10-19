module sinwave_gen(clock_50M,wav_data,dacclk,bclk,dacdat,myvalid);

	 input clock_50M;       
    input  [15:0]wav_data;
    input dacclk;        
    output dacdat;
    input bclk;
    output reg myvalid = 1;
	 
	 reg dacdat;
    //reg dacclk;
    reg [11:0]dacclk_cnt;
    //reg bclk;
    reg [11:0]bclk_cnt;
	 
    reg [4:0]data_num;
    reg [15:0]sin_out;
   
   
    parameter CLOCK_REF=50000000;
    parameter CLOCK_SAMPLE=44100;
	 
   reg dacclk_a,dacclk_b;
	
   //检测dacclk信�?�的跳�?�
   always@(posedge clock_50M )  
	begin
		dacclk_a<=dacclk;
		dacclk_b<=dacclk_a;
	end
	
   always@(posedge clock_50M )    
    begin
		if(dacclk_a!=dacclk_b)
         begin

				myvalid<=1'b1;      //dacclk跳�?�时,读ram有效
				
         end
       else
			begin
				myvalid<=1'b0;

			end
     end  
	  
	//检测bclk时钟跳�?�  
   reg bclk_a,bclk_b;
     always@(posedge clock_50M ) 
	  begin
		bclk_a<=bclk;
		bclk_b<=bclk_a;
	  end
	  
    always@(posedge clock_50M )    
    begin
		if(dacclk_a!=dacclk_b)             //�?��?左声�?�16bit和�?�声�?�16bit
			data_num<=15;
		else if(!bclk_a&&bclk_b)           //bclk 下�?沿,数�?��?�化        
			data_num<=data_num-1'b1;
	 end
			

  //posedge clock_50M
    
    always@(*) 
     begin
	     
        dacdat<=wav_data[data_num];     //产生DA转�?�器数字音频数�?�
	  
     end

  
     
endmodule

