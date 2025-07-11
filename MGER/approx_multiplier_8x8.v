`timescale 1ns / 1ps

module approx_multiplier_8x8 (
    input [7:0] A, B,
    output [15:0] P
);
    wire [7:0] S1;
    wire [6:0] S2, W1, W2;
    wire W1_4, W2_4, W1_6, W2_6, W1_8, W2_8;
    wire [15:0] S3, C, S, E, Z;
    wire [3:0] C_group;
    


    // Stage 1: High Block & Low Block
    high_block_multiplier hb (.A_H(A[7:4]), .B_H(B[7:4]), .S1(S1));
    low_block_multiplier lb (.A_L(A[3:0]), .B_L(B[3:0]), .S2(S2));

    // Stage 1: Mid Block Compression
    mid_block_multiplier mb (.A_H(A[7:4]), .B_H(B[7:4]),.A_L(A[3:0]), .B_L(B[3:0]), .W1(W1), .W2(W2));

    // Stage 2: Carry-Save Adder
    stage2_csa stage2 (.S1(S1), .S2(S2), .W1(W1), .W2(W2), .S3(S3), .C(C));

    // Stage 3: Inexact Half-Adder
    stage3 stage3 (.S3(S3), .C(C), .S(S), .E(E));

    //fig 4: error recovery
    fig4 fig4 (.S(S), .E(E), .Z(Z));
    
    assign P = Z;

endmodule




