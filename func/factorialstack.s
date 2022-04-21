.globl _start
.section .data

value:
.quad 5
.section .text
_start:
pushq $0 #push in sentinel val
movq value, %rax
#push all values from 1 to current stack val
pushvalues:
pushq %rax
decq %rax
jnz pushvalues
movq $1, %rax
#multiply
multiply:
popq %rcx
addq $0, %rcx
jz complete
mulq %rcx
jmp multiply
complete:
movq %rax, %rdi
movq $60, %rax
syscall
