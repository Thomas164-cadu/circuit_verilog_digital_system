module Registrador(
    input [15:0] D,
    input load,
    input rst,
    output [15:0] Q
);

    reg [15:0] saida;

    assign Q = saida;

    always @(posedge load or rst) begin
        if (rst == 1) saida <= 0;
        else saida <= D;
    end
endmodule