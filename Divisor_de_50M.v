`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:15 08/18/2016 
// Design Name: 
// Module Name:    Divisor_de_50M 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Divisor_de_50M(
    input clkglobal,
    input reset,
    output reg clk25M
    );
always @(posedge clkglobal)
	begin
	if (~reset)
		clk25M <= 1'b0;
	else
		clk25M <= ~clk25M;	
	end
endmodule


