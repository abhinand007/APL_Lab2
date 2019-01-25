	.file	1 "lab2_1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 16, regs= 3/0, args= 0, gp= 0
	.mask	0x40030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$fp,$sp
	li	$16,5			# 0x5
	li	$17,7			# 0x7
	addu	$2,$16,$17
	sw	$2,0($fp)
	subu	$2,$17,$16
	sw	$2,4($fp)
	mul	$2,$16,$17
	sw	$2,8($fp)
	teq	$16,$0,7
	div	$0,$17,$16
	mfhi	$2
	mflo	$2
	sw	$2,12($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
