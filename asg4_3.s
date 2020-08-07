    .data # データ領域の開始
A:  .word 1 # 配列Aの宣言
    .word 2
    .word 4
    .word 3
    .word 0
    .text # テキスト領域の開始
    .globl main # プログラムの開始位置の宣言
main: la $t1, A # $t1 <= Aのアドレス (ポインタの初期化)
      add $a0, $zero, $zero # $a0を初期化
loop: lw $a1, 0($t1) # $a1 <= A[i]
      beq $a1, $zero, halt # if ($a1==0) goto halt
      jal large # Large関数にジャンプ
      add $a0, $v0, $zero
      add $t0, $v0, $zero
      addi $t1, $t1, 4 # $t1 <= $t1 + 4 (ポインタのincrement)
      j loop # jump to loop
large: addi $sp, $sp, -4
      sw $s1, 0($sp) # $s1の退避
      slt $s1, $a0, $a1 # if ($a0 < $a1) $s1 <= 1
      bne $s1, $zero, L1 # if ($s1 != 0) goto L1
      add $v0, $a0, $zero # $v0 <= $a0 ($a0 is larger)
      j L2
L1: add $v0, $a1, $zero # $v0 <= $a1 ($a1 is larger)
L2: lw $s1, 0($sp) # $s1の復元
      addi $sp, $sp, 4
      jr $ra # return
halt: addi $v0, $zero, 10
syscall # mainのexit