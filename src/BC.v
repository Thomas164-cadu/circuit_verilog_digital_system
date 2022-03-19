module BC(
    input clk,
    input LX,
    input LS,
    input LH,
    input H,

    output 
);

reg [2:0] state;

parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

always @(posedge clk)begin
    case (state)
        A:  LX <= 1, 
            LS <= 0, 
            LH <= 1, 
            H <= 1,
            state <= B;

        B:  LX <= 1, 
            LS <= 0, 
            LH <= 1, 
            H <= 1,
            state <= B;
        
        C:  LX <= 1,
            LS <= 0, 
            LH <= 1, 
            H <= 1,
            state <= B;
end