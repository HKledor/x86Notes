.globl _start

.section .text
_start:
mov $60, %ax
mov $3, %di
syscall
