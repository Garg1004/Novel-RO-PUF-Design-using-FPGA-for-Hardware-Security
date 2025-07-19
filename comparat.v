`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:37:49
// Design Name: 
// Module Name: comparat
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


module comparat(
    input [15:0]count1,
    input [15:0]count2,
    input [3:0]lfsr_in,
    input clk,
    input reset,
    input enable,
    output reg [7:0]puf_response
    );
    reg sign_bit;
    reg [3:0] l_counter;
    reg [2:0] w_counter;
    wire [3:0] lfsr_out;
    lfsr l2(.clk(clk), .reset(reset), .enable(enable), .lfsr_in(lfsr_in), .lfsr_out(lfsr_out));
    always @(posedge clk or posedge reset)begin
        if(reset)begin
        sign_bit <= 1'b0;
        l_counter <= 4'b0000;
        w_counter <= 3'b000;
        puf_response <= 8'b00000000;
        end
        else if(enable)begin
            if(count1>count2)begin
            sign_bit<=1'b1;
            l_counter<=count2[3:0];
            w_counter<=count1[2:0];
        end else begin
            sign_bit<=1'b0;
            l_counter<=count1[3:0];
            w_counter<=count2[2:0];
            end
            sign_bit<=sign_bit ^ lfsr_out[0] ^ lfsr_out[1] ^ lfsr_out[3];
            puf_response<={sign_bit,l_counter,w_counter};
  end
  end
endmodule
