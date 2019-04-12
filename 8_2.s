.data
array: .word 0, 1, 0, 1, 0, 1
.text
main:
	la	$t0,array
	addi	$t1,$t0,20
	li	$s0,0
	li	$s1,5
	li	$s2,5
	j	loop

loop:
	bgt	$s0,$s1,exit
	lw	$t2,0($t0)
	lw	$t3,0($t1)
	beq	$t2,0,if1
	beq	$t3,1,if2
	sw	$t3,0($t0)
	sw	$t2,0($t1)
	addi	$t0,$t0,4
	addi	$s0,$s0,1
	addi	$t1,$t1,-4
	addi	$s1,$s1,-1
	j	loop

if1:
	addi	$t0,$t0,4
	addi	$s0,$s0,1
	j	loop

if2:
	addi	$t1,$t1,-4
	addi	$s1,$s1,-1
	j	loop

exit:
	la	$s0,array
	li	$s2,0
	
print:
	lw	$a0,0($s0)
	addi	$s0,$s0,4
	addi	$s2,$s2,1
	li	$v0,1
	syscall
	bne	$s2,6,print
	jr	$31
