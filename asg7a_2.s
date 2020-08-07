        .data
A:      .space 80 # string A
B:      .space 80 # string B
TEXT1:  .asciiz "input is "
TEXT2:  .asciiz "output is "
        .text
        .globl main
main:   li $t0, 0
        la $a0, TEXT1
        li $v0, 4
        syscall # print out TEXT1
        la $a0, A
        li $a1, 80
        li $v0, 8
        syscall # read string_A
        add $t1, $zero, $zero # initialize
        add $t2, $zero, $zero # initialize
LOOP:   lb $t1, 0($a0) # to check array size
        bne $t1, $zero, write # if($t1 == 0)
        add $t2, $zero, 1 # count
        add $a0, $a0, 1
        j LOOP
        ### 下は$t0がずっと代入されるだけ
write:  add $a0, $a0, -1
        sb $t0, 0($a0)
        add $t2, $t2, -1
        bne $t2, $zero, NEXT
        j write
NEXT:   la $a0, TEXT2
        li $v0, 4
        syscall # print out TEXT2
        la $a0, $t0
        li $v0, 8
        syscall # print string_B
        li $a0, 0xa
        li $v0, 11
        syscall # print return
        li $v0, 10
        syscall #exit
