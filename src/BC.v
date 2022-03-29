module BC(
    input inicio,
    input clk,
    input reset,
    output reg LX,
    output reg LS,
    output reg LH,
    output reg Hula,
    output reg[1:0] M0,
    output reg[1:0] M1,
    output reg[1:0] M2
);

reg[4:0] state;

parameter A = 5'b00000, B = 5'b00001, C = 5'b00010, D = 5'b00011, E = 5'b00100, F = 5'b00101, G = 5'b00110, H = 5'b00111, I = 5'b01000, J = 5'b01001, K = 5'b01010, L = 5'b01011, M = 5'b01100, N = 5'b01101, O = 5'b01110, P = 5'b01111, Q = 5'b10000, R = 5'b10001, S = 5'b10010, T = 5'b10011;

always @(posedge clk or reset)begin
    if (reset || inicio == 0) begin
        M0 <= 00;
        LX <= 0;
        M1 <= 00;
        M2 <= 00;
        Hula <= 0;
        LS <= 0;
        LH <= 0;
    end
    else if (inicio == 1) begin
        case (state)
            A: begin
                M0 <= 00;
                LX <= 1;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= B;
            end
            B: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 01;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= C;
            end
            C: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 01;
                M2 <= 00;
                Hula <= 1;
                LS <= 0;
                LH <= 0;
                state <= D;
                end                    
            D: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 01;
                M2 <= 00;
                Hula <= 1;
                LS <= 0;
                LH <= 1;
                state <= E;
            end
            E: begin
                M0 <= 01;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= F;
            end
            F: begin
                M0 <= 01;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= G;
            end
            G: begin
                M0 <= 01;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 1;
                LS <= 0;
                LH <= 0;
                state <= H;
            end
            H: begin
                M0 <= 01;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 1;
                LS <= 0;
                LH <= 1;
                state <= I;
            end
            I: begin
                M0 <= 10;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= J;
            end
            J: begin
                M0 <= 10;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= K;
            end
            K: begin
                M0 <= 10;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 1;
                LS <= 0;
                LH <= 0;
                state <= L;
            end
            L: begin
                M0 <= 10;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 1;
                LS <= 1;
                LH <= 0;
                state <= M;
            end
            M: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 10;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= N;
            end
            N: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 10;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= O;
            end
            O: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 1;
                state <= P;
            end
            P: begin
                M0 <= 11;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= Q;
            end
            Q: begin
                M0 <= 11;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= R;
            end
            R: begin
                M0 <= 11;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= S;
            end
            S: begin
                M0 <= 11;
                LX <= 0;
                M1 <= 00;
                M2 <= 11;
                Hula <= 0;
                LS <= 1;
                LH <= 0;
                state <= T;
            end
            T: begin
                M0 <= 00;
                LX <= 0;
                M1 <= 00;
                M2 <= 00;
                Hula <= 0;
                LS <= 0;
                LH <= 0;
                state <= A;
            end
        endcase
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
    reset0 = 1;
    #1;
    reset0 = 0;
    #2;
    inicio0 = 1;
    #25;
    $finish;
end
endmodule