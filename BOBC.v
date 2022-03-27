`include "BC.v"
`include "BO.v"

module BOBC(
    input rst,
    input clk,
    input [7:0] x,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] resultado
);
    
    BC BC1();

    wire [1:0] M0;
    wire [15:0] x;
    wire clk;
    wire LX;
    wire rst;
    wire [1:0] M1;
    wire [1:0] M2;
    wire LH;
    wire LS;
    wire H;

    BO BO1(A, B, C, M0, X, clk, LX, rst, M1, M2, LH, LS, H, resultado);

endmodule 

module testbench;

    reg rst0 = 0;
    reg clk0 = 0;
    reg [7:0] x0 = 2;
    reg [15:0] A0 = 5;
    reg [15:0] B0 = 3;
    reg [15:0] C0 = 4;
    wire[15:0] resultado0;

    BOBC BOCO1(rst0, clk0, x0, A0, B0, C0, resultado0);

    always #1 begin
        clk0 <= ~clk0;
    end

    initial begin
        $dumpvars;
        #1;
        inicio0 <= 1;
        rst0 <= 0;
        #1;
        inicio0 <= 1;
        #20;
        $finish;
    end
endmodule 
