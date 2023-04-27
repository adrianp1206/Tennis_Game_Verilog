`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 08:07:34 PM
// Design Name: 
// Module Name: tennisballmove_test
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


module tennisballmove_test(

    );
    
    reg clk;
    reg but_p1;
    reg but_p2;
    reg reset_clk;
    wire [15:0] led;
    
    top tb( .clk(clk), .but_1(but_p1), .but_2(but_p2), .reset_clk(reset_clk), .led(led));
    
    always #100 clk = ~clk;
    
    initial begin
        clk = 0;
        reset_clk = 1;
        #50 reset_clk = 0;
        #50 but_p1 = 1;
        #4800 but_p1 = 0; 
        but_p2 = 0;
        #2750 but_p2 = 1;
        #150 but_p2 = 0;
        
        #20000 but_p2 = 1;
        #100 but_p2 = 0;
   end
endmodule
