.globl _start
.section .data
mystring:
 .ascii "Hello World!\n"
mystring_end:
.equ mystring_end, - mystring
.section .text
_start:
movq $1, %rax #syscall num is 1
movq $1, %rdi
movq $mystring, %rsi #pointer to val
movq $mystring_length, %rdx # how long is my string
syscall
movq $0x3c, %rax
movq $0, %rdi
syscall
