module BC(
    input inicio,
    input clk,
    input reset,
    output reg LX,
    output reg LS,
    output reg LH,
    output reg H,
    output reg[1:0] M0,
    output reg[1:0] M1,
    output reg[1:0] M2
);

reg[2:0] state;

parameter A = 5'b00000, B = 5'b00001, C = 5'b00010, D = 5'b00011, E = 5'b00100, F = 5'b00101, G = 5'b00111, Y = 5'b01000, I = 5'b01001, J = 5'b01010, K = 5'b01011, L = 5'b01100, M = 5'b01101, N = 5'b01110, O = 5'b01111, P = 5'b10000, Q = 5'b10001, R = 5'b10010, S = 5'b10011, T = 5'b10100;

always @(posedge clk or reset)begin
    if (reset) begin
        LX <= 0;
        M1 <= 0;
        M2 <= 0;
        LS <= 0; 
        LH <= 0; 
        H <= 0;
    end
    else begin
        if (inicio == 1) begin
            case (state)
                A: begin
                    M00 <= 00;
                    LX0 <= 1;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= B;
                end
                B: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 01;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= C;
                end
                C: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 01;
                    M20 <= 00;
                    H0 <= 1;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= D;
                    end                    
                D: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 01;
                    M20 <= 00;
                    H0 <= 1;
                    LS0 <= 0;
                    LH0 <= 1;
                    state <= E;
                end
                E: begin
                    M00 <= 01;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= F;
                end
                F: begin
                    M00 <= 01;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= G;
                end
                G: begin
                    M00 <= 01;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 1;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= Y;
                end
                Y: begin
                    M00 <= 01;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 1;
                    LS0 <= 0;
                    LH0 <= 1;
                    state <= I;
                end
                I: begin
                    M00 <= 10;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= J;
                end
                J: begin
                    M00 <= 10;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= K;
                end
                K: begin
                    M00 <= 10;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 1;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= L;
                end
                L: begin
                    M00 <= 10;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 1;
                    LS0 <= 1;
                    LH0 <= 0;
                    state <= M;
                end
                M: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 10;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= N;
                end
                N: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 10;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= O;
                end
                O: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 1;
                    state <= P;
                end
                P: begin
                    M00 <= 11;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= Q;
                end
                Q: begin
                    M00 <= 11;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= R;
                end
                R: begin
                    M00 <= 11;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= S;
                end
                S: begin
                    M00 <= 11;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 11;
                    H0 <= 0;
                    LS0 <= 1;
                    LH0 <= 0;
                    state <= T;
                end
                T: begin
                    M00 <= 00;
                    LX0 <= 0;
                    M10 <= 00;
                    M20 <= 00;
                    H0 <= 0;
                    LS0 <= 0;
                    LH0 <= 0;
                    state <= A;
                end
            endcase
            state <= A;    
        end
    end
end

endmodule

module testbench;

    reg inicio0 = 0;
    reg clk0 = 0;
    reg reset0 = 0;
    wire LX0;
    wire LS0;
    wire LH0;
    wire H0;
    wire [1:0] M00;
    wire [1:0] M10;
    wire [1:0] M20;

BC jose(inicio0, clk0, reset0, LX0, LS0, LH0, H0, M00, M10, M20);

always #1 begin
    clk0 <= ~clk0;
end

initial begin
    $dumpvars;
    inicio0 <= 1;
    #15;
    $finish;
end
endmodule