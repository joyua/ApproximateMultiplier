`timescale 1ns / 1ps

module ATCM1_wrapper (
    input clk,             // �ܺ� �Է� Ŭ�� (125 MHz)
    input rst,
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] Z_out
);

    // ���� Ŭ�� ��ȣ
    wire clk_125M = clk;
    wire clk_100M;

    // Clock Wizard �ν��Ͻ�
    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // �Է� ����ȭ
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

    // ���� ����
    wire [15:0] Z;
    wire [8:0] P1_out, P2_out, P3_out, P4_out;
    wire [12:0] V_out, C2_out;
    wire [14:0] S2_out, S3_out;
    wire [8:0]  C3_out;
    wire [2:0]  orV_out;

    // ������ �ν��Ͻ�
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

    // ��� ����ȭ
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            Z_out <= 16'b0;
        else
            Z_out <= Z;
    end

endmodule
