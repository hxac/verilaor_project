`timescale 1ns/100ps

module count(
    input clk,
    input rst_n,
    output reg[7:0] cnt
);
    always @(posedge clk) begin
        cnt = rst_n ? 0 : cnt + 1;
    end

endmodule
