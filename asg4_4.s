.data
A: .space 80 # string A
TEXT1: .asciiz "input is "
TEXT2: .asciiz "output is "
       .text
       .globl main
main: li $t0, 0
      la $a0, TEXT1
      li $v0, 4
      syscall # print out TEXT1
      la $a0, A
      li $a1, 80
      li $v0, 8
      syscall # input string_A
      li $t2, 48 # ascii
      li $t3, 57 # ascii
      li $t4, 10 # num
LOOP: lb $t1, 0($a0)
      add $a0, $a0, 1 # increment pointer
      blt $t1, $t2, NEXT
      bgt $t1, $t3, NEXT
      mul $t0, $t0, $t4
      add $t0, $t0, $t1
      sub $t0, $t0, $t2 # if $t0 is num, sub $t0 by "0"
      j LOOP
NEXT: la $a0, TEXT2
      li $v0, 4
      syscall # print out TEXT2
      move $a0, $t0
      li $v0, 1
      syscall # print out $to
      li $a0, 0xa
      li $v0, 11
      syscall # print return
      li $v0, 10
      syscall
