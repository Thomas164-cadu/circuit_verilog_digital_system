`include "SomaMultiplica.v";
`include "Multiplexador.v"

module BO (
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [1:0] M0,
    input [15:0] x, //Modificar o valor de X ao final para [7:0]
    input clk,
    input LX,
    input RST,
    input [1:0] M1,
    input [1:0] M2,
    input LH,
    input LS,
    input H,
    output [15:0] Pronto 
); 

reg [15:0] R0; //Modificar valor do registrador ao final para [7:0]
reg [15:0] R1;
reg [15:0] R2;

assign R0 = x;
assign R1 = saidaSM;
assign R2 = saidaSM;

wire [15:0] saidaR0;
wire [15:0] saidaR1;
wire [15:0] saidaR2;

wire [15:0] saidaM0;
wire [15:0] saidaM1;
wire [15:0] saidaM2;

wire [15:0] saidaSM;

//Verificar o uso dos módulos; 
    Multiplexador multiplexador0(/*NULL*/, A, B, C, M0, clk, saidaM0);
    Multiplexador multiplexador1(saidaM0, saidaR0, saidaR1, saidaR2, M1, clk, saidaM1);
    Multiplexador multiplexador2(saidaR0, saidaM0, saidaR1, saidaR2, M2, clk, saidaM2);

    SomaMultiplica ULA(saidaM1, saidaM2, H, clk, saidaSM);

    Pronto <= saidaR1;

endmodule