`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 03:53:36 PM
// Design Name: 
// Module Name: PushButton_Debouncer
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

module PushButton_Debouncer(
    input clk,
    input button,
    output reg clean);

    //reg [4:0] max = 30'b100100100100100100100100100101;
    reg [4:0] max = 3'b011;
    reg [4:0] deb_count;
    reg output_exist;
    
    initial begin
        clean <= 0;
        output_exist <= 0;
        deb_count <= 0;
    end
    
   always @ (posedge clk) begin
    if (button) begin
        if (!output_exist) begin
            if (deb_count == max) begin
                clean <= 1;
                deb_count <= 0;
                output_exist <= 1;
            end
            else
                deb_count <= deb_count + 1;
            end
            else begin
                clean <= 0;
            end
        end
        else begin
            clean <= 0;
            output_exist <= 0;
            deb_count <= 0;
        end
        
    end
    
endmodule
    
