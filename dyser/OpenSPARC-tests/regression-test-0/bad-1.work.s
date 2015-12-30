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
dyser_init 000000
dyser_init 000000
dyser_init 000000
dyser_init 000000
dyser_init 000002
dyser_init 000000
dyser_init 008000
dyser_init 080400
dyser_init 001405
dyser_init 010000
dyser_init 01ff00
dyser_init 004000
dyser_init 008000
dyser_init 001000
dyser_init 1a0000
dyser_init 000381
dyser_init 000000
	
dyser_send 5 16
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
dyser_recv 2 17
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"

