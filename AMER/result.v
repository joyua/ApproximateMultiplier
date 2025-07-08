`timescale 1ns / 1ps

module result (
    input [14:0] S,
    input [9:0]  E,
    output [15:0] Z
);

    // E를 상위 비트에 위치시키고 하위 7비트는 0으로 채운다.
    wire [14:0] error_padded = {E, 5'b0};

    // 덧셈을 수행한다.
    assign Z = S + error_padded;

endmodule