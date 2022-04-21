

.globl _start
.section .data
size:
.quad 5
arr:
.quad 4,5,6,3,2,1
key:
.quad 6
.section .text
_start:
movq size, %rcx
movq key, %rax

arrloop:
movq arr(,%rcx,8), %rbx
cmpq %rax,%rbx
je fin
loopq arrloop

fin:
movq %rcx, %rdi
movq $60, %rax
syscall


