`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:24:08
// Design Name: 
// Module Name: Pufdesign_8
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


module Pufdesign_8(
    input s,
    input clk,
    input reset,
    input [3:0]lfsr_in,
    input enable,
    input [7:0]c,
    output [7:0] z
    );
    wire [7:0]ro_enable;
    wire [7:0]ro_out;
    wire [15:0]count1,count2;
    wire [2:0] ro1_sel,ro2_sel;
    wire [7:0]puf_response;

    reg selected_ro1,selected_ro2;
    
    Ro_selector ros(.clk(clk), .reset(reset), .enable(enable), .lfsr_in(lfsr_in), .ro1_sel(ro1_sel), .ro2_sel(ro2_sel), .ro_enable(ro_enable));
    ROpuf_design r1(.clk(clk), .s(s), .enable(ro_enable[0]), .c(c), .ro_out(ro_out[0]));
    ROpuf_design r2(.clk(clk), .s(s), .enable(ro_enable[1]), .c(c), .ro_out(ro_out[1]));
    ROpuf_design r3(.clk(clk), .s(s), .enable(ro_enable[2]), .c(c), .ro_out(ro_out[2]));
    ROpuf_design r4(.clk(clk), .s(s), .enable(ro_enable[3]), .c(c), .ro_out(ro_out[3]));
    ROpuf_design r5(.clk(clk), .s(s), .enable(ro_enable[4]), .c(c), .ro_out(ro_out[4]));
    ROpuf_design r6(.clk(clk), .s(s), .enable(ro_enable[5]), .c(c), .ro_out(ro_out[5]));
    ROpuf_design r7(.clk(clk), .s(s), .enable(ro_enable[6]), .c(c), .ro_out(ro_out[6]));
    ROpuf_design r8(.clk(clk), .s(s), .enable(ro_enable[7]), .c(c), .ro_out(ro_out[7]));
    
     always@(*)begin
     selected_ro1 = 1'b0;
     selected_ro2 = 1'b0;
    case(ro1_sel)
        3'b000: selected_ro1=ro_out[0];
        3'b001: selected_ro1=ro_out[1];
        3'b010: selected_ro1=ro_out[2];
        3'b011: selected_ro1=ro_out[3];
        3'b100: selected_ro1=ro_out[4];
        3'b101: selected_ro1=ro_out[5];
        3'b110: selected_ro1=ro_out[6];
        3'b111: selected_ro1=ro_out[7];
    endcase
        case(ro2_sel)
        3'b000: selected_ro2=ro_out[0];
        3'b001: selected_ro2=ro_out[1];
        3'b010: selected_ro2=ro_out[2];
        3'b011: selected_ro2=ro_out[3];
        3'b100: selected_ro2=ro_out[4];
        3'b101: selected_ro2=ro_out[5];
        3'b110: selected_ro2=ro_out[6];
        3'b111: selected_ro2=ro_out[7];
    endcase
    end
    counter c1(.clk(clk), .enable(enable), .reset(reset), .ro_clk(selected_ro1), .count(count1));
    counter c2(.clk(clk), .enable(enable), .reset(reset), .ro_clk(selected_ro2), .count(count2));
    comparat co(.count1(count1), .count2(count2),.lfsr_in(lfsr_in), .clk(clk), .reset(reset), .enable(enable), .puf_response(puf_response));
    
    assign z=puf_response;

endmodule
