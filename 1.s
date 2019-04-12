
array:  .word 1,2,3,2,3,2,1,3
main:
	la    $t0,array
	li    $s0,8
	li    $s1,0
	li    $s2,0
	li    $s3,3
	j     loop

loop:
	bgt   $s1,$s0,exit
	lw    $t1,0($t0)
	addi  $t0,$t0,4
	addi  $s1,$s1,1
	beq   $t1,$s3,if
	j     loop

if:
    addi  $s2,$s2,1
    j     loop

exit:
    jr    $31
