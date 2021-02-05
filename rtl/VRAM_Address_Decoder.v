module VRAM_Address_Decoder(
	input					clk,
	input			[9:0]		px,
	input			[9:0]		py,
	output reg	[19:0]	address
);

`include	"../Libs/MyModules/VGA_Params.h"

always @(posedge clk) begin
	address <= px + (pixelsH * py);
end

endmodule