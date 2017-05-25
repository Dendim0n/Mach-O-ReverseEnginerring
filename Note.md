#Note
##工具
* Hopper
* IDA
* LLDB
* Xcode
* Terminal
##LLDB使用笔记
### 直接用LLDB打开可执行文件
终端里：
```
=>LLDB
=>(lldb)testExecutable
=>(lldb)run
进程启动以后，Ctrl+C可以暂停，后续操作后，continue(c)可以继续运行
```
### LLDB依附于打开的进程
* 查找进程：
`ps aux | grep UserName | grep ProcName`
* 通过PID依附：
(lldb)process attach --pid PidNum
* 通过进程名字依附：
(lldb)process attach -name ProcName
### 添加断点
* 根据函数名加断点：
breakpoint set -n #FunctionName#
* 根据虚拟地址加断点：
breakpoint set -a #VirtualAddress#
* 查看断点：
breakpoint list
* 禁用断点：
breakpoint disable #断点序号(不填则全部禁用)#
* 启用断点：
breakpoint enable #断点序号(不填则全部启用)#
* 删除断点：
breakpoint delete #断点序号(不填则全部删除)#
###设置Watchpoint
* 根据内存地址设置
watchpoint set expression
* 根据变量名设置
watchpoint set variable (仅在源码调试时可用)
* 根据条件设置
watchpoint modify -c
例如：
watchpoint modify -c &(int &)0x12345678 == 20 （&换成星号）

###辅助命令
* 反汇编地址
disassemble -a  (dis -a $pc)
* 寄存器读写
register read
register write RegisterName Value(hex)
* 流程控制
step in: step(si) / F7
step out: next(ni) / F8
执行到函数返回: finish / Ctrl+F9
继续执行: continue / c
* 查看调用堆栈
`bt`
* 读取/写入内存
memory read [StartAddr EndAddr]/Register
memory write #Address# Values
* 打印与其他相关杂项
print
po
expr
* 查看加载模块信息
image list –o –f //-o 显示地址 -f 显示路径
