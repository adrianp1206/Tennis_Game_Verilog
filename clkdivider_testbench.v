`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 03:57:29 PM
// Design Name: 
// Module Name: clkdivider_testbench
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


module clkdivider_testbench(

    );
    
    reg clk;
    reg rst;
    wire divided_clk;
    
    clkdividerpart3 dut(.clk_in(clk), .rst(rst), .divided_clk(divided_clk));
    
    always #(10) clk = ~clk;
    
    initial begin 
    clk = 0;
    rst = 1;
    #50;
    rst = 0;
    #5000 $finish;
    end
endmodule
