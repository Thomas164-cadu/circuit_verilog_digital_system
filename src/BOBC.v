`include "BC.v"
`include "BO.v"

module BOBC(
    input inicio,
    input rst,
    input clk,
    input [15:0] x,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] resultado
);

    wire [1:0] M0;
    wire clk;
    wire LX;
    wire rst;
    wire [1:0] M1;
    wire [1:0] M2;
    wire LH;
    wire LS;
    wire H;
    
    BC BC1(inicio, clk, rst, LX, LS, LH, H, M0, M1, M2);

    BO BO1(A, B, C, M0, x, clk, LX, rst, M1, M2, LH, LS, H, resultado);

endmodule 

module testbench;

    reg inicio0 = 0;
    reg rst0 = 0;
    reg clk0 = 0;
    reg [15:0] x0 = 2;
    reg [15:0] A0 = 1;
    reg [15:0] B0 = 1;
    reg [15:0] C0 = 2;
    wire[15:0] resultado0;

    BOBC BOCO1(inicio0, rst0, clk0, x0, A0, B0, C0, resultado0);

    always #1 begin
        clk0 <= ~clk0;
    end

    initial begin
        $dumpvars;
        rst0 <= 1;
        #1;
        rst0 <= 0;
        #2;
        inicio0 <= 1;
        #50;
        $finish;
    end
endmodule