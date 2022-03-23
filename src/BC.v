module BC(
    input inicio;
    input clk,
    input reset,
    output LX,
    output LS,
    output LH,
    output H,
    output[1:0] M0,
    output[1:0] M1,
    output[1:0] M2
);

reg [2:0] state;

parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

always @(posedge clk or reset)begin
    if (reset) begin
        state <= F;
    end
    else begin
    //verificar sintaxe do case
        case (state)
            A:  M0 <= 0,
                LX <= 1,
                M1 <= 1,
                M2 < 0,
                LS <= 0, 
                LH <= 1, 
                H <= 1,
                state <= B;

            B:  M0 <= 1,
                LX <= 0,
                M1 <= 0,
                M2 <= 3,
                LS <= 1, 
                LH <= 0, 
                H <= 1,
                state <= C;
            
            C:  M0 <= 2,
                LX <= 0,
                M1 <= 0,
                M2 <= 0,
                LS <= 0, 
                LH <= 1, 
                H <= 1,
                state <= D;

            D:  M0 <= 0,
                LX <= 0,
                M1 <= 2,
                M2 <= 3,
                LS <= 1, 
                LH <= 0, 
                H <= 0,
                state <= E;

            E:  M0 <= 3,
                LX <= 0,
                M1 <= 0,
                M2 <= 2,
                LS <= 1, 
                LH <= 0, 
                H <= 0,
                state <= F;

            F:  M0 <= 0,
                LX <= 0,
                M1 <= 0,
                M2 <= 0,
                LS <= 0, 
                LH <= 0, 
                H <= 0,
                state <= A;
        endcase
    end
endmodule

module 