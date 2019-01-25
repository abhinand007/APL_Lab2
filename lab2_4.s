	.file	1 "lab2_4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	checkNum
	.set	nomips16
	.set	nomicromips
	.ent	checkNum
	.type	checkNum, @function
checkNum:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$0,0($fp)
	li	$2,2			# 0x2
	sw	$2,4($fp)
	b	$L2
	nop

$L5:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L3
	nop

	li	$2,3			# 0x3
	sw	$2,0($fp)
	b	$L4
	nop

$L3:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L2:
	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L5
	nop

$L4:
	lw	$2,0($fp)
	bne	$2,$0,$L6
	nop

	lw	$2,16($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L7
	nop

	li	$2,1			# 0x1
	sw	$2,0($fp)
	b	$L6
	nop

$L7:
	lw	$3,16($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L8
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L8:
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L6
	nop

	li	$2,2			# 0x2
	sw	$2,0($fp)
$L6:
	lw	$2,0($fp)
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	checkNum
	.size	checkNum, .-checkNum
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	li	$2,11			# 0xb
	sw	$2,28($fp)
	lw	$2,28($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L15
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L13
	nop

	li	$3,1			# 0x1
	bne	$2,$3,$L11
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
	b	$L11
	nop

$L16:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L15:
	lw	$4,28($fp)
	.option	pic0
	jal	checkNum
	nop

	.option	pic2
	move	$3,$2
	li	$2,3			# 0x3
	bne	$3,$2,$L16
	nop

	b	$L11
	nop

$L13:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
	nop
$L11:
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
