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

parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

always @(posedge clk or reset)begin
    if (reset) begin
        state <= F;
    end
    else begin
        if (inicio == 1)begin
            state <= A;    
            case (state)
                A:begin  
                    M0 <= 0;
                    LX <= 1;
                    M1 <= 1;
                    M2 <= 0;
                    LS <= 0; 
                    LH <= 1; 
                    H <= 1;
                    state <= B;
                end    

                B:begin  
                    M0 <= 1;
                    LX <= 0;
                    M1 <= 0;
                    M2 <= 3;
                    LS <= 1; 
                    LH <= 0; 
                    H <= 1;
                    state <= C;
                end

                C:begin  
                    M0 <= 2;
                    LX <= 0;
                    M1 <= 0;
                    M2 <= 0;
                    LS <= 0; 
                    LH <= 1; 
                    H <= 1;
                    state <= D;
                end

                D:begin  
                    M0 <= 0;
                    LX <= 0;
                    M1 <= 2;
                    M2 <= 3;
                    LS <= 1; 
                    LH <= 0; 
                    H <= 0;
                    state <= E;
                end

                E:begin 
                    M0 <= 3;
                    LX <= 0;
                    M1 <= 0;
                    M2 <= 2;
                    LS <= 1; 
                    LH <= 0; 
                    H <= 0;
                    state <= F;
                end

                F:begin  M0 <= 0;
                    LX <= 0;
                    M1 <= 0;
                    M2 <= 0;
                    LS <= 0; 
                    LH <= 0; 
                    H <= 0;
                    state <= A;
                end
                
            endcase
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
    #1;
    inicio0 <= 1;
    #13;
    $finish;
end
endmodule