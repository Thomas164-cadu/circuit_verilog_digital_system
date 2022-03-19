module Multiplexador(
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] D,
    input [1:0] set,
    input clk,
    output[15:0] saida
);

always @(posedge clk) begin
    if (set == 0)begin
        saida <= x;
    end
    if (set == 1)begin
        saida == A;
    end
end
endmodule