module SomaMultiplica(
    input[15:0] abc,
    input[15:0] xis,
    input H,
    input clk,
    output[15:0] resultado
);

reg[15:0] r;

assign resultado = r;

always @(posedge clk) begin
    if (H == 1)begin
        r <= abc * xis;
    end
    else begin
        r <= abc + xis;
    end
end
endmodule

module testbench;

    reg[15:0] abc0;
    reg[15:0] xis0;
    reg H0 = 0;
    reg clk0 = 0;
    wire[15:0] resultado0;

SomaMultiplica jose(abc0, xis0, H0, clk0, resultado0);

always #1 begin
    clk0 <= ~clk0;
end

initial begin
    $dumpvars;
    #1;
    abc0 <= 2;
    xis0 <= 3;
    H0 <= 1;
    #5;
    $finish;
end
endmodule