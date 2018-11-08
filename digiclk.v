module tb_clock;
    reg Clk_1sec;
    reg reset;

  wire [5:0] qsec;
  wire [5:0] qmin;
  wire [4:0] qhr;

 
    newdg tb (
        .clk(Clk_1sec), 
        .rst(reset), 
      .qsec(qsec), 
      .qmin(qmin), 
      .qhr(qhr)
    );
 
    initial Clk_1sec = 0;
    always #50 Clk_1sec = ~Clk_1sec;  

    	initial
		begin
		reset = 1;
		
		#100;
		reset = 0;  
	      
		$monitor("hr= %d min= %d  sec= %d",qhr,qmin,qsec);

		end
  
endmodule
