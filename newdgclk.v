module newdgclk(rst,clk,qsec,qmin,qhr);
input rst,clk;
output reg [5:0] qsec,qmin;
output reg [4:0] qhr;
always @(posedge clk)
	begin
	if(rst==1)
		begin
		qsec<=6'b000000;
		qmin<=6'b000000;
		qhr<=5'b00000;
		end
	else
		begin
		qsec<=qsec+1;
		    if(qsec==6'b111011)
			begin
			qmin<=qmin+1;
			qsec<=0;
			end
		    if(qmin==6'b111011)
			begin
			qhr<=qhr+1;
			qmin<=0;
			end
		    if(qhr==5'b10111)
			begin
			qhr<=0;
			end
	  	end
	end
endmodule
