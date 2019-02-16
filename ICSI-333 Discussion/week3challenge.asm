addi $v0, $zero, 5 	# read input
syscall
add $t0, $zero, $v0

add $t1, $zero, 255 	# 0000 0000 0000 0000 0000 0000 1111 1111

and $t2, $t0, $t1	# use and operator to find the same place which 1 put in

add $v0, $zero, 1	# display value
add $a0, $t2, $zero
syscall
