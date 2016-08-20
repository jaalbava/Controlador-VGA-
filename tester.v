`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:34:05 08/19/2016
// Design Name:   vga_sync
// Module Name:   D:/TEC/8 SEMESTRE/LAB SISTEMAS DIGITALES/Controlador VGA/vga_sync/tester.v
// Project Name:  vga_sync
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_sync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tester;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire hsync;
	wire vsync;
	wire video_on;
	wire p_tick;
	wire [9:0] pixel_x;
	wire [9:0] pixel_y;

	// Instantiate the Unit Under Test (UUT)
	vga_sync uut (
		.clk(clk), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync), 
		.video_on(video_on), 
		.p_tick(p_tick), 
		.pixel_x(pixel_x), 
		.pixel_y(pixel_y)
	);
	
	
	always begin #5 clk=~clk;end
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#10 reset=1;  
		
		#10 reset=0;
		// Add stimulus here
		
	end   
endmodule

