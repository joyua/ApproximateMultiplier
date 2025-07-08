`timescale 1ns / 1ps

module CLAM2_wrapping (
    input clk,             // �ܺ� �Է� Ŭ�� (125 MHz)
    input rst,
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] S_out
);

    // ���� Ŭ�� ������ ����
    wire clk_125M = clk;
    wire clk_100M;

    // Ŭ�� ���� ��� (clk_wiz IP)
    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // �Է� ��������
    reg [7:0] A_reg, B_reg;

    // ��� ����
    wire [15:0] S_wire;

    // ������ ���� ��ȣ
    wire [63:0] pp_wire;
    wire [14:0] R1_wire, R2_wire, R3_wire, R4_wire;
    wire [14:0] S1_wire, S2_wire, S3_wire;
    wire [14:0] C1_wire, C2_wire, C3_wire;

    // �Է� �������� ����ȭ
    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // CLAM2 ������ �ν��Ͻ�
    CLAM2 dut (
        .A(A_reg),
        .B(B_reg),
        .S(S_wire)
    );

    // ��� �������� ����ȭ
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            S_out <= 0;
        else
            S_out <= S_wire;
    end

endmodule
