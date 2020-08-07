	.data
input:	.space	80
output:	.space	80
TEXT1:  .asciiz "input is "
TEXT2:  .asciiz "output is "
	.text
	.globl main
main:
  li $v0, 4
  la $a0, TEXT1
  syscall # print out TEXT1

	li	$v0, 8
	la	$a0, input
	li	$a1, 80
	syscall
	
	li	$v0, 4
	la	$a0, input
	syscall
	
	jal	strlen

	add	$t1, $zero, $v0
	add	$t2, $zero, $a0
	add	$a0, $zero, $v0
	li	$v0, 1
	syscall
	
reverse:
	li	$t0, 0
	li	$t3, 0
	
	reverse_loop:
		add	$t3, $t2, $t0
		lb	$t4, 0($t3)
		beqz	$t4, exit
		sb	$t4, output($t1)
		addi	$t1, $t1, -1
		addi	$t0, $t0, 1
		j	reverse_loop
	
exit:
# add a newline
  addi $a0, $0, 0xA
  addi $v0, $0, 0xB
  syscall

  li $v0, 4
  la $a0, TEXT2
  syscall # print out TEXT2

	li	$v0, 4
	la	$a0, output
	syscall
		
	li	$v0, 10
	syscall
	
strlen:
	li	$t0, 0
	li	$t2, 0
	
	strlen_loop:
		add	$t2, $a0, $t0
		lb	$t1, 0($t2)
		beqz	$t1, strlen_exit
		addiu	$t0, $t0, 1
		j	strlen_loop
		
	strlen_exit:
		addi	$t0, $t0, -1
		add	$v0, $zero, $t0
		add	$t0, $zero, $zero
		jr	$ra