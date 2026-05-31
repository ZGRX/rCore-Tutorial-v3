.section .text.entry              # 切换到 .text.entry 段，放启动入口代码
.globl _start                     # 声明 _start 为全局符号，方便链接器找到入口
_start:                           # 定义入口标签 _start
    la sp, boot_stack_top         # 初始化栈指针 sp = boot_stack_top
    call rust_main                # 调用 Rust 入口函数 rust_main

.section .bss.stack               # 切换到 .bss.stack 段，放启动栈空间
.globl boot_stack_lower_bound     # 声明栈底符号为全局符号
boot_stack_lower_bound:           # 栈的低地址边界
    .space 4096 * 16              # 预留 64 KiB 栈空间

.globl boot_stack_top             # 声明栈顶符号为全局符号
boot_stack_top:                   # 栈的高地址边界