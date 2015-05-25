
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:43 04/29/2015 
// Design Name: 
// Module Name:    sevensegmentdisplay_top 
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
module sevensegmentdisplay_top(
    input clock,
    input [9:0] points,
    input [3:0] level,
    output [3:0] ANx,
    output [7:0]Cx

    );
	 
	 wire [7:0] w_C0;
	 wire [7:0] w_C2;
	 wire [7:0] w_C1;
	 wire [7:0] w_C3;
	 
PointsDecoder PD(.points(points), .c3(w_C3), .c2(w_C2), .c1(w_C1));
leveldecoder LevD(.level(level), .c0(w_C0));
DigitSelector DS (.clock(clock), .c3(w_C3), .c2(w_C2), .c1(w_C1), .c0(w_C0), .ANx(ANx), .Cx(Cx));

endmodule
