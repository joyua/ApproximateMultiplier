`timescale 1ns / 1ps

module AMER_wrapping (
    input clk,              // �ܺ� 125MHz Ŭ��
    input rst,              // �񵿱� ����
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] Z_out
);

    // Ŭ�� ����
    wire clk_125M = clk;
    wire clk_100M;

    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // �Է� ��������
    reg [7:0] A_reg, B_reg;

    // ��� wire
    wire [15:0] Z_wire;

    // �Է� ����ȭ
    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // AMER �ν��Ͻ�
    AMER_4b dut (
        .A(A_reg),
        .B(B_reg),
        .Z(Z_wire)
    );

    // ��� ����ȭ
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            Z_out <= 0;
        else
            Z_out <= Z_wire;
    end

endmodule
