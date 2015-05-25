

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:53 04/29/2015 
// Design Name: 
// Module Name:    DigitSelector 
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
module DigitSelector(  
			input [7:0] c0,
			input [7:0] c1,
			input [7:0] c2,
			input [7:0] c3,
			input clock,
			output [3:0] ANx,
			output [7:0] Cx
);


			reg[7:0] segm;
			reg[3:0] anode;
			reg[2:0] digit = 1;
	
			reg[19:0] counter = 0;

	 //d = t*f ; t = 16ms ; d = 16*10^-3*50*10^6 = 800 000 cicli
    //digit_period = 800 000/4 = 200 000 cicli
    //refreshed at every 16ms (60Hz)
	 
		always@(negedge clock)
		begin
			if (digit == 1)
        begin
            if (counter == 200000)
                begin
                    digit = 2;
						  segm = c3;
                end
            else
                begin
                counter = counter + 1;
                end
        end
    else if (digit == 2)
        begin
            if (counter == 400000)
                begin
                    digit = 3;
						  segm = c2;
                end
            else
                begin
                    counter = counter + 1;
                   
                end
        end
    else if (digit == 3)
        begin
            if (counter == 600000)
                begin
                    digit = 4;
						  segm = c1;
                end
            else
                begin
                    counter = counter + 1;
                  
                end
        end
    else if (digit == 4)
        begin
            if (counter == 800000)
                begin
                    digit = 1;
						  segm = c0;
                    counter = 0;
                end 
            else
                begin
                    counter = counter + 1;
                 
                end
        end 
end

always@(*)
	begin
    case(digit)
        0: anode = 4'b1111; //toate stinse
        4: anode = 4'b1110; //AN0
        3: anode = 4'b1101; //AN1
        2: anode = 4'b1011; //AN2
        1: anode = 4'b0111; //AN3
        default:
        anode = 4'b1111; 
    endcase
	 end

assign {Cx[7],Cx[6],Cx[5],Cx[4],Cx[3],Cx[2],Cx[1],Cx[0]} = segm;
assign ANx = anode;

endmodule
