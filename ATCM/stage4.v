`timescale 1ns / 1ps

module stage4(
    input [14:0] S,
    input [8:0] C,
    output [15:0] Z
    );
        // E�� ���� ��Ʈ�� ��ġ��Ű�� ���� 7��Ʈ�� 0���� ä���.
    wire [14:0] carry_padded = {C, 6'b0};

    // ������ �����Ѵ�.
    assign Z = S + carry_padded;
    
endmodule
