CC=verilator
CFLAGS=-cc --exe -x-assign fast --trace --build --timing 
CINCLUDS=+librescan +libext+.v+.sv+.vh+.svh -y .

# Verilog 源码
VSRC=top_module
# CPP 控制仿真
CCSRC=sim_main
# 构建目标（仿真器）
TARGET=./obj_dir/V$(VSRC)
# 输出波形（在 top_module 里面设置的）
WAVE_VCD=./logs/wave.vcd

.PHONY: default view clean

# 默认任务
default: $(WAVE_VCD)

# 编译
$(TARGET):
	$(CC) $(CFLAGS) $(CINCLUDS) $(VSRC).v $(CCSRC).cpp

# 仿真
$(WAVE_VCD): $(TARGET)
	$(TARGET) +trace

# 查看输出波形
view: $(WAVE_VCD)
	gtkwave $(WAVE_VCD) &

# 清理
clean:
	rm -rf ./obj_dir ./logs
