`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:13 04/15/2015 
// Design Name: 
// Module Name:    PointsDecoder 
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
//If any column (100's, 10's, 1's, etc.) is 5 or greater, add 3 to that column.
//Shift all #'s to the left 1 position.
//If 8 shifts have been performed, it's done! Evaluate each column for the BCD values.
//Go to step 1. 
module PointsDecoder(
			 
			input [9:0] points, 
			output  [3:0] c1,  // hundreds
			output  [3:0] c2, // tens
			output  [3:0] c3  // units
    );

reg [3:0] units;
reg [3:0] tens;
reg [3:0] hundreds;
integer i;
		
		always @(points)
			begin
					hundreds=4'd0;
					tens=4'd0;
					units=4'd0;
					
			for(i=9; i>=0; i=i-1)
				begin
						if(hundreds>=5)
								hundreds=hundreds+3;
						if(tens>=5)
								tens=tens+3;
						if(units>=5)
								units=units+3;
								
			hundreds=hundreds<<1;
			hundreds[0]=tens[3];
			tens=tens<<1;
			tens[0]=units[3];
			units=units<<1;
			units[0]= points[i];
			
			end
		end

				
wire [11:0] digit;
assign digit[3:0] = units;
assign digit[7:4] = tens;
assign digit[11:8] = hundreds;

leveldecoder Levdec_u (.level(digit[3:0]),.c0(c3));
leveldecoder Levdec_t (.level(digit[7:4]),.c0(c2));
leveldecoder Levdec_h (.level(digit[11:8]),.c0(c1));
/*

	
 always @(*)
	begin
	case (units)
		0: c3 = 8'b11000000;
		1: c3 = 8'b11111001;
		2: c3 = 8'b10100100;
		3: c3 = 8'b10110000;
		4: c3 = 8'b10011001;
		5: c3 = 8'b10010010;
		6: c3 = 8'b10000010;
		7: c3 = 8'b11111000;
		8: c3 = 8'b10000000;
		9: c3 = 8'b10010000;
		default: c3 = 8'b11111101;
		
		endcase
				
	case (tens)
		0: c2 = 8'b11000000;
		1: c2 = 8'b11111001;
		2: c2 = 8'b10100100;
		3: c2 = 8'b10110000;
		4: c2 = 8'b10011001;
		5: c2 = 8'b10010010;
		6: c2 = 8'b10000010;
		7: c2 = 8'b11111000;
		8: c2 = 8'b10000000;
		9: c2 = 8'b10010000;
		default: c2 = 8'b11111101;
		
		endcase
	case (hundreds)
		0: c1 = 8'b11000000;
		1: c1 = 8'b11111001;
		2: c1 = 8'b10100100;
		3: c1 = 8'b10110000;
		4: c1 = 8'b10011001;
		5: c1 = 8'b10010010;
		6: c1 = 8'b10000010;
		7: c1 = 8'b11111000;
		8: c1 = 8'b10000000;
		9: c1 = 8'b10010000;
		default: c1 = 8'b11111101;
		
		endcase
	end
*/
					
endmodule


