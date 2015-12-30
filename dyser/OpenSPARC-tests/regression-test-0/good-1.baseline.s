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
.LOOP:  ! unrolled 12 times
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	sll	%l2, 1, %l2
	or	%l2, 1, %l3
	not	%l2, %l4
	add	%l3, %l4, %l5
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
