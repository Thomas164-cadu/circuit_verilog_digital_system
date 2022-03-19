//Multiplexador do Bloco Operativo, será reutilizado em diferentes partes
module Multiplexador(
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] D,
    input [1:0] set,
    input clk,
    output[15:0] saida
);

//A ordem das entradas importa nesse caso para setar as entradas no BO
always @(posedge clk) begin
    if (set == 0)begin
        saida <= A;
    end
    if (set == 1)begin
        saida <= B;
    end
    if (set == 2) begin
        saida <= C;
    end
    if (set == 3) begin
        saida <= D;
    end
end
endmodule
