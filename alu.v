`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2025 23:36:47
// Design Name: 
// Module Name: alu
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


// Simple 8-bit ALU with 8 operations
module alu(
    input [7:0] A, B,          // 8-bit inputs
    input [2:0] ALU_Sel,       // 3-bit control signal
    output reg [7:0] ALU_Out,  // 8-bit output
    output reg CarryOut        // Carry flag for arithmetic
);

reg [8:0] temp;  // temporary register for arithmetic carry

always @(*) begin
    CarryOut = 1'b0;  // default
    case (ALU_Sel)
        3'b000: begin
            temp = A + B;       // Addition
            ALU_Out = temp[7:0];
            CarryOut = temp[8];
        end
        3'b001: begin
            temp = A - B;       // Subtraction
            ALU_Out = temp[7:0];
        end
        3'b010: ALU_Out = A & B;       // AND
        3'b011: ALU_Out = A | B;       // OR
        3'b100: ALU_Out = A ^ B;       // XOR
        3'b101: ALU_Out = ~A;          // NOT A
        3'b110: ALU_Out = A << 1;      // Left Shift
        3'b111: ALU_Out = A >> 1;      // Right Shift
        default: ALU_Out = 8'b00000000;
    endcase
end

endmodule

