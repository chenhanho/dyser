	.file	"outline.c"
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Constant Func 00 Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Constant Func 00 Test complete.\n"
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
	
dyser_init 000000
dyser_init 000000
dyser_init 001800
dyser_init 000000
dyser_init 000002
dyser_init 001000
dyser_init 000000
dyser_init 080040
dyser_init 000415
dyser_init 000100
dyser_init 010550
dyser_init 004000
dyser_init 028000
dyser_init 108002
dyser_init 050009
dyser_init 000085
dyser_init 000002

	mov	%g0, %g1
	mov	1, %g2
dyser_send 5 1 3 2
	mov	2, %g1
	mov	3, %g2
dyser_send 7 1 1 2
	mov	10, %g1
	mov	15, %g2
dyser_send 5 1 3 2
	mov	15, %g1
	mov	5, %g2
dyser_send 7 1 1 2
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop

dyser_recv 1 1
	st	%g1, [%fp-32]
	mov	5, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL1
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL1:
dyser_recv 0 1
	st	%g1, [%fp-32]
	mov	11, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
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
dyser_recv 4 1
	st	%g1, [%fp-32]
	mov	7, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL3
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL3:
dyser_recv 2 1
	st	%g1, [%fp-32]
	mov	13, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL4
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL4:
dyser_recv 1 1
	st	%g1, [%fp-32]
	mov	15, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL5
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL5:
dyser_recv 0 1
	st	%g1, [%fp-32]
	mov	5, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL6
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL6:
dyser_recv 4 1
	st	%g1, [%fp-32]
	mov	10, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL7
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL7:
dyser_recv 2 1
	st	%g1, [%fp-32]
	mov	15, %g2
	st	%g2, [%fp-20]
	cmp	%g1, %g2
	be	.LL8
	 nop
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	ld	[%fp-32], %o1
	ld	[%fp-20], %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]

.LL8:
	sethi	%hi(.LLC1), %g1
	or	%g1, %lo(.LLC1), %o0
	call	printf, 0
	 nop
	ld	[%fp-36], %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
