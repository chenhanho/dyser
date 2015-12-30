	.file	"outline.c"
	
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Load Store Test failed: %d (expected: %d)\n"
	.align 8
.LLC1:
	.asciz	"Load Store Test complete.\n"
	
	.section	".data"
	.align 4
values:
	.skip	400
	
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
	
	mov	%g0, %l6
	sethi	%hi(values), %l7
	or	%l7, %lo(values), %l7
	
.INIT_VALUES:
	st	%l6, [%l7]
	add	%l7, 4, %l7
	add	%l6, 1, %l6
	cmp	%l6, 100
	bl	.INIT_VALUES
	 nop
	
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
	
	mov	%g0, %l6
	sethi	%hi(values), %l7
	or	%l7, %lo(values), %l7
	
.INCREMENT:
dyser_load 2 23
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
dyser_store 0 23
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	
	add	%l7, 4, %l7
	add	%l6, 1, %l6
	cmp	%l6, 100
	bl	.INCREMENT
	 nop
	
	mov	%g0, %l6
	sethi	%hi(values), %l7
	or	%l7, %lo(values), %l7
	
.CHECK_VALUES:
	ld	[%l7], %l0
	add	%l7, 4, %l7
	add	%l6, 1, %l6
	cmp	%l0, %l6
	bne	.FAIL
	 nop
	cmp	%l6, 100
	bl	.CHECK_VALUES
	 nop
	
	b .DONE
	 nop
	
.FAIL:
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %o0
	mov	%l0, %o1
	mov	%l6, %o2
	call	printf, 0
	 nop
	mov	1, %g1
	st	%g1, [%fp-36]
	
.DONE:
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
