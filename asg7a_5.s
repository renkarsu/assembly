.data
prompt:     .asciiz "How many primes? "
line:       .asciiz "\n"
.text
.globl main
main:
la $a0, prompt
syscall

#receive input
li $v0, 5
syscall
add $s1, $v0, $zero

beq $s1, $zero, exit

#print 1st prime
li $v0, 1
addi $a0, $zero, 2
syscall

li $v0, 4               # print new line
la $a0, line
syscall

addi $s2, $s2, 1
addi $a2, $zero, 2

loop:
addi $a2, $a2, 1
#beq $s2, $s1, exit
jal check_prime
beq $v1, $zero, loop
addi $s2, $s2, 1
#print next prime
li $v0, 1
add $a0, $a2, $zero
syscall

li $v0, 4               # print a new line
la $a0, line
syscall

beq $s2, $s1, exit
j loop

check_prime:
add $t1, $a2, $zero
addi $t2, $zero, 1
loop2:
addi $t2, $t2, 1
beq $t2, $t1, true
div $t3, $t1, $t2
mfhi $t4
beq $t4, $zero, false
j loop2
false:
li $v1, 0
jr $ra
true:
li $v1, 1
jr $ra

exit:
# program exit
li $v0, 10
syscall
