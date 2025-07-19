`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:30:34
// Design Name: 
// Module Name: Ro_selector
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


module Ro_selector(
    input clk,
    input reset,
    input enable,
    input [3:0] lfsr_in,
    output reg [2:0]ro1_sel,
    output reg [2:0]ro2_sel,
    output [7:0] ro_enable
    );
    wire [3:0] lfsr_out;
    lfsr l1(.clk(clk), .enable(enable), .reset(reset), .lfsr_in(lfsr_in), .lfsr_out(lfsr_out));

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ro1_sel <= 3'b001;
        ro2_sel <= 3'b010;
    end else if (enable) begin
        ro1_sel <= lfsr_out[2:0];
        ro2_sel <= (ro1_sel == lfsr_out[3:1]) ? (lfsr_out[3:1] ^ 3'b011) : lfsr_out[3:1];
    end
end
    assign ro_enable = enable ? ((8'b1 << ro1_sel) | (8'b1 << ro2_sel)) : 8'b0;

endmodule
