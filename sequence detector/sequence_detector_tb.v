module sequence_detector_tb;

reg in, clk, reset;
wire out;

sequence_detector inst1(in, clk, reset, out);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
in = 0;
reset = 1;
#30;
	reset = 0;
#40;
	in = 1;
#10;
	in = 0;
#10;
	in = 1;
#20;
	in = 0;
#20;
	in =1;
#20;
	in = 0;
end

endmodule