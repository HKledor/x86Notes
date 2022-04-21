#PURPOSE  This Program Finds the Maximum Number of a set of data items

#Vars : 

# %edi - Holds the index of the data item being examined
# %ebx - Largest Item Found
# %eax - Current Data Item

# Following Mem locs are used

# data_items - contains item data a 0 terminates data

.section .data

data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66
data_items_end:
.section .text

.globl _start

_start:
movl $0, %edi # move 0 into edi
movl data_items(,%edi,4), %eax # load first byte of data
movl $0, %ebx # since this is first time, %eax is biggest

start_loop:
cmpl $data_items_end*4, %edi # if 0 is @ eax break
je loop_exit
incl %edi # load next val
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax # compare vals
jle start_loop
movl %eax, %ebx # move the val as biggest
jmp start_loop

loop_exit:
#ebx is status code for exit sys call and has max num

movl $1, %eax #1 is exit() syscall
int $0x80
