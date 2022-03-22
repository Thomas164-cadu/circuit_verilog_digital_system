`include "SomaMultiplica.v";
`include "Multiplexador.v"

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

wire [15:0] saidaR0;

Registrador R0(x, clk, LX, rst, saidaR0);

wire [15:0] saidaR1;
wire [15:0] saidaR2;

wire [15:0] saidaM0;
Multiplexador multiplexador0(/*NULL*/, A, B, C, M0, clk, saidaM0);

wire [15:0] saidaM1;
Multiplexador multiplexador1(saidaM0, saidaR0, saidaR1, saidaR2, M1, clk, saidaM1);
wire [15:0] saidaM2;
Multiplexador multiplexador2(saidaR0, saidaM0, saidaR1, saidaR2, M2, clk, saidaM2);


wire [15:0] saidaSM;
SomaMultiplica ULA(saidaM1, saidaM2, H, clk, saidaSM);

endmodule