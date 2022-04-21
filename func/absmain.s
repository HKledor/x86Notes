.globl main
.section .text
main:
movq $-4, %rdi
call abs
ret
