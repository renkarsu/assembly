.text                   # text section
.globl main             # call main by SPIM
main: addi $t0, $zero, 0     # 1
      addi $t1, $zero, 40960  # 2
      sll $9, $zero, 16  # 3
      addi $9, $9, 100    # 4
       # 5
                # 6
.data                   # data section
value: .word 10, 20, 0  # data for addition
syscall