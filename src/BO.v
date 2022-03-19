`include "SomaMultiplica.v";

module BO (
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [1:0] M0,
    input [15:0] x, //Modificar o valor de X ao final para [7:0]
    input clk,
    input LX,
    input RSTX,
    input [1:0] M1,
    input [1:0] M2,
    input LH,
    input RSTH,
    input LS,
    output [15:0] Pronto 
); 


reg [15:0] R0; //Modificar valor do registrador ao final para [7:0]
reg [15:0] M0;

assign R0 = x;

always @(posedge clk)begin
    if (M == 0 & N == 0)begin
        M0 <= A;
    end
end


    
endmodule