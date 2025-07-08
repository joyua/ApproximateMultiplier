`timescale 1ns / 1ps

module approx_multiplier_8x8_wrapper (
    input clk,             // 외부 입력 클럭 (125 MHz)
    input rst,
    input [7:0] A_in,
    input [7:0] B_in,
    output reg [15:0] P_out
);
    
    // 내부 클럭 생성용 연결
    wire clk_125M = clk;
    wire clk_100M;
// 필요 추가
    wire [15:0] P_wire;


    // 클럭 생성 모듈 (clk_wiz IP 인스턴스 포함)
    clk_gen_100M clk_gen (
        .clk_ref(clk_125M),
        .rst(rst),
        .clk_100M(clk_100M)
    );

    // 입력 레지스터
    reg [7:0] A_reg, B_reg;


    // 입력 동기화 (clk_100M 기준)
    always @(posedge clk_100M or posedge rst) begin
        if (rst) begin
            A_reg <= 0;
            B_reg <= 0;
        end else begin
            A_reg <= A_in;
            B_reg <= B_in;
        end
    end

    // 곱셈기 인스턴스
    approx_multiplier_8x8 approx_inst (
        .A(A_reg),
        .B(B_reg),
        .P(P_wire)
    );

    // 출력 레지스터 (clk_100M 기준)
    always @(posedge clk_100M or posedge rst) begin
        if (rst)
            P_out <= 0;
        else
            P_out <= P_wire;
    end

endmodule
