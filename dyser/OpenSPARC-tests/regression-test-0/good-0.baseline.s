	.file	"test.c"

	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -136, %sp
	!#PROLOGUE# 1
	
	mov	1, %g7
	sll	%g7, 12, %g7
.LOOP:
	add	%l0, %l1, %g1
	and	%g1, 0x0f, %l7
	add	%l0, %l1, %g1
	srl	%g1, 1, %l6
	mov	%l0, %g1
	mov	%l1, %l0
	mov	%g1, %l1
	not	%l2, %l2
	
	add	%l0, %l1, %g1
	and	%g1, 0x0f, %l7
	add	%l0, %l1, %g1
	srl	%g1, 1, %l6
	mov	%l0, %g1
	mov	%l1, %l0
	mov	%g1, %l1
	not	%l2, %l2
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
