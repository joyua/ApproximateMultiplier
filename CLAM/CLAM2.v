module CLAM2(
    input [7:0] A, B,
    output [15:0] S
);

    wire [63:0] pp;
    wire [14:0] R1, R2, R3, R4;




    Stage1 u1 (.A(A), .B(B), .pp(pp));
    Stage2 u2 (.pp(pp), .R1(R1), .R2(R2), .R3(R3), .R4(R4));
    SDLC_result u3 (.R1(R1), .R2(R2), .R3(R3), .R4(R4), .S(S));

endmodule
