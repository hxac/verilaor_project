# Verilator 模板文件

参考 Verilator 官方文档编写

https://github.com/verilator/verilator/tree/master/examples/make_tracing_c

clone 下来，直接编译运行即可
```sh
git clone https://github.com/hxac/verilaor_project.git

cd verilaor_project

make
```

## 依赖环境安装

### Debian

```sh
sudo apt-get -y install verilator gtkwave
```

### ArchLinux

```sh
yay -S verilator
yay -S gtkwave
```

## VIM 编辑器配置

```sh
vi ~/.vim_runtime/vimrcs/extended.vim 
```

用的是 `amix/vimrc` 的 `VIM` 配置文件，在末尾合适的位置插入

```vim
elseif &filetype == 'verilog'  
	exec "!make clean"  
	exec "!make"  
	exec "!make view"
```

按下 `F5` 然后 回车 即可自动编译，仿真，查看波形
