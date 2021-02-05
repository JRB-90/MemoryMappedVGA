module VRAM_Address_Decoder(
	input						clk,
	input			[9:0]		px,
	input			[9:0]		py,
	output reg	[15:0]	address
);

`include	"VGA_Params.h"

always @(posedge clk) begin
	address <= (px >> 1) + ((pixelsH >> 1) * (py >> 1));
end

endmodule