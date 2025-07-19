`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:36:41
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input enable,
    input reset,
    input ro_clk,
    output reg [15:0]count
    );
    
    wire gated_clk = ro_clk & enable;
    
    always@(posedge gated_clk or posedge reset)begin
    if(reset) begin
        count<=16'b0;
    end
    else if (enable)
        count<=count+1'b1;
     end
endmodule
