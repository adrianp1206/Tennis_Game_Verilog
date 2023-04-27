`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 07:57:12 PM
// Design Name: 
// Module Name: tennisball_movement
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


module tennisball_movement(
    input clk,
    input but_p1,
    input but_p2,
    input s_or_t,
    output [15:0] leds,
    output [7:0] AN,
    output [6:0] C
    );
    reg [15:0] led;
    reg [10:0] count = 0;
    reg [3:0] speed = 4'b0010;
    reg fraction = 2'h1;
    reg reset = 1;
    //reg reset_clk;
    //wire new_clk;
    reg [7:0] AN_IN;
    reg [55:0] C_IN;
    reg moving;
    reg direction;
    reg [1:0] earlycount1, earlycount2;
    reg [1:0] score_p1 = 0;
    reg [1:0] score_p2 = 0;
    reg[2:0] score_p1_squash = 0;
    reg overall_count = 0;
    reg done = 0;
    reg [26:0] toggle_value = 27'b101111101011110000100000000;
    reg squash_count = 0;
    reg tennis_count = 0;
    
   // clkdividerpart3 clkdiv1(clk, reset_clk, speed, new_clk);
    SevenLEDDemo s(clk, reset_clk, score_p1, score_p2, score_p1_squash, s_or_t,  AN, C);
    clkdividerpart3 clkdiv1(clk, reset_clk, toggle_value, new_clk);
  
    
    always @ (posedge new_clk)
    begin
       if (!s_or_t) begin
       if (tennis_count == 0) begin
        
        reset = 1;
        tennis_count = 1;
        squash_count = 0;
        score_p1 = 0;
        score_p2 = 0;
        count = 0;
        overall_count = 0;
        direction = 0;
        end
        if (reset) begin
        if (~overall_count) begin
            if (count[0] == 0 && !done) begin
                led = 16'b0000000000000001;
                moving = 0;
                reset = 0;
                direction = 0;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                toggle_value = 27'b101111101011110000100000000;
            end
            else if (count[0] == 1 && !done) begin
                led = 16'b1000000000000000;
                moving = 0;
                reset = 0;
                direction = 1;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                toggle_value = 27'b101111101011110000100000000;
                end
             else if (done) begin
                led = 16'b00000000000000001;
                moving = 0;
                reset = 0;
                direction = 0;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                score_p1 = 0;
                score_p2 = 0;
                toggle_value = 27'b101111101011110000100000000;
             end
            end
            else if (overall_count) begin
             if (count[0] == 1 && !done) begin
                led = 16'b1000000000000000;
                moving = 0;
                reset = 0;
                direction = 1;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                toggle_value = 27'b101111101011110000100000000;
                end
                else if (count[0] == 0 && !done) begin
                led = 16'b0000000000000001;
                moving = 0;
                reset = 0;
                direction = 0;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                toggle_value = 27'b101111101011110000100000000;
            end
            else if (done) begin
                led = 16'b1000000000000000;
                moving = 0;
                reset = 0;
                direction = 1;
                earlycount1 = 0;
                earlycount2 = 0;
                done = 0;
                score_p1 = 0;
                score_p2 = 0;
                toggle_value = 27'b101111101011110000100000000;
             end
           end
        end
           else if (reset == 0) begin
                if (led == 16'b0000000000000001 && moving == 0 && but_p1) begin
                    moving = 1;
                    direction = 0;
                    count = count + 1;
                    
                end
                else if (led == 16'b1000000000000000 && moving == 0 && but_p2) begin
                    moving = 1;
                    direction = 1;
                    count = count + 1;
                end
                
                else if (led == 16'b1000000000000000 && but_p2 && moving == 1) begin
                    direction = 1;
                    toggle_value = toggle_value >> 1;
                end
                
                else if (led == 16'b0000000000000001 && but_p1 && moving == 1) begin
                    direction = 0;
                    toggle_value = toggle_value >> 1;
                end
                
                else if (led == 16'b1000000000000000 && !but_p2 && moving == 1) begin
                    score_p1 = score_p1 + 1;
                    reset = 1;
                end
                
                else if (led == 16'b0000000000000001 && !but_p1 && moving == 1) begin
                    score_p2 = score_p2 + 1;
                    reset = 1;
                end
                
                else if (direction == 0 && moving == 1 && led != 16'b1000000000000000 && but_p2 == 1) begin
                    
                    earlycount2 = earlycount2 + 1;
                end
                
                 else if (direction == 1 && moving == 1 && led != 16'b0000000000000001 && but_p1 == 1) begin
                    earlycount1 = earlycount1 + 1;
                end
                
                else begin
                    direction = direction;
                end
                
                
                if (direction == 0 && moving == 1) begin
                    led = led << 1;
                end
                
                else if (direction == 1 && moving == 1) begin
                    led = led >> 1;
                end
                if (earlycount1 > 2) begin
                    score_p2 = score_p2 + 1;
                    reset = 1;
                end
                else if (earlycount2 > 2) begin
                    score_p1 = score_p1 + 1;
                    reset = 1;
                end
                
                if (score_p2 == 3) begin
                    overall_count = 0;
                    done = 1;
                    reset = 1;
                end
                else if (score_p1 == 3) begin
                    overall_count = 1;
                    done = 1;
                    reset = 1;
                end
            end
      end

 else begin
    if (squash_count == 0) begin
        reset = 1;
    end
    if (reset) begin
        led = 16'b0000000000000001;
        moving = 0;
        earlycount1 = 0;
        earlycount2 = 0;
        toggle_value = 27'b101111101011110000100000000;
        reset = 0;
        score_p1_squash = 0;
        squash_count = 1;
        
        tennis_count = 0;
        
    end
    else begin
        if (moving == 0 && led == 16'b0000000000000001 && but_p1) begin
            moving = 1;
        end
        if (moving == 1 && led == 16'b0000000000000001 && but_p1) begin
            direction = 0;
            toggle_value = toggle_value >> 1;
            score_p1_squash = score_p1_squash + 1;
        end
        else if (moving == 1 && led == 16'b1000000000000000) begin
            direction = 1;
        end
        else if (moving == 1 && led != 16'b0000000000000001 && but_p1) begin
            earlycount1 = earlycount1 + 1;
        end
        
        if (earlycount1 > 2) begin
            reset = 1;
        end
        
        if (moving == 1 && direction == 0) begin
            led = led << 1;
        end
        else if (moving == 1 && direction == 1) begin
            led = led >> 1;
        end
            
        
        
        
        
        
      
            
       
end  
end  
end  
      assign leds = led;
      //assign score1 = score_p1;
      //assign score2 = score_p2;
   
endmodule
