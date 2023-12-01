`timescale 1ns/100ps

module top_module;
    initial begin    
        // iVerilog 系统函数        
        $dumpfile("logs/wave.vcd");  // 生成 波形文件名
        $dumpvars;                   // 生成所有的信号
    end

    reg clk, rst_n;
    wire[7:0] cnt;

	// 产生时钟信号
    initial clk = 0;
    always clk = #10 ~clk;

	// 调用 count.v 模块
    count count_ins1(clk, rst_n, cnt);

	// 计算器重置 -> 启动
    initial begin
        #10 rst_n = 0;
        #20 rst_n = 1;
        #20 rst_n = 0;
        #20
        $finish;
    end

endmodule
