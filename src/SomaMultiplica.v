module SomaMultiplica(
    input[15:0] abc,
    input[15:0] xis,
    input H,
    input clk,
    output[15:0] resultado
);

always @(posedge clk) begin
    if (H == 1) begin
        resultado <= abc & xis;
    end 
    else begin
        resultado <= abc | xis;
    end
endmodule

