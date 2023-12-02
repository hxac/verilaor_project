# Verilator 模板文件

参考 Verilator 官方文档编写

https://github.com/verilator/verilator/tree/master/examples/make_tracing_c

首先 fork 一份到自己账户，然后 clone 下来。直接编译运行即可：
```sh
git clone https://github.com/hxac/verilaor_project.git && cd verilaor_project

# 编译仿真
make

# 查看波形（需 gtkwave）
make view

# 清理构建结果（每次编译前必须清理）
make clean
```

直接 clone 本仓库也可以，记得删除 origin：
```sh
# 删除远程
git remote rm origin
```

或者替换为自己的仓库：
```sh
git remote add origin git@github.com:hxac/verilaor_project.git
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

用的是 `amix/vimrc` 的 `VIM` 配置文件：

```sh
vi ~/.vim_runtime/vimrcs/extended.vim 
```

在末尾合适的位置插入：

```vim
elseif &filetype == 'verilog'  
	exec "!make clean"  
	exec "!make"  
```

按下 `F5` 然后 回车 即可自动编译，仿真，查看波形。

> 编译后查看新的生成波形，直接在 gtkwave 里面点刷新就行了。
