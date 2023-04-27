`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 03:28:21 PM
// Design Name: 
// Module Name: ball_movement_test
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


module ball_movement_test(

    );
    
    reg clk;
    reg but_1;
    reg but_2;
    reg reset;
    wire [15:0] led;
    
    ball_movement dut(.clk(clk), .but_1(but_1), .but_2(but_2), .reset_clk(reset),  .led(led));
    
    always #50 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        
        #100 reset = 0;
        
        #100 but_1 = 1;
        #230 but_1 = 0;
         but_2 = 0;
         
         #2980 but_2 = 1;
         #3050 but_2 = 0;
        
    end
        
endmodule
