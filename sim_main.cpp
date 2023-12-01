#include <verilated.h>
#include "Vtop_module.h"

int main() 
{
    // 输出文件夹
    Verilated::mkdir("logs");
    
    // 配置 verilated
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    contextp->debug(0);
    contextp->traceEverOn(true);

    // 定义 top_module.v
    const std::unique_ptr<Vtop_module> top{new Vtop_module{contextp.get(), "TOP"}};

    // 持续仿真直到遇上 $finish 标签
    while (!contextp->gotFinish()) 
    {
        // 仿真时间间隔
        contextp->timeInc(1);
        // 仿真
        top->eval();
    }
    // 结束仿真
    top->final(); 

    return 0;
}
