`timescale 1ns / 1ps

module SDLC_result(
    input  [14:0] R1, R2, R3, R4,
    output [15:0] S
);

    // Verilog의 + 연산자는 합산 결과를 충분한 비트 폭으로 자동 확장합니다.
    // 15비트 숫자 4개를 더하면 결과는 최대 17비트가 될 수 있으므로,
    // 그에 맞춰 중간 결과와 최종 결과를 선언하는 것이 좋습니다.
    wire [16:0] temp_sum;
    
    // 네 개의 입력을 한 번에 더합니다.
    // 합성 도구는 이 코드를 보고 내부적으로 효율적인 덧셈 트리 구조를 생성합니다.
    assign temp_sum = R1 + R2 + R3 + R4;

    // 최종 출력 S는 16비트이므로, 계산 결과의 하위 16비트를 할당합니다.
    // 만약 17비트 전체 결과가 필요하다면 output S를 [16:0]으로 선언해야 합니다.
    assign S = temp_sum[15:0];

endmodule