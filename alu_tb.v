`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2025 23:36:47
// Design Name: 
// Module Name: alu_tb
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



module alu_tb;

reg [7:0] A, B;
reg [2:0] ALU_Sel;
wire [7:0] ALU_Out;
wire CarryOut;

// Instantiate ALU
alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
);

integer i;

initial begin
    // Apply inputs
    A = 8'b00001010;  // 10
    B = 8'b00000101;  // 5

    // Display header
    $display("Time\tSel\tA\tB\tOutput\tCarry");
    $display("------------------------------------------------");

    // Loop through all 8 operations
    for (i = 0; i < 8; i = i + 1) begin
        ALU_Sel = i[2:0];
        #10; // wait for output to settle
        $display("%0t\t%b\t%0d\t%0d\t%0d\t%b", $time, ALU_Sel, A, B, ALU_Out, CarryOut);
    end

    $finish;
end

endmodule

