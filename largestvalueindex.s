.globl _start
.section .data

numberofnumbers:
.quad 7

mynumbers: 
.quad 5,20,33,80,52,10,1

.section .text
_start:
movq numberofnumbers, %rcx
movq $0, %rbx  #index
movq $0, %rdi  #largest num
myloop:
movq mynumbers(,%rbx,8), %rax
cmpq mynumbers(,%rbx,8), %rdi
jge loopcontrol
movq %rax, %rdi
loopcontrol:
incq %rbx
loopq myloop
endloop:
movq $60, %rax
syscall
