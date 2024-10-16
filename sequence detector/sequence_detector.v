module sequence_detector(input in, input clk, input reset, output reg out);
parameter A = 3'b000, B = 3'b001, C = 3'b011, D = 3'b010, E = 4'b110;
reg [2:0] curr_state, next_state;

always @(posedge clk) begin
	if(reset)
		curr_state <= A;
	else
		curr_state <= next_state;
end
//combinational block
always @(*) begin
	case(curr_state)
		A: next_state = in ? B : A;
		B : next_state = in ? B : C;
		C : next_state = in ? D : A;
		D : next_state = in ? E : C;
		E : next_state = in ? A : C;
		default: next_state = A;
	endcase
end

always @(*) begin
	case(curr_state)
		A: out = 1'b0;
		B : out = 1'b0;
		C : out = 1'b0;
		D: out = 1'b0;
		E: out = 1'b1;
		default: out = 1'b0;
	endcase
end
endmodule