`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module testop;

	// Inputs
	reg clk;
	reg reset;
	reg swt1;
	reg swt2;
	reg swt3;

	// Outputs
	wire vsync;
	wire hsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	TOP_VGA uut (
		.clk(clk), 
		.reset(reset), 
		.swt1(swt1), 
		.swt2(swt2), 
		.swt3(swt3), 
		.vsync(vsync), 
		.hsync(hsync), 
		.rgb(rgb_next)
	);


		always
		begin 
		#5 clk = ~clk;
		end
		
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		swt1 = 0;
		swt2 = 0;
		swt3 = 0;

		// Wait 100 ns for global reset to finish
		
		
		#2 reset = 1;
		#2 reset = 0;
			swt1 = 1; //R
			swt2 = 0; //G
			swt3 = 0; //B
        
		// Add stimulus here

	end
      
endmodule

