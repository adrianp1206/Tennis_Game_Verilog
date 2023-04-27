`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 06:15:39 PM
// Design Name: 
// Module Name: top_testbench
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


module top_testbench(

    );
    reg clk;
    reg but_1;
    reg but_2;
    reg reset;
    wire [15:0] led;
    
    top dut(.clk(clk), .but_1(but_1), .but_2(but_2), .reset_clk(reset),  .leds(led));
    
    always #50 clk = ~clk;
    
    initial begin
        clk = 0;        
        #100 reset = 0;
        #200 reset = 1;
        #10 reset = 0;
        
        #100 but_1 = 1;
        #4200 but_1 = 0;
            but_2 = 0;
         
         //#2980 but_2 = 1;
         //#3050 but_2 = 0;
        
    end
        
endmodule

