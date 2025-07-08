`timescale 1ns / 1ps

module ErrorRecovery(
    input [8:0] E3, E4,
    input [10:0] E6,
    input [14:0] E7,
    output [9:0] E
    );
    assign E[0] = E3[1] | E6[3] | E7[7];
    assign E[1] = E3[2] | E4[0] | E6[3] | E7[7];
    assign E[2] = E3[3] | E4[1] | E6[3] | E7[7];
    assign E[3] = E3[4] | E4[2] | E6[4] | E7[8];
    assign E[4] = E3[5] | E4[3] | E6[5] | E7[9];
    assign E[5] = E3[6] | E4[4] | E6[6] | E7[10];
    assign E[6] = E3[7] | E4[5] | E6[7] | E7[11];
    assign E[7] = E3[8] | E4[6] | E6[8] | E7[12];
    assign E[8] = E4[7] | E6[9] | E7[13];
    assign E[9] = E4[8] | E6[10] | E7[14];
    
endmodule
