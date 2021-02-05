module VRAM_Address_Decoder(
	input					clk,
	input			[9:0]		px,
	input			[9:0]		py,
	output reg	[15:0]	address
);

`include	"VGA_Params.h"

always @(posedge clk) begin
	address <= (px + (pixelsH * py)) >> 2;
end

endmodule