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
	
	.word 0xa1b80000  ! dyser_init 0x100000
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b82000  ! dyser_init 0x000400
	.word 0x81b80000  ! dyser_init 0x000000
	.word 0x81b80011  ! dyser_init 0x000011
	.word 0x83b80010  ! dyser_init 0x010010
	.word 0x81bc0000  ! dyser_init 0x008000
	.word 0x81b80004  ! dyser_init 0x000004
	.word 0x81b80004  ! dyser_init 0x000004
	.word 0x81b80010  ! dyser_init 0x000010
	.word 0x8bb87800  ! dyser_init 0x050f00
	.word 0x81b82000  ! dyser_init 0x000400
	.word 0x81baa000  ! dyser_init 0x005400
	.word 0xa1b8000e  ! dyser_init 0x10000e
	.word 0xa1b80200  ! dyser_init 0x100040
	.word 0x81b8071f  ! dyser_init 0x0000ff
	.word 0x81b80007  ! dyser_init 0x000007
	
	mov	1, %g7
	sll	%g7, 12, %g7
.LOOP:
	.word 0x89bc0731  ! dyser_send d4, r16, d3, r17
	.word 0x81bc0020  ! dyser_send d0, r16
	.word 0x89bc0731  ! dyser_send d4, r16, d3, r17
	.word 0x81bc0020  ! dyser_send d0, r16
	
	.word 0x8fbc0040  ! dyser_recv d7, r16
	.word 0x81bc4040  ! dyser_recv d0, r17
	.word 0x83bc8040  ! dyser_recv d1, r18
	.word 0x87bcc040  ! dyser_recv d3, r19
	.word 0x8bbd0040  ! dyser_recv d5, r20
	.word 0x8fbc0040  ! dyser_recv d7, r16
	.word 0x81bc4040  ! dyser_recv d0, r17
	.word 0x83bc8040  ! dyser_recv d1, r18
	.word 0x87bcc040  ! dyser_recv d3, r19
	.word 0x8bbd0040  ! dyser_recv d5, r20
	
	subcc	%g7, 1, %g7
	bne	.LOOP
	 nop
	
	mov	%g0, %i0
	ret
	restore
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4"

