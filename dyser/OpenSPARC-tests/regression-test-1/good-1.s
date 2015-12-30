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
	
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80002  ! dyser_init 0x000002
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81bc0000  ! dyser_init 0x008000
	.word 0x91b82000  ! dyser_init 0x080400
	.word 0x81b8a005  ! dyser_init 0x001405
	.word 0x83b80000  ! dyser_init 0x010000
	.word 0x83bff800  ! dyser_init 0x01ff00
	.word 0x81ba0000  ! dyser_init 0x004000
	.word 0x81bc0000  ! dyser_init 0x008000
	.word 0x81b88000  ! dyser_init 0x001000
	.word 0xb5b80000  ! dyser_init 0x1a0000
	.word 0x81b81c01  ! dyser_init 0x000381
	.word 0x81b80000  ! dyser_init 0x000000
	
	mov	1, %g7
	sll	%g7, 12, %g7
.LOOP:  ! unrolled 12 times
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	.word 0x8bbc0020  ! dyser_send d5, r16
	
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	.word 0x85bc4040  ! dyser_recv d2, r17
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"

