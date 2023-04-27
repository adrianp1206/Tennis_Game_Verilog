`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 06:11:59 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top( input clk,
    input but_1,
    input but_2,
    input s_or_t,
    input reset_clk,
    output [15:0] led,
    output [7:0] AN,
    output [6:0] C

    );
   wire new_clk, score1, score2;
   
    PushButton_Debouncer pb1(new_clk, but_1, but_p1);
    PushButton_Debouncer pb2(new_clk, but_2, but_p2);
    tennisball_movement bm(clk, but_1, but_2, s_or_t, led, AN, C);
    
endmodule
