      .data #データ領域の開始
A    :.word 1 #配列Aの宣言
      .word 2
      .word 4
      .word 3
      .word 0
      .text #テキスト領域の開始
      .globl main #プログラムの開始位置の宣言
main : add $t0, $zero, $zero #$t0 <= 0（総和の初期化
       la $t1, A #$t1 <= Aのアドレス(ポインタの初期化)
loop : lw $t2, 0($t1) #$t2 <= A[i]
       beq $t2, $zero,halt #if ($t2 == 0) goto halt
       add $t0 $t0, $t2 #$t0 <= $t0 + $t2
       addi $t1, $t1, 4 #$t1 <= $t1 + 4(ポインタのincrement)
       j loop #jump to loop
halt : addi $v0, $zero, 10
       syscall #mainのexit
