.data
	askForStr: .asciiz "Enter your String: "
	mayBePalindrome: .space 256
	
	strIsPalindrome: .asciiz " is a palindrome\n"
	strNotPalindrome: .asciiz " is not a palindrome\n"  
.text
	main:	
	
	la $a0, askForStr	
	jal cout		# Print "Enter your String: "
	
	la $a0, mayBePalindrome
	li $a1, 256
	jal getString		# Get User Input String (\n is at the end)
	
	move $s0, $v1		# Store String address
	
	move $a0, $v1
	jal strLen		# Get String Length
	
	move $s1, $v1		# Store String length in s1
	
	add $s3, $s0, $s1	# Store String last character location	
	
	srl $s1, $s1, 1		# Set s1 to String Length / 2
	
	li $s2, 1	# set s2 ( bool isPalindrome)  = true
	
	li $t0, 0	# int i = 0
	
	palindromeLoop:
	slt $t1, $t0, $s1
	beq $t1, $zero, palindromeLoopBreak
	addi $t0, $t0, 1
	
	lb $t2, 0($s0)
	lb $t3, -1($s3)
	
	bne $t2, $t3, changePalindromeStatus
	
	addi $s0, $s0, 1
	subi $s3, $s3, 1
	j palindromeLoop
	
	changePalindromeStatus:
	li $s2, 0
	
	palindromeLoopBreak:
	
	la $a0, mayBePalindrome
	jal cout
	
	beq $s2, $zero, isNotAPalindrome
	la $a0, strIsPalindrome
	jal cout
	j endProgram
	
	
	isNotAPalindrome:
	la $a0, strNotPalindrome
	jal cout
	
	# End of program
	endProgram:
	li $v0, 10
	syscall
	
	
	
	#####################################
	#					  #
	# 		FUNCTIONS		  #
	#					  #
	#####################################
	
	cout:
	# arguments:
	# a0: String address
	li $v0, 4
	syscall
	jr $ra
	
	getString:
	# arguments:
	# a0:String address to be stored
	# a1:Length String address to be stored
	# return
	# v1: Adress of string to be stored
	li $v0, 8
	syscall
	la $v1, mayBePalindrome
	jr $ra
	
	strLen:
	# arguments:
	# a0: String address
	# return
	# v1: String len
		# strLenLoopInit
		add $v1, $zero, $zero # int result = 0
		addi $t0, $zero, 10   # value of \n
		strLenLoop:
		lb $t1, 0($a0)	# char c = str[i]
		beq $t1, $t0, strLenReturn # if (c == 0) return result
		addi $v1, $v1, 1 # result += 1
		addi $a0, $a0, 1 # i += 1
		j strLenLoop
		strLenReturn:
		jr $ra
