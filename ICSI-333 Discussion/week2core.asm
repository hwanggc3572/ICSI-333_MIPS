addi $v0, $zero, 5
syscall
add $t0, $zero, $v0

addi $v0, $zero, 5
syscall
add $t1, $zero, $v0

ble $t0, $t1, ELSE
	add $v0, $zero, 1
	add $a0, $t0, $zero
	syscall
	j exit
ELSE:
add $v0, $zero, 1
add $a0, $t1, $zero
syscall
exit:
