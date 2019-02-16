li $v0, 42
li $a1, 100
syscall		# Generate a random number 1 ~ 100

addi $v0, $zero, 1
add $a0, $a0, $zero
syscall		# display the random number

add $a1, $a0, $zero	# copy a0 to a1 to compare to user input

start:			# for iteration
addi $v0, $zero, 5
syscall
add $t0, $zero, $v0	# get user input


beq $t0, $a1, end 	# if user input equals random number, it goes to end
blt $t0, $a1, ELSE	
	add $a0, $zero, 72 	# H
	add $v0, $zero, 11
	syscall			
	j start			# return to start to get a new user input
ELSE:
add $a0, $zero, 76		# L
add $v0, $zero, 11
syscall
j start				# return to start to get a new user input

end:
add $a0, $zero, 67		# C
add $v0, $zero, 11
syscall
