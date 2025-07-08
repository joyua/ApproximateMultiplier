`timescale 1ns / 1ps

module stage4(
    input [14:0] S,
    input [8:0] C,
    output [15:0] Z
    );
        // E를 상위 비트에 위치시키고 하위 7비트는 0으로 채운다.
    wire [14:0] carry_padded = {C, 6'b0};

    // 덧셈을 수행한다.
    assign Z = S + carry_padded;
    
endmodule
