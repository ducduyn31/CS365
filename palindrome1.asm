.data
	askForStr:          .asciiz     "Enter your String: "
	mayBePalindrome:    .space      256
	
	strIsPalindrome:    .asciiz     " is a palindrome\n"
	strNotPalindrome:   .asciiz     " is not a palindrome\n"
.text
	main:	

	# Print "Enter your String: "
	la      $a0,        askForStr
	jal     cout


	# Get User Input String (\n is at the end)
	la      $a0,        mayBePalindrome
	li      $a1,        256
	jal     getString

	# Store String address to static memory s0
	move    $s0,        $v1

	# Get String Length
	move    $a0,        $v1
	jal     strLen

	# Store String length in static memory s1
	move    $s1,        $v1
	
	# Remove \n
	move    $a0,        $s0
	move    $a1,        $s1
	jal     rmChar

	# Store String last character location
	add     $s3,        $s0,        $s1

	# Set s1 to String Length / 2
	srl     $s1,        $s1,        1

	# set s2 ( bool isPalindrome)  = true
	li      $s2,        1

	# int i = 0
	li      $t0,        0
	
	palindromeLoop:
	slt     $t1,        $t0,        $s1
	beq     $t1,        $zero,      palindromeLoopBreak
	addi    $t0,        $t0,        1
	
	lb      $t2,        0($s0)
	lb      $t3,        -1($s3)
	
	bne     $t2,        $t3,        changePalindromeStatus
	
	addi    $s0,        $s0,        1
	subi    $s3,        $s3,        1
	j       palindromeLoop
	
	changePalindromeStatus:
	li      $s2,        0
	
	palindromeLoopBreak:
	
	la      $a0,        mayBePalindrome
	jal     cout
	
	beq     $s2,        $zero,      isNotAPalindrome
	la      $a0,        strIsPalindrome
	jal     cout
	j       endProgram
	
	
	isNotAPalindrome:
	la      $a0,        strNotPalindrome
	jal     cout
	
	# End of program
	endProgram:
	li      $v0,        10
	syscall
	
	
	
	#####################################
	#					  #
	# 		FUNCTIONS		  #
	#					  #
	#####################################
	
	cout:
	# arguments:
	# a0: String address
	li      $v0,        4
	syscall
	jr      $ra
	
	getString:
	# arguments:
	# a0:String address to be stored
	# a1:Length String address to be stored
	# return
	# v1: Adress of string to be stored
	li      $v0,        8
	syscall
	la      $v1,        mayBePalindrome
	jr      $ra
	
	strLen:
	# arguments:
	# a0: String address
	# return
	# v1: String len

    # set return value to 0
    add     $v1,        $zero,      $zero
    # set \n to the end of the string character
    addi    $t0,        $zero,      10

    strLenLoop:
    lb      $t1,        0($a0)	                    # char c = str[i]
    beq     $t1,        $t0,        strLenReturn    # if (c == 0) return result
    addi    $v1,        $v1,        1               # result += 1
    addi    $a0,        $a0,        1               # i += 1
    j       strLenLoop
    strLenReturn:
    jr      $ra

    rmChar:
    # arguments
    # a0: String address
    # a1 char index
    add 	$t0,        $a0,        $a1
    sb      $zero,      0($t0)
    jr      $ra
