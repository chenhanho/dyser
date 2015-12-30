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
	
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80400  ! dyser_init 0x000080
	.word 0x89b84c00  ! dyser_init 0x040980
	.word 0x89b80000  ! dyser_init 0x040000
	.word 0x81b80010  ! dyser_init 0x000010
	.word 0x81bc0010  ! dyser_init 0x008010
	.word 0x83bc0000  ! dyser_init 0x018000
	.word 0x91b80200  ! dyser_init 0x080040
	.word 0x81b8c001  ! dyser_init 0x001801
	.word 0x87b80010  ! dyser_init 0x030010
	.word 0x8db80210  ! dyser_init 0x060050
	.word 0x81b82000  ! dyser_init 0x000400
	.word 0x81bc0000  ! dyser_init 0x008000
	.word 0xa1bc000c  ! dyser_init 0x10800c
	.word 0x8bb80009  ! dyser_init 0x050009
	.word 0x89b81800  ! dyser_init 0x040300
	.word 0x81b80010  ! dyser_init 0x000010
	mov	%g0, %g1
	mov	1, %g2
	.word 0x89b84722  ! dyser_send d4, r1, d3, r2
	mov	2, %g1
	mov	3, %g2
	.word 0x85b84322  ! dyser_send d2, r1, d1, r2
	mov	4, %g1
	mov	5, %g2
	.word 0x8db84b22  ! dyser_send d6, r1, d5, r2
	mov	6, %g1
	mov	7, %g2
	.word 0x81b84f22  ! dyser_send d0, r1, d7, r2
	mov	4, %g1
	mov	%g0, %g2
	.word 0x89b84722  ! dyser_send d4, r1, d3, r2
	mov	85, %g1
	mov	15, %g2
	.word 0x85b84322  ! dyser_send d2, r1, d1, r2
	mov	15, %g1
	mov	85, %g2
	.word 0x8db84b22  ! dyser_send d6, r1, d5, r2
	mov	10, %g1
	mov	2, %g2
	.word 0x81b84f22  ! dyser_send d0, r1, d7, r2
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
	.word 0x83b84040  ! dyser_recv d1, r1
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
	.word 0x81b84040  ! dyser_recv d0, r1
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
	.word 0x8bb84040  ! dyser_recv d5, r1
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
	.word 0x87b84040  ! dyser_recv d3, r1
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
	.word 0x83b84040  ! dyser_recv d1, r1
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
	.word 0x81b84040  ! dyser_recv d0, r1
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
	.word 0x8bb84040  ! dyser_recv d5, r1
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
	.word 0x87b84040  ! dyser_recv d3, r1
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

