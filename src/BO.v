`include "SomaMultiplica.v"
`include "Multiplexador.v"
`include "Registrador.v"

module BO (
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [1:0] M0,
    input [15:0] x,
    input clk,
    input LX,
    input rst,
    input [1:0] M1,
    input [1:0] M2,
    input LH,
    input LS,
    input H,
    output [15:0] Pronto 
); 

parameter vazio = 16'b0000000000000000;

Registrador R0(x, clk, LX, rst, saidaR0);
wire [15:0] saidaR0;

Registrador R1(saidaSM, clk, LH, rst, saidaR1);
wire [15:0] saidaR1;

Registrador R2(saidaSM, clk, LS, rst, saidaR2);
wire [15:0] saidaR2;

Multiplexador multiplexador0(vazio, A, B, C, M0, clk, saidaM0);
wire [15:0] saidaM0;

Multiplexador multiplexador2(saidaR0, saidaM0, saidaR2, saidaR1, M2, clk, saidaM2);
wire [15:0] saidaM2;

Multiplexador multiplexador1(saidaM0, saidaR0, saidaR2, saidaR1, M1, clk, saidaM1);
wire [15:0] saidaM1;

SomaMultiplica ULA(saidaM1, saidaM2, H, clk, saidaSM);
wire [15:0] saidaSM;

assign Pronto = saidaR2;

endmodule

//module testbench;
//
//    reg [15:0] A0 = 1;
//    reg [15:0] B0 = 2;
//    reg [15:0] C0 = 2;
//    reg [1:0] M00;
//    reg [15:0] x0 = 2;
//    reg clk0 = 0;
//    reg LX0;
//    reg reset0;
//    reg [1:0] M10;
//    reg [1:0] M20;
//    reg LH0 = 0;
//    reg LS0 = 0;
//    reg H0 = 0;
//    wire [15:0] saida0;
//
//BO jose(A0, B0, C0, M00, x0, clk0, LX0, reset0, M10, M20, LH0, LS0, H0, saida0);
//
//always #1 begin
//    clk0 <= ~clk0;
//end
//
//initial begin
//    $dumpvars;
//    #1;
//    M00 <= 00;
//    LX0 <= 1;
//    reset0 <= 0;
//    M10 <= 01;
//    M20 <= 00;
//    H0 <= 1;
//    LS0 <= 0;
//    LH0 <= 1;
//    #6;
//    M00 <= 01;
//    LX0 <= 0;
//    reset0 <= 0;
//    M10 <= 00;
//    M20 <= 11;
//    H0 <= 1;
//    LS0 <= 1;
//    LH0 <= 0;
//    #6;
//    M00 <= 10;
//    LX0 <= 0;
//    reset0 <= 0;
//    M10 <= 00;
//    M20 <= 00;
//    H0 <= 1;
//    LS0 <= 0;
//    LH0 <= 1;
//    #8;
//    M00 <= 00;
//    LX0 <= 0;
//    reset0 <= 0;
//    M10 <= 10;
//    M20 <= 11;
//    H0 <= 0;
//    LS0 <= 1;
//    LH0 <= 0;
//    #6;
//    M00 <= 11;
//    LX0 <= 0;
//    reset0 <= 0;
//    M10 <= 00;
//    M20 <= 10;
//    H0 <= 0;
//    LS0 <= 1;
//    LH0 <= 0;
//    #8;
//    M00 <= 00;
//    LX0 <= 0;
//    reset0 <= 1;
//    M10 <= 00;
//    M20 <= 00;
//    H0 <= 0;
//    LS0 <= 0;
//    LH0 <= 0;
//    #50;
//    $finish;
//end
//endmodule