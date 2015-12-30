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
	
dyser_init 100000
dyser_init 000000
dyser_init 000400
dyser_init 000000
dyser_init 000011
dyser_init 010010
dyser_init 008000
dyser_init 000004
dyser_init 000004
dyser_init 000010
dyser_init 050f00
dyser_init 000400
dyser_init 005400
dyser_init 10000e
dyser_init 100040
dyser_init 0000ff
dyser_init 000007
	
	mov	1, %g7
	sll	%g7, 12, %g7
.LOOP:
dyser_send 4 16 3 17
dyser_send 0 16
dyser_send 4 16 3 17
dyser_send 0 16
	
dyser_recv 7 16
dyser_recv 0 17
dyser_recv 1 18
dyser_recv 3 19
dyser_recv 5 20
dyser_recv 7 16
dyser_recv 0 17
dyser_recv 1 18
dyser_recv 3 19
dyser_recv 5 20
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"
