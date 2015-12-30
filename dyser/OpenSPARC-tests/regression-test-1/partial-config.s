	.file	"outline.c"
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Partial-Config Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Partial-Config Test passed.\n"
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -136, %sp
	!#PROLOGUE# 1
	st	%g0, [%fp-24]
	mov	1, %g1
	st	%g1, [%fp-28]
	ld	[%fp-24], %o5
	ld	[%fp-28], %g1
	add	%o5, %g1, %g1
	st	%g1, [%fp-20]
	
	.word 0xa1bf8710  ! dyser_init 0x10f0f0
	.word 0x95bde61e  ! dyser_init 0x0abcde
	.word 0x83b91a05  ! dyser_init 0x012345
	.word 0x93bc3b05  ! dyser_init 0x098765
	.word 0x8bbaaa15  ! dyser_init 0x055555
	.word 0x95bd550a  ! dyser_init 0x0aaaaa
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80400  ! dyser_init 0x000080
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80200  ! dyser_init 0x000040
	.word 0x81b82004  ! dyser_init 0x000404
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80008  ! dyser_init 0x000008
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b81000  ! dyser_init 0x000200
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81bc0018  ! dyser_init 0x008018
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	.word 0x85b80020  ! dyser_send d2, r0
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
	.word 0x81b84040  ! dyser_recv d0, r1
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
	b	.LL1
	 nop
.LL2:
	sethi	%hi(.LLC1), %g1
	or	%g1, %lo(.LLC1), %o0
	call	printf, 0
	 nop
	st	%g0, [%fp-36]
.LL1:
	ld	[%fp-36], %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"

