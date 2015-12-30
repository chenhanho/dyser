	.file	"outline.c"
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Straight Through 1 Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Straight Through 1 Test complete.\n"
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
	.word 0x81b80008  ! dyser_init 0x000008
	.word 0x81bc2000  ! dyser_init 0x008400
	.word 0x89b80000  ! dyser_init 0x040000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80800  ! dyser_init 0x000100
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x89b80602  ! dyser_init 0x0400c2
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b84000  ! dyser_init 0x000800
	.word 0x81b80008  ! dyser_init 0x000008
	.word 0x85b80000  ! dyser_init 0x020000
	.word 0x81b81000  ! dyser_init 0x000200
	.word 0xb1b80000  ! dyser_init 0x180000
	.word 0x81bc0001  ! dyser_init 0x008001
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80002  ! dyser_init 0x000002
	mov	%g0, %g1
	mov	1, %g2
	.word 0x8bb84722  ! dyser_send d5, r1, d3, r2
	mov	2, %g1
	mov	3, %g2
	.word 0x83b84d22  ! dyser_send d1, r1, d6, r2
	mov	4, %g1
	mov	5, %g2
	.word 0x8bb84722  ! dyser_send d5, r1, d3, r2
	mov	6, %g1
	mov	7, %g2
	.word 0x83b84d22  ! dyser_send d1, r1, d6, r2
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	.word 0x8db84040  ! dyser_recv d6, r1
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
	.word 0x89b84040  ! dyser_recv d4, r1
	st	%g1, [%fp-32]
	mov	1, %g2
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
	.word 0x85b84040  ! dyser_recv d2, r1
	st	%g1, [%fp-32]
	mov	2, %g2
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
	.word 0x83b84040  ! dyser_recv d1, r1
	st	%g1, [%fp-32]
	mov	3, %g2
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
	.word 0x8db84040  ! dyser_recv d6, r1
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
	.word 0x89b84040  ! dyser_recv d4, r1
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
	.word 0x85b84040  ! dyser_recv d2, r1
	st	%g1, [%fp-32]
	mov	6, %g2
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
	.word 0x83b84040  ! dyser_recv d1, r1
	st	%g1, [%fp-32]
	mov	7, %g2
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

