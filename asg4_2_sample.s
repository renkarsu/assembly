      .data # データ領域の開始
A:    .word 1 # 配列Aの宣言
      .word 2
      .word 4
      .word 3
      .word 0
      .text # テキスト領域の開始
      .globl main # プログラムの開始位置の宣言
main: la $t1, A # $t1 <= Aのアドレス (ポインタの初期化)
loop: lw $t2, 0($t1) # $t2 <= A[i]
      beq $t2, $zero, halt # if ($t2==0) goto halt
      bgt $t2, $t0, max # if ($t2>$t0) goto max
      addi $t1, $t1, 4 # $t1 <= $t1 + 4 (ポインタのincrement)
      j loop # jump to loop
max:  lw $t0, 0($t1) # $t0 <= A[i]
      addi $t1, $t1, 4 # $t1 <= $t1 + 4 (ポインタのincrement)
      j loop # jump to loop
halt: addi $v0, $zero, 10
      syscall # mainのexit