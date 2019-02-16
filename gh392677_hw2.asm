.data
#string to be printed
msg1: .asciiz "\nEnter Array Size: "
msg2: .asciiz "\nEnter Integer: "
msg3: .asciiz "\nSorted Array: "
.text

main:

li $v0, 4		#print msg1
la $a0, msg1
syscall

li $v0, 5		#read array size from user
syscall
add $t9, $zero, $v0	#arraysize = $t9

add $t0, $zero, $zero	#set counter
add $t1, $zero, $sp	#set index

loop:			#make an array by the numbers from user input
beq $t0, $t9, else	#if the counter equals arraysize, the loop goes to else

li $v0, 4		#print msg2
la $a0, msg2
syscall

li $v0, 5		#read input integer
syscall
sw $v0, 0($t1)		#save the number into the array[index]

add $t1, $t1, 4		#go to next index
addi $t0, $t0, 1	#add 1 to counter

j loop

else:

jal bubbleSort		#go to bubbleSort 

li $v0, 4		#print msg3
la $a0, msg3
syscall

add $t0, $zero, $zero		#reset counter
add $t1, $zero, $sp		#reset index 

print:				#print array in ascending order by bubble sort
beq $t0, $t9, endprint		#while($t0 < arraysize)

lw $t2, 0($t1)			#$t2 = array[index]

add $a0, $zero, $t2		#print $t2
li $v0, 1
syscall

addi $a0, $zero, 32		#print space
li $v0, 11
syscall

addi $t0, $t0, 1		#$t0++
addi $t1, $t1, 4		#next index
j print

endprint:

j exit

bubbleSort:			#Bubble Sort

add $t0, $zero, $zero		#reset counter

iloop:				#i-loop
beq $t0, $t9, endiloop		#for(i=0;i<arraysize;i++)
add $t1, $zero, $sp		#index
addi $t2, $t1, 4		#index + 1
addi $t7, $zero, 1		#j-loop counter

jloop:				#j-loop
beq $t7, $t9, endjloop		#for(j=1;j<arraysize;j++)
lw $t4, 0($t1)			#$t4=array[index]
lw $t5, 0($t2)			#$t5=array[index+1]
bgt $t4, $t5, elsei		#if array[index] <= array[index+1], just move to next index and counter
addi $t1, $t1, 4
addi $t2, $t2, 4
addi $t7, $t7, 1
j next
elsei:				#if array[index] > array[index+1]
sw $t4, 0($t2)			#swap array[index], array[index+1]
sw $t5, 0($t1)			
addi $t1, $t1, 4		#and move to next index and counter
addi $t2, $t2, 4
addi $t7, $t7, 1
next:
j jloop
endjloop:

addi $t0, $t0, 1		#add 1 to i-loop counter
j iloop

endiloop:

jr $ra			#return to the address in main

exit:			#end the program
