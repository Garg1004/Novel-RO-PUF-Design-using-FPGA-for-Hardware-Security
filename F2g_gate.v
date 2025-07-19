`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:34:23
// Design Name: 
// Module Name: F2g_gate
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


module F2g_gate(
    input a,
    input b,
    input c,
    output p,
    output q,
    output r
    );
    assign p=a;
    assign q=a^b;
    assign r=a^c;
endmodule
