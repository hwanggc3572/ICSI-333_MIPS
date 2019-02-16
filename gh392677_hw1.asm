Loop1:
addi $v0, $zero, 5		# read user input
syscall
add $t0, $zero, $v0		# put the result in $t0

addi $t1, $zero, -2147483648	# $t1 1000 0000 0000 0000 0000 0000 0000 0000
add $t5, $zero, $zero		# $t5: counter starts from 0

add $t6, $zero, $zero		# $t6 = 0
addi $t7, $zero, 1		# $t7 = 1

Loop2:
and $t2, $t0, $t1		# use 'and' to find the position both $t0 and $t1 have 1
blt $t2, 1, ELSE		# if $t2 is bigger than 0(XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX - somewhere 1), print 1($t7)
	addi $v0, $zero, 1
	add $a0, $t7, $zero
	syscall
	j Next			# jump to Next
ELSE:				# if $t2 is 0(0000 0000 0000 0000 0000 0000 0000 0000), print 0($t6)
addi $v0, $zero, 1
add $a0, $t6, $zero
syscall
j Next				# jump to Next
Next:
srl $t1, $t1, 1			# halve $t1 every iteration (ex: 1000 -> 0100)
addi $t5, $t5, 1		# add 1 to the counter
blt $t5, 32, Loop2		# repeat Loop2 32 times to make a 32 bits binary number
j Loop1				# jump to Loop1 to read user input again