`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:54 04/15/2015 
// Design Name: 
// Module Name:    leveldecoder 
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

	module leveldecoder(
		input [3:0] level,
		output reg [7:0] c0
    );
	always @ (level) begin
	 case(level)
	 
			0: c0= 8'b11000000;
			1: c0= 8'b11111001;
			2: c0= 8'b10100100;
			3: c0= 8'b10110000;
			4: c0= 8'b10011001;
			5: c0= 8'b10010010;
			6: c0= 8'b10000010;
			7: c0= 8'b11111000;
			8: c0= 8'b10000000;
			9: c0= 8'b10010000;
			default: c0= 8'b10000110; 
			
	 endcase
	 end
	 
	 endmodule  
