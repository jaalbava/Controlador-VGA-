`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:20 08/21/2016 
// Design Name: 
// Module Name:    Color_case 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module color_case(
		color_rgb,
		px_color
);

input wire [2:0] color_rgb;
output reg [2:0] px_color;


always @*
	case(color_rgb) //hay que crear las variables rgb (viene desde los switches) y color (tipo reg) ambas de 3 bits
						3'b000:
							begin
							px_color= 3'b000;
							end

						3'b001:
							begin
							px_color= 3'b001;
							end

						3'b010:
							begin
							px_color= 3'b010;
							end

						3'b011:
							begin
							px_color= 3'b011;
							end

						3'b100:
							begin
							px_color= 3'b100;
							end

						3'b101:
							begin
							px_color= 3'b101;
							end

						3'b110:
							begin
							px_color= 3'b110;
							end

						3'b111:
							begin
							px_color= 3'b111;
							end
							
						default: 
							begin
							px_color= 3'b111;
							end
				endcase

endmodule 