module VGA_Controller(
	input						clk,
	input			[11:0]	color,
	
	output reg				is_drawing,
	output reg	[9:0] 	px,
	output reg	[9:0] 	py,
	output reg				vga_hs,
	output reg				vga_vs,
	output reg	[3:0]		vga_r,
	output reg	[3:0]		vga_g,
	output reg	[3:0]		vga_b
);

`include	"VGA_Params.h"

initial begin
	is_drawing = 1'b0;
	px = 0;
	py = 0;
	vga_hs = 1'b0;
	vga_vs = 1'b0;
	vga_r = 4'b0000;
	vga_g = 4'b0000;
	vga_b = 4'b0000;
end

always @(posedge clk) begin
	is_drawing <= (px < pixelsH) && (py < pixelsV);
end

always @(posedge clk) begin
	vga_hs <= ~((px >= (pixelsH + frontH)) && (px <= (pixelsH + frontH + syncH)));
	vga_vs <= ~((py >= (pixelsV + frontV)) && (py <= (pixelsV + frontV + syncV)));
end

always @(posedge clk) begin
	if (px == sizeH) begin
		px <= 0;
	end else begin
		px <= px + 1;
	end
end

always @(posedge clk) begin
	if (px == sizeH) begin
		if (py == sizeV) begin
			py <= 0;
		end else begin
			py <= py + 1;
		end
	end
end

always @(posedge clk) begin
	if (is_drawing) begin
		vga_r <= color[3:0];
		vga_g <= color[7:4];
		vga_b <= color[11:8];
	end else begin
		vga_r <= 4'b0000;
		vga_g <= 4'b0000;
		vga_b <= 4'b0000;
	end
end

endmodule
