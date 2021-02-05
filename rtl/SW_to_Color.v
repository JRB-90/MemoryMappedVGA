module SW_to_Color(
	input						clk,
	input			[9:0]		sw,
	output reg	[11:0]	col
);

always @(posedge clk) begin
	col <= sw * 4;
end

endmodule