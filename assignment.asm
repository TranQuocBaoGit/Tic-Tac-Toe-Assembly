.data
	newline: .asciiz "\n"
	space: .byte ' '
	playboard: .asciiz "   |   |      (1|2|3)\n---+---+---\n   |   |      (4|5|6)\n---+---+---\n   |   |      (7|8|9)\n"
	Xturn: .asciiz "This is player X's turn, insert your play: "
	Oturn: .asciiz "This is player O's turn, insert your play: "
	X: .asciiz "X"
	O: .asciiz "O"
	Xwin: .asciiz "Player X win!!\n"
	Owin: .asciiz "Player O win!!\n"
	tie: .asciiz "\nTie!!\n"
	menu: .asciiz "\nChoose your next option: \nInsert [1] to play again, [2] to exist\nYour option: "
	invalid: .asciiz "*Invalid move*\nInsert again: "
	invalidInsert: .asciiz "\n*Invalid option*\nInsert [1] to play again, [2] to exist\nYour option: "
	#again: .asciiz "Please insert again: "
	occupied: .asciiz "*Space already occupied*\nInsert again: "
.text
main:
	li $s0, 0
	la $s1, playboard
	li $s2, 0
	
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	li $t9, 0
	
	lb $a1, space
	sb $a1, 1($s1)
	sb $a1, 5($s1)
	sb $a1, 9($s1)
	sb $a1, 35($s1)
	sb $a1, 39($s1)
	sb $a1, 43($s1)
	sb $a1, 69($s1)
	sb $a1, 73($s1)
	sb $a1, 77($s1)
	
begin:
	li $v0, 4
	la $a0, playboard
	syscall
	
	beq $s0, 9, Tie
	addi $s0, $s0, 1
	andi $t0, $s0, 1
	bnez $t0, playerX

playerO:
	li $v0, 4
	la $a0, Oturn
	syscall
	j startPlay

playerX:
	li $v0, 4
	la $a0, Xturn
	syscall

startPlay:
	li $v0, 5
	syscall
	move $s2, $v0
	li $v0, 4
	la $a0, newline
	syscall
	
	beq $s2, 1, Pos1
	beq $s2, 2, Pos2
	beq $s2, 3, Pos3
	beq $s2, 4, Pos4
	beq $s2, 5, Pos5
	beq $s2, 6, Pos6
	beq $s2, 7, Pos7
	beq $s2, 8, Pos8
	beq $s2, 9, Pos9

	li $v0, 4
	la $a0, invalid
	syscall
	j startPlay

Pos1:
	bnez $t1, SpaceOccipied
	bnez $t0, X1
	
		O1:
		li $t1, 2
		lb $a1, O
		sb $a1, 1($s1)
		j checkVitory
		
		X1:
		li $t1, 1
		lb $a1, X
		sb $a1, 1($s1)
		j checkVitory
		
Pos2:
	bnez $t2, SpaceOccipied
	bnez $t0, X2
	
		O2:
		li $t2, 2
		lb $a1, O
		sb $a1, 5($s1)
		j checkVitory
		
		X2:
		li $t2, 1
		lb $a1, X
		sb $a1, 5($s1)
		j checkVitory
		
Pos3:
	bnez $t3, SpaceOccipied
	bnez $t0, X3
	
		O3:
		li $t3, 2
		lb $a1, O
		sb $a1, 9($s1)
		j checkVitory
		
		X3:
		li $t3, 1
		lb $a1, X
		sb $a1, 9($s1)
		j checkVitory
		
Pos4:
	bnez $t4, SpaceOccipied
	bnez $t0, X4
	
		O4:
		li $t4, 2
		lb $a1, O
		sb $a1, 35($s1)
		j checkVitory
		
		X4:
		li $t4, 1
		lb $a1, X
		sb $a1, 35($s1)
		j checkVitory
		
Pos5:
	bnez $t5, SpaceOccipied
	bnez $t0, X5
	
		O5:
		li $t5, 2
		lb $a1, O
		sb $a1, 39($s1)
		j checkVitory
		
		X5:
		li $t5, 1
		lb $a1, X
		sb $a1, 39($s1)
		j checkVitory
		
Pos6:
	bnez $t6, SpaceOccipied
	bnez $t0, X6
	
		O6:
		li $t6, 2
		lb $a1, O
		sb $a1, 43($s1)
		j checkVitory
		
		X6:
		li $t6, 1
		lb $a1, X
		sb $a1, 43($s1)
		j checkVitory
		
Pos7:
	bnez $t7, SpaceOccipied
	bnez $t0, X7
	
		O7:
		li $t7, 2
		lb $a1, O
		sb $a1, 69($s1)
		j checkVitory
		
		X7:
		li $t7, 1
		lb $a1, X
		sb $a1, 69($s1)
		j checkVitory
		
Pos8:
	bnez $t8, SpaceOccipied
	bnez $t0, X8
	
		O8:
		li $t8, 2
		lb $a1, O
		sb $a1, 73($s1)
		j checkVitory
		
		X8:
		li $t8, 1
		lb $a1, X
		sb $a1, 73($s1)
		j checkVitory
		
Pos9:
	bnez $t9, SpaceOccipied
	bnez $t0, X9
	
		O9:
		li $t9, 2
		lb $a1, O
		sb $a1, 77($s1)
		j checkVitory
		
		X9:
		li $t9, 1
		lb $a1, X
		sb $a1, 77($s1)
		j checkVitory
		
SpaceOccipied:
	li $v0, 4
	la $a0, occupied
	syscall
	j startPlay
	
checkVitory:
	and $s3, $t1, $t2
	and $s3, $s3, $t3
	bnez $s3, Victory
	
	and $s3, $t4, $t5
	and $s3, $s3, $t6
	bnez $s3, Victory
	
	and $s3, $t7, $t8
	and $s3, $s3, $t9
	bnez $s3, Victory
	
	and $s3, $t1, $t4
	and $s3, $s3, $t7
	bnez $s3, Victory
	
	and $s3, $t2, $t5
	and $s3, $s3, $t8
	bnez $s3, Victory
	
	and $s3, $t3, $t6
	and $s3, $s3, $t9
	bnez $s3, Victory
	
	and $s3, $t1, $t5
	and $s3, $s3, $t9
	bnez $s3, Victory
	
	and $s3, $t3, $t5
	and $s3, $s3, $t7
	bnez $s3, Victory
	j begin
	
Victory:
	li $v0, 4
	la $a0, playboard
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	bnez $t0, Xwon
	
Owon:
	li $v0, 4
	la $a0, Owin
	syscall
	j exitMenu
	
Xwon:
	li $v0, 4
	la $a0, Xwin
	syscall
	j exitMenu
	
Tie:
	li $v0, 4
	la $a0, tie
	syscall
	
exitMenu:
	li $v0, 4
	la $a0, menu
	syscall
insert:
	li $v0, 5
	syscall
	beq $v0, 1, main
	beq $v0, 2, exit
insertAgain:
	li $v0, 4
	la $a0, invalidInsert
	syscall
	j insert
exit:
	li $v0, 10
	syscall
