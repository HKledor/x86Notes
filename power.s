#Purp: Prgo to illustrate how to func
# This prog will compute 2^3 + 5^2

#Everything in main prog is stored in registers

.section .data

.section .text

.globl _start
_start:
push $3
push $2
call power
addl $8, %esp
pushl %eax
push $2
push $5
call power
add $8, %esp
popl %ebx

add %eax, %ebx
mov $1, %eax
int $0x80


#POWER FUNC

# WIll RETURN OUTPUT
# FIRST ARG BASE NUM
# SECOND ARG POWER TO RAISE TO

#VARS
# %ebx - holds base num
# %ecx - holds pow

## -4(%ebp) holds result

# eax used for temp stor

.type power, @function
power:
pushl %ebp
mov %esp, %ebp
sub $4, %esp
movl 8(%ebp), %ebx
mov 12(%ebp), %ecx
movl %ebx, -4(%ebp)

power_loop_start:
cmpl $1,%ecx
je end_power
mov -4(%ebp), %eax
imull %ebx, %eax
mov %eax, -4(%ebp)

dec %ecx
jmp power_loop_start

end_power:
mov -4(%ebp), %eax
mov %ebp, %esp
popl %ebp
ret

