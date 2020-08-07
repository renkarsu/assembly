      .data # データ領域の開始
A    :.word 1 # 配列Aの宣言
      .word 2
      .word 4
      .word 3
      .word 0
      .text # テキスト領域の開始
      .globl main # プログラムの開始位置の宣言
main : add $t0, $zero, $zero # 2 t0 will be max
       la $t1, A # 3
loop : lw $t2, 0($t1) # 4 t2 <= A[i]
       bgt $t0, $t2, go # 5 if(rs > rt)
       move $t0 $t2 # 6
go :   addi $t1, $t1, 4 # 7
       beq $t2, $zero, halt #9
       j loop # 10
halt : addi $v0, $zero, 10 # 11
       syscall #mainのexit
