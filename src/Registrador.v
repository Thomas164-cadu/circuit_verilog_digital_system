module Registrador(
    input [15:0] D,
    input clk,
    input load,
    input rst,
    output [15:0] Q
);

    reg [15:0] saida;

    assign Q = saida;

    always @(posedge clk or rst) begin
        if (rst == 1) saida <= 0;
        else if (load == 1)begin
        saida <= D;
        end
    end
endmodule

module testbench;

    reg [15:0] D0;
    reg clk0 = 0;
    reg load0;
    reg rst0 = 0;
    wire [15:0] Q0;

Registrador jose(D0, clk0, load0, rst0, Q0);

always #1 begin
    clk0 <= ~clk0;
end

initial begin
    $dumpvars;
    #1;
    D0 <= 1;
    load0 <= 1;
    #5;
    load0 <= 0;
    D0 <= 5;
    #5;
    $finish;
end
endmodule