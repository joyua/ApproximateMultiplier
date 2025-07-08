`timescale 1ns / 1ps

module approx_multiplier_8x8_wrapper (
    input clk,             // �ܺ� �Է� Ŭ�� (125 MHz)
    input rst,
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] P_out
);
    
    // ���� Ŭ�� ������ ����
    wire clk_125M = clk;
    wire clk_100M;
// �ʿ� �߰�
    wire [15:0] P_wire;


    // Ŭ�� ���� ��� (clk_wiz IP �ν��Ͻ� ����)
    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // �Է� ��������
    reg [7:0] A_reg, B_reg;


    // �Է� ����ȭ (clk_100M ����)
    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // ������ �ν��Ͻ�
    approx_multiplier_8x8 approx_inst (
        .A(A_reg),
        .B(B_reg),
        .P(P_wire)
    );

    // ��� �������� (clk_100M ����)
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            P_out <= 0;
        else
            P_out <= P_wire;
    end

endmodule
