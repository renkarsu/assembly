.text                   # text section
.globl main             # call main by SPIM
main: addi $t0, $0, 7     # load address ‘value’ into $t0
      addi $t1, $0, 95    # load word 0(value) into $t1
      add  $t2,$t0,$t1    # load word 4(value) into $t2
      addi $t3 $zero 10 # add two numbers into $t3
      sll $t3 $t3 10    # store word $t3 into 8($t0)
      addi $t3 $t3 64
      sw $t2 0($t3)
      lw  $t4, 0($t3)
.data                   # data section
value: .word 10, 20, 0  # data for addition
syscall # mainのexit