	.file	1 "lab2_3.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	isPrime
	.set	nomips16
	.set	nomicromips
	.ent	isPrime
	.type	isPrime, @function
isPrime:
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

	li	$2,1			# 0x1
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
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	isPrime
	.size	isPrime, .-isPrime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,448,$31		# vars= 416, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-448
	sw	$31,444($sp)
	sw	$fp,440($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,436($fp)
	sw	$0,28($fp)
	li	$2,2			# 0x2
	sw	$2,32($fp)
	b	$L8
	nop

$L10:
	lw	$4,32($fp)
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	lw	$28,16($fp)
	bne	$2,$0,$L9
	nop

	lw	$2,28($fp)
	addiu	$3,$2,1
	sw	$3,28($fp)
	sll	$2,$2,2
	addiu	$3,$fp,440
	addu	$2,$3,$2
	lw	$3,32($fp)
	sw	$3,-404($2)
$L9:
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L8:
	lw	$2,32($fp)
	slt	$2,$2,100
	bne	$2,$0,$L10
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,436($fp)
	lw	$3,0($3)
	beq	$4,$3,$L12
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L12:
	move	$sp,$fp
	lw	$31,444($sp)
	lw	$fp,440($sp)
	addiu	$sp,$sp,448
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
