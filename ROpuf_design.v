`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 10:32:51
// Design Name: 
// Module Name: ROpuf_design
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


module ROpuf_design(
    input clk,      // Clock input to synchronize feedback
    input s,
    input enable,
    input [7:0] c,
    output ro_out
    );

    wire r1, r2, r3, r4, r5, r6, r7, r8;
    reg t;  // Register to hold feedback value
    wire gated_clk= clk & enable;
    // F2G Gates for RO-PUF chain
    F2g_gate f1(.a(t),  .b(), .c(c[0]), .p(), .q(), .r(r1));
    F2g_gate f2(.a(r1), .b(), .c(c[1]), .p(), .q(), .r(r2));
    F2g_gate f3(.a(r2), .b(), .c(c[2]), .p(), .q(), .r(r3));
    F2g_gate f4(.a(r3), .b(), .c(c[3]), .p(), .q(), .r(r4));
    F2g_gate f5(.a(r4), .b(), .c(c[4]), .p(), .q(), .r(r5));
    F2g_gate f6(.a(r5), .b(), .c(c[5]), .p(), .q(), .r(r6));
    F2g_gate f7(.a(r6), .b(), .c(c[6]), .p(), .q(), .r(r7));
    F2g_gate f8(.a(r7), .b(), .c(c[7]), .p(), .q(), .r(r8));

    // Sequential logic to break combinational loop
    always @(posedge gated_clk) begin
        if (enable) 
             t <= (r8 ^ s) & ~(c[3] & c[5]);  
        else
            t <= s;
    end
    assign ro_out= r8 & enable;
endmodule
