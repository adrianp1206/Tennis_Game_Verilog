`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 06:54:03 PM
// Design Name: 
// Module Name: clkdividerpart3
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


module clkdividerpart3(

    input clk_in,
	input rst,
	input [26:0] toggle_value,
	output reg divided_clk
    );
	 
	 

reg[26:0] cnt;

always@(posedge clk_in or posedge rst)
begin
	if (rst==1) begin
		cnt <= 0;
		divided_clk <= 0;
	end
	else begin
		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clk <= ~divided_clk;
		end
		else begin
			cnt <= cnt +1;
			divided_clk <= divided_clk;		
		end
		end
		end
	
	endmodule

