/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: v9_trap_mem.s
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/

!!-------------------------------------------------------------------------------
!!
!!	This file has the micro-code to test out all the traps specified
!!	in the SPARC-V9 trap table. 
!!
!!-------------------------------------------------------------------------------

#define ENABLE_T0_Fp_disabled_0x20
#include "boot.s"

.text
.global main
.global misalign_sum3

main:

/*
 **********************************************************
 *  Memory address not aligned error
 **********************************************************
 */
!!------------------------------------
!!	Compare & Swap 
!!------------------------------------
	set	0x150003,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	casa	[%l0] 0x80,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	set	0x0,	%l3
	wr	%l3,	0x80,	%asi
	nop
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	casa	[%l0] %asi,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	casxa	[%l0] 0x80,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

	set	0x0,	%l3
	wr	%l3,	0x80,	%asi
	nop
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	casxa	[%l0] %asi,	%l1,	%l2		
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!------------------------------------
!!	Jumpl
!!------------------------------------
	set	0x150001,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	jmpl	%l0,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!------------------------------------
!!	Ld floating point 
!!------------------------------------
	set	0x150001,	%l0
	set	0x44,	%l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ld	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldd	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if 0	/* this will cause an illegal inst trap first */
	/* for right now, we skip multi-trap-per-inst */
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldq	[%l0],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ld	[%l0],	%fsr
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldx	[%l0],	%fsr
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!----------------------------------
!! ld fp from ASI : mem misaligned 
!!----------------------------------
	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lda	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lda	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

#if 0	/* this will cause illegal inst trap first */
	/* for right now, we don't care multi-trap-per inst */
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldqa	[%l0] 0x80,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldqa	[%l0] %asi,	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
#endif

!!---------------------------------------
!!  Load Integer
!!---------------------------------------
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsh	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsw	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduh	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduw	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldx	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldd	[%l0],	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

!!---------------------------------------
!!  Load Integer from ASI
!!---------------------------------------
	set	0x150001,	%l0

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsha	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldswa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduha	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduwa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldxa	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l0] 0x80,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1


	/* ASI instead of imm */
	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop

	set	0x150001,	%l0
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldsha	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldswa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduha	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	lduwa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldxa	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldda	[%l0] %asi,	%l2
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0003,     %l1
!!------------------------------------
!! return : mem misalign
!!------------------------------------
	call 	misalign_sum3
	nop

!!------------------------------------
!! Store floating point
!!------------------------------------
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	st	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	std	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

#if 0	/* cause an illegal inst trap */
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stq	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1
#endif

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	st	%fsr,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stx	%fsr,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

!!------------------------------------
!! Store floating point to ASI
!!------------------------------------
	set	0x0,	%l0
	wr	%l0,	0x80,	%asi
	nop

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	sta	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	sta	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stda	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

#if 0	/* this will cause illegal inst trap */
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stqa	%f0,	[%l2] 0x80
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stqa	%f0,	[%l2] %asi
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0004,     %l1
#endif

!!--------------------------------------------------
!!	swap reg with mem : mem_misaln trap
!!--------------------------------------------------
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	swap	[%l2],	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!--------------------------------------------------
!!	swap reg with ASI mem : mem_misaln trap
!!--------------------------------------------------
	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	swapa	[%l2] 0x80,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

	set	0x150001, 	%l2
        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	swapa	[%l2+0x0] %asi,	%l3
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

/*
 *************************************************
 *     LDQF & LDDF_mem_address misaligned 
 *************************************************
 */
#if 0	/* mem_addr_misaligned trap : 0x34 has
	 * higher priority 
	 */
!!-------------------------------
!!  ldd floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x35,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldd	[%l2],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

!!-------------------------------
!!  ldq floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x38,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	ldq	[%l2],	%f0
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1

/*
 *************************************************
 *     STQF & STDF_mem_address misaligned 
 *************************************************
 */
!!-------------------------------
!!  std floating point
!!-------------------------------
	set	0x160001,	%l2
        set     0x36,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	std	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

!!-------------------------------
!!  stq floating point
!!-------------------------------
#if 0
	set	0x160001,	%l2
        set     0x39,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	stq	%f0,	[%l2]
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        set     0xffff0005,     %l1
#endif

		/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

misalign_sum3:
	mov     0x1000 , %sp
        save    %sp,    -96,    %sp
!        add     %i0,    %i1,    %l7
!        add     %l7,    %i2,    %l7

        set     0x34,   %o0	/* mem addr misaligned */
        set     0x1,    %o1	/* enable for once */
        ta      T_HTRAP_EN_N_TIMES
        nop
	return	%i7+1	/* misaligned addr return */
        nop
        cmp     %o0,    0
        bne,a   diag_fail
        mov     4,     %l1

	return 	%i7+8	/* good return */ 
	nop

.data

fpdt_data:
	.xword	0xffff0000eeee1111
	.xword	0xffff0000eeee2222
	.xword	0xffff0000eeee3333
	.xword	0xffff0000eeee4444
.end

/*
 ***************************************************
 * Pages defined to test out the MMU access traps 
 ***************************************************
 */
 
#define	IDAEXECPG_BASE_TEXT_ADDR	0x250000		
#define	IDAEXECPG_BASE_TEXT_ADDR_PA	0x100250000
#define	IDAEXECPG_BASE_DATA_ADDR	0x260000
#define	IDAEXECPG_BASE_DATA_ADDR_PA	0x100260000			

SECTION .IDAEXEC_PAGE TEXT_VA=IDAEXECPG_BASE_TEXT_ADDR, DATA_VA=IDAEXECPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_TEXT_ADDR, PA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        RA=IDAEXECPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAEXEC_PAGE,
        VA=IDAEXECPG_BASE_DATA_ADDR, PA=IDAEXECPG_BASE_DATA_ADDR_PA,
        RA=IDAEXECPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.text

.global  idaexec_start 
.global  idaexec_d1	

idaexec_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaexec_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end

/*
 ************************************************************
 *	Section defined to test the Data Protection trap
 ************************************************************
 */
#define	IDAPROTPG_BASE_TEXT_ADDR	0x350000		
#define	IDAPROTPG_BASE_TEXT_ADDR_PA	0x100350000
#define	IDAPROTPG_BASE_DATA_ADDR	0x360000
#define	IDAPROTPG_BASE_DATA_ADDR_PA	0x100360000			

SECTION .IDAPROT_PAGE TEXT_VA=IDAPROTPG_BASE_TEXT_ADDR, DATA_VA=IDAPROTPG_BASE_DATA_ADDR
attr_text {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_TEXT_ADDR, PA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        RA=IDAPROTPG_BASE_TEXT_ADDR_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=0, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }
        
attr_data {
        Name = .IDAPROT_PAGE,
        VA=IDAPROTPG_BASE_DATA_ADDR, PA=IDAPROTPG_BASE_DATA_ADDR_PA,
        RA=IDAPROTPG_BASE_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0, 
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text

.global  idaprot_start 
.global  idaprot_d1	

idaprot_start:
	set	0x0,	%l0
	set	0x1,	%l1
	add	%l1,	%l0,	%l2
	return

.data	

idaprot_d1:	.word	0x11223344
		.word	0x11223355
		.word	0x11223366
		.word	0x11223377
.end
