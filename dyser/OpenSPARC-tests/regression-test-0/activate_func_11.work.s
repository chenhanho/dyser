	.file	"outline.c"
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Activate Func 11 Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Activate Func 11 Test complete.\n"
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
dyser_init 000080
dyser_init 040980
dyser_init 040000
dyser_init 000010
dyser_init 008010
dyser_init 018000
dyser_init 080040
dyser_init 001801
dyser_init 030010
dyser_init 060050
dyser_init 000400
dyser_init 008000
dyser_init 10800c
dyser_init 050009
dyser_init 040300
dyser_init 000010

	mov	%g0, %g1
	mov	1, %g2
dyser_send 4 1 3 2
	mov	2, %g1
	mov	3, %g2
dyser_send 2 1 1 2
	mov	4, %g1
	mov	5, %g2
dyser_send 6 1 5 2
	mov	6, %g1
	mov	7, %g2
dyser_send 0 1 7 2
	mov	4, %g1
	mov	%g0, %g2
dyser_send 4 1 3 2
	mov	85, %g1
	mov	15, %g2
dyser_send 2 1 1 2
	mov	15, %g1
	mov	85, %g2
dyser_send 6 1 5 2
	mov	10, %g1
	mov	2, %g2
dyser_send 0 1 7 2
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

dyser_recv 1 1
	st	%g1, [%fp-32]
	mov	%g0, %g2
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
	mov	3, %g2
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
dyser_recv 5 1
	st	%g1, [%fp-32]
	mov	5, %g2
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
dyser_recv 3 1
	st	%g1, [%fp-32]
	mov	%g0, %g2
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
	mov	4, %g2
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
	mov	95, %g2
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
dyser_recv 5 1
	st	%g1, [%fp-32]
	mov	95, %g2
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
dyser_recv 3 1
	st	%g1, [%fp-32]
	mov	2, %g2
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
