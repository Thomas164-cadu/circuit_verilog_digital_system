//Multiplexador do Bloco Operativo, será reutilizado em diferentes partes
module Multiplexador(
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] D,
    input [1:0] set,
    input clk,
    output[15:0] saidaM
);

reg[15:0] s;

assign saidaM = s;
//A ordem das entradas importa nesse caso para setar as entradas no BO
always @(posedge clk) begin
    if (set == 0)begin
        s <= A;
    end
    if (set == 1)begin
        s <= B;
    end
    if (set == 2) begin
        s <= C;
    end
    if (set == 3) begin
        s <= D;
    end
end
endmodule

module testbench;

    reg [15:0] A0;
    reg [15:0] B0;
    reg [15:0] C0;
    reg [15:0] D0;
    reg [1:0] set0 = 0;
    reg clk0 = 0;
    wire [15:0] saida0;

Multiplexador jose(A0, B0, C0, D0, set0, clk0, saida0);

always #1 begin
    clk0 <= ~clk0;
end

initial begin
    $dumpvars;
    #1;
    A0 <= 1;
    B0 <= 0;
    C0 <= 3;
    D0 <= 4;
    set0 <= 1;
    #5;
    $finish;
end
endmodule