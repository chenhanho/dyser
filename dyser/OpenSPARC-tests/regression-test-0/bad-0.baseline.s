	.file	"test.c"

	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Bad-0 Baseline Test complete.\n"
	.align 8
.LLC1:
	.asciz	"  Bad-0 Baseline iteration: %d.\n"
	
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -136, %sp
	!#PROLOGUE# 1
	
	sethi	%hi(.LLC0), %o0
	or	%o0, %lo(.LLC0), %o0
	call	printf, 0
	 nop
	
	mov	1, %l4
	
	sethi	%hi(.LLC0), %o0
	or	%o0, %lo(.LLC0), %o0
	call	printf, 0
	 nop
	
	sll	%l4, 12, %l4
	
	sethi	%hi(.LLC0), %o0
	or	%o0, %lo(.LLC0), %o0
	call	printf, 0
	 nop
	
.LOOP:
	add	%l0, %l1, %g1
	and	%g1, 0x0f, %l7
	add	%l0, %l1, %g1
	srl	%g1, 1, %l6
	mov	%l0, %g1
	mov	%l1, %l0
	mov	%g1, %l1
	not	%l2, %l2
	
	sethi	%hi(.LLC1), %o0
	or	%o0, %lo(.LLC1), %o0
	mov	%l4, %o1
	call	printf, 0
	 nop
	
	subcc	%l4, 1, %l4
!	bne	.LOOP
!	 nop
	
	sethi	%hi(.LLC0), %o0
	or	%o0, %lo(.LLC0), %o0
	call	printf, 0
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
