module reset_delay(clock_125m,rst_n);    //复位延时65536*20ns
   input clock_125m;
   output rst_n;
   reg [19:0]cnt = 20'h00000;
   reg rst_n;
  
   always@(posedge clock_125m)
   begin
      if(cnt<20'h1ffff)  // was 16'hffff or from me 16'd896
      begin
        cnt<=cnt+1;
        rst_n<=0;
      end
      else
        rst_n<=1;       
   end
endmodule
