.data
list: .asciiz "iittirupati"
.text
main:
	la	$t0,list
	addi	$t1,$t0,10
	li	$s0,0
	li	$s1,10
	j	loop
	
loop:
	bgt	$s0,$s1,exit
	lb	$t2,0($t0)
	lb	$t3,0($t1)
	sb	$t3,0($t0)
	sb	$t2,0($t1)
	addi	$s0,$s0,1
	addi	$s1,$s1,-1
	addi	$t0,$t0,1
	addi	$t1,$t1,-1
	j	loop

exit:
	la	$s0,list
	li	$s1,0

print:
	lb	$a0,0($s0)
	addi	$s0,$s0,1
	addi	$s1,$s1,1
	li	$v0,11
	syscall
	bne	$s1,11,print
	jr	$31
	
