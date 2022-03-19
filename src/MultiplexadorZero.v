module Multiplexador(
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] D,
    input M,
    input N,
    input clk,
    output[15:0] saida
);

always @(posedge clk) begin
    if (M == 0 & N == 0)begin
        saida <= x;
    end
end
endmodule