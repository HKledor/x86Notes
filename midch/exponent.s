.globl _start

_start:
movq $2, %rbx 
movq $1, %rax
movq $3, %rcx
exploop:
mulq %rbx
loopq exploop
complete:
movq %rax,%rdi
movq $60, %rax
syscall
