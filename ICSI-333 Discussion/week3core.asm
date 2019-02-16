add $t1, $zero, 1

addi $v0, $zero, 1
add $a0, $t1, $zero
syscall

Loop:
sll $t1, $t1, 1

addi $v0, $zero, 1
add $a0, $t1, $zero
syscall

bne $t1, 128, Loop
