`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:31:37
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input clk,
    input reset,
    input enable,
    input [3:0]lfsr_in,
    output reg [3:0]lfsr_out
    );
    always@(posedge clk, posedge reset) begin
        if(reset)
            lfsr_out <= lfsr_in; //seed value for initializing lfsr_out by lfsr_in at reset.....
        else if(enable)
            lfsr_out<={lfsr_out[2:0],lfsr_out[1]^lfsr_out[3]};
    end
endmodule
