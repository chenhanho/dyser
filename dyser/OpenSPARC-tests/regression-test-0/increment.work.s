	.file	"outline.c"
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Increment Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Increment Test complete.\n"
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -136, %sp
	!#PROLOGUE# 1
	st	%g0, [%fp-36]
	
	st	%g0, [%fp-24]
	mov	1, %g1
	st	%g1, [%fp-28]
	ld	[%fp-24], %o5
	ld	[%fp-28], %g1
	add	%o5, %g1, %g1
	st	%g1, [%fp-20]
	
dyser_init 000000
dyser_init 000000
dyser_init 000000
dyser_init 000000
dyser_init 000000
dyser_init 000080
dyser_init 000000
dyser_init 000040
dyser_init 000404
dyser_init 000000
dyser_init 000008
dyser_init 000000
dyser_init 000200
dyser_init 000000
dyser_init 008018
dyser_init 000000
dyser_init 000000
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
dyser_send 2 0
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
dyser_recv 0 1
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	
	st	%g1, [%fp-32]
	ld	[%fp-32], %o5
	ld	[%fp-20], %g1
	cmp	%o5, %g1
	be	.LL2
	nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL2:
	sethi	%hi(.LLC1), %g1
	or	%g1, %lo(.LLC1), %o0
	call	printf, 0
	 nop
.LL1:
	ld	[%fp-36], %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
