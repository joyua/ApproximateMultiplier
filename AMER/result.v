`timescale 1ns / 1ps

module result (
    input [14:0] S,
    input [9:0]  E,
    output [15:0] Z
);

    // E�� ���� ��Ʈ�� ��ġ��Ű�� ���� 7��Ʈ�� 0���� ä���.
    wire [14:0] error_padded = {E, 5'b0};

    // ������ �����Ѵ�.
    assign Z = S + error_padded;

endmodule