.text                   # text section
.globl main             # call main by SPIM
main: addi $t1, $zero, 1     # 1
start: addi $t0, $zero, 16384  # 2 16384==0x4000
      sll $t0, $t0, 17        # 3
loop: srl $8, $8, 1          # 4
      bne $8, $9, loop       # 5
      j start                # 6
.data                   # data section
value: .word 10, 20, 0  # data for addition
syscall