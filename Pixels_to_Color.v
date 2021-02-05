module Pixels_to_Color(
	input						clk,
	input			[9:0]		px,
	input			[9:0]		py,
	output reg	[11:0]	color
);

always @(posedge clk) begin
	if (px >= 40 && px < 60) begin
		color <= 12'b111100000000;
	end else begin
		color <= 0;
	end
end

endmodule