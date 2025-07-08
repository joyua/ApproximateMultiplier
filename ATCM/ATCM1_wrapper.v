`timescale 1ns / 1ps

module ATCM1_wrapper (
    input clk,             // 외부 입력 클럭 (125 MHz)
    input rst,
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] Z_out
);

    // 내부 클럭 신호
    wire clk_125M = clk;
    wire clk_100M;

    // Clock Wizard 인스턴스
    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // 입력 동기화
    reg [7:0] A_reg, B_reg;

    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // 내부 연결
    wire [15:0] Z;
    wire [8:0] P1_out, P2_out, P3_out, P4_out;
    wire [12:0] V_out, C2_out;
    wire [14:0] S2_out, S3_out;
    wire [8:0]  C3_out;
    wire [2:0]  orV_out;

    // 곱셈기 인스턴스
    ATCM1 dut (
        .A(A_reg),
        .B(B_reg),
        .Z(Z),
        .P1_out(P1_out),
        .P2_out(P2_out),
        .P3_out(P3_out),
        .P4_out(P4_out),
        .V_out(V_out),
        .S2_out(S2_out),
        .C2_out(C2_out),
        .orV_out(orV_out),
        .S3_out(S3_out),
        .C3_out(C3_out)
    );

    // 출력 동기화
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            Z_out <= 16'b0;
        else
            Z_out <= Z;
    end

endmodule
