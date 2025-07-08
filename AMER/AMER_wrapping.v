`timescale 1ns / 1ps

module AMER_wrapping (
    input clk,              // 외부 125MHz 클럭
    input rst,              // 비동기 리셋
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] Z_out
);

    // 클럭 생성
    wire clk_125M = clk;
    wire clk_100M;

    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // 입력 레지스터
    reg [7:0] A_reg, B_reg;

    // 출력 wire
    wire [15:0] Z_wire;

    // 입력 동기화
    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // AMER 인스턴스
    AMER_4b dut (
        .A(A_reg),
        .B(B_reg),
        .Z(Z_wire)
    );

    // 출력 동기화
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            Z_out <= 0;
        else
            Z_out <= Z_wire;
    end

endmodule
