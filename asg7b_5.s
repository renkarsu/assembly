	.data
str:
	.asciiz "value = "
bas:
	.asciiz "second integer = "
pow:
	.asciiz "first integer = "
	.text
	.globl  main
main:
	sub	$sp,$sp,8
	sw	$ra,0($sp)


	li	$v0,4
	la	$a0,pow
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
		
	li	$v0,4
	la	$a0,bas
	syscall
	
	li $v0,5
	syscall
	move $a0,$t2
	move $a1,$v0


	jal	euc
	sw	$v0,4($sp)

# print the result 
	
	li	$v0,4
	la	$a0,str
	syscall

	li	$v0,1
	lw	$a0,4($sp)
	syscall

	lw	$ra,0($sp)
	add	$sp,$sp,8
	jr	$ra

# func

euc:
	sub	$sp,$sp,4
	sw	$s0,0($sp)
							
	bne $a1,$zero,L1
		j EXIT
	
	L1:   
		beq  $a1, $zero, EXIT
		move $t4,$a1
		rem $a1,$a0,$a1
		move $a0,$t4
		j    L1
	EXIT: 

	move $v0,$a0

	lw	$s0,0($sp)
	add	$sp,$sp,4
	jr	$ra