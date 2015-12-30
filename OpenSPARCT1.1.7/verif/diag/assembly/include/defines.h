/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: defines.h
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
#ifndef __DEFINES_H__
#define __DEFINES_H__

#include "constants.h"
#include "asi_s.h"
#include "trap_types.h"
#include "pstate.h"
#include "ver.h"
#include "RF_8win_macros.h"

#ifdef THREAD_MASK

#define THREAD_COUNT ( ((THREAD_MASK >> 0) & 0x1) + ((THREAD_MASK >> 1) & 0x1) + ((THREAD_MASK >> 2) & 0x1) + ((THREAD_MASK >> 3) & 0x1) + ((THREAD_MASK >> 4) & 0x1) + ((THREAD_MASK >> 5) & 0x1) + ((THREAD_MASK >> 6) & 0x1) + ((THREAD_MASK >> 7) & 0x1) + ((THREAD_MASK >> 8) & 0x1) + ((THREAD_MASK >> 9) & 0x1) + ((THREAD_MASK >> 10) & 0x1) + ((THREAD_MASK >> 11) & 0x1) + ((THREAD_MASK >> 12) & 0x1) + ((THREAD_MASK >> 13) & 0x1) + ((THREAD_MASK >> 14) & 0x1) + ((THREAD_MASK >> 15) & 0x1) + ((THREAD_MASK >> 16) & 0x1) + ((THREAD_MASK >> 17) & 0x1) + ((THREAD_MASK >> 18) & 0x1) + ((THREAD_MASK >> 19) & 0x1) + ((THREAD_MASK >> 20) & 0x1) + ((THREAD_MASK >> 21) & 0x1) + ((THREAD_MASK >> 22) & 0x1) + ((THREAD_MASK >> 23) & 0x1) + ((THREAD_MASK >> 24) & 0x1) + ((THREAD_MASK >> 25) & 0x1) + ((THREAD_MASK >> 26) & 0x1) + ((THREAD_MASK >> 27) & 0x1) + ((THREAD_MASK >> 28) & 0x1) + ((THREAD_MASK >> 29) & 0x1) + ((THREAD_MASK >> 30) & 0x1) + ((THREAD_MASK >> 31) & 0x1) )

#else

#ifndef THREAD_COUNT
#define THREAD_COUNT 1
#endif
#ifndef THREAD_STRIDE
#define THREAD_STRIDE 1
#endif

#if (THREAD_COUNT == 1)
#define THREAD_MASK 0x00000001
#elif (THREAD_COUNT == 2)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE),16)
#elif (THREAD_COUNT == 3)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2),16)
#elif (THREAD_COUNT == 4)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3),16)
#elif (THREAD_COUNT == 5)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4),16)
#elif (THREAD_COUNT == 6)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5),16)
#elif (THREAD_COUNT == 7)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6),16)
#elif (THREAD_COUNT == 8)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7),16)
#elif (THREAD_COUNT == 9)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8),16)
#elif (THREAD_COUNT == 10)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9),16)
#elif (THREAD_COUNT == 11)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10),16)
#elif (THREAD_COUNT == 12)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10) | (0x00000001 << THREAD_STRIDE*11),16)
#elif (THREAD_COUNT == 13)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10) | (0x00000001 << THREAD_STRIDE*11) | (0x00000001 << THREAD_STRIDE*12),16)
#elif (THREAD_COUNT == 14)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10) | (0x00000001 << THREAD_STRIDE*11) | (0x00000001 << THREAD_STRIDE*12) | (0x00000001 << THREAD_STRIDE*13),16)
#elif (THREAD_COUNT == 15)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10) | (0x00000001 << THREAD_STRIDE*11) | (0x00000001 << THREAD_STRIDE*12) | (0x00000001 << THREAD_STRIDE*13) | (0x00000001 << THREAD_STRIDE*14),16)
#elif (THREAD_COUNT == 16)
#define THREAD_MASK [0x]mpeval(0x00000001 | (0x00000001 << THREAD_STRIDE) | (0x00000001 << THREAD_STRIDE*2) | (0x00000001 << THREAD_STRIDE*3) | (0x00000001 << THREAD_STRIDE*4) | (0x00000001 << THREAD_STRIDE*5) | (0x00000001 << THREAD_STRIDE*6) | (0x00000001 << THREAD_STRIDE*7) | (0x00000001 << THREAD_STRIDE*8) | (0x00000001 << THREAD_STRIDE*9)  | (0x00000001 << THREAD_STRIDE*10) | (0x00000001 << THREAD_STRIDE*11) | (0x00000001 << THREAD_STRIDE*12) | (0x00000001 << THREAD_STRIDE*13) | (0x00000001 << THREAD_STRIDE*14) | (0x00000001 << THREAD_STRIDE*15),16)
#elif (THREAD_COUNT == 17)
#define THREAD_MASK 0x0001ffff
#elif (THREAD_COUNT == 18)
#define THREAD_MASK 0x0003ffff
#elif (THREAD_COUNT == 19)
#define THREAD_MASK 0x0007ffff
#elif (THREAD_COUNT == 20)
#define THREAD_MASK 0x000fffff
#elif (THREAD_COUNT == 21)
#define THREAD_MASK 0x001fffff
#elif (THREAD_COUNT == 22)
#define THREAD_MASK 0x003fffff
#elif (THREAD_COUNT == 23)
#define THREAD_MASK 0x007fffff
#elif (THREAD_COUNT == 24)
#define THREAD_MASK 0x00ffffff
#elif (THREAD_COUNT == 25)
#define THREAD_MASK 0x01ffffff
#elif (THREAD_COUNT == 26)
#define THREAD_MASK 0x03ffffff
#elif (THREAD_COUNT == 27)
#define THREAD_MASK 0x07ffffff
#elif (THREAD_COUNT == 28)
#define THREAD_MASK 0x0fffffff
#elif (THREAD_COUNT == 29)
#define THREAD_MASK 0x1fffffff
#elif (THREAD_COUNT == 30)
#define THREAD_MASK 0x3fffffff
#elif (THREAD_COUNT == 31)
#define THREAD_MASK 0x7fffffff
#elif (THREAD_COUNT == 32)
#define THREAD_MASK 0xffffffff
#endif

#endif

! Address space
!------------------------------------------
! SECTION	VA		RA/PA
!===========================================

#ifndef HV_RED_TEXT_PA
#define HV_RED_TEXT_PA		0x40000
#endif

#ifndef HV_RED_DATA_PA
#define HV_RED_DATA_PA		0x4c000
#endif

#ifndef HV_TRAP_BASE_PA
#define HV_TRAP_BASE_PA		0x80000
#endif

#ifndef	HV_TRAP_DATA_PA
#define HV_TRAP_DATA_PA		0x8c000
#endif	

#ifndef PRIV_RESET_VA
#define PRIV_RESET_VA		0x144000
#endif 

#ifndef PRIV_RESET_RA
#define PRIV_RESET_RA		0x144000
#endif 

#ifndef TRAP_BASE_VA
#define TRAP_BASE_VA		0x120000
#endif

#ifndef TRAP_BASE_RA
#define TRAP_BASE_RA		0x120000
#endif

#ifndef TRAP_DATA_VA
#define TRAP_DATA_VA	        0x12c000
#endif	

#ifndef TRAP_DATA_RA
#define TRAP_DATA_RA	        0x12c000
#endif	

#ifndef	KERNEL_BASE_TEXT_VA
#define KERNEL_BASE_TEXT_VA	0x1834000
#endif

#ifndef KERNEL_BASE_TEXT_RA
#define KERNEL_BASE_TEXT_RA	0x101834000
#endif

#ifndef	KERNEL_BASE_DATA_VA
#define KERNEL_BASE_DATA_VA	0x1c34000
#endif	

#ifndef KERNEL_BASE_DATA_RA
# define KERNEL_BASE_DATA_RA	0x101c34000
#endif

#ifndef MAIN_BASE_TEXT_VA
#define MAIN_BASE_TEXT_VA	0x20000000
#endif

#ifndef MAIN_BASE_TEXT_RA
#define MAIN_BASE_TEXT_RA	0x130000000
#endif

#ifndef NO_M4
#ifndef MAIN_BASE_TEXT_PA
define(MAIN_BASE_TEXT_PA, `0x'dnl'
mpeval(MAIN_BASE_TEXT_RA + PART_0_BASE, 16)dnl
)
#endif
#endif

#ifndef MAIN_BASE_DATA_VA
#define MAIN_BASE_DATA_VA	0x60000000
#endif

#ifndef MAIN_BASE_DATA_RA
#define MAIN_BASE_DATA_RA	0x170000000
#endif

#ifndef NO_M4
#ifndef MAIN_BASE_DATA_PA
define(MAIN_BASE_DATA_PA, `0x'dnl'
mpeval(MAIN_BASE_DATA_RA + PART_0_BASE, 16)dnl
)
#endif
#endif

#ifndef MAIN_BASE_BSS_VA
#define MAIN_BASE_BSS_VA	0x68030000
#endif

#ifndef MAIN_BASE_BSS_RA
#define MAIN_BASE_BSS_RA	0x178030000
#endif

#ifndef STACK_BASE_VA
#define STACK_BASE_VA		0x68038000
#endif

#ifndef STACK_BASE_RA
#define STACK_BASE_RA		0x178038000
#endif


#ifndef STACK_BIAS
# define STACK_BIAS 2047
#endif

#ifndef STACKSIZE
# define STACKSIZE 18432
#endif


#ifndef USER_START_LABEL
# define USER_START_LABEL main
#endif

#ifndef	USER_PAGE_INCR
#define USER_PAGE_INCR 0x40000
#endif	

#ifndef	ASI_LSU_CTL_REG
#define ASI_LSU_CTL_REG 0x45
#endif	
		
#ifndef	ASI_LSU_DIAG_REG
#define ASI_LSU_DIAG_REG 0x42
#endif	
		
#ifndef	ASI_SPARC_ERROR_EN_REG
#define ASI_SPARC_ERROR_EN_REG 0x4b
#endif	
		
#ifndef CREGS_CCR
#define CREGS_CCR 0
#endif

#ifndef NO_M4
define(cregs_ccr_imm, CREGS_CCR)dnl
#endif

#ifndef CREGS_FPRS_FEF
#define CREGS_FPRS_FEF 0
#endif

#ifndef CREGS_FPRS_DU
#define CREGS_FPRS_DU 0
#endif

#ifndef CREGS_FPRS_DL
#define CREGS_FPRS_DL 0
#endif

#ifndef CREGS_FPRS
#define CREGS_FPRS ((CREGS_FPRS_FEF << 2) | (CREGS_FPRS_DU << 1) | CREGS_FPRS_DL)
#endif

#ifndef NO_M4
define(cregs_fprs_imm, eval(CREGS_FPRS))dnl
#endif

#ifndef CREGS_ASI
#define CREGS_ASI 0
#endif

#ifndef NO_M4
define(cregs_asi_imm, CREGS_ASI)dnl
#endif


#ifndef CREGS_TICK_NPT
#define CREGS_TICK_NPT 0
#endif

#ifndef CREGS_TICK_COUNTER
#define CREGS_TICK_COUNTER 0
#endif

#ifndef CREGS_TICK
#define CREGS_TICK ((CREGS_TICK_NPT << 63) | CREGS_TICK_COUNTER)
#endif

#ifndef NO_M4
define(cregs_tick_r64, mpeval(CREGS_TICK))dnl
#endif

#ifndef CREGS_STICK_NPT
#define CREGS_STICK_NPT 0
#endif

#ifndef CREGS_STICK_COUNTER
#define CREGS_STICK_COUNTER 0
#endif

#ifndef CREGS_STICK
#define CREGS_STICK ((CREGS_STICK_NPT << 63) | CREGS_STICK_COUNTER)
#endif

#ifndef NO_M4
define(cregs_stick_r64, mpeval(CREGS_STICK))dnl
#endif

#ifndef CREGS_Y
#define CREGS_Y 0
#endif

#ifndef CREGS_PIL
#define CREGS_PIL 0xf
#endif

#ifndef NO_M4
define(cregs_pil_imm, CREGS_PIL)dnl
#endif

#ifndef CREGS_CWP
#define CREGS_CWP 0
#endif

#ifndef NO_M4
define(cregs_cwp_imm, CREGS_CWP)dnl
#endif

#ifndef CREGS_CANSAVE
#define CREGS_CANSAVE 6
#endif

#ifndef NO_M4
define(cregs_cansave_imm, CREGS_CANSAVE)dnl
#endif

#ifndef CREGS_CANRESTORE
#define CREGS_CANRESTORE 0
#endif

#ifndef NO_M4
define(cregs_canrestore_imm, CREGS_CANRESTORE)dnl
#endif

#ifndef CREGS_OTHERWIN
#define CREGS_OTHERWIN 0
#endif

#ifndef NO_M4
define(cregs_otherwin_imm, CREGS_OTHERWIN)dnl
#endif

#ifndef CREGS_CLEANWIN
#define CREGS_CLEANWIN 7
#endif

#ifndef NO_M4
define(cregs_cleanwin_imm, CREGS_CLEANWIN)dnl
#endif


#ifndef CREGS_WSTATE
#define CREGS_WSTATE 7
#endif

#ifndef NO_M4
define(cregs_wstate_imm, CREGS_WSTATE)dnl
#endif

#ifndef CREGS_HPSTATE_TLZ
#define CREGS_HPSTATE_TLZ 1
#endif

#ifndef CREGS_HPSTATE_HPRIV
#define CREGS_HPSTATE_HPRIV 1
#endif

#ifndef CREGS_HPSTATE_RED
#define CREGS_HPSTATE_RED 0 
#endif

#ifndef CREGS_HPSTATE_IBE
#define CREGS_HPSTATE_IBE 0
#endif

#ifndef	CREGS_HPSTATE
#define CREGS_HPSTATE \
    (CREGS_HPSTATE_TLZ | (CREGS_HPSTATE_HPRIV << 2) | (CREGS_HPSTATE_RED << 5) |\
    (CREGS_HPSTATE_IBE << 10))

#endif	

#ifndef NO_M4
define(cregs_hpstate_imm, eval(CREGS_HPSTATE))dnl
#endif


#ifndef CREGS_PSTATE_AG
#define CREGS_PSTATE_AG 1
#endif

#ifndef CREGS_PSTATE_IE
#define CREGS_PSTATE_IE 1
#endif

#ifndef CREGS_PSTATE_PRIV
#define CREGS_PSTATE_PRIV 1
#endif

#ifndef CREGS_PSTATE_AM
#define CREGS_PSTATE_AM 0
#endif

#ifndef CREGS_PSTATE_PEF
#define CREGS_PSTATE_PEF 0
#endif

#ifndef CREGS_PSTATE_RED
#define CREGS_PSTATE_RED 0 
#endif

#ifndef CREGS_PSTATE_MM 
#define CREGS_PSTATE_MM 0
#endif

#ifndef CREGS_PSTATE_TLE
#define CREGS_PSTATE_TLE 0
#endif

#ifndef CREGS_PSTATE_CLE
#define CREGS_PSTATE_CLE 0
#endif

#ifndef CREGS_PSTATE_MG
#define CREGS_PSTATE_MG 0
#endif

#ifndef CREGS_PSTATE_IG
#define CREGS_PSTATE_IG 0
#endif

#ifndef	CREGS_PSTATE
#define CREGS_PSTATE \
    (CREGS_PSTATE_AG | (CREGS_PSTATE_IE << 1) | (CREGS_PSTATE_PRIV << 2) |\
    (CREGS_PSTATE_AM << 3) | (CREGS_PSTATE_PEF << 4) | (CREGS_PSTATE_RED << 5) |\
    (CREGS_PSTATE_MM << 6) | (CREGS_PSTATE_TLE << 8) | (CREGS_PSTATE_CLE << 9) |\
    (CREGS_PSTATE_MG << 10) | (CREGS_PSTATE_IG))


#endif	

#ifndef NO_M4
define(cregs_pstate_imm, eval(CREGS_PSTATE))dnl
#endif


#ifndef CREGS_HTSTATE_TLZ
#define CREGS_HTSTATE_TLZ 0
#endif

#ifndef CREGS_HTSTATE_HPRIV
#define CREGS_HTSTATE_HPRIV 0
#endif

#ifndef CREGS_HTSTATE_RED
#define CREGS_HTSTATE_RED 0 
#endif

#ifndef	CREGS_HTSTATE
#define CREGS_HTSTATE \
    (CREGS_HTSTATE_TLZ | (CREGS_HTSTATE_HPRIV << 2) | (CREGS_HTSTATE_RED << 5))
#endif	

#ifndef NO_M4
define(cregs_htstate_r64, eval(CREGS_HTSTATE))dnl
#endif


#ifndef	CREGS_TSTATE_CWP
#define CREGS_TSTATE_CWP 0
#endif	

#ifndef CREGS_TSTATE_PSTATE_AG
#define CREGS_TSTATE_PSTATE_AG 0
#endif

#ifndef CREGS_TSTATE_PSTATE_IE
#define CREGS_TSTATE_PSTATE_IE 1
#endif

#ifndef CREGS_TSTATE_PSTATE_PRIV
#define CREGS_TSTATE_PSTATE_PRIV 1
#endif

#ifndef CREGS_TSTATE_PSTATE_AM
#define CREGS_TSTATE_PSTATE_AM 0
#endif

#ifndef CREGS_TSTATE_PSTATE_PEF
#define CREGS_TSTATE_PSTATE_PEF 1
#endif

#ifndef CREGS_TSTATE_PSTATE_RED
#define CREGS_TSTATE_PSTATE_RED 0 
#endif

#ifndef CREGS_TSTATE_PSTATE_MM 
#define CREGS_TSTATE_PSTATE_MM 0
#endif

#ifndef CREGS_TSTATE_PSTATE_TLE
#define CREGS_TSTATE_PSTATE_TLE 0
#endif

#ifndef CREGS_TSTATE_PSTATE_CLE
#define CREGS_TSTATE_PSTATE_CLE 0
#endif

#ifndef CREGS_TSTATE_PSTATE_MG
#define CREGS_TSTATE_PSTATE_MG 0
#endif

#ifndef CREGS_TSTATE_PSTATE_IG
#define CREGS_TSTATE_PSTATE_IG 0
#endif

#ifndef	CREGS_TSTATE_PSTATE
#define CREGS_TSTATE_PSTATE \
    (CREGS_TSTATE_PSTATE_AG | (CREGS_TSTATE_PSTATE_IE << 1) | (CREGS_TSTATE_PSTATE_PRIV << 2) |\
    (CREGS_TSTATE_PSTATE_AM << 3) | (CREGS_TSTATE_PSTATE_PEF << 4) | (CREGS_TSTATE_PSTATE_RED << 5) |\
    (CREGS_TSTATE_PSTATE_MM << 6) | (CREGS_TSTATE_PSTATE_TLE << 8) | (CREGS_TSTATE_PSTATE_CLE << 9) |\
    (CREGS_TSTATE_PSTATE_MG << 10) | (CREGS_TSTATE_PSTATE_IG))

#endif	

#ifndef	CREGS_TSTATE_ASI
#define CREGS_TSTATE_ASI 0
#endif	

#ifndef	CREGS_TSTATE_CCR
#define CREGS_TSTATE_CCR 0
#endif	

#ifndef	CREGS_TSTATE
#define CREGS_TSTATE (\
     CREGS_TSTATE_CWP | (CREGS_TSTATE_PSTATE << 8) |\
    (CREGS_TSTATE_ASI << 24) | (CREGS_TSTATE_CCR << 32))
#endif	

#ifndef NO_M4
define(cregs_tstate_r64, mpeval(CREGS_TSTATE))dnl
#endif


#ifndef	CREGS_LSU_CTL_REG_IC
#define CREGS_LSU_CTL_REG_IC 1
#endif	

#ifndef	CREGS_LSU_CTL_REG_DC
#define CREGS_LSU_CTL_REG_DC 1
#endif	

#ifndef	CREGS_LSU_CTL_REG_IM
#define CREGS_LSU_CTL_REG_IM 1
#endif	

#ifndef	CREGS_LSU_CTL_REG_DM
#define CREGS_LSU_CTL_REG_DM 1
#endif	

#ifndef	CREGS_LSU_CTL_REG_FM
#define CREGS_LSU_CTL_REG_FM 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_VW
#define CREGS_LSU_CTL_REG_VW 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_VR
#define CREGS_LSU_CTL_REG_VR 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_PW
#define CREGS_LSU_CTL_REG_PW 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_PR
#define CREGS_LSU_CTL_REG_PR 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_VM
#define CREGS_LSU_CTL_REG_VM 0
#endif	

#ifndef	CREGS_LSU_CTL_REG_PM
#define CREGS_LSU_CTL_REG_PM 0
#endif	

#ifdef ENABLE_L1_PER_THREAD
#define CREGS_LSU_CTL_REG_IC 0
#define CREGS_LSU_CTL_REG_DC 0
#define CREGS_LSU_CTL_REG_IC_THR (CREGS_LSU_CTL_REG_IC_T0 | (CREGS_LSU_CTL_REG_IC_T1 << 1) | (CREGS_LSU_CTL_REG_IC_T2 << 2) | (CREGS_LSU_CTL_REG_IC_T3 << 3))
#define CREGS_LSU_CTL_REG_DC_THR (CREGS_LSU_CTL_REG_DC_T0 | (CREGS_LSU_CTL_REG_DC_T1 << 1) | (CREGS_LSU_CTL_REG_DC_T2 << 2) | (CREGS_LSU_CTL_REG_DC_T3 << 3))
#ifndef NO_M4
define(cregs_lsu_ctl_reg_ic_thr, eval(CREGS_LSU_CTL_REG_IC_THR))dnl
define(cregs_lsu_ctl_reg_dc_thr, eval(CREGS_LSU_CTL_REG_DC_THR))dnl
#endif
#endif

#ifndef	CREGS_LSU_CTL_REG
#define CREGS_LSU_CTL_REG (\
     CREGS_LSU_CTL_REG_IC | (CREGS_LSU_CTL_REG_DC << 1) | (CREGS_LSU_CTL_REG_IM << 2) |\
    (CREGS_LSU_CTL_REG_DM << 3) | (CREGS_LSU_CTL_REG_FM << 4) | (CREGS_LSU_CTL_REG_VW << 21) |\
    (CREGS_LSU_CTL_REG_VR << 22) | (CREGS_LSU_CTL_REG_PW << 23) | (CREGS_LSU_CTL_REG_PR << 24) |\
    (CREGS_LSU_CTL_REG_VM << 25) | (CREGS_LSU_CTL_REG_PM << 33))

#endif	

#ifndef NO_M4
define(cregs_lsu_ctl_reg_r64, mpeval(CREGS_LSU_CTL_REG))dnl
#endif


#ifndef	CREGS_LSU_DIAG_REG_DASSOCDIS
#define CREGS_LSU_DIAG_REG_DASSOCDIS 0
#endif	

#ifndef	CREGS_LSU_DIAG_REG_IASSOCDIS
#define CREGS_LSU_DIAG_REG_IASSOCDIS 0
#endif	

#ifndef CREGS_LSU_DIAG_REG
#define CREGS_LSU_DIAG_REG (\
	CREGS_LSU_DIAG_REG_IASSOCDIS | (CREGS_LSU_DIAG_REG_DASSOCDIS << 1))
#endif

#ifndef NO_M4
define(cregs_lsu_diag_reg_r64, eval(CREGS_LSU_DIAG_REG))dnl
#endif


#ifndef	CREGS_SPARC_ERROR_EN_REG_CEEN
#define CREGS_SPARC_ERROR_EN_REG_CEEN 1
#endif	

#ifndef	CREGS_SPARC_ERROR_EN_REG_NCEEN
#define CREGS_SPARC_ERROR_EN_REG_NCEEN 1
#endif	

#ifndef CREGS_SPARC_ERROR_EN_REG
#define CREGS_SPARC_ERROR_EN_REG (\
	CREGS_SPARC_ERROR_EN_REG_CEEN | (CREGS_SPARC_ERROR_EN_REG_NCEEN << 1))
#endif

#ifndef NO_M4
define(cregs_sparc_error_en_reg_r64, eval(CREGS_SPARC_ERROR_EN_REG))dnl
#endif


#ifndef	CREGS_L2_CTL_REG_ASSOCDIS
#define CREGS_L2_CTL_REG_ASSOCDIS 0
#endif	

#ifndef	CREGS_L2_CTL_REG_DIS
#define CREGS_L2_CTL_REG_DIS 0
#endif	

#ifndef CREGS_L2_CTL_REG_DBG
#define CREGS_L2_CTL_REG_DBG 0
#endif

#ifndef CREGS_L2_CTL_REG
#define CREGS_L2_CTL_REG (\
	CREGS_L2_CTL_REG_DIS | (CREGS_L2_CTL_REG_ASSOCDIS << 1) | (CREGS_L2_CTL_REG_DBG << 20))
#endif

#ifndef NO_M4
define(cregs_l2_ctl_reg_r64, eval(CREGS_L2_CTL_REG))dnl
#endif


#ifndef	CREGS_L2_ERROR_EN_REG_CEEN
#define CREGS_L2_ERROR_EN_REG_CEEN 1
#endif	

#ifndef	CREGS_L2_ERROR_EN_REG_NCEEN
#define CREGS_L2_ERROR_EN_REG_NCEEN 1
#endif	

#ifndef CREGS_L2_ERROR_EN_REG
#define CREGS_L2_ERROR_EN_REG (\
	CREGS_L2_ERROR_EN_REG_CEEN | (CREGS_L2_ERROR_EN_REG_NCEEN << 1))
#endif

#ifndef NO_M4
define(cregs_l2_error_en_reg_r64, eval(CREGS_L2_ERROR_EN_REG))dnl
#endif

#ifndef CREGS_JBI_CONFIG1_ARB
#define CREGS_JBI_CONFIG1_ARB  1
#endif

#ifndef CREGS_JBI_CONFIG1
define(CREGS_JBI_CONFIG1, `0x'dnl'
mpeval((0x03fb303e00000000 | CREGS_JBI_CONFIG1_ARB), 16))dnl 
#endif

#ifndef CREGS_TOM_CONFIG1
define(CREGS_TOM_CONFIG1, `0x'dnl' 
mpeval((0x000907f001000000 | (CREGS_JBI_CONFIG1_ARB << 27)), 16))dnl 
#endif

#ifndef CREGS_JBI_L2_TIMEOUT
#define CREGS_JBI_L2_TIMEOUT 7000
#endif

#ifndef CREGS_JBI_ARB_TIMEOUT
#define CREGS_JBI_ARB_TIMEOUT 1000
#endif

#ifndef CREGS_JBI_TRANS_TIMEOUT
#define CREGS_JBI_TRANS_TIMEOUT 2000
#endif

#ifndef CREGS_JBI_INTR_TIMEOUT
#define CREGS_JBI_INTR_TIMEOUT 3000
#endif

#ifndef	PCONTEXT
#define PCONTEXT	0x44
#endif	
#ifndef	SCONTEXT
#define SCONTEXT	0x55
#endif							

#ifndef CDIV
#define CDIV		2
#endif

#ifndef DDIV
#define DDIV		14
#endif

#ifndef JDIV
#define JDIV		12
#endif

#ifndef CREGS_CLK_DIV_FREQ_CHANGE
#define CREGS_CLK_DIV_FREQ_CHANGE 1
#endif

/*** the following code is generated by ./clk_table.pl clk_table.csv ***/
#if !defined(CREGS_CLK_JSYNC) || !defined(CREGS_CLK_DSYNC) || !defined(CREGS_CLK_DIV)

#if (CDIV == 4) && (DDIV == 16) && (JDIV == 16)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (32 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (16 << 16) | (16 << 8) | 4 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3

#elif (CDIV == 2) && (DDIV == 17) && (JDIV == 23)
#define CREGS_CLK_DIV (184 << 52) | (136 << 42) | (1564 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (17 << 16) | (23 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (20 << 24) | (1 << 22) | (8 << 16) | (21 << 8) | 22
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (0 << 24) | (1 << 22) | (8 << 16) | (15 << 8) | 16

#elif (CDIV == 2) && (DDIV == 14) && (JDIV == 12)
#define CREGS_CLK_DIV (24 << 52) | (28 << 42) | (168 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (14 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (1 << 32) | (1 << 30) | (1 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6

#elif (CDIV == 2) && (DDIV == 15) && (JDIV == 13)
#define CREGS_CLK_DIV (104 << 52) | (120 << 42) | (780 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (15 << 16) | (13 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (2 << 24) | (1 << 22) | (8 << 16) | (11 << 8) | 12
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (1 << 24) | (1 << 22) | (8 << 16) | (13 << 8) | 14

#elif (CDIV == 2) && (DDIV == 10) && (JDIV == 10)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (40 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (10 << 16) | (10 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (3 << 32) | (1 << 30) | (3 << 24) | (1 << 22) | (3 << 16) | (3 << 8) | 4
#define CREGS_CLK_DSYNC (1 << 38) | (3 << 32) | (1 << 30) | (3 << 24) | (1 << 22) | (3 << 16) | (3 << 8) | 4

#elif (CDIV == 2) && (DDIV == 11) && (JDIV == 11)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (44 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (11 << 16) | (11 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (3 << 24) | (1 << 22) | (8 << 16) | (9 << 8) | 10
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (3 << 24) | (1 << 22) | (8 << 16) | (9 << 8) | 10

#elif (CDIV == 2) && (DDIV == 12) && (JDIV == 12)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (48 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (12 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5

#elif (CDIV == 2) && (DDIV == 13) && (JDIV == 13)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (52 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (13 << 16) | (13 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (2 << 24) | (1 << 22) | (8 << 16) | (11 << 8) | 12
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (2 << 24) | (1 << 22) | (8 << 16) | (11 << 8) | 12

#elif (CDIV == 2) && (DDIV == 14) && (JDIV == 14)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (56 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (14 << 16) | (14 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (1 << 32) | (1 << 30) | (1 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6
#define CREGS_CLK_DSYNC (1 << 38) | (1 << 32) | (1 << 30) | (1 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6

#elif (CDIV == 2) && (DDIV == 15) && (JDIV == 15)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (60 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (15 << 16) | (15 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (1 << 24) | (1 << 22) | (8 << 16) | (13 << 8) | 14
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (1 << 24) | (1 << 22) | (8 << 16) | (13 << 8) | 14

#elif (CDIV == 2) && (DDIV == 16) && (JDIV == 16)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (64 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (16 << 16) | (16 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (6 << 8) | 7
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (6 << 8) | 7

#elif (CDIV == 2) && (DDIV == 17) && (JDIV == 17)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (68 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (17 << 16) | (17 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (0 << 24) | (1 << 22) | (8 << 16) | (15 << 8) | 16
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (0 << 24) | (1 << 22) | (8 << 16) | (15 << 8) | 16

#elif (CDIV == 2) && (DDIV == 18) && (JDIV == 18)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (72 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (18 << 16) | (18 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (7 << 8) | 8
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (7 << 8) | 8

#elif (CDIV == 2) && (DDIV == 19) && (JDIV == 19)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (76 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (19 << 16) | (19 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (18 << 24) | (1 << 22) | (8 << 16) | (17 << 8) | 18
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (18 << 24) | (1 << 22) | (8 << 16) | (17 << 8) | 18

#elif (CDIV == 2) && (DDIV == 20) && (JDIV == 20)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (80 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (20 << 16) | (20 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (8 << 8) | 9
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (8 << 8) | 9

#elif (CDIV == 2) && (DDIV == 11) && (JDIV == 12)
#define CREGS_CLK_DIV (96 << 52) | (88 << 42) | (528 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (11 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (3 << 24) | (1 << 22) | (8 << 16) | (9 << 8) | 10

#elif (CDIV == 2) && (DDIV == 13) && (JDIV == 12)
#define CREGS_CLK_DIV (96 << 52) | (104 << 42) | (624 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (13 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (2 << 24) | (1 << 22) | (8 << 16) | (11 << 8) | 12

#elif (CDIV == 2) && (DDIV == 15) && (JDIV == 12)
#define CREGS_CLK_DIV (32 << 52) | (40 << 42) | (240 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (15 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (1 << 24) | (1 << 22) | (8 << 16) | (13 << 8) | 14

#elif (CDIV == 2) && (DDIV == 16) && (JDIV == 12)
#define CREGS_CLK_DIV (9 << 52) | (12 << 42) | (72 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (16 << 16) | (12 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (6 << 8) | 7

#elif (CDIV == 4) && (DDIV == 24) && (JDIV == 24)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (48 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (24 << 16) | (24 << 8) | 4 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5

#elif (CDIV == 1) && (DDIV == 4) && (JDIV == 4)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (32 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (4 << 16) | (4 << 8) | 1 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3

#elif (CDIV == 1) && (DDIV == 6) && (JDIV == 6)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (48 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (6 << 16) | (6 << 8) | 1 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5

#elif (CDIV == 1) && (DDIV == 7) && (JDIV == 7)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (56 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (7 << 16) | (7 << 8) | 1 
#define CREGS_CLK_JSYNC (1 << 38) | (1 << 32) | (1 << 30) | (1 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6
#define CREGS_CLK_DSYNC (1 << 38) | (1 << 32) | (1 << 30) | (1 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6

#elif (CDIV == 4) && (DDIV == 12) && (JDIV == 16)
#define CREGS_CLK_DIV (16 << 52) | (12 << 42) | (48 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (12 << 16) | (16 << 8) | 4 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (1 << 8) | 2

#elif (CDIV == 2) && (DDIV == 24) && (JDIV == 8)
#define CREGS_CLK_DIV (4 << 52) | (12 << 42) | (48 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (24 << 16) | (8 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11

#elif (CDIV == 2) && (DDIV == 6) && (JDIV == 24)
#define CREGS_CLK_DIV (32 << 52) | (8 << 42) | (96 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (6 << 16) | (24 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (1 << 8) | 2

#elif (CDIV == 2) && (DDIV == 24) && (JDIV == 24)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (96 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (24 << 16) | (24 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11

#elif (CDIV == 2) && (DDIV == 8) && (JDIV == 24)
#define CREGS_CLK_DIV (24 << 52) | (8 << 42) | (96 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (8 << 16) | (24 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3

#elif (CDIV == 2) && (DDIV == 23) && (JDIV == 7)
#define CREGS_CLK_DIV (56 << 52) | (184 << 42) | (644 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (23 << 16) | (7 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (1 << 32) | (2 << 30) | (5 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (20 << 24) | (1 << 22) | (8 << 16) | (21 << 8) | 22

#elif (CDIV == 2) && (DDIV == 7) && (JDIV == 23)
#define CREGS_CLK_DIV (184 << 52) | (56 << 42) | (644 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (7 << 16) | (23 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (20 << 24) | (1 << 22) | (8 << 16) | (21 << 8) | 22
#define CREGS_CLK_DSYNC (1 << 38) | (1 << 32) | (2 << 30) | (5 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6

#elif (CDIV == 2) && (DDIV == 12) && (JDIV == 24)
#define CREGS_CLK_DIV (16 << 52) | (8 << 42) | (96 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (12 << 16) | (24 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (4 << 8) | 5

#elif (CDIV == 2) && (DDIV == 6) && (JDIV == 6)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (24 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (6 << 16) | (6 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (1 << 8) | 2
#define CREGS_CLK_DSYNC (1 << 38) | (2 << 32) | (1 << 30) | (2 << 24) | (1 << 22) | (2 << 16) | (1 << 8) | 2

#elif (CDIV == 2) && (DDIV == 7) && (JDIV == 7)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (28 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (7 << 16) | (7 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (1 << 32) | (2 << 30) | (5 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6
#define CREGS_CLK_DSYNC (1 << 38) | (1 << 32) | (2 << 30) | (5 << 24) | (1 << 22) | (1 << 16) | (5 << 8) | 6

#elif (CDIV == 2) && (DDIV == 8) && (JDIV == 8)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (32 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (8 << 16) | (8 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3
#define CREGS_CLK_DSYNC (1 << 38) | (0 << 32) | (1 << 30) | (0 << 24) | (1 << 22) | (0 << 16) | (2 << 8) | 3

#elif (CDIV == 2) && (DDIV == 9) && (JDIV == 9)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (36 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (9 << 16) | (9 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (4 << 24) | (1 << 22) | (8 << 16) | (7 << 8) | 8
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (4 << 24) | (1 << 22) | (8 << 16) | (7 << 8) | 8

#elif (CDIV == 2) && (DDIV == 21) && (JDIV == 21)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (84 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (21 << 16) | (21 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (19 << 24) | (1 << 22) | (8 << 16) | (19 << 8) | 20
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (19 << 24) | (1 << 22) | (8 << 16) | (19 << 8) | 20

#elif (CDIV == 2) && (DDIV == 22) && (JDIV == 22)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (88 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (22 << 16) | (22 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (9 << 8) | 10
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (9 << 8) | 10

#elif (CDIV == 2) && (DDIV == 23) && (JDIV == 23)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (92 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (23 << 16) | (23 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (2 << 30) | (20 << 24) | (1 << 22) | (8 << 16) | (21 << 8) | 22
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (2 << 30) | (20 << 24) | (1 << 22) | (8 << 16) | (21 << 8) | 22

#elif (CDIV == 2) && (DDIV == 24) && (JDIV == 24)
#define CREGS_CLK_DIV (8 << 52) | (8 << 42) | (96 << 28) | (CREGS_CLK_DIV_FREQ_CHANGE << 26) | (24 << 16) | (24 << 8) | 2 
#define CREGS_CLK_JSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11
#define CREGS_CLK_DSYNC (1 << 38) | (8 << 32) | (1 << 30) | (8 << 24) | (1 << 22) | (8 << 16) | (10 << 8) | 11

#else
#define CREGS_CLK_DIV Error_undefined_CDIV_DDIV_JDIV_combination
#define CREGS_CLK_JSYNC Error_undefined_CDIV_DDIV_JDIV_combination
#define CREGS_CLK_DSYNC Error_undefined_CDIV_DDIV_JDIV_combination
#endif

#endif

/*********************************************** Trap names From Simics*/
#define T_Reserved_Vec_0			0x000
#define T_Power_On_Reset			0x001
#define T_Watchdog_Reset			0x002
#define T_Externally_Initiated_Reset		0x003
#define T_Software_Initiated_Reset		0x004
#define T_Red_State_Exception			0x005
#define T_Reserved_Vec_6			0x006
#define T_Reserved_Vec_7			0x007
#define T_Instruction_Access_Exception		0x008
#define T_Instruction_Access_Mmu_Miss		0x009
#define T_Instruction_Access_Error		0x00a
#define T_Reserved_Vec_b			0x00b
#define T_Reserved_Vec_c			0x00c
#define T_Reserved_Vec_d			0x00d
#define T_Reserved_Vec_e			0x00e
#define T_Reserved_Vec_f			0x00f
#define T_Illegal_Instruction			0x010
#define T_Privileged_Opcode			0x011
#define T_Unimplemented_Ldd			0x012
#define T_Unimplemented_Std			0x013
#define T_Reserved_Vec_14			0x014
#define T_Reserved_Vec_15			0x015
#define T_Reserved_Vec_16			0x016
#define T_Reserved_Vec_17			0x017
#define T_Reserved_Vec_18			0x018
#define T_Reserved_Vec_19			0x019
#define T_Reserved_Vec_1a			0x01a
#define T_Reserved_Vec_1b			0x01b
#define T_Reserved_Vec_1c			0x01c
#define T_Reserved_Vec_1d			0x01d
#define T_Reserved_Vec_1e			0x01e
#define T_Reserved_Vec_1f			0x01f

#define T_Fp_Disabled				0x020
#define T_Fp_Exception_Ieee_754			0x021
#define T_Fp_Exception_Other			0x022
#define T_Tag_Overflow				0x023
#define T_Clean_Window				0x024
#define T_Reserved_Vec_25			0x025
#define T_Reserved_Vec_26			0x026
#define T_Reserved_Vec_27			0x027
#define T_Division_By_Zero			0x028
#define T_Internal_Processor_Error		0x029
#define T_Reserved_Vec_2a			0x02a
#define T_Reserved_Vec_2b			0x02b
#define T_Reserved_Vec_2c			0x02c
#define T_Reserved_Vec_2d			0x02d
#define T_Reserved_Vec_2e			0x02e
#define T_Reserved_Vec_2f			0x02f

#define T_Data_Access_Exception			0x030
#define T_Data_Access_Mmu_Miss			0x031
#define T_Data_Access_Error			0x032
#define T_Data_Access_Protection		0x033
#define T_Mem_Address_Not_Aligned		0x034
#define T_Lddf_Mem_Address_Not_Aligned		0x035
#define T_Stdf_Mem_Address_Not_Aligned		0x036
#define T_Privileged_Action			0x037
#define T_Ldqf_Mem_Address_Not_Aligned		0x038
#define T_Stqf_Mem_Address_Not_Aligned		0x039
#define T_Reserved_Vec_3a			0x03a
#define T_Reserved_Vec_3b			0x03b
#define T_Reserved_Vec_3c			0x03c
#define T_Reserved_Vec_3d			0x03d
#define T_Reserved_Vec_3e			0x03e
#define T_Reserved_Vec_3f			0x03f
#define T_Async_Data_Error			0x040
#define T_Interrupt_Level_1			0x041
#define T_Interrupt_Level_2			0x042
#define T_Interrupt_Level_3			0x043
#define T_Interrupt_Level_4			0x044
#define T_Interrupt_Level_5			0x045
#define T_Interrupt_Level_6			0x046
#define T_Interrupt_Level_7			0x047
#define T_Interrupt_Level_8			0x048
#define T_Interrupt_Level_9			0x049
#define T_Interrupt_Level_10			0x04a
#define T_Interrupt_Level_11			0x04b
#define T_Interrupt_Level_12			0x04c
#define T_Interrupt_Level_13			0x04d
#define T_Interrupt_Level_14			0x04e
#define T_Interrupt_Level_15			0x04f

#define T_Interrupt_Vector			0x060
#define T_PA_Watchpoint				0x061
#define T_VA_Watchpoint				0x062
#define T_Corrected_ECC_Error			0x063

#define T_Fast_Instruction_Access_MMU_Miss	0x064
#define T_Fast_Data_Access_MMU_Miss		0x068
#define T_Fast_Data_Access_Protection		0x06c

#define T_Spill_0_Normal			0x080
#define T_Spill_1_Normal			0x084
#define T_Spill_2_Normal			0x088
#define T_Spill_3_Normal			0x08c
#define T_Spill_4_Normal			0x090
#define T_Spill_5_Normal			0x094
#define T_Spill_6_Normal			0x098
#define T_Spill_7_Normal			0x09c
#define T_Spill_0_Other				0x0a0
#define T_Spill_1_Other				0x0a4
#define T_Spill_2_Other				0x0a8
#define T_Spill_3_Other				0x0ac
#define T_Spill_4_Other				0x0b0
#define T_Spill_5_Other				0x0b4
#define T_Spill_6_Other				0x0b8
#define T_Spill_7_Other				0x0bc
#define T_Fill_0_Normal				0x0c0
#define T_Fill_1_Normal				0x0c4
#define T_Fill_2_Normal				0x0c8
#define T_Fill_3_Normal				0x0cc
#define T_Fill_4_Normal				0x0d0
#define T_Fill_5_Normal				0x0d4
#define T_Fill_6_Normal				0x0d8
#define T_Fill_7_Normal				0x0dc
#define T_Fill_0_Other				0x0e0
#define T_Fill_1_Other				0x0e4
#define T_Fill_2_Other				0x0e8
#define T_Fill_3_Other				0x0ec
#define T_Fill_4_Other				0x0f0
#define T_Fill_5_Other				0x0f4
#define T_Fill_6_Other				0x0f8
#define T_Fill_7_Other				0x0fc

#define T_GOOD_TRAP			        0x00
#define T_BAD_TRAP			        0x01
#define T_CHANGE_PRIV    		        0x02
#define T_CHANGE_NONPRIV    		        0x03
#define T_CHANGE_TO_TL1 		        0x04
#define T_CHANGE_TO_TL0 		        0x05
#define T_TRAP_EN                               0x08
#define T_TRAP_DIS                              0x0a
#define T_TRAP_EN_N_TIMES                       0x0c

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Service trap fron different trap-level and priv
!!                   tl==0                tl > 0              hyper    
!! T_CHANGE_PRIV     T0_0x102             T1_0x102            HT_0x102 
!! T_CHANGE_NONPRIV  T0_0x103             T1_0x103            HT_0x103 
!! T_CHANGE_TO_TL1   T0_0x104             *T1_0x104           HT_0x104
!! T_CHANGE_TO_TL0   T0_0x105             *T1_0x105           HT_0x105
!! T_TRAP_EN         T0_0x108             T1_0x108            HT_0x108 (emulate)
!! T_TRAP_DIS        T0_0x10a             T1_0x10a            HT_0x10a (emulate)
!! T_TRAP_EN_N_TIMES T0_0x10c             T1_0x10c            HT_0x10c (emulate)
!! T_SYSCALL         T0_0x118             N/A                 N/A
!! T_SYSRET          T0_0x11a             N/A                 N/A
!! 
!! T_CHANGE_HPRIV    T0_0x120 (HT_0x180)  T1_0x120 (HT_0x180) HT_0x120
!! T_CHANGE_NONHPRIV T0_0x122 (HT_0x182)  T1_0x122 (HT_0x182) HT_0x122
!! T_HTRAP_EN        T0_0x124 (HT_0x184)  T1_0x124 (HT_0x184) HT_0x124
!! T_HTRAP_DIS       T0_0x126 (HT_0x186)  T1_0x126 (HT_0x186) HT_0x126
!! T_HTRAP_EN_N_TIMEST0_0x128 (HT_0x188)  T1_0x128 (HT_0x188) HT_0x128
!! T_CHANGE_CTX      T0_0x12a (HT_0x18a)  T1_0x12a (HT_0x18a) HT_0x12a
!! T_RD_THID         T0_0x12e (HT_0x18e)  T1_0x12c (HT_0x18e) HT_0x12e
!!
!! T_TRAP_INST0      T0_0x130		  N/A                 N/A
!! T_TRAP_INST1      T0_0x131 		  N/A                 N/A
!!
!! T_HTRAP_INST0     T0_0x132 (HT_0x190)  T1_0x132 (HT_0x190) N/A
!! T_HTRAP_INST1     T0_0x133 (HT_0x191)  T1_0x133 (HT_0x191) N/A
!!
!! * function not available (not required)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


#define T_API_CHANGE_PRIV    		        0x80
#define T_API_CHANGE_NONPRIV   		        0x82
#define T_API_TRAP_EN                           0x84
#define T_API_TRAP_DIS                          0x86
#define T_API_TRAP_EN_N_TIMES                   0x88
#define T_API_CHANGE_CTX			0x8a
#define T_API_RD_THID				0x8e
#define T_API_HTRAP_INST0			0x90
#define T_API_HTRAP_INST1			0x91
#define T_API_RD_THID_GLOBAL			0x96

#define T_MUTEX_LOCK                            0x10
#define T_MUTEX_UNLOCK                          0x14
#define T_SYNC                                  0x16
#define T_FUNCTION                              0x18
#define T_SYSCALL                               0x18
#define T_SYSRET                                0x1a

#define T_CHANGE_HPRIV    		        0x20
#define T_CHANGE_NONHPRIV    		        0x22
#define T_HTRAP_EN                              0x24
#define T_HTRAP_DIS                             0x26
#define T_HTRAP_EN_N_TIMES                      0x28
#define T_CHANGE_CTX				0x2a
#define T_RD_THID				0x2e

#define T_TRAP_INST0                            0x30
#define T_TRAP_INST1                            0x31
#define T_HTRAP_INST0                           0x32
#define T_HTRAP_INST1                           0x33

#define SVC_NOP                                 0
#define SVC_DEMAP_PAGE                          1
#define SVC_DEMAP_CTX                           2
#define SVC_DEMAP_ALL                           3

#define SVC_RDTH_ID                             4
#define SVC_WRTH_ATTR                           5
#define SVC_TH_JOIN                             6

#ifndef MAX_TRAP_CNT
#define MAX_TRAP_CNT 0x4000
#endif

#ifdef ENABLE_T0_Reserved_0x00
#define E0_0x00 MAX_TRAP_CNT
#else
#define E0_0x00 0
#endif


#ifdef ENABLE_T0_Reserved_0x01		
#define E0_0x01 MAX_TRAP_CNT
#else
#define E0_0x01 0
#endif

#ifdef ENABLE_T0_Reserved_0x02		
#define E0_0x02 MAX_TRAP_CNT
#else
#define E0_0x02 0
#endif

#ifdef ENABLE_T0_Reserved_0x03		
#define E0_0x03 MAX_TRAP_CNT
#else
#define E0_0x03 0
#endif

#ifdef ENABLE_T0_Reserved_0x04		
#define E0_0x04 MAX_TRAP_CNT
#else
#define E0_0x04 0
#endif

#ifdef ENABLE_T0_Reserved_0x05		
#define E0_0x05 MAX_TRAP_CNT
#else
#define E0_0x05 0
#endif

#ifdef ENABLE_T0_Reserved_0x06		
#define E0_0x06 MAX_TRAP_CNT
#else
#define E0_0x06 0
#endif

#ifdef ENABLE_T0_Reserved_0x07		
#define E0_0x07 MAX_TRAP_CNT
#else
#define E0_0x07 0
#endif

#ifdef ENABLE_T0_Instruction_access_exception_0x08
#define E0_0x08 MAX_TRAP_CNT
#else
#define E0_0x08 0
#endif

#ifdef ENABLE_T0_Reserved_0x09		
#define E0_0x09 MAX_TRAP_CNT
#else
#define E0_0x09 0
#endif

#ifdef ENABLE_T0_Instruction_access_error_0x0a		
#define E0_0x0a MAX_TRAP_CNT
#else
#define E0_0x0a 0
#endif

#ifdef ENABLE_T0_Reserved_0x0b		
#define E0_0x0b MAX_TRAP_CNT
#else
#define E0_0x0b 0
#endif

#ifdef ENABLE_T0_Reserved_0x0c		
#define E0_0x0c MAX_TRAP_CNT
#else
#define E0_0x0c 0
#endif

#ifdef ENABLE_T0_Reserved_0x0d		
#define E0_0x0d MAX_TRAP_CNT
#else
#define E0_0x0d 0
#endif

#ifdef ENABLE_T0_Reserved_0x0e		
#define E0_0x0e MAX_TRAP_CNT
#else
#define E0_0x0e 0
#endif

#ifdef ENABLE_T0_Reserved_0x0f		
#define E0_0x0f MAX_TRAP_CNT
#else
#define E0_0x0f 0
#endif

#ifdef ENABLE_T0_Illegal_instruction_0x10
#define E0_0x10 MAX_TRAP_CNT
#else
#define E0_0x10 0
#endif

#ifdef ENABLE_T0_Privileged_opcode_0x11
#define E0_0x11 MAX_TRAP_CNT
#else
#define E0_0x11 0
#endif

#ifdef ENABLE_T0_Unimplemented_LDD_0x12
#define E0_0x12 MAX_TRAP_CNT
#else
#define E0_0x12 0
#endif

#ifdef ENABLE_T0_Unimplemented_STD_0x13
#define E0_0x13 MAX_TRAP_CNT
#else
#define E0_0x13 0
#endif

#ifdef ENABLE_T0_Reserved_0x14		
#define E0_0x14 MAX_TRAP_CNT
#else
#define E0_0x14 0
#endif

#ifdef ENABLE_T0_Reserved_0x15		
#define E0_0x15 MAX_TRAP_CNT
#else
#define E0_0x15 0
#endif

#ifdef ENABLE_T0_Reserved_0x16		
#define E0_0x16 MAX_TRAP_CNT
#else
#define E0_0x16 0
#endif

#ifdef ENABLE_T0_Reserved_0x17		
#define E0_0x17 MAX_TRAP_CNT
#else
#define E0_0x17 0
#endif

#ifdef ENABLE_T0_Reserved_0x18		
#define E0_0x18 MAX_TRAP_CNT
#else
#define E0_0x18 0
#endif

#ifdef ENABLE_T0_Reserved_0x19		
#define E0_0x19 MAX_TRAP_CNT
#else
#define E0_0x19 0
#endif

#ifdef ENABLE_T0_Reserved_0x1a		
#define E0_0x1a MAX_TRAP_CNT
#else
#define E0_0x1a 0
#endif

#ifdef ENABLE_T0_Reserved_0x1b		
#define E0_0x1b MAX_TRAP_CNT
#else
#define E0_0x1b 0
#endif

#ifdef ENABLE_T0_Reserved_0x1c		
#define E0_0x1c MAX_TRAP_CNT
#else
#define E0_0x1c 0
#endif

#ifdef ENABLE_T0_Reserved_0x1d		
#define E0_0x1d MAX_TRAP_CNT
#else
#define E0_0x1d 0
#endif

#ifdef ENABLE_T0_Reserved_0x1e		
#define E0_0x1e MAX_TRAP_CNT
#else
#define E0_0x1e 0
#endif

#ifdef ENABLE_T0_Reserved_0x1f		
#define E0_0x1f MAX_TRAP_CNT
#else
#define E0_0x1f 0
#endif

#ifdef ENABLE_T0_Fp_disabled_0x20
#define E0_0x20 MAX_TRAP_CNT
#else
#define E0_0x20 0
#endif

#ifdef ENABLE_T0_Fp_exception_ieee_754_0x21		
#define E0_0x21 MAX_TRAP_CNT
#else
#define E0_0x21 0
#endif

#ifdef ENABLE_T0_Fp_exception_other_0x22		
#define E0_0x22 MAX_TRAP_CNT
#else
#define E0_0x22 0
#endif

#ifdef ENABLE_T0_Tag_Overflow_0x23		
#define E0_0x23 MAX_TRAP_CNT
#else
#define E0_0x23 0
#endif

#ifdef ENABLE_T0_Clean_Window_0x24
#define E0_0x24 MAX_TRAP_CNT
#else
#define E0_0x24 0
#endif

#define E0_0x25 0
#define E0_0x26 0
#define E0_0x27 0

#ifdef ENABLE_T0_Division_By_Zero_0x28		
#define E0_0x28 MAX_TRAP_CNT
#else
#define E0_0x28 0
#endif

#ifdef ENABLE_T0_Reserved_0x29		
#define E0_0x29 MAX_TRAP_CNT
#else
#define E0_0x29 0
#endif

#ifdef ENABLE_T0_Reserved_0x2a		
#define E0_0x2a MAX_TRAP_CNT
#else
#define E0_0x2a 0
#endif

#ifdef ENABLE_T0_Reserved_0x2b		
#define E0_0x2b MAX_TRAP_CNT
#else
#define E0_0x2b 0
#endif

#ifdef ENABLE_T0_Reserved_0x2c		
#define E0_0x2c MAX_TRAP_CNT
#else
#define E0_0x2c 0
#endif

#ifdef ENABLE_T0_Reserved_0x2d		
#define E0_0x2d MAX_TRAP_CNT
#else
#define E0_0x2d 0
#endif

#ifdef ENABLE_T0_Reserved_0x2e		
#define E0_0x2e MAX_TRAP_CNT
#else
#define E0_0x2e 0
#endif

#ifdef ENABLE_T0_Reserved_0x2f		
#define E0_0x2f MAX_TRAP_CNT
#else
#define E0_0x2f 0
#endif

#ifdef ENABLE_T0_Data_Access_Exception_0x30		
#define E0_0x30 MAX_TRAP_CNT
#else
#define E0_0x30 0
#endif

#ifdef ENABLE_T0_Reserved_0x31		
#define E0_0x31 MAX_TRAP_CNT
#else
#define E0_0x31 0
#endif

#ifdef ENABLE_T0_Data_access_error_0x32		
#define E0_0x32 MAX_TRAP_CNT
#else
#define E0_0x32 0
#endif

#ifdef ENABLE_T0_Reserved_0x33		
#define E0_0x33 MAX_TRAP_CNT
#else
#define E0_0x33 0
#endif

#ifdef ENABLE_T0_Mem_Address_Not_Aligned_0x34		
#define E0_0x34 MAX_TRAP_CNT
#else
#define E0_0x34 0
#endif

#ifdef ENABLE_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define E0_0x35 MAX_TRAP_CNT
#else
#define E0_0x35 0
#endif

#ifdef ENABLE_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define E0_0x36 MAX_TRAP_CNT
#else
#define E0_0x36 0
#endif

#ifdef ENABLE_T0_Privileged_Action_0x37		
#define E0_0x37 MAX_TRAP_CNT
#else
#define E0_0x37 0
#endif

#ifdef ENABLE_T0_Reserved_0x38		
#define E0_0x38 MAX_TRAP_CNT
#else
#define E0_0x38 0
#endif

#ifdef ENABLE_T0_Reserved_0x39		
#define E0_0x39 MAX_TRAP_CNT
#else
#define E0_0x39 0
#endif

#ifdef ENABLE_T0_Reserved_0x3a		
#define E0_0x3a MAX_TRAP_CNT
#else
#define E0_0x3a 0
#endif

#ifdef ENABLE_T0_Reserved_0x3b		
#define E0_0x3b MAX_TRAP_CNT
#else
#define E0_0x3b 0
#endif

#ifdef ENABLE_T0_Reserved_0x3c		
#define E0_0x3c MAX_TRAP_CNT
#else
#define E0_0x3c 0
#endif

#ifdef ENABLE_T0_Reserved_0x3d		
#define E0_0x3d MAX_TRAP_CNT
#else
#define E0_0x3d 0
#endif

#ifdef ENABLE_T0_Reserved_0x3e		
#define E0_0x3e MAX_TRAP_CNT
#else
#define E0_0x3e 0
#endif

#ifdef ENABLE_T0_Reserved_0x3f		
#define E0_0x3f MAX_TRAP_CNT
#else
#define E0_0x3f 0
#endif

#ifdef ENABLE_T0_Reserved_0x40		
#define E0_0x40 MAX_TRAP_CNT
#else
#define E0_0x40 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_1_0x41		
#define E0_0x41 MAX_TRAP_CNT
#else
#define E0_0x41 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_2_0x42		
#define E0_0x42 MAX_TRAP_CNT
#else
#define E0_0x42 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_3_0x43		
#define E0_0x43 MAX_TRAP_CNT
#else
#define E0_0x43 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_4_0x44		
#define E0_0x44 MAX_TRAP_CNT
#else
#define E0_0x44 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_5_0x45		
#define E0_0x45 MAX_TRAP_CNT
#else
#define E0_0x45 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_6_0x46		
#define E0_0x46 MAX_TRAP_CNT
#else
#define E0_0x46 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_7_0x47		
#define E0_0x47 MAX_TRAP_CNT
#else
#define E0_0x47 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_8_0x48		
#define E0_0x48 MAX_TRAP_CNT
#else
#define E0_0x48 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_9_0x49		
#define E0_0x49 MAX_TRAP_CNT
#else
#define E0_0x49 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_10_0x4a		
#define E0_0x4a MAX_TRAP_CNT
#else
#define E0_0x4a 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_11_0x4b		
#define E0_0x4b MAX_TRAP_CNT
#else
#define E0_0x4b 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_12_0x4c		
#define E0_0x4c MAX_TRAP_CNT
#else
#define E0_0x4c 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_13_0x4d		
#define E0_0x4d MAX_TRAP_CNT
#else
#define E0_0x4d 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_14_0x4e		
#define E0_0x4e MAX_TRAP_CNT
#else
#define E0_0x4e 0
#endif

#ifdef ENABLE_T0_Interrupt_Level_15_0x4f		
#define E0_0x4f MAX_TRAP_CNT
#else
#define E0_0x4f 0
#endif

#ifdef ENABLE_T0_Reserved_0x50		
#define E0_0x50 MAX_TRAP_CNT
#else
#define E0_0x50 0
#endif

#ifdef ENABLE_T0_Reserved_0x51		
#define E0_0x51 MAX_TRAP_CNT
#else
#define E0_0x51 0
#endif

#ifdef ENABLE_T0_Reserved_0x52		
#define E0_0x52 MAX_TRAP_CNT
#else
#define E0_0x52 0
#endif

#ifdef ENABLE_T0_Reserved_0x53		
#define E0_0x53 MAX_TRAP_CNT
#else
#define E0_0x53 0
#endif

#ifdef ENABLE_T0_Reserved_0x54		
#define E0_0x54 MAX_TRAP_CNT
#else
#define E0_0x54 0
#endif

#ifdef ENABLE_T0_Reserved_0x55		
#define E0_0x55 MAX_TRAP_CNT
#else
#define E0_0x55 0
#endif

#ifdef ENABLE_T0_Reserved_0x56		
#define E0_0x56 MAX_TRAP_CNT
#else
#define E0_0x56 0
#endif

#ifdef ENABLE_T0_Reserved_0x57		
#define E0_0x57 MAX_TRAP_CNT
#else
#define E0_0x57 0
#endif

#ifdef ENABLE_T0_Reserved_0x58		
#define E0_0x58 MAX_TRAP_CNT
#else
#define E0_0x58 0
#endif

#ifdef ENABLE_T0_Reserved_0x59		
#define E0_0x59 MAX_TRAP_CNT
#else
#define E0_0x59 0
#endif

#ifdef ENABLE_T0_Reserved_0x5a		
#define E0_0x5a MAX_TRAP_CNT
#else
#define E0_0x5a 0
#endif

#ifdef ENABLE_T0_Reserved_0x5b		
#define E0_0x5b MAX_TRAP_CNT
#else
#define E0_0x5b 0
#endif

#ifdef ENABLE_T0_Reserved_0x5c		
#define E0_0x5c MAX_TRAP_CNT
#else
#define E0_0x5c 0
#endif

#ifdef ENABLE_T0_Reserved_0x5d		
#define E0_0x5d MAX_TRAP_CNT
#else
#define E0_0x5d 0
#endif

#ifdef ENABLE_T0_Reserved_0x5e		
#define E0_0x5e MAX_TRAP_CNT
#else
#define E0_0x5e 0
#endif

#ifdef ENABLE_T0_Reserved_0x5f		
#define E0_0x5f MAX_TRAP_CNT
#else
#define E0_0x5f 0
#endif

#ifdef ENABLE_T0_Interrupt_0x60		
#define E0_0x60 MAX_TRAP_CNT
#else
#define E0_0x60 0
#endif

#ifdef ENABLE_T0_Reserved_0x61		
#define E0_0x61 MAX_TRAP_CNT
#else
#define E0_0x61 0
#endif

#ifdef ENABLE_T0_Reserved_0x62		
#define E0_0x62 MAX_TRAP_CNT
#else
#define E0_0x62 0
#endif

#ifdef ENABLE_T0_Corrected_ECC_error_0x63		
#define E0_0x63 MAX_TRAP_CNT
#else
#define E0_0x63 0
#endif

#ifdef ENABLE_T0_fast_instr_access_MMU_miss_0x64
#define E0_0x64 MAX_TRAP_CNT
#else
#define E0_0x64 0
#endif

#ifdef ENABLE_T0_Reserved_0x65
#define E0_0x65 MAX_TRAP_CNT
#else
#define E0_0x65 0
#endif

#ifdef ENABLE_T0_Reserved_0x66
#define E0_0x66 MAX_TRAP_CNT
#else
#define E0_0x66 0
#endif

#ifdef ENABLE_T0_Reserved_0x67
#define E0_0x67 MAX_TRAP_CNT
#else
#define E0_0x67 0
#endif

#ifdef ENABLE_T0_fast_data_access_MMU_miss_0x68
#define E0_0x68 MAX_TRAP_CNT
#else
#define E0_0x68 0
#endif

#ifdef ENABLE_T0_Reserved_0x69
#define E0_0x69 MAX_TRAP_CNT
#else
#define E0_0x69 0
#endif

#ifdef ENABLE_T0_Reserved_0x6a
#define E0_0x6a MAX_TRAP_CNT
#else
#define E0_0x6a 0
#endif

#ifdef ENABLE_T0_Reserved_0x6b
#define E0_0x6b MAX_TRAP_CNT
#else
#define E0_0x6b 0
#endif

#ifdef ENABLE_T0_data_access_protection_0x6c		
#define E0_0x6c MAX_TRAP_CNT
#else
#define E0_0x6c 0
#endif

#ifdef ENABLE_T0_Reserved_0x6d
#define E0_0x6d MAX_TRAP_CNT
#else
#define E0_0x6d 0
#endif

#ifdef ENABLE_T0_Reserved_0x6e
#define E0_0x6e MAX_TRAP_CNT
#else
#define E0_0x6e 0
#endif

#ifdef ENABLE_T0_Reserved_0x6f
#define E0_0x6f MAX_TRAP_CNT
#else
#define E0_0x6f 0
#endif

#ifdef ENABLE_T0_Reserved_0x70		
#define E0_0x70 MAX_TRAP_CNT
#else
#define E0_0x70 0
#endif

#ifdef ENABLE_T0_Reserved_0x71		
#define E0_0x71 MAX_TRAP_CNT
#else
#define E0_0x71 0
#endif

#ifdef ENABLE_T0_Reserved_0x72		
#define E0_0x72 MAX_TRAP_CNT
#else
#define E0_0x72 0
#endif

#ifdef ENABLE_T0_Reserved_0x73		
#define E0_0x73 MAX_TRAP_CNT
#else
#define E0_0x73 0
#endif

#ifdef ENABLE_T0_Reserved_0x74		
#define E0_0x74 MAX_TRAP_CNT
#else
#define E0_0x74 0
#endif

#ifdef ENABLE_T0_Reserved_0x75		
#define E0_0x75 MAX_TRAP_CNT
#else
#define E0_0x75 0
#endif

#ifdef ENABLE_T0_Reserved_0x76		
#define E0_0x76 MAX_TRAP_CNT
#else
#define E0_0x76 0
#endif

#ifdef ENABLE_T0_Reserved_0x77		
#define E0_0x77 MAX_TRAP_CNT
#else
#define E0_0x77 0
#endif

#ifdef ENABLE_T0_Reserved_0x78		
#define E0_0x78 MAX_TRAP_CNT
#else
#define E0_0x78 0
#endif

#ifdef ENABLE_T0_Reserved_0x79		
#define E0_0x79 MAX_TRAP_CNT
#else
#define E0_0x79 0
#endif

#ifdef ENABLE_T0_Reserved_0x7a		
#define E0_0x7a MAX_TRAP_CNT
#else
#define E0_0x7a 0
#endif

#ifdef ENABLE_T0_Reserved_0x7b		
#define E0_0x7b MAX_TRAP_CNT
#else
#define E0_0x7b 0
#endif

#ifdef ENABLE_T0_Reserved_0x7c		
#define E0_0x7c MAX_TRAP_CNT
#else
#define E0_0x7c 0
#endif

#ifdef ENABLE_T0_Reserved_0x7d		
#define E0_0x7d MAX_TRAP_CNT
#else
#define E0_0x7d 0
#endif

#ifdef ENABLE_T0_Reserved_0x7e		
#define E0_0x7e MAX_TRAP_CNT
#else
#define E0_0x7e 0
#endif

#ifdef ENABLE_T0_Reserved_0x7f		
#define E0_0x7f MAX_TRAP_CNT
#else
#define E0_0x7f 0
#endif

#ifdef ENABLE_T0_Window_Spill_0_Normal_0x80		
#define E0_0x80 MAX_TRAP_CNT
#else
#define E0_0x80 0
#endif

#ifdef ENABLE_T0_Reserved_0x81
#define E0_0x81 MAX_TRAP_CNT
#else
#define E0_0x81 0
#endif

#ifdef ENABLE_T0_Reserved_0x82
#define E0_0x82 MAX_TRAP_CNT
#else
#define E0_0x82 0
#endif

#ifdef ENABLE_T0_Reserved_0x83
#define E0_0x83 MAX_TRAP_CNT
#else
#define E0_0x83 0
#endif

#ifdef ENABLE_T0_Window_Spill_1_Normal_0x84		
#define E0_0x84 MAX_TRAP_CNT
#else
#define E0_0x84 0
#endif

#ifdef ENABLE_T0_Reserved_0x85
#define E0_0x85 MAX_TRAP_CNT
#else
#define E0_0x85 0
#endif

#ifdef ENABLE_T0_Reserved_0x86
#define E0_0x86 MAX_TRAP_CNT
#else
#define E0_0x86 0
#endif

#ifdef ENABLE_T0_Reserved_0x87
#define E0_0x87 MAX_TRAP_CNT
#else
#define E0_0x87 0
#endif

#ifdef ENABLE_T0_Window_Spill_2_Normal_0x88		
#define E0_0x88 MAX_TRAP_CNT
#else
#define E0_0x88 0
#endif

#ifdef ENABLE_T0_Reserved_0x89
#define E0_0x89 MAX_TRAP_CNT
#else
#define E0_0x89 0
#endif

#ifdef ENABLE_T0_Reserved_0x8a
#define E0_0x8a MAX_TRAP_CNT
#else
#define E0_0x8a 0
#endif

#ifdef ENABLE_T0_Reserved_0x8b
#define E0_0x8b MAX_TRAP_CNT
#else
#define E0_0x8b 0
#endif


#ifdef ENABLE_T0_Window_Spill_3_Normal_0x8c
#define E0_0x8c MAX_TRAP_CNT
#else
#define E0_0x8c 0
#endif

#ifdef ENABLE_T0_Reserved_0x8d
#define E0_0x8d MAX_TRAP_CNT
#else
#define E0_0x8d 0
#endif

#ifdef ENABLE_T0_Reserved_0x8e
#define E0_0x8e MAX_TRAP_CNT
#else
#define E0_0x8e 0
#endif

#ifdef ENABLE_T0_Reserved_0x8f
#define E0_0x8f MAX_TRAP_CNT
#else
#define E0_0x8f 0
#endif

#ifdef ENABLE_T0_Window_Spill_4_Normal_0x90
#define E0_0x90 MAX_TRAP_CNT
#else
#define E0_0x90 0
#endif

#ifdef ENABLE_T0_Reserved_0x91
#define E0_0x91 MAX_TRAP_CNT
#else
#define E0_0x91 0
#endif

#ifdef ENABLE_T0_Reserved_0x92
#define E0_0x92 MAX_TRAP_CNT
#else
#define E0_0x92 0
#endif

#ifdef ENABLE_T0_Reserved_0x93
#define E0_0x93 MAX_TRAP_CNT
#else
#define E0_0x93 0
#endif

#ifdef ENABLE_T0_Window_Spill_5_Normal_0x94
#define E0_0x94 MAX_TRAP_CNT
#else
#define E0_0x94 0
#endif

#ifdef ENABLE_T0_Reserved_0x95
#define E0_0x95 MAX_TRAP_CNT
#else
#define E0_0x95 0
#endif

#ifdef ENABLE_T0_Reserved_0x96
#define E0_0x96 MAX_TRAP_CNT
#else
#define E0_0x96 0
#endif

#ifdef ENABLE_T0_Reserved_0x97
#define E0_0x97 MAX_TRAP_CNT
#else
#define E0_0x97 0
#endif

#ifdef ENABLE_T0_Window_Spill_6_Normal_0x98
#define E0_0x98 MAX_TRAP_CNT
#else
#define E0_0x98 0
#endif

#ifdef ENABLE_T0_Reserved_0x99
#define E0_0x99 MAX_TRAP_CNT
#else
#define E0_0x99 0
#endif

#ifdef ENABLE_T0_Reserved_0x9a
#define E0_0x9a MAX_TRAP_CNT
#else
#define E0_0x9a 0
#endif

#ifdef ENABLE_T0_Reserved_0x9b
#define E0_0x9b MAX_TRAP_CNT
#else
#define E0_0x9b 0
#endif

#ifdef ENABLE_T0_Window_Spill_7_Normal_0x9c
#define E0_0x9c MAX_TRAP_CNT
#else
#define E0_0x9c 0
#endif

#ifdef ENABLE_T0_Reserved_0x9d
#define E0_0x9d MAX_TRAP_CNT
#else
#define E0_0x9d 0
#endif

#ifdef ENABLE_T0_Reserved_0x9e
#define E0_0x9e MAX_TRAP_CNT
#else
#define E0_0x9e 0
#endif

#ifdef ENABLE_T0_Reserved_0x9f
#define E0_0x9f MAX_TRAP_CNT
#else
#define E0_0x9f 0
#endif

#ifdef ENABLE_T0_Window_Spill_0_Other_0xa0		
#define E0_0xa0 MAX_TRAP_CNT
#else
#define E0_0xa0 0
#endif

#ifdef ENABLE_T0_Reserved_0xa1
#define E0_0xa1 MAX_TRAP_CNT
#else
#define E0_0xa1 0
#endif

#ifdef ENABLE_T0_Reserved_0xa2
#define E0_0xa2 MAX_TRAP_CNT
#else
#define E0_0xa2 0
#endif

#ifdef ENABLE_T0_Reserved_0xa3
#define E0_0xa3 MAX_TRAP_CNT
#else
#define E0_0xa3 0
#endif

#ifdef ENABLE_T0_Window_Spill_1_Other_0xa4		
#define E0_0xa4 MAX_TRAP_CNT
#else
#define E0_0xa4 0
#endif

#ifdef ENABLE_T0_Reserved_0xa5
#define E0_0xa5 MAX_TRAP_CNT
#else
#define E0_0xa5 0
#endif

#ifdef ENABLE_T0_Reserved_0xa6
#define E0_0xa6 MAX_TRAP_CNT
#else
#define E0_0xa6 0
#endif

#ifdef ENABLE_T0_Reserved_0xa7
#define E0_0xa7 MAX_TRAP_CNT
#else
#define E0_0xa7 0
#endif

#ifdef ENABLE_T0_Window_Spill_2_Other_0xa8		
#define E0_0xa8 MAX_TRAP_CNT
#else
#define E0_0xa8 0
#endif

#ifdef ENABLE_T0_Reserved_0xa9
#define E0_0xa9 MAX_TRAP_CNT
#else
#define E0_0xa9 0
#endif

#ifdef ENABLE_T0_Reserved_0xaa
#define E0_0xaa MAX_TRAP_CNT
#else
#define E0_0xaa 0
#endif

#ifdef ENABLE_T0_Reserved_0xab
#define E0_0xab MAX_TRAP_CNT
#else
#define E0_0xab 0
#endif

#ifdef ENABLE_T0_Window_Spill_3_Other_0xac
#define E0_0xac MAX_TRAP_CNT
#else
#define E0_0xac 0
#endif

#ifdef ENABLE_T0_Reserved_0xad
#define E0_0xad MAX_TRAP_CNT
#else
#define E0_0xad 0
#endif

#ifdef ENABLE_T0_Reserved_0xae
#define E0_0xae MAX_TRAP_CNT
#else
#define E0_0xae 0
#endif

#ifdef ENABLE_T0_Reserved_0xaf
#define E0_0xaf MAX_TRAP_CNT
#else
#define E0_0xaf 0
#endif

#ifdef ENABLE_T0_Window_Spill_4_Other_0xb0
#define E0_0xb0 MAX_TRAP_CNT
#else
#define E0_0xb0 0
#endif

#ifdef ENABLE_T0_Reserved_0xb1
#define E0_0xb1 MAX_TRAP_CNT
#else
#define E0_0xb1 0
#endif

#ifdef ENABLE_T0_Reserved_0xb2
#define E0_0xb2 MAX_TRAP_CNT
#else
#define E0_0xb2 0
#endif

#ifdef ENABLE_T0_Reserved_0xb3
#define E0_0xb3 MAX_TRAP_CNT
#else
#define E0_0xb3 0
#endif

#ifdef ENABLE_T0_Window_Spill_5_Other_0xb4
#define E0_0xb4 MAX_TRAP_CNT
#else
#define E0_0xb4 0
#endif

#ifdef ENABLE_T0_Reserved_0xb5
#define E0_0xb5 MAX_TRAP_CNT
#else
#define E0_0xb5 0
#endif

#ifdef ENABLE_T0_Reserved_0xb6
#define E0_0xb6 MAX_TRAP_CNT
#else
#define E0_0xb6 0
#endif

#ifdef ENABLE_T0_Reserved_0xb7
#define E0_0xb7 MAX_TRAP_CNT
#else
#define E0_0xb7 0
#endif

#ifdef ENABLE_T0_Window_Spill_6_Other_0xb8
#define E0_0xb8 MAX_TRAP_CNT
#else
#define E0_0xb8 0
#endif

#ifdef ENABLE_T0_Reserved_0xb9
#define E0_0xb9 MAX_TRAP_CNT
#else
#define E0_0xb9 0
#endif

#ifdef ENABLE_T0_Reserved_0xba
#define E0_0xba MAX_TRAP_CNT
#else
#define E0_0xba 0
#endif

#ifdef ENABLE_T0_Reserved_0xbb
#define E0_0xbb MAX_TRAP_CNT
#else
#define E0_0xbb 0
#endif

#ifdef ENABLE_T0_Window_Spill_7_Other_0xbc
#define E0_0xbc MAX_TRAP_CNT
#else
#define E0_0xbc 0
#endif

#ifdef ENABLE_T0_Reserved_0xbd
#define E0_0xbd MAX_TRAP_CNT
#else
#define E0_0xbd 0
#endif

#ifdef ENABLE_T0_Reserved_0xbe
#define E0_0xbe MAX_TRAP_CNT
#else
#define E0_0xbe 0
#endif

#ifdef ENABLE_T0_Reserved_0xbf
#define E0_0xbf MAX_TRAP_CNT
#else
#define E0_0xbf 0
#endif

#ifdef ENABLE_T0_Window_Fill_0_Normal_0xc0
#define E0_0xc0 MAX_TRAP_CNT
#else
#define E0_0xc0 0
#endif

#ifdef ENABLE_T0_Reserved_0xc1
#define E0_0xc1 MAX_TRAP_CNT
#else
#define E0_0xc1 0
#endif

#ifdef ENABLE_T0_Reserved_0xc2
#define E0_0xc2 MAX_TRAP_CNT
#else
#define E0_0xc2 0
#endif

#ifdef ENABLE_T0_Reserved_0xc3
#define E0_0xc3 MAX_TRAP_CNT
#else
#define E0_0xc3 0
#endif

#ifdef ENABLE_T0_Window_Fill_1_Normal_0xc4
#define E0_0xc4 MAX_TRAP_CNT
#else
#define E0_0xc4 0
#endif

#ifdef ENABLE_T0_Reserved_0xc5
#define E0_0xc5 MAX_TRAP_CNT
#else
#define E0_0xc5 0
#endif

#ifdef ENABLE_T0_Reserved_0xc6
#define E0_0xc6 MAX_TRAP_CNT
#else
#define E0_0xc6 0
#endif

#ifdef ENABLE_T0_Reserved_0xc7
#define E0_0xc7 MAX_TRAP_CNT
#else
#define E0_0xc7 0
#endif

#ifdef ENABLE_T0_Window_Fill_2_Normal_0xc8
#define E0_0xc8 MAX_TRAP_CNT
#else
#define E0_0xc8 0
#endif

#ifdef ENABLE_T0_Reserved_0xc9
#define E0_0xc9 MAX_TRAP_CNT
#else
#define E0_0xc9 0
#endif

#ifdef ENABLE_T0_Reserved_0xca
#define E0_0xca MAX_TRAP_CNT
#else
#define E0_0xca 0
#endif

#ifdef ENABLE_T0_Reserved_0xcb
#define E0_0xcb MAX_TRAP_CNT
#else
#define E0_0xcb 0
#endif

#ifdef ENABLE_T0_Window_Fill_3_Normal_0xcc
#define E0_0xcc MAX_TRAP_CNT
#else
#define E0_0xcc 0
#endif

#ifdef ENABLE_T0_Reserved_0xcd
#define E0_0xcd MAX_TRAP_CNT
#else
#define E0_0xcd 0
#endif

#ifdef ENABLE_T0_Reserved_0xce
#define E0_0xce MAX_TRAP_CNT
#else
#define E0_0xce 0
#endif

#ifdef ENABLE_T0_Reserved_0xcf
#define E0_0xcf MAX_TRAP_CNT
#else
#define E0_0xcf 0
#endif

#ifdef ENABLE_T0_Window_Fill_4_Normal_0xd0
#define E0_0xd0 MAX_TRAP_CNT
#else
#define E0_0xd0 0
#endif

#ifdef ENABLE_T0_Reserved_0xd1
#define E0_0xd1 MAX_TRAP_CNT
#else
#define E0_0xd1 0
#endif

#ifdef ENABLE_T0_Reserved_0xd2
#define E0_0xd2 MAX_TRAP_CNT
#else
#define E0_0xd2 0
#endif

#ifdef ENABLE_T0_Reserved_0xd3
#define E0_0xd3 MAX_TRAP_CNT
#else
#define E0_0xd3 0
#endif

#ifdef ENABLE_T0_Window_Fill_5_Normal_0xd4
#define E0_0xd4 MAX_TRAP_CNT
#else
#define E0_0xd4 0
#endif

#ifdef ENABLE_T0_Reserved_0xd5
#define E0_0xd5 MAX_TRAP_CNT
#else
#define E0_0xd5 0
#endif

#ifdef ENABLE_T0_Reserved_0xd6
#define E0_0xd6 MAX_TRAP_CNT
#else
#define E0_0xd6 0
#endif

#ifdef ENABLE_T0_Reserved_0xd7
#define E0_0xd7 MAX_TRAP_CNT
#else
#define E0_0xd7 0
#endif

#ifdef ENABLE_T0_Window_Fill_6_Normal_0xd8
#define E0_0xd8 MAX_TRAP_CNT
#else
#define E0_0xd8 0
#endif

#ifdef ENABLE_T0_Reserved_0xd9
#define E0_0xd9 MAX_TRAP_CNT
#else
#define E0_0xd9 0
#endif

#ifdef ENABLE_T0_Reserved_0xda
#define E0_0xda MAX_TRAP_CNT
#else
#define E0_0xda 0
#endif

#ifdef ENABLE_T0_Reserved_0xdb
#define E0_0xdb MAX_TRAP_CNT
#else
#define E0_0xdb 0
#endif

#ifdef ENABLE_T0_Window_Fill_7_Normal_0xdc
#define E0_0xdc MAX_TRAP_CNT
#else
#define E0_0xdc 0
#endif

#ifdef ENABLE_T0_Reserved_0xdd
#define E0_0xdd MAX_TRAP_CNT
#else
#define E0_0xdd 0
#endif

#ifdef ENABLE_T0_Reserved_0xde
#define E0_0xde MAX_TRAP_CNT
#else
#define E0_0xde 0
#endif

#ifdef ENABLE_T0_Reserved_0xdf
#define E0_0xdf MAX_TRAP_CNT
#else
#define E0_0xdf 0
#endif

#ifdef ENABLE_T0_Window_Fill_0_Other_0xe0
#define E0_0xe0 MAX_TRAP_CNT
#else
#define E0_0xe0 0
#endif

#ifdef ENABLE_T0_Reserved_0xe1
#define E0_0xe1 MAX_TRAP_CNT
#else
#define E0_0xe1 0
#endif

#ifdef ENABLE_T0_Reserved_0xe2
#define E0_0xe2 MAX_TRAP_CNT
#else
#define E0_0xe2 0
#endif

#ifdef ENABLE_T0_Reserved_0xe3
#define E0_0xe3 MAX_TRAP_CNT
#else
#define E0_0xe3 0
#endif

#ifdef ENABLE_T0_Window_Fill_1_Other_0xe4
#define E0_0xe4 MAX_TRAP_CNT
#else
#define E0_0xe4 0
#endif

#ifdef ENABLE_T0_Reserved_0xe5
#define E0_0xe5 MAX_TRAP_CNT
#else
#define E0_0xe5 0
#endif

#ifdef ENABLE_T0_Reserved_0xe6
#define E0_0xe6 MAX_TRAP_CNT
#else
#define E0_0xe6 0
#endif

#ifdef ENABLE_T0_Reserved_0xe7
#define E0_0xe7 MAX_TRAP_CNT
#else
#define E0_0xe7 0
#endif

#ifdef ENABLE_T0_Window_Fill_2_Other_0xe8
#define E0_0xe8 MAX_TRAP_CNT
#else
#define E0_0xe8 0
#endif

#ifdef ENABLE_T0_Reserved_0xe9
#define E0_0xe9 MAX_TRAP_CNT
#else
#define E0_0xe9 0
#endif

#ifdef ENABLE_T0_Reserved_0xea
#define E0_0xea MAX_TRAP_CNT
#else
#define E0_0xea 0
#endif

#ifdef ENABLE_T0_Reserved_0xeb
#define E0_0xeb MAX_TRAP_CNT
#else
#define E0_0xeb 0
#endif

#ifdef ENABLE_T0_Window_Fill_3_Other_0xec
#define E0_0xec MAX_TRAP_CNT
#else
#define E0_0xec 0
#endif

#ifdef ENABLE_T0_Reserved_0xed
#define E0_0xed MAX_TRAP_CNT
#else
#define E0_0xed 0
#endif

#ifdef ENABLE_T0_Reserved_0xee
#define E0_0xee MAX_TRAP_CNT
#else
#define E0_0xee 0
#endif

#ifdef ENABLE_T0_Reserved_0xef
#define E0_0xef MAX_TRAP_CNT
#else
#define E0_0xef 0
#endif

#ifdef ENABLE_T0_Window_Fill_4_Other_0xf0
#define E0_0xf0 MAX_TRAP_CNT
#else
#define E0_0xf0 0
#endif

#ifdef ENABLE_T0_Reserved_0xf1
#define E0_0xf1 MAX_TRAP_CNT
#else
#define E0_0xf1 0
#endif

#ifdef ENABLE_T0_Reserved_0xf2
#define E0_0xf2 MAX_TRAP_CNT
#else
#define E0_0xf2 0
#endif

#ifdef ENABLE_T0_Reserved_0xf3
#define E0_0xf3 MAX_TRAP_CNT
#else
#define E0_0xf3 0
#endif

#ifdef ENABLE_T0_Window_Fill_5_Other_0xf4
#define E0_0xf4 MAX_TRAP_CNT
#else
#define E0_0xf4 0
#endif

#ifdef ENABLE_T0_Reserved_0xf5
#define E0_0xf5 MAX_TRAP_CNT
#else
#define E0_0xf5 0
#endif

#ifdef ENABLE_T0_Reserved_0xf6
#define E0_0xf6 MAX_TRAP_CNT
#else
#define E0_0xf6 0
#endif

#ifdef ENABLE_T0_Reserved_0xf7
#define E0_0xf7 MAX_TRAP_CNT
#else
#define E0_0xf7 0
#endif

#ifdef ENABLE_T0_Window_Fill_6_Other_0xf8
#define E0_0xf8 MAX_TRAP_CNT
#else
#define E0_0xf8 0
#endif

#ifdef ENABLE_T0_Reserved_0xf9
#define E0_0xf9 MAX_TRAP_CNT
#else
#define E0_0xf9 0
#endif

#ifdef ENABLE_T0_Reserved_0xfa
#define E0_0xfa MAX_TRAP_CNT
#else
#define E0_0xfa 0
#endif

#ifdef ENABLE_T0_Reserved_0xfb
#define E0_0xfb MAX_TRAP_CNT
#else
#define E0_0xfb 0
#endif

#ifdef ENABLE_T0_Window_Fill_7_Other_0xfc
#define E0_0xfc MAX_TRAP_CNT
#else
#define E0_0xfc 0
#endif

#ifdef ENABLE_T0_Reserved_0xfd
#define E0_0xfd MAX_TRAP_CNT
#else
#define E0_0xfd 0
#endif

#ifdef ENABLE_T0_Reserved_0xfe
#define E0_0xfe MAX_TRAP_CNT
#else
#define E0_0xfe 0
#endif

#ifdef ENABLE_T0_Reserved_0xff
#define E0_0xff MAX_TRAP_CNT
#else
#define E0_0xff 0
#endif

#ifdef ENABLE_T1_Reserved_0x00	
#define E1_0x00 MAX_TRAP_CNT
#else
#define E1_0x00 0
#endif

#ifdef ENABLE_T1_Reserved_0x01		
#define E1_0x01 MAX_TRAP_CNT
#else
#define E1_0x01 0
#endif

#ifdef ENABLE_T1_Reserved_0x02		
#define E1_0x02 MAX_TRAP_CNT
#else
#define E1_0x02 0
#endif

#ifdef ENABLE_T1_Reserved_0x03		
#define E1_0x03 MAX_TRAP_CNT
#else
#define E1_0x03 0
#endif

#ifdef ENABLE_T1_Reserved_0x04		
#define E1_0x04 MAX_TRAP_CNT
#else
#define E1_0x04 0
#endif

#ifdef ENABLE_T1_Reserved_0x05		
#define E1_0x05 MAX_TRAP_CNT
#else
#define E1_0x05 0
#endif

#ifdef ENABLE_T1_Reserved_0x06		
#define E1_0x06 MAX_TRAP_CNT
#else
#define E1_0x06 0
#endif

#ifdef ENABLE_T1_Reserved_0x07		
#define E1_0x07 MAX_TRAP_CNT
#else
#define E1_0x07 0
#endif

#ifdef ENABLE_T1_Reserved_0x08		
#define E1_0x08 MAX_TRAP_CNT
#else
#define E1_0x08 0
#endif

#ifdef ENABLE_T1_Reserved_0x09		
#define E1_0x09 MAX_TRAP_CNT
#else
#define E1_0x09 0
#endif

#ifdef ENABLE_T1_Reserved_0x0a		
#define E1_0x0a MAX_TRAP_CNT
#else
#define E1_0x0a 0
#endif

#ifdef ENABLE_T1_Reserved_0x0b		
#define E1_0x0b MAX_TRAP_CNT
#else
#define E1_0x0b 0
#endif

#ifdef ENABLE_T1_Reserved_0x0c		
#define E1_0x0c MAX_TRAP_CNT
#else
#define E1_0x0c 0
#endif

#ifdef ENABLE_T1_Reserved_0x0d		
#define E1_0x0d MAX_TRAP_CNT
#else
#define E1_0x0d 0
#endif

#ifdef ENABLE_T1_Reserved_0x0e		
#define E1_0x0e MAX_TRAP_CNT
#else
#define E1_0x0e 0
#endif

#ifdef ENABLE_T1_Reserved_0x0f		
#define E1_0x0f MAX_TRAP_CNT
#else
#define E1_0x0f 0
#endif

#ifdef ENABLE_T1_Illegal_instruction_0x10
#define E1_0x10 MAX_TRAP_CNT
#else
#define E1_0x10 0
#endif

#ifdef ENABLE_T1_Reserved_0x11		
#define E1_0x11 MAX_TRAP_CNT
#else
#define E1_0x11 0
#endif

#ifdef ENABLE_T1_Reserved_0x12		
#define E1_0x12 MAX_TRAP_CNT
#else
#define E1_0x12 0
#endif

#ifdef ENABLE_T1_Reserved_0x13		
#define E1_0x13 MAX_TRAP_CNT
#else
#define E1_0x13 0
#endif

#ifdef ENABLE_T1_Reserved_0x14		
#define E1_0x14 MAX_TRAP_CNT
#else
#define E1_0x14 0
#endif

#ifdef ENABLE_T1_Reserved_0x15		
#define E1_0x15 MAX_TRAP_CNT
#else
#define E1_0x15 0
#endif

#ifdef ENABLE_T1_Reserved_0x16		
#define E1_0x16 MAX_TRAP_CNT
#else
#define E1_0x16 0
#endif

#ifdef ENABLE_T1_Reserved_0x17		
#define E1_0x17 MAX_TRAP_CNT
#else
#define E1_0x17 0
#endif

#ifdef ENABLE_T1_Reserved_0x18		
#define E1_0x18 MAX_TRAP_CNT
#else
#define E1_0x18 0
#endif

#ifdef ENABLE_T1_Reserved_0x19		
#define E1_0x19 MAX_TRAP_CNT
#else
#define E1_0x19 0
#endif

#ifdef ENABLE_T1_Reserved_0x1a		
#define E1_0x1a MAX_TRAP_CNT
#else
#define E1_0x1a 0
#endif

#ifdef ENABLE_T1_Reserved_0x1b		
#define E1_0x1b MAX_TRAP_CNT
#else
#define E1_0x1b 0
#endif

#ifdef ENABLE_T1_Reserved_0x1c		
#define E1_0x1c MAX_TRAP_CNT
#else
#define E1_0x1c 0
#endif

#ifdef ENABLE_T1_Reserved_0x1d		
#define E1_0x1d MAX_TRAP_CNT
#else
#define E1_0x1d 0
#endif

#ifdef ENABLE_T1_Reserved_0x1e		
#define E1_0x1e MAX_TRAP_CNT
#else
#define E1_0x1e 0
#endif

#ifdef ENABLE_T1_Reserved_0x1f		
#define E1_0x1f MAX_TRAP_CNT
#else
#define E1_0x1f 0
#endif

#ifdef ENABLE_T1_Reserved_0x20		
#define E1_0x20 MAX_TRAP_CNT
#else
#define E1_0x20 0
#endif

#ifdef ENABLE_T1_Reserved_0x21		
#define E1_0x21 MAX_TRAP_CNT
#else
#define E1_0x21 0
#endif

#ifdef ENABLE_T1_Reserved_0x22		
#define E1_0x22 MAX_TRAP_CNT
#else
#define E1_0x22 0
#endif

#ifdef ENABLE_T1_Reserved_0x23		
#define E1_0x23 MAX_TRAP_CNT
#else
#define E1_0x23 0
#endif

#ifdef ENABLE_T1_Reserved_0x24		
#define E1_0x24 MAX_TRAP_CNT
#else
#define E1_0x24 0
#endif

#ifdef ENABLE_T1_Reserved_0x25		
#define E1_0x25 MAX_TRAP_CNT
#else
#define E1_0x25 0
#endif

#ifdef ENABLE_T1_Reserved_0x26		
#define E1_0x26 MAX_TRAP_CNT
#else
#define E1_0x26 0
#endif

#ifdef ENABLE_T1_Reserved_0x27		
#define E1_0x27 MAX_TRAP_CNT
#else
#define E1_0x27 0
#endif

#ifdef ENABLE_T1_Reserved_0x28		
#define E1_0x28 MAX_TRAP_CNT
#else
#define E1_0x28 0
#endif

#ifdef ENABLE_T1_Reserved_0x29		
#define E1_0x29 MAX_TRAP_CNT
#else
#define E1_0x29 0
#endif

#ifdef ENABLE_T1_Reserved_0x2a		
#define E1_0x2a MAX_TRAP_CNT
#else
#define E1_0x2a 0
#endif

#ifdef ENABLE_T1_Reserved_0x2b		
#define E1_0x2b MAX_TRAP_CNT
#else
#define E1_0x2b 0
#endif

#ifdef ENABLE_T1_Reserved_0x2c		
#define E1_0x2c MAX_TRAP_CNT
#else
#define E1_0x2c 0
#endif

#ifdef ENABLE_T1_Reserved_0x2d		
#define E1_0x2d MAX_TRAP_CNT
#else
#define E1_0x2d 0
#endif

#ifdef ENABLE_T1_Reserved_0x2e		
#define E1_0x2e MAX_TRAP_CNT
#else
#define E1_0x2e 0
#endif

#ifdef ENABLE_T1_Reserved_0x2f		
#define E1_0x2f MAX_TRAP_CNT
#else
#define E1_0x2f 0
#endif

#ifdef ENABLE_T1_Reserved_0x30		
#define E1_0x30 MAX_TRAP_CNT
#else
#define E1_0x30 0
#endif

#ifdef ENABLE_T1_Reserved_0x31		
#define E1_0x31 MAX_TRAP_CNT
#else
#define E1_0x31 0
#endif

#ifdef ENABLE_T1_Reserved_0x32		
#define E1_0x32 MAX_TRAP_CNT
#else
#define E1_0x32 0
#endif

#ifdef ENABLE_T1_Reserved_0x33		
#define E1_0x33 MAX_TRAP_CNT
#else
#define E1_0x33 0
#endif

#ifdef ENABLE_T1_Reserved_0x34		
#define E1_0x34 MAX_TRAP_CNT
#else
#define E1_0x34 0
#endif

#ifdef ENABLE_T1_Reserved_0x35		
#define E1_0x35 MAX_TRAP_CNT
#else
#define E1_0x35 0
#endif

#ifdef ENABLE_T1_Reserved_0x36		
#define E1_0x36 MAX_TRAP_CNT
#else
#define E1_0x36 0
#endif

#ifdef ENABLE_T1_Reserved_0x37		
#define E1_0x37 MAX_TRAP_CNT
#else
#define E1_0x37 0
#endif

#ifdef ENABLE_T1_Reserved_0x38		
#define E1_0x38 MAX_TRAP_CNT
#else
#define E1_0x38 0
#endif

#ifdef ENABLE_T1_Reserved_0x39		
#define E1_0x39 MAX_TRAP_CNT
#else
#define E1_0x39 0
#endif

#ifdef ENABLE_T1_Reserved_0x3a		
#define E1_0x3a MAX_TRAP_CNT
#else
#define E1_0x3a 0
#endif

#ifdef ENABLE_T1_Reserved_0x3b		
#define E1_0x3b MAX_TRAP_CNT
#else
#define E1_0x3b 0
#endif

#ifdef ENABLE_T1_Reserved_0x3c		
#define E1_0x3c MAX_TRAP_CNT
#else
#define E1_0x3c 0
#endif

#ifdef ENABLE_T1_Reserved_0x3d		
#define E1_0x3d MAX_TRAP_CNT
#else
#define E1_0x3d 0
#endif

#ifdef ENABLE_T1_Reserved_0x3e		
#define E1_0x3e MAX_TRAP_CNT
#else
#define E1_0x3e 0
#endif

#ifdef ENABLE_T1_Reserved_0x3f		
#define E1_0x3f MAX_TRAP_CNT
#else
#define E1_0x3f 0
#endif

#ifdef ENABLE_T1_Reserved_0x40		
#define E1_0x40 MAX_TRAP_CNT
#else
#define E1_0x40 0
#endif

#ifdef ENABLE_T1_Reserved_0x41		
#define E1_0x41 MAX_TRAP_CNT
#else
#define E1_0x41 0
#endif

#ifdef ENABLE_T1_Reserved_0x42		
#define E1_0x42 MAX_TRAP_CNT
#else
#define E1_0x42 0
#endif

#ifdef ENABLE_T1_Reserved_0x43		
#define E1_0x43 MAX_TRAP_CNT
#else
#define E1_0x43 0
#endif

#ifdef ENABLE_T1_Reserved_0x44		
#define E1_0x44 MAX_TRAP_CNT
#else
#define E1_0x44 0
#endif

#ifdef ENABLE_T1_Reserved_0x45		
#define E1_0x45 MAX_TRAP_CNT
#else
#define E1_0x45 0
#endif

#ifdef ENABLE_T1_Reserved_0x46		
#define E1_0x46 MAX_TRAP_CNT
#else
#define E1_0x46 0
#endif

#ifdef ENABLE_T1_Reserved_0x47		
#define E1_0x47 MAX_TRAP_CNT
#else
#define E1_0x47 0
#endif

#ifdef ENABLE_T1_Reserved_0x48		
#define E1_0x48 MAX_TRAP_CNT
#else
#define E1_0x48 0
#endif

#ifdef ENABLE_T1_Reserved_0x49		
#define E1_0x49 MAX_TRAP_CNT
#else
#define E1_0x49 0
#endif

#ifdef ENABLE_T1_Reserved_0x4a		
#define E1_0x4a MAX_TRAP_CNT
#else
#define E1_0x4a 0
#endif

#ifdef ENABLE_T1_Reserved_0x4b		
#define E1_0x4b MAX_TRAP_CNT
#else
#define E1_0x4b 0
#endif

#ifdef ENABLE_T1_Reserved_0x4c		
#define E1_0x4c MAX_TRAP_CNT
#else
#define E1_0x4c 0
#endif

#ifdef ENABLE_T1_Reserved_0x4d		
#define E1_0x4d MAX_TRAP_CNT
#else
#define E1_0x4d 0
#endif

#ifdef ENABLE_T1_Reserved_0x4e		
#define E1_0x4e MAX_TRAP_CNT
#else
#define E1_0x4e 0
#endif

#ifdef ENABLE_T1_Reserved_0x4f		
#define E1_0x4f MAX_TRAP_CNT
#else
#define E1_0x4f 0
#endif

#ifdef ENABLE_T1_Reserved_0x50		
#define E1_0x50 MAX_TRAP_CNT
#else
#define E1_0x50 0
#endif

#ifdef ENABLE_T1_Reserved_0x51		
#define E1_0x51 MAX_TRAP_CNT
#else
#define E1_0x51 0
#endif

#ifdef ENABLE_T1_Reserved_0x52		
#define E1_0x52 MAX_TRAP_CNT
#else
#define E1_0x52 0
#endif

#ifdef ENABLE_T1_Reserved_0x53		
#define E1_0x53 MAX_TRAP_CNT
#else
#define E1_0x53 0
#endif

#ifdef ENABLE_T1_Reserved_0x54		
#define E1_0x54 MAX_TRAP_CNT
#else
#define E1_0x54 0
#endif

#ifdef ENABLE_T1_Reserved_0x55		
#define E1_0x55 MAX_TRAP_CNT
#else
#define E1_0x55 0
#endif

#ifdef ENABLE_T1_Reserved_0x56		
#define E1_0x56 MAX_TRAP_CNT
#else
#define E1_0x56 0
#endif

#ifdef ENABLE_T1_Reserved_0x57		
#define E1_0x57 MAX_TRAP_CNT
#else
#define E1_0x57 0
#endif

#ifdef ENABLE_T1_Reserved_0x58		
#define E1_0x58 MAX_TRAP_CNT
#else
#define E1_0x58 0
#endif

#ifdef ENABLE_T1_Reserved_0x59		
#define E1_0x59 MAX_TRAP_CNT
#else
#define E1_0x59 0
#endif

#ifdef ENABLE_T1_Reserved_0x5a		
#define E1_0x5a MAX_TRAP_CNT
#else
#define E1_0x5a 0
#endif

#ifdef ENABLE_T1_Reserved_0x5b		
#define E1_0x5b MAX_TRAP_CNT
#else
#define E1_0x5b 0
#endif

#ifdef ENABLE_T1_Reserved_0x5c		
#define E1_0x5c MAX_TRAP_CNT
#else
#define E1_0x5c 0
#endif

#ifdef ENABLE_T1_Reserved_0x5d		
#define E1_0x5d MAX_TRAP_CNT
#else
#define E1_0x5d 0
#endif

#ifdef ENABLE_T1_Reserved_0x5e		
#define E1_0x5e MAX_TRAP_CNT
#else
#define E1_0x5e 0
#endif

#ifdef ENABLE_T1_Reserved_0x5f		
#define E1_0x5f MAX_TRAP_CNT
#else
#define E1_0x5f 0
#endif

#ifdef ENABLE_T1_Reserved_0x60		
#define E1_0x60 MAX_TRAP_CNT
#else
#define E1_0x60 0
#endif

#ifdef ENABLE_T1_Reserved_0x61		
#define E1_0x61 MAX_TRAP_CNT
#else
#define E1_0x61 0
#endif

#ifdef ENABLE_T1_Reserved_0x62		
#define E1_0x62 MAX_TRAP_CNT
#else
#define E1_0x62 0
#endif

#ifdef ENABLE_T1_Reserved_0x63		
#define E1_0x63 MAX_TRAP_CNT
#else
#define E1_0x63 0
#endif

#ifdef ENABLE_T1_fast_instr_access_MMU_miss_0x64
#define E1_0x64 MAX_TRAP_CNT
#else
#define E1_0x64 0
#endif

#ifdef ENABLE_T1_Reserved_0x65
#define E1_0x65 MAX_TRAP_CNT
#else
#define E1_0x65 0
#endif

#ifdef ENABLE_T1_Reserved_0x66
#define E1_0x66 MAX_TRAP_CNT
#else
#define E1_0x66 0
#endif

#ifdef ENABLE_T1_Reserved_0x67
#define E1_0x67 MAX_TRAP_CNT
#else
#define E1_0x67 0
#endif

#ifdef ENABLE_T1_fast_data_access_MMU_miss_0x68
#define E1_0x68 MAX_TRAP_CNT
#else
#define E1_0x68 0
#endif

#ifdef ENABLE_T1_Reserved_0x69
#define E1_0x69 MAX_TRAP_CNT
#else
#define E1_0x69 0
#endif

#ifdef ENABLE_T1_Reserved_0x6a
#define E1_0x6a MAX_TRAP_CNT
#else
#define E1_0x6a 0
#endif

#ifdef ENABLE_T1_Reserved_0x6b
#define E1_0x6b MAX_TRAP_CNT
#else
#define E1_0x6b 0
#endif

#ifdef ENABLE_T1_data_access_protection_0x6c		
#define E1_0x6c MAX_TRAP_CNT
#else
#define E1_0x6c 0
#endif

#ifdef ENABLE_T1_Reserved_0x6d		
#define E1_0x6d MAX_TRAP_CNT
#else
#define E1_0x6d 0
#endif

#ifdef ENABLE_T1_Reserved_0x6e		
#define E1_0x6e MAX_TRAP_CNT
#else
#define E1_0x6e 0
#endif

#ifdef ENABLE_T1_Reserved_0x6f		
#define E1_0x6f MAX_TRAP_CNT
#else
#define E1_0x6f 0
#endif

#ifdef ENABLE_T1_Reserved_0x70		
#define E1_0x70 MAX_TRAP_CNT
#else
#define E1_0x70 0
#endif

#ifdef ENABLE_T1_Reserved_0x71		
#define E1_0x71 MAX_TRAP_CNT
#else
#define E1_0x71 0
#endif

#ifdef ENABLE_T1_Reserved_0x72		
#define E1_0x72 MAX_TRAP_CNT
#else
#define E1_0x72 0
#endif

#ifdef ENABLE_T1_Reserved_0x73		
#define E1_0x73 MAX_TRAP_CNT
#else
#define E1_0x73 0
#endif

#ifdef ENABLE_T1_Reserved_0x74		
#define E1_0x74 MAX_TRAP_CNT
#else
#define E1_0x74 0
#endif

#ifdef ENABLE_T1_Reserved_0x75		
#define E1_0x75 MAX_TRAP_CNT
#else
#define E1_0x75 0
#endif

#ifdef ENABLE_T1_Reserved_0x76		
#define E1_0x76 MAX_TRAP_CNT
#else
#define E1_0x76 0
#endif

#ifdef ENABLE_T1_Reserved_0x77		
#define E1_0x77 MAX_TRAP_CNT
#else
#define E1_0x77 0
#endif

#ifdef ENABLE_T1_Reserved_0x78		
#define E1_0x78 MAX_TRAP_CNT
#else
#define E1_0x78 0
#endif

#ifdef ENABLE_T1_Reserved_0x79		
#define E1_0x79 MAX_TRAP_CNT
#else
#define E1_0x79 0
#endif

#ifdef ENABLE_T1_Reserved_0x7a		
#define E1_0x7a MAX_TRAP_CNT
#else
#define E1_0x7a 0
#endif

#ifdef ENABLE_T1_Reserved_0x7b		
#define E1_0x7b MAX_TRAP_CNT
#else
#define E1_0x7b 0
#endif

#ifdef ENABLE_T1_Reserved_0x7c		
#define E1_0x7c MAX_TRAP_CNT
#else
#define E1_0x7c 0
#endif

#ifdef ENABLE_T1_Reserved_0x7d		
#define E1_0x7d MAX_TRAP_CNT
#else
#define E1_0x7d 0
#endif

#ifdef ENABLE_T1_Reserved_0x7e		
#define E1_0x7e MAX_TRAP_CNT
#else
#define E1_0x7e 0
#endif

#ifdef ENABLE_T1_Reserved_0x7f		
#define E1_0x7f MAX_TRAP_CNT
#else
#define E1_0x7f 0
#endif

#ifdef ENABLE_T1_Reserved_0x80		
#define E1_0x80 MAX_TRAP_CNT
#else
#define E1_0x80 0
#endif

#ifdef ENABLE_T1_Reserved_0x81
#define E1_0x81 MAX_TRAP_CNT
#else
#define E1_0x81 0
#endif

#ifdef ENABLE_T1_Reserved_0x82
#define E1_0x82 MAX_TRAP_CNT
#else
#define E1_0x82 0
#endif

#ifdef ENABLE_T1_Reserved_0x83
#define E1_0x83 MAX_TRAP_CNT
#else
#define E1_0x83 0
#endif

#ifdef ENABLE_T1_Reserved_0x84		
#define E1_0x84 MAX_TRAP_CNT
#else
#define E1_0x84 0
#endif

#ifdef ENABLE_T1_Reserved_0x85
#define E1_0x85 MAX_TRAP_CNT
#else
#define E1_0x85 0
#endif

#ifdef ENABLE_T1_Reserved_0x86
#define E1_0x86 MAX_TRAP_CNT
#else
#define E1_0x86 0
#endif

#ifdef ENABLE_T1_Reserved_0x87
#define E1_0x87 MAX_TRAP_CNT
#else
#define E1_0x87 0
#endif

#ifdef ENABLE_T1_Reserved_0x88		
#define E1_0x88 MAX_TRAP_CNT
#else
#define E1_0x88 0
#endif

#ifdef ENABLE_T1_Reserved_0x89
#define E1_0x89 MAX_TRAP_CNT
#else
#define E1_0x89 0
#endif

#ifdef ENABLE_T1_Reserved_0x8a
#define E1_0x8a MAX_TRAP_CNT
#else
#define E1_0x8a 0
#endif

#ifdef ENABLE_T1_Reserved_0x8b
#define E1_0x8b MAX_TRAP_CNT
#else
#define E1_0x8b 0
#endif

#ifdef ENABLE_T1_Reserved_0x8c		
#define E1_0x8c MAX_TRAP_CNT
#else
#define E1_0x8c 0
#endif

#ifdef ENABLE_T1_Reserved_0x8d
#define E1_0x8d MAX_TRAP_CNT
#else
#define E1_0x8d 0
#endif

#ifdef ENABLE_T1_Reserved_0x8e
#define E1_0x8e MAX_TRAP_CNT
#else
#define E1_0x8e 0
#endif

#ifdef ENABLE_T1_Reserved_0x8f
#define E1_0x8f MAX_TRAP_CNT
#else
#define E1_0x8f 0
#endif

#ifdef ENABLE_T1_Reserved_0x90		
#define E1_0x90 MAX_TRAP_CNT
#else
#define E1_0x90 0
#endif

#ifdef ENABLE_T1_Reserved_0x91		
#define E1_0x91 MAX_TRAP_CNT
#else
#define E1_0x91 0
#endif

#ifdef ENABLE_T1_Reserved_0x92		
#define E1_0x92 MAX_TRAP_CNT
#else
#define E1_0x92 0
#endif

#ifdef ENABLE_T1_Reserved_0x93		
#define E1_0x93 MAX_TRAP_CNT
#else
#define E1_0x93 0
#endif

#ifdef ENABLE_T1_Reserved_0x94		
#define E1_0x94 MAX_TRAP_CNT
#else
#define E1_0x94 0
#endif

#ifdef ENABLE_T1_Reserved_0x95		
#define E1_0x95 MAX_TRAP_CNT
#else
#define E1_0x95 0
#endif

#ifdef ENABLE_T1_Reserved_0x96		
#define E1_0x96 MAX_TRAP_CNT
#else
#define E1_0x96 0
#endif

#ifdef ENABLE_T1_Reserved_0x97		
#define E1_0x97 MAX_TRAP_CNT
#else
#define E1_0x97 0
#endif

#ifdef ENABLE_T1_Reserved_0x98		
#define E1_0x98 MAX_TRAP_CNT
#else
#define E1_0x98 0
#endif

#ifdef ENABLE_T1_Reserved_0x99		
#define E1_0x99 MAX_TRAP_CNT
#else
#define E1_0x99 0
#endif

#ifdef ENABLE_T1_Reserved_0x9a		
#define E1_0x9a MAX_TRAP_CNT
#else
#define E1_0x9a 0
#endif

#ifdef ENABLE_T1_Reserved_0x9b		
#define E1_0x9b MAX_TRAP_CNT
#else
#define E1_0x9b 0
#endif

#ifdef ENABLE_T1_Reserved_0x9c		
#define E1_0x9c MAX_TRAP_CNT
#else
#define E1_0x9c 0
#endif

#ifdef ENABLE_T1_Reserved_0x9d		
#define E1_0x9d MAX_TRAP_CNT
#else
#define E1_0x9d 0
#endif

#ifdef ENABLE_T1_Reserved_0x9e		
#define E1_0x9e MAX_TRAP_CNT
#else
#define E1_0x9e 0
#endif

#ifdef ENABLE_T1_Reserved_0x9f		
#define E1_0x9f MAX_TRAP_CNT
#else
#define E1_0x9f 0
#endif

#ifdef ENABLE_T1_Reserved_0xa0		
#define E1_0xa0 MAX_TRAP_CNT
#else
#define E1_0xa0 0
#endif

#ifdef ENABLE_T1_Reserved_0xa1		
#define E1_0xa1 MAX_TRAP_CNT
#else
#define E1_0xa1 0
#endif

#ifdef ENABLE_T1_Reserved_0xa2		
#define E1_0xa2 MAX_TRAP_CNT
#else
#define E1_0xa2 0
#endif

#ifdef ENABLE_T1_Reserved_0xa3		
#define E1_0xa3 MAX_TRAP_CNT
#else
#define E1_0xa3 0
#endif

#ifdef ENABLE_T1_Reserved_0xa4		
#define E1_0xa4 MAX_TRAP_CNT
#else
#define E1_0xa4 0
#endif

#ifdef ENABLE_T1_Reserved_0xa5		
#define E1_0xa5 MAX_TRAP_CNT
#else
#define E1_0xa5 0
#endif

#ifdef ENABLE_T1_Reserved_0xa6		
#define E1_0xa6 MAX_TRAP_CNT
#else
#define E1_0xa6 0
#endif

#ifdef ENABLE_T1_Reserved_0xa7		
#define E1_0xa7 MAX_TRAP_CNT
#else
#define E1_0xa7 0
#endif

#ifdef ENABLE_T1_Reserved_0xa8		
#define E1_0xa8 MAX_TRAP_CNT
#else
#define E1_0xa8 0
#endif

#ifdef ENABLE_T1_Reserved_0xa9		
#define E1_0xa9 MAX_TRAP_CNT
#else
#define E1_0xa9 0
#endif

#ifdef ENABLE_T1_Reserved_0xaa		
#define E1_0xaa MAX_TRAP_CNT
#else
#define E1_0xaa 0
#endif

#ifdef ENABLE_T1_Reserved_0xab		
#define E1_0xab MAX_TRAP_CNT
#else
#define E1_0xab 0
#endif

#ifdef ENABLE_T1_Reserved_0xac		
#define E1_0xac MAX_TRAP_CNT
#else
#define E1_0xac 0
#endif

#ifdef ENABLE_T1_Reserved_0xad		
#define E1_0xad MAX_TRAP_CNT
#else
#define E1_0xad 0
#endif

#ifdef ENABLE_T1_Reserved_0xae		
#define E1_0xae MAX_TRAP_CNT
#else
#define E1_0xae 0
#endif

#ifdef ENABLE_T1_Reserved_0xaf		
#define E1_0xaf MAX_TRAP_CNT
#else
#define E1_0xaf 0
#endif

#ifdef ENABLE_T1_Reserved_0xb0		
#define E1_0xb0 MAX_TRAP_CNT
#else
#define E1_0xb0 0
#endif

#ifdef ENABLE_T1_Reserved_0xb1		
#define E1_0xb1 MAX_TRAP_CNT
#else
#define E1_0xb1 0
#endif

#ifdef ENABLE_T1_Reserved_0xb2		
#define E1_0xb2 MAX_TRAP_CNT
#else
#define E1_0xb2 0
#endif

#ifdef ENABLE_T1_Reserved_0xb3		
#define E1_0xb3 MAX_TRAP_CNT
#else
#define E1_0xb3 0
#endif

#ifdef ENABLE_T1_Reserved_0xb4		
#define E1_0xb4 MAX_TRAP_CNT
#else
#define E1_0xb4 0
#endif

#ifdef ENABLE_T1_Reserved_0xb5		
#define E1_0xb5 MAX_TRAP_CNT
#else
#define E1_0xb5 0
#endif

#ifdef ENABLE_T1_Reserved_0xb6		
#define E1_0xb6 MAX_TRAP_CNT
#else
#define E1_0xb6 0
#endif

#ifdef ENABLE_T1_Reserved_0xb7		
#define E1_0xb7 MAX_TRAP_CNT
#else
#define E1_0xb7 0
#endif

#ifdef ENABLE_T1_Reserved_0xb8		
#define E1_0xb8 MAX_TRAP_CNT
#else
#define E1_0xb8 0
#endif

#ifdef ENABLE_T1_Reserved_0xb9		
#define E1_0xb9 MAX_TRAP_CNT
#else
#define E1_0xb9 0
#endif

#ifdef ENABLE_T1_Reserved_0xba		
#define E1_0xba MAX_TRAP_CNT
#else
#define E1_0xba 0
#endif

#ifdef ENABLE_T1_Reserved_0xbb		
#define E1_0xbb MAX_TRAP_CNT
#else
#define E1_0xbb 0
#endif

#ifdef ENABLE_T1_Reserved_0xbc		
#define E1_0xbc MAX_TRAP_CNT
#else
#define E1_0xbc 0
#endif

#ifdef ENABLE_T1_Reserved_0xbd		
#define E1_0xbd MAX_TRAP_CNT
#else
#define E1_0xbd 0
#endif

#ifdef ENABLE_T1_Reserved_0xbe		
#define E1_0xbe MAX_TRAP_CNT
#else
#define E1_0xbe 0
#endif

#ifdef ENABLE_T1_Reserved_0xbf		
#define E1_0xbf MAX_TRAP_CNT
#else
#define E1_0xbf 0
#endif

#ifdef ENABLE_T1_Reserved_0xc0		
#define E1_0xc0 MAX_TRAP_CNT
#else
#define E1_0xc0 0
#endif

#ifdef ENABLE_T1_Reserved_0xc1		
#define E1_0xc1 MAX_TRAP_CNT
#else
#define E1_0xc1 0
#endif

#ifdef ENABLE_T1_Reserved_0xc2		
#define E1_0xc2 MAX_TRAP_CNT
#else
#define E1_0xc2 0
#endif

#ifdef ENABLE_T1_Reserved_0xc3		
#define E1_0xc3 MAX_TRAP_CNT
#else
#define E1_0xc3 0
#endif

#ifdef ENABLE_T1_Reserved_0xc4		
#define E1_0xc4 MAX_TRAP_CNT
#else
#define E1_0xc4 0
#endif

#ifdef ENABLE_T1_Reserved_0xc5		
#define E1_0xc5 MAX_TRAP_CNT
#else
#define E1_0xc5 0
#endif

#ifdef ENABLE_T1_Reserved_0xc6		
#define E1_0xc6 MAX_TRAP_CNT
#else
#define E1_0xc6 0
#endif

#ifdef ENABLE_T1_Reserved_0xc7		
#define E1_0xc7 MAX_TRAP_CNT
#else
#define E1_0xc7 0
#endif

#ifdef ENABLE_T1_Reserved_0xc8		
#define E1_0xc8 MAX_TRAP_CNT
#else
#define E1_0xc8 0
#endif

#ifdef ENABLE_T1_Reserved_0xc9		
#define E1_0xc9 MAX_TRAP_CNT
#else
#define E1_0xc9 0
#endif

#ifdef ENABLE_T1_Reserved_0xca		
#define E1_0xca MAX_TRAP_CNT
#else
#define E1_0xca 0
#endif

#ifdef ENABLE_T1_Reserved_0xcb		
#define E1_0xcb MAX_TRAP_CNT
#else
#define E1_0xcb 0
#endif

#ifdef ENABLE_T1_Reserved_0xcc		
#define E1_0xcc MAX_TRAP_CNT
#else
#define E1_0xcc 0
#endif

#ifdef ENABLE_T1_Reserved_0xcd		
#define E1_0xcd MAX_TRAP_CNT
#else
#define E1_0xcd 0
#endif

#ifdef ENABLE_T1_Reserved_0xce		
#define E1_0xce MAX_TRAP_CNT
#else
#define E1_0xce 0
#endif

#ifdef ENABLE_T1_Reserved_0xcf		
#define E1_0xcf MAX_TRAP_CNT
#else
#define E1_0xcf 0
#endif

#ifdef ENABLE_T1_Reserved_0xd0		
#define E1_0xd0 MAX_TRAP_CNT
#else
#define E1_0xd0 0
#endif

#ifdef ENABLE_T1_Reserved_0xd1		
#define E1_0xd1 MAX_TRAP_CNT
#else
#define E1_0xd1 0
#endif

#ifdef ENABLE_T1_Reserved_0xd2		
#define E1_0xd2 MAX_TRAP_CNT
#else
#define E1_0xd2 0
#endif

#ifdef ENABLE_T1_Reserved_0xd3		
#define E1_0xd3 MAX_TRAP_CNT
#else
#define E1_0xd3 0
#endif

#ifdef ENABLE_T1_Reserved_0xd4		
#define E1_0xd4 MAX_TRAP_CNT
#else
#define E1_0xd4 0
#endif

#ifdef ENABLE_T1_Reserved_0xd5		
#define E1_0xd5 MAX_TRAP_CNT
#else
#define E1_0xd5 0
#endif

#ifdef ENABLE_T1_Reserved_0xd6		
#define E1_0xd6 MAX_TRAP_CNT
#else
#define E1_0xd6 0
#endif

#ifdef ENABLE_T1_Reserved_0xd7		
#define E1_0xd7 MAX_TRAP_CNT
#else
#define E1_0xd7 0
#endif

#ifdef ENABLE_T1_Reserved_0xd8		
#define E1_0xd8 MAX_TRAP_CNT
#else
#define E1_0xd8 0
#endif

#ifdef ENABLE_T1_Reserved_0xd9		
#define E1_0xd9 MAX_TRAP_CNT
#else
#define E1_0xd9 0
#endif

#ifdef ENABLE_T1_Reserved_0xda		
#define E1_0xda MAX_TRAP_CNT
#else
#define E1_0xda 0
#endif

#ifdef ENABLE_T1_Reserved_0xdb		
#define E1_0xdb MAX_TRAP_CNT
#else
#define E1_0xdb 0
#endif

#ifdef ENABLE_T1_Reserved_0xdc		
#define E1_0xdc MAX_TRAP_CNT
#else
#define E1_0xdc 0
#endif

#ifdef ENABLE_T1_Reserved_0xdd		
#define E1_0xdd MAX_TRAP_CNT
#else
#define E1_0xdd 0
#endif

#ifdef ENABLE_T1_Reserved_0xde		
#define E1_0xde MAX_TRAP_CNT
#else
#define E1_0xde 0
#endif

#ifdef ENABLE_T1_Reserved_0xdf		
#define E1_0xdf MAX_TRAP_CNT
#else
#define E1_0xdf 0
#endif

#ifdef ENABLE_T1_Reserved_0xe0		
#define E1_0xe0 MAX_TRAP_CNT
#else
#define E1_0xe0 0
#endif

#ifdef ENABLE_T1_Reserved_0xe1		
#define E1_0xe1 MAX_TRAP_CNT
#else
#define E1_0xe1 0
#endif

#ifdef ENABLE_T1_Reserved_0xe2		
#define E1_0xe2 MAX_TRAP_CNT
#else
#define E1_0xe2 0
#endif

#ifdef ENABLE_T1_Reserved_0xe3		
#define E1_0xe3 MAX_TRAP_CNT
#else
#define E1_0xe3 0
#endif

#ifdef ENABLE_T1_Reserved_0xe4		
#define E1_0xe4 MAX_TRAP_CNT
#else
#define E1_0xe4 0
#endif

#ifdef ENABLE_T1_Reserved_0xe5		
#define E1_0xe5 MAX_TRAP_CNT
#else
#define E1_0xe5 0
#endif

#ifdef ENABLE_T1_Reserved_0xe6		
#define E1_0xe6 MAX_TRAP_CNT
#else
#define E1_0xe6 0
#endif

#ifdef ENABLE_T1_Reserved_0xe7		
#define E1_0xe7 MAX_TRAP_CNT
#else
#define E1_0xe7 0
#endif

#ifdef ENABLE_T1_Reserved_0xe8		
#define E1_0xe8 MAX_TRAP_CNT
#else
#define E1_0xe8 0
#endif

#ifdef ENABLE_T1_Reserved_0xe9		
#define E1_0xe9 MAX_TRAP_CNT
#else
#define E1_0xe9 0
#endif

#ifdef ENABLE_T1_Reserved_0xea		
#define E1_0xea MAX_TRAP_CNT
#else
#define E1_0xea 0
#endif

#ifdef ENABLE_T1_Reserved_0xeb		
#define E1_0xeb MAX_TRAP_CNT
#else
#define E1_0xeb 0
#endif

#ifdef ENABLE_T1_Reserved_0xec		
#define E1_0xec MAX_TRAP_CNT
#else
#define E1_0xec 0
#endif

#ifdef ENABLE_T1_Reserved_0xed		
#define E1_0xed MAX_TRAP_CNT
#else
#define E1_0xed 0
#endif

#ifdef ENABLE_T1_Reserved_0xee		
#define E1_0xee MAX_TRAP_CNT
#else
#define E1_0xee 0
#endif

#ifdef ENABLE_T1_Reserved_0xef		
#define E1_0xef MAX_TRAP_CNT
#else
#define E1_0xef 0
#endif

#ifdef ENABLE_T1_Reserved_0xf0		
#define E1_0xf0 MAX_TRAP_CNT
#else
#define E1_0xf0 0
#endif

#ifdef ENABLE_T1_Reserved_0xf1		
#define E1_0xf1 MAX_TRAP_CNT
#else
#define E1_0xf1 0
#endif

#ifdef ENABLE_T1_Reserved_0xf2		
#define E1_0xf2 MAX_TRAP_CNT
#else
#define E1_0xf2 0
#endif

#ifdef ENABLE_T1_Reserved_0xf3		
#define E1_0xf3 MAX_TRAP_CNT
#else
#define E1_0xf3 0
#endif

#ifdef ENABLE_T1_Reserved_0xf4		
#define E1_0xf4 MAX_TRAP_CNT
#else
#define E1_0xf4 0
#endif

#ifdef ENABLE_T1_Reserved_0xf5		
#define E1_0xf5 MAX_TRAP_CNT
#else
#define E1_0xf5 0
#endif

#ifdef ENABLE_T1_Reserved_0xf6		
#define E1_0xf6 MAX_TRAP_CNT
#else
#define E1_0xf6 0
#endif

#ifdef ENABLE_T1_Reserved_0xf7		
#define E1_0xf7 MAX_TRAP_CNT
#else
#define E1_0xf7 0
#endif

#ifdef ENABLE_T1_Reserved_0xf8		
#define E1_0xf8 MAX_TRAP_CNT
#else
#define E1_0xf8 0
#endif

#ifdef ENABLE_T1_Reserved_0xf9		
#define E1_0xf9 MAX_TRAP_CNT
#else
#define E1_0xf9 0
#endif

#ifdef ENABLE_T1_Reserved_0xfa		
#define E1_0xfa MAX_TRAP_CNT
#else
#define E1_0xfa 0
#endif

#ifdef ENABLE_T1_Reserved_0xfb		
#define E1_0xfb MAX_TRAP_CNT
#else
#define E1_0xfb 0
#endif

#ifdef ENABLE_T1_Reserved_0xfc		
#define E1_0xfc MAX_TRAP_CNT
#else
#define E1_0xfc 0
#endif

#ifdef ENABLE_T1_Reserved_0xfd		
#define E1_0xfd MAX_TRAP_CNT
#else
#define E1_0xfd 0
#endif

#ifdef ENABLE_T1_Reserved_0xfe		
#define E1_0xfe MAX_TRAP_CNT
#else
#define E1_0xfe 0
#endif

#ifdef ENABLE_T1_Reserved_0xff		
#define E1_0xff MAX_TRAP_CNT
#else
#define E1_0xff 0
#endif


#ifdef ENABLE_HT0_Reserved_0x00
#define HE0_0x00 MAX_TRAP_CNT
#else
#define HE0_0x00 0
#endif


#ifdef ENABLE_HT0_Reserved_0x01		
#define HE0_0x01 MAX_TRAP_CNT
#else
#define HE0_0x01 0
#endif

#ifdef ENABLE_HT0_Reserved_0x02		
#define HE0_0x02 MAX_TRAP_CNT
#else
#define HE0_0x02 0
#endif

#ifdef ENABLE_HT0_Reserved_0x03		
#define HE0_0x03 MAX_TRAP_CNT
#else
#define HE0_0x03 0
#endif

#ifdef ENABLE_HT0_Reserved_0x04		
#define HE0_0x04 MAX_TRAP_CNT
#else
#define HE0_0x04 0
#endif

#ifdef ENABLE_HT0_Reserved_0x05		
#define HE0_0x05 MAX_TRAP_CNT
#else
#define HE0_0x05 0
#endif

#ifdef ENABLE_HT0_Reserved_0x06		
#define HE0_0x06 MAX_TRAP_CNT
#else
#define HE0_0x06 0
#endif

#ifdef ENABLE_HT0_Reserved_0x07		
#define HE0_0x07 MAX_TRAP_CNT
#else
#define HE0_0x07 0
#endif

#ifdef ENABLE_HT0_Instruction_access_exception_0x08
#define HE0_0x08 MAX_TRAP_CNT
#else
#define HE0_0x08 0
#endif

#ifdef ENABLE_HT0_Reserved_0x09		
#define HE0_0x09 MAX_TRAP_CNT
#else
#define HE0_0x09 0
#endif

#ifdef ENABLE_HT0_Instruction_access_error_0x0a		
#define HE0_0x0a MAX_TRAP_CNT
#else
#define HE0_0x0a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x0b		
#define HE0_0x0b MAX_TRAP_CNT
#else
#define HE0_0x0b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x0c		
#define HE0_0x0c MAX_TRAP_CNT
#else
#define HE0_0x0c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x0d		
#define HE0_0x0d MAX_TRAP_CNT
#else
#define HE0_0x0d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x0e		
#define HE0_0x0e MAX_TRAP_CNT
#else
#define HE0_0x0e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x0f		
#define HE0_0x0f MAX_TRAP_CNT
#else
#define HE0_0x0f 0
#endif

#ifdef ENABLE_HT0_Illegal_instruction_0x10
#define HE0_0x10 MAX_TRAP_CNT
#else
#define HE0_0x10 0
#endif

#ifdef ENABLE_HT0_Privileged_opcode_0x11
#define HE0_0x11 MAX_TRAP_CNT
#else
#define HE0_0x11 0
#endif

#ifdef ENABLE_HT0_Unimplemented_LDD_0x12
#define HE0_0x12 MAX_TRAP_CNT
#else
#define HE0_0x12 0
#endif

#ifdef ENABLE_HT0_Unimplemented_STD_0x13
#define HE0_0x13 MAX_TRAP_CNT
#else
#define HE0_0x13 0
#endif

#ifdef ENABLE_HT0_Reserved_0x14		
#define HE0_0x14 MAX_TRAP_CNT
#else
#define HE0_0x14 0
#endif

#ifdef ENABLE_HT0_Reserved_0x15		
#define HE0_0x15 MAX_TRAP_CNT
#else
#define HE0_0x15 0
#endif

#ifdef ENABLE_HT0_Reserved_0x16		
#define HE0_0x16 MAX_TRAP_CNT
#else
#define HE0_0x16 0
#endif

#ifdef ENABLE_HT0_Reserved_0x17		
#define HE0_0x17 MAX_TRAP_CNT
#else
#define HE0_0x17 0
#endif

#ifdef ENABLE_HT0_Reserved_0x18		
#define HE0_0x18 MAX_TRAP_CNT
#else
#define HE0_0x18 0
#endif

#ifdef ENABLE_HT0_Reserved_0x19		
#define HE0_0x19 MAX_TRAP_CNT
#else
#define HE0_0x19 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1a		
#define HE0_0x1a MAX_TRAP_CNT
#else
#define HE0_0x1a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1b		
#define HE0_0x1b MAX_TRAP_CNT
#else
#define HE0_0x1b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1c		
#define HE0_0x1c MAX_TRAP_CNT
#else
#define HE0_0x1c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1d		
#define HE0_0x1d MAX_TRAP_CNT
#else
#define HE0_0x1d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1e		
#define HE0_0x1e MAX_TRAP_CNT
#else
#define HE0_0x1e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x1f		
#define HE0_0x1f MAX_TRAP_CNT
#else
#define HE0_0x1f 0
#endif

#ifdef ENABLE_HT0_Fp_disabled_0x20
#define HE0_0x20 MAX_TRAP_CNT
#else
#define HE0_0x20 0
#endif

#ifdef ENABLE_HT0_Fp_exception_ieee_754_0x21		
#define HE0_0x21 MAX_TRAP_CNT
#else
#define HE0_0x21 0
#endif

#ifdef ENABLE_HT0_Fp_exception_other_0x22		
#define HE0_0x22 MAX_TRAP_CNT
#else
#define HE0_0x22 0
#endif

#ifdef ENABLE_HT0_Tag_Overflow_0x23		
#define HE0_0x23 MAX_TRAP_CNT
#else
#define HE0_0x23 0
#endif

#ifdef ENABLE_HT0_Clean_Window_0x24
#define HE0_0x24 MAX_TRAP_CNT
#else
#define HE0_0x24 0
#endif

#define HE0_0x25 0
#define HE0_0x26 0
#define HE0_0x27 0

#ifdef ENABLE_HT0_Division_By_Zero_0x28		
#define HE0_0x28 MAX_TRAP_CNT
#else
#define HE0_0x28 0
#endif

#ifdef ENABLE_HT0_Reserved_0x29		
#define HE0_0x29 MAX_TRAP_CNT
#else
#define HE0_0x29 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2a		
#define HE0_0x2a MAX_TRAP_CNT
#else
#define HE0_0x2a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2b		
#define HE0_0x2b MAX_TRAP_CNT
#else
#define HE0_0x2b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2c		
#define HE0_0x2c MAX_TRAP_CNT
#else
#define HE0_0x2c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2d		
#define HE0_0x2d MAX_TRAP_CNT
#else
#define HE0_0x2d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2e		
#define HE0_0x2e MAX_TRAP_CNT
#else
#define HE0_0x2e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x2f		
#define HE0_0x2f MAX_TRAP_CNT
#else
#define HE0_0x2f 0
#endif

#ifdef ENABLE_HT0_Data_Access_Exception_0x30		
#define HE0_0x30 MAX_TRAP_CNT
#else
#define HE0_0x30 0
#endif

#ifdef ENABLE_HT0_Reserved_0x31		
#define HE0_0x31 MAX_TRAP_CNT
#else
#define HE0_0x31 0
#endif

#ifdef ENABLE_HT0_Data_access_error_0x32		
#define HE0_0x32 MAX_TRAP_CNT
#else
#define HE0_0x32 0
#endif

#ifdef ENABLE_HT0_Reserved_0x33		
#define HE0_0x33 MAX_TRAP_CNT
#else
#define HE0_0x33 0
#endif

#ifdef ENABLE_HT0_Mem_Address_Not_Aligned_0x34		
#define HE0_0x34 MAX_TRAP_CNT
#else
#define HE0_0x34 0
#endif

#ifdef ENABLE_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define HE0_0x35 MAX_TRAP_CNT
#else
#define HE0_0x35 0
#endif

#ifdef ENABLE_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define HE0_0x36 MAX_TRAP_CNT
#else
#define HE0_0x36 0
#endif

#ifdef ENABLE_HT0_Privileged_Action_0x37		
#define HE0_0x37 MAX_TRAP_CNT
#else
#define HE0_0x37 0
#endif

#ifdef ENABLE_HT0_Reserved_0x38		
#define HE0_0x38 MAX_TRAP_CNT
#else
#define HE0_0x38 0
#endif

#ifdef ENABLE_HT0_Reserved_0x39		
#define HE0_0x39 MAX_TRAP_CNT
#else
#define HE0_0x39 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3a		
#define HE0_0x3a MAX_TRAP_CNT
#else
#define HE0_0x3a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3b		
#define HE0_0x3b MAX_TRAP_CNT
#else
#define HE0_0x3b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3c		
#define HE0_0x3c MAX_TRAP_CNT
#else
#define HE0_0x3c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3d		
#define HE0_0x3d MAX_TRAP_CNT
#else
#define HE0_0x3d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3e		
#define HE0_0x3e MAX_TRAP_CNT
#else
#define HE0_0x3e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x3f		
#define HE0_0x3f MAX_TRAP_CNT
#else
#define HE0_0x3f 0
#endif

#ifdef ENABLE_HT0_Reserved_0x40		
#define HE0_0x40 MAX_TRAP_CNT
#else
#define HE0_0x40 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_1_0x41		
#define HE0_0x41 MAX_TRAP_CNT
#else
#define HE0_0x41 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_2_0x42		
#define HE0_0x42 MAX_TRAP_CNT
#else
#define HE0_0x42 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_3_0x43		
#define HE0_0x43 MAX_TRAP_CNT
#else
#define HE0_0x43 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_4_0x44		
#define HE0_0x44 MAX_TRAP_CNT
#else
#define HE0_0x44 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_5_0x45		
#define HE0_0x45 MAX_TRAP_CNT
#else
#define HE0_0x45 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_6_0x46		
#define HE0_0x46 MAX_TRAP_CNT
#else
#define HE0_0x46 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_7_0x47		
#define HE0_0x47 MAX_TRAP_CNT
#else
#define HE0_0x47 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_8_0x48		
#define HE0_0x48 MAX_TRAP_CNT
#else
#define HE0_0x48 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_9_0x49		
#define HE0_0x49 MAX_TRAP_CNT
#else
#define HE0_0x49 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_10_0x4a		
#define HE0_0x4a MAX_TRAP_CNT
#else
#define HE0_0x4a 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_11_0x4b		
#define HE0_0x4b MAX_TRAP_CNT
#else
#define HE0_0x4b 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_12_0x4c		
#define HE0_0x4c MAX_TRAP_CNT
#else
#define HE0_0x4c 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_13_0x4d		
#define HE0_0x4d MAX_TRAP_CNT
#else
#define HE0_0x4d 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_14_0x4e		
#define HE0_0x4e MAX_TRAP_CNT
#else
#define HE0_0x4e 0
#endif

#ifdef ENABLE_HT0_Interrupt_Level_15_0x4f		
#define HE0_0x4f MAX_TRAP_CNT
#else
#define HE0_0x4f 0
#endif

#ifdef ENABLE_HT0_Reserved_0x50		
#define HE0_0x50 MAX_TRAP_CNT
#else
#define HE0_0x50 0
#endif

#ifdef ENABLE_HT0_Reserved_0x51		
#define HE0_0x51 MAX_TRAP_CNT
#else
#define HE0_0x51 0
#endif

#ifdef ENABLE_HT0_Reserved_0x52		
#define HE0_0x52 MAX_TRAP_CNT
#else
#define HE0_0x52 0
#endif

#ifdef ENABLE_HT0_Reserved_0x53		
#define HE0_0x53 MAX_TRAP_CNT
#else
#define HE0_0x53 0
#endif

#ifdef ENABLE_HT0_Reserved_0x54		
#define HE0_0x54 MAX_TRAP_CNT
#else
#define HE0_0x54 0
#endif

#ifdef ENABLE_HT0_Reserved_0x55		
#define HE0_0x55 MAX_TRAP_CNT
#else
#define HE0_0x55 0
#endif

#ifdef ENABLE_HT0_Reserved_0x56		
#define HE0_0x56 MAX_TRAP_CNT
#else
#define HE0_0x56 0
#endif

#ifdef ENABLE_HT0_Reserved_0x57		
#define HE0_0x57 MAX_TRAP_CNT
#else
#define HE0_0x57 0
#endif

#ifdef ENABLE_HT0_Reserved_0x58		
#define HE0_0x58 MAX_TRAP_CNT
#else
#define HE0_0x58 0
#endif

#ifdef ENABLE_HT0_Reserved_0x59		
#define HE0_0x59 MAX_TRAP_CNT
#else
#define HE0_0x59 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5a		
#define HE0_0x5a MAX_TRAP_CNT
#else
#define HE0_0x5a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5b		
#define HE0_0x5b MAX_TRAP_CNT
#else
#define HE0_0x5b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5c		
#define HE0_0x5c MAX_TRAP_CNT
#else
#define HE0_0x5c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5d		
#define HE0_0x5d MAX_TRAP_CNT
#else
#define HE0_0x5d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5e		
#define HE0_0x5e MAX_TRAP_CNT
#else
#define HE0_0x5e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x5f		
#define HE0_0x5f MAX_TRAP_CNT
#else
#define HE0_0x5f 0
#endif

#ifdef ENABLE_HT0_Interrupt_0x60		
#define HE0_0x60 MAX_TRAP_CNT
#else
#define HE0_0x60 0
#endif

#ifdef ENABLE_HT0_Reserved_0x61		
#define HE0_0x61 MAX_TRAP_CNT
#else
#define HE0_0x61 0
#endif

#ifdef ENABLE_HT0_Reserved_0x62		
#define HE0_0x62 MAX_TRAP_CNT
#else
#define HE0_0x62 0
#endif

#ifdef ENABLE_HT0_Corrected_ECC_error_0x63		
#define HE0_0x63 MAX_TRAP_CNT
#else
#define HE0_0x63 0
#endif

#ifdef ENABLE_HT0_fast_instr_access_MMU_miss_0x64
#define HE0_0x64 MAX_TRAP_CNT
#else
#define HE0_0x64 0
#endif

#ifdef ENABLE_HT0_Reserved_0x65
#define HE0_0x65 MAX_TRAP_CNT
#else
#define HE0_0x65 0
#endif

#ifdef ENABLE_HT0_Reserved_0x66
#define HE0_0x66 MAX_TRAP_CNT
#else
#define HE0_0x66 0
#endif

#ifdef ENABLE_HT0_Reserved_0x67
#define HE0_0x67 MAX_TRAP_CNT
#else
#define HE0_0x67 0
#endif

#ifdef ENABLE_HT0_fast_data_access_MMU_miss_0x68
#define HE0_0x68 MAX_TRAP_CNT
#else
#define HE0_0x68 0
#endif

#ifdef ENABLE_HT0_Reserved_0x69
#define HE0_0x69 MAX_TRAP_CNT
#else
#define HE0_0x69 0
#endif

#ifdef ENABLE_HT0_Reserved_0x6a
#define HE0_0x6a MAX_TRAP_CNT
#else
#define HE0_0x6a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x6b
#define HE0_0x6b MAX_TRAP_CNT
#else
#define HE0_0x6b 0
#endif

#ifdef ENABLE_HT0_data_access_protection_0x6c		
#define HE0_0x6c MAX_TRAP_CNT
#else
#define HE0_0x6c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x6d
#define HE0_0x6d MAX_TRAP_CNT
#else
#define HE0_0x6d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x6e
#define HE0_0x6e MAX_TRAP_CNT
#else
#define HE0_0x6e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x6f
#define HE0_0x6f MAX_TRAP_CNT
#else
#define HE0_0x6f 0
#endif

#ifdef ENABLE_HT0_Reserved_0x70		
#define HE0_0x70 MAX_TRAP_CNT
#else
#define HE0_0x70 0
#endif

#ifdef ENABLE_HT0_Reserved_0x71		
#define HE0_0x71 MAX_TRAP_CNT
#else
#define HE0_0x71 0
#endif

#ifdef ENABLE_HT0_Reserved_0x72		
#define HE0_0x72 MAX_TRAP_CNT
#else
#define HE0_0x72 0
#endif

#ifdef ENABLE_HT0_Reserved_0x73		
#define HE0_0x73 MAX_TRAP_CNT
#else
#define HE0_0x73 0
#endif

#ifdef ENABLE_HT0_Reserved_0x74		
#define HE0_0x74 MAX_TRAP_CNT
#else
#define HE0_0x74 0
#endif

#ifdef ENABLE_HT0_Reserved_0x75		
#define HE0_0x75 MAX_TRAP_CNT
#else
#define HE0_0x75 0
#endif

#ifdef ENABLE_HT0_Reserved_0x76		
#define HE0_0x76 MAX_TRAP_CNT
#else
#define HE0_0x76 0
#endif

#ifdef ENABLE_HT0_Reserved_0x77		
#define HE0_0x77 MAX_TRAP_CNT
#else
#define HE0_0x77 0
#endif

#ifdef ENABLE_HT0_Reserved_0x78		
#define HE0_0x78 MAX_TRAP_CNT
#else
#define HE0_0x78 0
#endif

#ifdef ENABLE_HT0_Reserved_0x79		
#define HE0_0x79 MAX_TRAP_CNT
#else
#define HE0_0x79 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7a		
#define HE0_0x7a MAX_TRAP_CNT
#else
#define HE0_0x7a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7b		
#define HE0_0x7b MAX_TRAP_CNT
#else
#define HE0_0x7b 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7c		
#define HE0_0x7c MAX_TRAP_CNT
#else
#define HE0_0x7c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7d		
#define HE0_0x7d MAX_TRAP_CNT
#else
#define HE0_0x7d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7e		
#define HE0_0x7e MAX_TRAP_CNT
#else
#define HE0_0x7e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x7f		
#define HE0_0x7f MAX_TRAP_CNT
#else
#define HE0_0x7f 0
#endif

#ifdef ENABLE_HT0_Window_Spill_0_Normal_0x80		
#define HE0_0x80 MAX_TRAP_CNT
#else
#define HE0_0x80 0
#endif

#ifdef ENABLE_HT0_Reserved_0x81
#define HE0_0x81 MAX_TRAP_CNT
#else
#define HE0_0x81 0
#endif

#ifdef ENABLE_HT0_Reserved_0x82
#define HE0_0x82 MAX_TRAP_CNT
#else
#define HE0_0x82 0
#endif

#ifdef ENABLE_HT0_Reserved_0x83
#define HE0_0x83 MAX_TRAP_CNT
#else
#define HE0_0x83 0
#endif

#ifdef ENABLE_HT0_Window_Spill_1_Normal_0x84		
#define HE0_0x84 MAX_TRAP_CNT
#else
#define HE0_0x84 0
#endif

#ifdef ENABLE_HT0_Reserved_0x85
#define HE0_0x85 MAX_TRAP_CNT
#else
#define HE0_0x85 0
#endif

#ifdef ENABLE_HT0_Reserved_0x86
#define HE0_0x86 MAX_TRAP_CNT
#else
#define HE0_0x86 0
#endif

#ifdef ENABLE_HT0_Reserved_0x87
#define HE0_0x87 MAX_TRAP_CNT
#else
#define HE0_0x87 0
#endif

#ifdef ENABLE_HT0_Window_Spill_2_Normal_0x88		
#define HE0_0x88 MAX_TRAP_CNT
#else
#define HE0_0x88 0
#endif

#ifdef ENABLE_HT0_Reserved_0x89
#define HE0_0x89 MAX_TRAP_CNT
#else
#define HE0_0x89 0
#endif

#ifdef ENABLE_HT0_Reserved_0x8a
#define HE0_0x8a MAX_TRAP_CNT
#else
#define HE0_0x8a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x8b
#define HE0_0x8b MAX_TRAP_CNT
#else
#define HE0_0x8b 0
#endif


#ifdef ENABLE_HT0_Window_Spill_3_Normal_0x8c
#define HE0_0x8c MAX_TRAP_CNT
#else
#define HE0_0x8c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x8d
#define HE0_0x8d MAX_TRAP_CNT
#else
#define HE0_0x8d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x8e
#define HE0_0x8e MAX_TRAP_CNT
#else
#define HE0_0x8e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x8f
#define HE0_0x8f MAX_TRAP_CNT
#else
#define HE0_0x8f 0
#endif

#ifdef ENABLE_HT0_Window_Spill_4_Normal_0x90
#define HE0_0x90 MAX_TRAP_CNT
#else
#define HE0_0x90 0
#endif

#ifdef ENABLE_HT0_Reserved_0x91
#define HE0_0x91 MAX_TRAP_CNT
#else
#define HE0_0x91 0
#endif

#ifdef ENABLE_HT0_Reserved_0x92
#define HE0_0x92 MAX_TRAP_CNT
#else
#define HE0_0x92 0
#endif

#ifdef ENABLE_HT0_Reserved_0x93
#define HE0_0x93 MAX_TRAP_CNT
#else
#define HE0_0x93 0
#endif

#ifdef ENABLE_HT0_Window_Spill_5_Normal_0x94
#define HE0_0x94 MAX_TRAP_CNT
#else
#define HE0_0x94 0
#endif

#ifdef ENABLE_HT0_Reserved_0x95
#define HE0_0x95 MAX_TRAP_CNT
#else
#define HE0_0x95 0
#endif

#ifdef ENABLE_HT0_Reserved_0x96
#define HE0_0x96 MAX_TRAP_CNT
#else
#define HE0_0x96 0
#endif

#ifdef ENABLE_HT0_Reserved_0x97
#define HE0_0x97 MAX_TRAP_CNT
#else
#define HE0_0x97 0
#endif

#ifdef ENABLE_HT0_Window_Spill_6_Normal_0x98
#define HE0_0x98 MAX_TRAP_CNT
#else
#define HE0_0x98 0
#endif

#ifdef ENABLE_HT0_Reserved_0x99
#define HE0_0x99 MAX_TRAP_CNT
#else
#define HE0_0x99 0
#endif

#ifdef ENABLE_HT0_Reserved_0x9a
#define HE0_0x9a MAX_TRAP_CNT
#else
#define HE0_0x9a 0
#endif

#ifdef ENABLE_HT0_Reserved_0x9b
#define HE0_0x9b MAX_TRAP_CNT
#else
#define HE0_0x9b 0
#endif

#ifdef ENABLE_HT0_Window_Spill_7_Normal_0x9c
#define HE0_0x9c MAX_TRAP_CNT
#else
#define HE0_0x9c 0
#endif

#ifdef ENABLE_HT0_Reserved_0x9d
#define HE0_0x9d MAX_TRAP_CNT
#else
#define HE0_0x9d 0
#endif

#ifdef ENABLE_HT0_Reserved_0x9e
#define HE0_0x9e MAX_TRAP_CNT
#else
#define HE0_0x9e 0
#endif

#ifdef ENABLE_HT0_Reserved_0x9f
#define HE0_0x9f MAX_TRAP_CNT
#else
#define HE0_0x9f 0
#endif

#ifdef ENABLE_HT0_Window_Spill_0_Other_0xa0		
#define HE0_0xa0 MAX_TRAP_CNT
#else
#define HE0_0xa0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa1
#define HE0_0xa1 MAX_TRAP_CNT
#else
#define HE0_0xa1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa2
#define HE0_0xa2 MAX_TRAP_CNT
#else
#define HE0_0xa2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa3
#define HE0_0xa3 MAX_TRAP_CNT
#else
#define HE0_0xa3 0
#endif

#ifdef ENABLE_HT0_Window_Spill_1_Other_0xa4		
#define HE0_0xa4 MAX_TRAP_CNT
#else
#define HE0_0xa4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa5
#define HE0_0xa5 MAX_TRAP_CNT
#else
#define HE0_0xa5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa6
#define HE0_0xa6 MAX_TRAP_CNT
#else
#define HE0_0xa6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa7
#define HE0_0xa7 MAX_TRAP_CNT
#else
#define HE0_0xa7 0
#endif

#ifdef ENABLE_HT0_Window_Spill_2_Other_0xa8		
#define HE0_0xa8 MAX_TRAP_CNT
#else
#define HE0_0xa8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xa9
#define HE0_0xa9 MAX_TRAP_CNT
#else
#define HE0_0xa9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xaa
#define HE0_0xaa MAX_TRAP_CNT
#else
#define HE0_0xaa 0
#endif

#ifdef ENABLE_HT0_Reserved_0xab
#define HE0_0xab MAX_TRAP_CNT
#else
#define HE0_0xab 0
#endif

#ifdef ENABLE_HT0_Window_Spill_3_Other_0xac
#define HE0_0xac MAX_TRAP_CNT
#else
#define HE0_0xac 0
#endif

#ifdef ENABLE_HT0_Reserved_0xad
#define HE0_0xad MAX_TRAP_CNT
#else
#define HE0_0xad 0
#endif

#ifdef ENABLE_HT0_Reserved_0xae
#define HE0_0xae MAX_TRAP_CNT
#else
#define HE0_0xae 0
#endif

#ifdef ENABLE_HT0_Reserved_0xaf
#define HE0_0xaf MAX_TRAP_CNT
#else
#define HE0_0xaf 0
#endif

#ifdef ENABLE_HT0_Window_Spill_4_Other_0xb0
#define HE0_0xb0 MAX_TRAP_CNT
#else
#define HE0_0xb0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb1
#define HE0_0xb1 MAX_TRAP_CNT
#else
#define HE0_0xb1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb2
#define HE0_0xb2 MAX_TRAP_CNT
#else
#define HE0_0xb2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb3
#define HE0_0xb3 MAX_TRAP_CNT
#else
#define HE0_0xb3 0
#endif

#ifdef ENABLE_HT0_Window_Spill_5_Other_0xb4
#define HE0_0xb4 MAX_TRAP_CNT
#else
#define HE0_0xb4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb5
#define HE0_0xb5 MAX_TRAP_CNT
#else
#define HE0_0xb5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb6
#define HE0_0xb6 MAX_TRAP_CNT
#else
#define HE0_0xb6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb7
#define HE0_0xb7 MAX_TRAP_CNT
#else
#define HE0_0xb7 0
#endif

#ifdef ENABLE_HT0_Window_Spill_6_Other_0xb8
#define HE0_0xb8 MAX_TRAP_CNT
#else
#define HE0_0xb8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xb9
#define HE0_0xb9 MAX_TRAP_CNT
#else
#define HE0_0xb9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xba
#define HE0_0xba MAX_TRAP_CNT
#else
#define HE0_0xba 0
#endif

#ifdef ENABLE_HT0_Reserved_0xbb
#define HE0_0xbb MAX_TRAP_CNT
#else
#define HE0_0xbb 0
#endif

#ifdef ENABLE_HT0_Window_Spill_7_Other_0xbc
#define HE0_0xbc MAX_TRAP_CNT
#else
#define HE0_0xbc 0
#endif

#ifdef ENABLE_HT0_Reserved_0xbd
#define HE0_0xbd MAX_TRAP_CNT
#else
#define HE0_0xbd 0
#endif

#ifdef ENABLE_HT0_Reserved_0xbe
#define HE0_0xbe MAX_TRAP_CNT
#else
#define HE0_0xbe 0
#endif

#ifdef ENABLE_HT0_Reserved_0xbf
#define HE0_0xbf MAX_TRAP_CNT
#else
#define HE0_0xbf 0
#endif

#ifdef ENABLE_HT0_Window_Fill_0_Normal_0xc0
#define HE0_0xc0 MAX_TRAP_CNT
#else
#define HE0_0xc0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc1
#define HE0_0xc1 MAX_TRAP_CNT
#else
#define HE0_0xc1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc2
#define HE0_0xc2 MAX_TRAP_CNT
#else
#define HE0_0xc2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc3
#define HE0_0xc3 MAX_TRAP_CNT
#else
#define HE0_0xc3 0
#endif

#ifdef ENABLE_HT0_Window_Fill_1_Normal_0xc4
#define HE0_0xc4 MAX_TRAP_CNT
#else
#define HE0_0xc4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc5
#define HE0_0xc5 MAX_TRAP_CNT
#else
#define HE0_0xc5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc6
#define HE0_0xc6 MAX_TRAP_CNT
#else
#define HE0_0xc6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc7
#define HE0_0xc7 MAX_TRAP_CNT
#else
#define HE0_0xc7 0
#endif

#ifdef ENABLE_HT0_Window_Fill_2_Normal_0xc8
#define HE0_0xc8 MAX_TRAP_CNT
#else
#define HE0_0xc8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xc9
#define HE0_0xc9 MAX_TRAP_CNT
#else
#define HE0_0xc9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xca
#define HE0_0xca MAX_TRAP_CNT
#else
#define HE0_0xca 0
#endif

#ifdef ENABLE_HT0_Reserved_0xcb
#define HE0_0xcb MAX_TRAP_CNT
#else
#define HE0_0xcb 0
#endif

#ifdef ENABLE_HT0_Window_Fill_3_Normal_0xcc
#define HE0_0xcc MAX_TRAP_CNT
#else
#define HE0_0xcc 0
#endif

#ifdef ENABLE_HT0_Reserved_0xcd
#define HE0_0xcd MAX_TRAP_CNT
#else
#define HE0_0xcd 0
#endif

#ifdef ENABLE_HT0_Reserved_0xce
#define HE0_0xce MAX_TRAP_CNT
#else
#define HE0_0xce 0
#endif

#ifdef ENABLE_HT0_Reserved_0xcf
#define HE0_0xcf MAX_TRAP_CNT
#else
#define HE0_0xcf 0
#endif

#ifdef ENABLE_HT0_Window_Fill_4_Normal_0xd0
#define HE0_0xd0 MAX_TRAP_CNT
#else
#define HE0_0xd0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd1
#define HE0_0xd1 MAX_TRAP_CNT
#else
#define HE0_0xd1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd2
#define HE0_0xd2 MAX_TRAP_CNT
#else
#define HE0_0xd2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd3
#define HE0_0xd3 MAX_TRAP_CNT
#else
#define HE0_0xd3 0
#endif

#ifdef ENABLE_HT0_Window_Fill_5_Normal_0xd4
#define HE0_0xd4 MAX_TRAP_CNT
#else
#define HE0_0xd4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd5
#define HE0_0xd5 MAX_TRAP_CNT
#else
#define HE0_0xd5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd6
#define HE0_0xd6 MAX_TRAP_CNT
#else
#define HE0_0xd6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd7
#define HE0_0xd7 MAX_TRAP_CNT
#else
#define HE0_0xd7 0
#endif

#ifdef ENABLE_HT0_Window_Fill_6_Normal_0xd8
#define HE0_0xd8 MAX_TRAP_CNT
#else
#define HE0_0xd8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xd9
#define HE0_0xd9 MAX_TRAP_CNT
#else
#define HE0_0xd9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xda
#define HE0_0xda MAX_TRAP_CNT
#else
#define HE0_0xda 0
#endif

#ifdef ENABLE_HT0_Reserved_0xdb
#define HE0_0xdb MAX_TRAP_CNT
#else
#define HE0_0xdb 0
#endif

#ifdef ENABLE_HT0_Window_Fill_7_Normal_0xdc
#define HE0_0xdc MAX_TRAP_CNT
#else
#define HE0_0xdc 0
#endif

#ifdef ENABLE_HT0_Reserved_0xdd
#define HE0_0xdd MAX_TRAP_CNT
#else
#define HE0_0xdd 0
#endif

#ifdef ENABLE_HT0_Reserved_0xde
#define HE0_0xde MAX_TRAP_CNT
#else
#define HE0_0xde 0
#endif

#ifdef ENABLE_HT0_Reserved_0xdf
#define HE0_0xdf MAX_TRAP_CNT
#else
#define HE0_0xdf 0
#endif

#ifdef ENABLE_HT0_Window_Fill_0_Other_0xe0
#define HE0_0xe0 MAX_TRAP_CNT
#else
#define HE0_0xe0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe1
#define HE0_0xe1 MAX_TRAP_CNT
#else
#define HE0_0xe1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe2
#define HE0_0xe2 MAX_TRAP_CNT
#else
#define HE0_0xe2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe3
#define HE0_0xe3 MAX_TRAP_CNT
#else
#define HE0_0xe3 0
#endif

#ifdef ENABLE_HT0_Window_Fill_1_Other_0xe4
#define HE0_0xe4 MAX_TRAP_CNT
#else
#define HE0_0xe4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe5
#define HE0_0xe5 MAX_TRAP_CNT
#else
#define HE0_0xe5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe6
#define HE0_0xe6 MAX_TRAP_CNT
#else
#define HE0_0xe6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe7
#define HE0_0xe7 MAX_TRAP_CNT
#else
#define HE0_0xe7 0
#endif

#ifdef ENABLE_HT0_Window_Fill_2_Other_0xe8
#define HE0_0xe8 MAX_TRAP_CNT
#else
#define HE0_0xe8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xe9
#define HE0_0xe9 MAX_TRAP_CNT
#else
#define HE0_0xe9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xea
#define HE0_0xea MAX_TRAP_CNT
#else
#define HE0_0xea 0
#endif

#ifdef ENABLE_HT0_Reserved_0xeb
#define HE0_0xeb MAX_TRAP_CNT
#else
#define HE0_0xeb 0
#endif

#ifdef ENABLE_HT0_Window_Fill_3_Other_0xec
#define HE0_0xec MAX_TRAP_CNT
#else
#define HE0_0xec 0
#endif

#ifdef ENABLE_HT0_Reserved_0xed
#define HE0_0xed MAX_TRAP_CNT
#else
#define HE0_0xed 0
#endif

#ifdef ENABLE_HT0_Reserved_0xee
#define HE0_0xee MAX_TRAP_CNT
#else
#define HE0_0xee 0
#endif

#ifdef ENABLE_HT0_Reserved_0xef
#define HE0_0xef MAX_TRAP_CNT
#else
#define HE0_0xef 0
#endif

#ifdef ENABLE_HT0_Window_Fill_4_Other_0xf0
#define HE0_0xf0 MAX_TRAP_CNT
#else
#define HE0_0xf0 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf1
#define HE0_0xf1 MAX_TRAP_CNT
#else
#define HE0_0xf1 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf2
#define HE0_0xf2 MAX_TRAP_CNT
#else
#define HE0_0xf2 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf3
#define HE0_0xf3 MAX_TRAP_CNT
#else
#define HE0_0xf3 0
#endif

#ifdef ENABLE_HT0_Window_Fill_5_Other_0xf4
#define HE0_0xf4 MAX_TRAP_CNT
#else
#define HE0_0xf4 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf5
#define HE0_0xf5 MAX_TRAP_CNT
#else
#define HE0_0xf5 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf6
#define HE0_0xf6 MAX_TRAP_CNT
#else
#define HE0_0xf6 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf7
#define HE0_0xf7 MAX_TRAP_CNT
#else
#define HE0_0xf7 0
#endif

#ifdef ENABLE_HT0_Window_Fill_6_Other_0xf8
#define HE0_0xf8 MAX_TRAP_CNT
#else
#define HE0_0xf8 0
#endif

#ifdef ENABLE_HT0_Reserved_0xf9
#define HE0_0xf9 MAX_TRAP_CNT
#else
#define HE0_0xf9 0
#endif

#ifdef ENABLE_HT0_Reserved_0xfa
#define HE0_0xfa MAX_TRAP_CNT
#else
#define HE0_0xfa 0
#endif

#ifdef ENABLE_HT0_Reserved_0xfb
#define HE0_0xfb MAX_TRAP_CNT
#else
#define HE0_0xfb 0
#endif

#ifdef ENABLE_HT0_Window_Fill_7_Other_0xfc
#define HE0_0xfc MAX_TRAP_CNT
#else
#define HE0_0xfc 0
#endif

#ifdef ENABLE_HT0_Reserved_0xfd
#define HE0_0xfd MAX_TRAP_CNT
#else
#define HE0_0xfd 0
#endif

#ifdef ENABLE_HT0_Reserved_0xfe
#define HE0_0xfe MAX_TRAP_CNT
#else
#define HE0_0xfe 0
#endif

#ifdef ENABLE_HT0_Reserved_0xff
#define HE0_0xff MAX_TRAP_CNT
#else
#define HE0_0xff 0
#endif

#ifdef ENABLE_HT1_Reserved_0x00	
#define HE1_0x00 MAX_TRAP_CNT
#else
#define HE1_0x00 0
#endif

#ifdef ENABLE_HT1_Reserved_0x01		
#define HE1_0x01 MAX_TRAP_CNT
#else
#define HE1_0x01 0
#endif

#ifdef ENABLE_HT1_Reserved_0x02		
#define HE1_0x02 MAX_TRAP_CNT
#else
#define HE1_0x02 0
#endif

#ifdef ENABLE_HT1_Reserved_0x03		
#define HE1_0x03 MAX_TRAP_CNT
#else
#define HE1_0x03 0
#endif

#ifdef ENABLE_HT1_Reserved_0x04		
#define HE1_0x04 MAX_TRAP_CNT
#else
#define HE1_0x04 0
#endif

#ifdef ENABLE_HT1_Reserved_0x05		
#define HE1_0x05 MAX_TRAP_CNT
#else
#define HE1_0x05 0
#endif

#ifdef ENABLE_HT1_Reserved_0x06		
#define HE1_0x06 MAX_TRAP_CNT
#else
#define HE1_0x06 0
#endif

#ifdef ENABLE_HT1_Reserved_0x07		
#define HE1_0x07 MAX_TRAP_CNT
#else
#define HE1_0x07 0
#endif

#ifdef ENABLE_HT1_Reserved_0x08		
#define HE1_0x08 MAX_TRAP_CNT
#else
#define HE1_0x08 0
#endif

#ifdef ENABLE_HT1_Reserved_0x09		
#define HE1_0x09 MAX_TRAP_CNT
#else
#define HE1_0x09 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0a		
#define HE1_0x0a MAX_TRAP_CNT
#else
#define HE1_0x0a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0b		
#define HE1_0x0b MAX_TRAP_CNT
#else
#define HE1_0x0b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0c		
#define HE1_0x0c MAX_TRAP_CNT
#else
#define HE1_0x0c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0d		
#define HE1_0x0d MAX_TRAP_CNT
#else
#define HE1_0x0d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0e		
#define HE1_0x0e MAX_TRAP_CNT
#else
#define HE1_0x0e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x0f		
#define HE1_0x0f MAX_TRAP_CNT
#else
#define HE1_0x0f 0
#endif

#ifdef ENABLE_HT1_Illegal_instruction_0x10
#define HE1_0x10 MAX_TRAP_CNT
#else
#define HE1_0x10 0
#endif

#ifdef ENABLE_HT1_Reserved_0x11		
#define HE1_0x11 MAX_TRAP_CNT
#else
#define HE1_0x11 0
#endif

#ifdef ENABLE_HT1_Reserved_0x12		
#define HE1_0x12 MAX_TRAP_CNT
#else
#define HE1_0x12 0
#endif

#ifdef ENABLE_HT1_Reserved_0x13		
#define HE1_0x13 MAX_TRAP_CNT
#else
#define HE1_0x13 0
#endif

#ifdef ENABLE_HT1_Reserved_0x14		
#define HE1_0x14 MAX_TRAP_CNT
#else
#define HE1_0x14 0
#endif

#ifdef ENABLE_HT1_Reserved_0x15		
#define HE1_0x15 MAX_TRAP_CNT
#else
#define HE1_0x15 0
#endif

#ifdef ENABLE_HT1_Reserved_0x16		
#define HE1_0x16 MAX_TRAP_CNT
#else
#define HE1_0x16 0
#endif

#ifdef ENABLE_HT1_Reserved_0x17		
#define HE1_0x17 MAX_TRAP_CNT
#else
#define HE1_0x17 0
#endif

#ifdef ENABLE_HT1_Reserved_0x18		
#define HE1_0x18 MAX_TRAP_CNT
#else
#define HE1_0x18 0
#endif

#ifdef ENABLE_HT1_Reserved_0x19		
#define HE1_0x19 MAX_TRAP_CNT
#else
#define HE1_0x19 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1a		
#define HE1_0x1a MAX_TRAP_CNT
#else
#define HE1_0x1a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1b		
#define HE1_0x1b MAX_TRAP_CNT
#else
#define HE1_0x1b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1c		
#define HE1_0x1c MAX_TRAP_CNT
#else
#define HE1_0x1c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1d		
#define HE1_0x1d MAX_TRAP_CNT
#else
#define HE1_0x1d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1e		
#define HE1_0x1e MAX_TRAP_CNT
#else
#define HE1_0x1e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x1f		
#define HE1_0x1f MAX_TRAP_CNT
#else
#define HE1_0x1f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x20		
#define HE1_0x20 MAX_TRAP_CNT
#else
#define HE1_0x20 0
#endif

#ifdef ENABLE_HT1_Reserved_0x21		
#define HE1_0x21 MAX_TRAP_CNT
#else
#define HE1_0x21 0
#endif

#ifdef ENABLE_HT1_Reserved_0x22		
#define HE1_0x22 MAX_TRAP_CNT
#else
#define HE1_0x22 0
#endif

#ifdef ENABLE_HT1_Reserved_0x23		
#define HE1_0x23 MAX_TRAP_CNT
#else
#define HE1_0x23 0
#endif

#ifdef ENABLE_HT1_Reserved_0x24		
#define HE1_0x24 MAX_TRAP_CNT
#else
#define HE1_0x24 0
#endif

#ifdef ENABLE_HT1_Reserved_0x25		
#define HE1_0x25 MAX_TRAP_CNT
#else
#define HE1_0x25 0
#endif

#ifdef ENABLE_HT1_Reserved_0x26		
#define HE1_0x26 MAX_TRAP_CNT
#else
#define HE1_0x26 0
#endif

#ifdef ENABLE_HT1_Reserved_0x27		
#define HE1_0x27 MAX_TRAP_CNT
#else
#define HE1_0x27 0
#endif

#ifdef ENABLE_HT1_Reserved_0x28		
#define HE1_0x28 MAX_TRAP_CNT
#else
#define HE1_0x28 0
#endif

#ifdef ENABLE_HT1_Reserved_0x29		
#define HE1_0x29 MAX_TRAP_CNT
#else
#define HE1_0x29 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2a		
#define HE1_0x2a MAX_TRAP_CNT
#else
#define HE1_0x2a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2b		
#define HE1_0x2b MAX_TRAP_CNT
#else
#define HE1_0x2b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2c		
#define HE1_0x2c MAX_TRAP_CNT
#else
#define HE1_0x2c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2d		
#define HE1_0x2d MAX_TRAP_CNT
#else
#define HE1_0x2d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2e		
#define HE1_0x2e MAX_TRAP_CNT
#else
#define HE1_0x2e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x2f		
#define HE1_0x2f MAX_TRAP_CNT
#else
#define HE1_0x2f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x30		
#define HE1_0x30 MAX_TRAP_CNT
#else
#define HE1_0x30 0
#endif

#ifdef ENABLE_HT1_Reserved_0x31		
#define HE1_0x31 MAX_TRAP_CNT
#else
#define HE1_0x31 0
#endif

#ifdef ENABLE_HT1_Reserved_0x32		
#define HE1_0x32 MAX_TRAP_CNT
#else
#define HE1_0x32 0
#endif

#ifdef ENABLE_HT1_Reserved_0x33		
#define HE1_0x33 MAX_TRAP_CNT
#else
#define HE1_0x33 0
#endif

#ifdef ENABLE_HT1_Reserved_0x34		
#define HE1_0x34 MAX_TRAP_CNT
#else
#define HE1_0x34 0
#endif

#ifdef ENABLE_HT1_Reserved_0x35		
#define HE1_0x35 MAX_TRAP_CNT
#else
#define HE1_0x35 0
#endif

#ifdef ENABLE_HT1_Reserved_0x36		
#define HE1_0x36 MAX_TRAP_CNT
#else
#define HE1_0x36 0
#endif

#ifdef ENABLE_HT1_Reserved_0x37		
#define HE1_0x37 MAX_TRAP_CNT
#else
#define HE1_0x37 0
#endif

#ifdef ENABLE_HT1_Reserved_0x38		
#define HE1_0x38 MAX_TRAP_CNT
#else
#define HE1_0x38 0
#endif

#ifdef ENABLE_HT1_Reserved_0x39		
#define HE1_0x39 MAX_TRAP_CNT
#else
#define HE1_0x39 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3a		
#define HE1_0x3a MAX_TRAP_CNT
#else
#define HE1_0x3a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3b		
#define HE1_0x3b MAX_TRAP_CNT
#else
#define HE1_0x3b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3c		
#define HE1_0x3c MAX_TRAP_CNT
#else
#define HE1_0x3c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3d		
#define HE1_0x3d MAX_TRAP_CNT
#else
#define HE1_0x3d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3e		
#define HE1_0x3e MAX_TRAP_CNT
#else
#define HE1_0x3e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x3f		
#define HE1_0x3f MAX_TRAP_CNT
#else
#define HE1_0x3f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x40		
#define HE1_0x40 MAX_TRAP_CNT
#else
#define HE1_0x40 0
#endif

#ifdef ENABLE_HT1_Reserved_0x41		
#define HE1_0x41 MAX_TRAP_CNT
#else
#define HE1_0x41 0
#endif

#ifdef ENABLE_HT1_Reserved_0x42		
#define HE1_0x42 MAX_TRAP_CNT
#else
#define HE1_0x42 0
#endif

#ifdef ENABLE_HT1_Reserved_0x43		
#define HE1_0x43 MAX_TRAP_CNT
#else
#define HE1_0x43 0
#endif

#ifdef ENABLE_HT1_Reserved_0x44		
#define HE1_0x44 MAX_TRAP_CNT
#else
#define HE1_0x44 0
#endif

#ifdef ENABLE_HT1_Reserved_0x45		
#define HE1_0x45 MAX_TRAP_CNT
#else
#define HE1_0x45 0
#endif

#ifdef ENABLE_HT1_Reserved_0x46		
#define HE1_0x46 MAX_TRAP_CNT
#else
#define HE1_0x46 0
#endif

#ifdef ENABLE_HT1_Reserved_0x47		
#define HE1_0x47 MAX_TRAP_CNT
#else
#define HE1_0x47 0
#endif

#ifdef ENABLE_HT1_Reserved_0x48		
#define HE1_0x48 MAX_TRAP_CNT
#else
#define HE1_0x48 0
#endif

#ifdef ENABLE_HT1_Reserved_0x49		
#define HE1_0x49 MAX_TRAP_CNT
#else
#define HE1_0x49 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4a		
#define HE1_0x4a MAX_TRAP_CNT
#else
#define HE1_0x4a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4b		
#define HE1_0x4b MAX_TRAP_CNT
#else
#define HE1_0x4b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4c		
#define HE1_0x4c MAX_TRAP_CNT
#else
#define HE1_0x4c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4d		
#define HE1_0x4d MAX_TRAP_CNT
#else
#define HE1_0x4d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4e		
#define HE1_0x4e MAX_TRAP_CNT
#else
#define HE1_0x4e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x4f		
#define HE1_0x4f MAX_TRAP_CNT
#else
#define HE1_0x4f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x50		
#define HE1_0x50 MAX_TRAP_CNT
#else
#define HE1_0x50 0
#endif

#ifdef ENABLE_HT1_Reserved_0x51		
#define HE1_0x51 MAX_TRAP_CNT
#else
#define HE1_0x51 0
#endif

#ifdef ENABLE_HT1_Reserved_0x52		
#define HE1_0x52 MAX_TRAP_CNT
#else
#define HE1_0x52 0
#endif

#ifdef ENABLE_HT1_Reserved_0x53		
#define HE1_0x53 MAX_TRAP_CNT
#else
#define HE1_0x53 0
#endif

#ifdef ENABLE_HT1_Reserved_0x54		
#define HE1_0x54 MAX_TRAP_CNT
#else
#define HE1_0x54 0
#endif

#ifdef ENABLE_HT1_Reserved_0x55		
#define HE1_0x55 MAX_TRAP_CNT
#else
#define HE1_0x55 0
#endif

#ifdef ENABLE_HT1_Reserved_0x56		
#define HE1_0x56 MAX_TRAP_CNT
#else
#define HE1_0x56 0
#endif

#ifdef ENABLE_HT1_Reserved_0x57		
#define HE1_0x57 MAX_TRAP_CNT
#else
#define HE1_0x57 0
#endif

#ifdef ENABLE_HT1_Reserved_0x58		
#define HE1_0x58 MAX_TRAP_CNT
#else
#define HE1_0x58 0
#endif

#ifdef ENABLE_HT1_Reserved_0x59		
#define HE1_0x59 MAX_TRAP_CNT
#else
#define HE1_0x59 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5a		
#define HE1_0x5a MAX_TRAP_CNT
#else
#define HE1_0x5a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5b		
#define HE1_0x5b MAX_TRAP_CNT
#else
#define HE1_0x5b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5c		
#define HE1_0x5c MAX_TRAP_CNT
#else
#define HE1_0x5c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5d		
#define HE1_0x5d MAX_TRAP_CNT
#else
#define HE1_0x5d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5e		
#define HE1_0x5e MAX_TRAP_CNT
#else
#define HE1_0x5e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x5f		
#define HE1_0x5f MAX_TRAP_CNT
#else
#define HE1_0x5f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x60		
#define HE1_0x60 MAX_TRAP_CNT
#else
#define HE1_0x60 0
#endif

#ifdef ENABLE_HT1_Reserved_0x61		
#define HE1_0x61 MAX_TRAP_CNT
#else
#define HE1_0x61 0
#endif

#ifdef ENABLE_HT1_Reserved_0x62		
#define HE1_0x62 MAX_TRAP_CNT
#else
#define HE1_0x62 0
#endif

#ifdef ENABLE_HT1_Reserved_0x63		
#define HE1_0x63 MAX_TRAP_CNT
#else
#define HE1_0x63 0
#endif

#ifdef ENABLE_HT1_fast_instr_access_MMU_miss_0x64
#define HE1_0x64 MAX_TRAP_CNT
#else
#define HE1_0x64 0
#endif

#ifdef ENABLE_HT1_Reserved_0x65
#define HE1_0x65 MAX_TRAP_CNT
#else
#define HE1_0x65 0
#endif

#ifdef ENABLE_HT1_Reserved_0x66
#define HE1_0x66 MAX_TRAP_CNT
#else
#define HE1_0x66 0
#endif

#ifdef ENABLE_HT1_Reserved_0x67
#define HE1_0x67 MAX_TRAP_CNT
#else
#define HE1_0x67 0
#endif

#ifdef ENABLE_HT1_fast_data_access_MMU_miss_0x68
#define HE1_0x68 MAX_TRAP_CNT
#else
#define HE1_0x68 0
#endif

#ifdef ENABLE_HT1_Reserved_0x69
#define HE1_0x69 MAX_TRAP_CNT
#else
#define HE1_0x69 0
#endif

#ifdef ENABLE_HT1_Reserved_0x6a
#define HE1_0x6a MAX_TRAP_CNT
#else
#define HE1_0x6a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x6b
#define HE1_0x6b MAX_TRAP_CNT
#else
#define HE1_0x6b 0
#endif

#ifdef ENABLE_HT1_data_access_protection_0x6c		
#define HE1_0x6c MAX_TRAP_CNT
#else
#define HE1_0x6c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x6d		
#define HE1_0x6d MAX_TRAP_CNT
#else
#define HE1_0x6d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x6e		
#define HE1_0x6e MAX_TRAP_CNT
#else
#define HE1_0x6e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x6f		
#define HE1_0x6f MAX_TRAP_CNT
#else
#define HE1_0x6f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x70		
#define HE1_0x70 MAX_TRAP_CNT
#else
#define HE1_0x70 0
#endif

#ifdef ENABLE_HT1_Reserved_0x71		
#define HE1_0x71 MAX_TRAP_CNT
#else
#define HE1_0x71 0
#endif

#ifdef ENABLE_HT1_Reserved_0x72		
#define HE1_0x72 MAX_TRAP_CNT
#else
#define HE1_0x72 0
#endif

#ifdef ENABLE_HT1_Reserved_0x73		
#define HE1_0x73 MAX_TRAP_CNT
#else
#define HE1_0x73 0
#endif

#ifdef ENABLE_HT1_Reserved_0x74		
#define HE1_0x74 MAX_TRAP_CNT
#else
#define HE1_0x74 0
#endif

#ifdef ENABLE_HT1_Reserved_0x75		
#define HE1_0x75 MAX_TRAP_CNT
#else
#define HE1_0x75 0
#endif

#ifdef ENABLE_HT1_Reserved_0x76		
#define HE1_0x76 MAX_TRAP_CNT
#else
#define HE1_0x76 0
#endif

#ifdef ENABLE_HT1_Reserved_0x77		
#define HE1_0x77 MAX_TRAP_CNT
#else
#define HE1_0x77 0
#endif

#ifdef ENABLE_HT1_Reserved_0x78		
#define HE1_0x78 MAX_TRAP_CNT
#else
#define HE1_0x78 0
#endif

#ifdef ENABLE_HT1_Reserved_0x79		
#define HE1_0x79 MAX_TRAP_CNT
#else
#define HE1_0x79 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7a		
#define HE1_0x7a MAX_TRAP_CNT
#else
#define HE1_0x7a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7b		
#define HE1_0x7b MAX_TRAP_CNT
#else
#define HE1_0x7b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7c		
#define HE1_0x7c MAX_TRAP_CNT
#else
#define HE1_0x7c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7d		
#define HE1_0x7d MAX_TRAP_CNT
#else
#define HE1_0x7d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7e		
#define HE1_0x7e MAX_TRAP_CNT
#else
#define HE1_0x7e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x7f		
#define HE1_0x7f MAX_TRAP_CNT
#else
#define HE1_0x7f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x80		
#define HE1_0x80 MAX_TRAP_CNT
#else
#define HE1_0x80 0
#endif

#ifdef ENABLE_HT1_Reserved_0x81
#define HE1_0x81 MAX_TRAP_CNT
#else
#define HE1_0x81 0
#endif

#ifdef ENABLE_HT1_Reserved_0x82
#define HE1_0x82 MAX_TRAP_CNT
#else
#define HE1_0x82 0
#endif

#ifdef ENABLE_HT1_Reserved_0x83
#define HE1_0x83 MAX_TRAP_CNT
#else
#define HE1_0x83 0
#endif

#ifdef ENABLE_HT1_Reserved_0x84		
#define HE1_0x84 MAX_TRAP_CNT
#else
#define HE1_0x84 0
#endif

#ifdef ENABLE_HT1_Reserved_0x85
#define HE1_0x85 MAX_TRAP_CNT
#else
#define HE1_0x85 0
#endif

#ifdef ENABLE_HT1_Reserved_0x86
#define HE1_0x86 MAX_TRAP_CNT
#else
#define HE1_0x86 0
#endif

#ifdef ENABLE_HT1_Reserved_0x87
#define HE1_0x87 MAX_TRAP_CNT
#else
#define HE1_0x87 0
#endif

#ifdef ENABLE_HT1_Reserved_0x88		
#define HE1_0x88 MAX_TRAP_CNT
#else
#define HE1_0x88 0
#endif

#ifdef ENABLE_HT1_Reserved_0x89
#define HE1_0x89 MAX_TRAP_CNT
#else
#define HE1_0x89 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8a
#define HE1_0x8a MAX_TRAP_CNT
#else
#define HE1_0x8a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8b
#define HE1_0x8b MAX_TRAP_CNT
#else
#define HE1_0x8b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8c		
#define HE1_0x8c MAX_TRAP_CNT
#else
#define HE1_0x8c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8d
#define HE1_0x8d MAX_TRAP_CNT
#else
#define HE1_0x8d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8e
#define HE1_0x8e MAX_TRAP_CNT
#else
#define HE1_0x8e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x8f
#define HE1_0x8f MAX_TRAP_CNT
#else
#define HE1_0x8f 0
#endif

#ifdef ENABLE_HT1_Reserved_0x90		
#define HE1_0x90 MAX_TRAP_CNT
#else
#define HE1_0x90 0
#endif

#ifdef ENABLE_HT1_Reserved_0x91		
#define HE1_0x91 MAX_TRAP_CNT
#else
#define HE1_0x91 0
#endif

#ifdef ENABLE_HT1_Reserved_0x92		
#define HE1_0x92 MAX_TRAP_CNT
#else
#define HE1_0x92 0
#endif

#ifdef ENABLE_HT1_Reserved_0x93		
#define HE1_0x93 MAX_TRAP_CNT
#else
#define HE1_0x93 0
#endif

#ifdef ENABLE_HT1_Reserved_0x94		
#define HE1_0x94 MAX_TRAP_CNT
#else
#define HE1_0x94 0
#endif

#ifdef ENABLE_HT1_Reserved_0x95		
#define HE1_0x95 MAX_TRAP_CNT
#else
#define HE1_0x95 0
#endif

#ifdef ENABLE_HT1_Reserved_0x96		
#define HE1_0x96 MAX_TRAP_CNT
#else
#define HE1_0x96 0
#endif

#ifdef ENABLE_HT1_Reserved_0x97		
#define HE1_0x97 MAX_TRAP_CNT
#else
#define HE1_0x97 0
#endif

#ifdef ENABLE_HT1_Reserved_0x98		
#define HE1_0x98 MAX_TRAP_CNT
#else
#define HE1_0x98 0
#endif

#ifdef ENABLE_HT1_Reserved_0x99		
#define HE1_0x99 MAX_TRAP_CNT
#else
#define HE1_0x99 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9a		
#define HE1_0x9a MAX_TRAP_CNT
#else
#define HE1_0x9a 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9b		
#define HE1_0x9b MAX_TRAP_CNT
#else
#define HE1_0x9b 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9c		
#define HE1_0x9c MAX_TRAP_CNT
#else
#define HE1_0x9c 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9d		
#define HE1_0x9d MAX_TRAP_CNT
#else
#define HE1_0x9d 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9e		
#define HE1_0x9e MAX_TRAP_CNT
#else
#define HE1_0x9e 0
#endif

#ifdef ENABLE_HT1_Reserved_0x9f		
#define HE1_0x9f MAX_TRAP_CNT
#else
#define HE1_0x9f 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa0		
#define HE1_0xa0 MAX_TRAP_CNT
#else
#define HE1_0xa0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa1		
#define HE1_0xa1 MAX_TRAP_CNT
#else
#define HE1_0xa1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa2		
#define HE1_0xa2 MAX_TRAP_CNT
#else
#define HE1_0xa2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa3		
#define HE1_0xa3 MAX_TRAP_CNT
#else
#define HE1_0xa3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa4		
#define HE1_0xa4 MAX_TRAP_CNT
#else
#define HE1_0xa4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa5		
#define HE1_0xa5 MAX_TRAP_CNT
#else
#define HE1_0xa5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa6		
#define HE1_0xa6 MAX_TRAP_CNT
#else
#define HE1_0xa6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa7		
#define HE1_0xa7 MAX_TRAP_CNT
#else
#define HE1_0xa7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa8		
#define HE1_0xa8 MAX_TRAP_CNT
#else
#define HE1_0xa8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xa9		
#define HE1_0xa9 MAX_TRAP_CNT
#else
#define HE1_0xa9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xaa		
#define HE1_0xaa MAX_TRAP_CNT
#else
#define HE1_0xaa 0
#endif

#ifdef ENABLE_HT1_Reserved_0xab		
#define HE1_0xab MAX_TRAP_CNT
#else
#define HE1_0xab 0
#endif

#ifdef ENABLE_HT1_Reserved_0xac		
#define HE1_0xac MAX_TRAP_CNT
#else
#define HE1_0xac 0
#endif

#ifdef ENABLE_HT1_Reserved_0xad		
#define HE1_0xad MAX_TRAP_CNT
#else
#define HE1_0xad 0
#endif

#ifdef ENABLE_HT1_Reserved_0xae		
#define HE1_0xae MAX_TRAP_CNT
#else
#define HE1_0xae 0
#endif

#ifdef ENABLE_HT1_Reserved_0xaf		
#define HE1_0xaf MAX_TRAP_CNT
#else
#define HE1_0xaf 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb0		
#define HE1_0xb0 MAX_TRAP_CNT
#else
#define HE1_0xb0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb1		
#define HE1_0xb1 MAX_TRAP_CNT
#else
#define HE1_0xb1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb2		
#define HE1_0xb2 MAX_TRAP_CNT
#else
#define HE1_0xb2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb3		
#define HE1_0xb3 MAX_TRAP_CNT
#else
#define HE1_0xb3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb4		
#define HE1_0xb4 MAX_TRAP_CNT
#else
#define HE1_0xb4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb5		
#define HE1_0xb5 MAX_TRAP_CNT
#else
#define HE1_0xb5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb6		
#define HE1_0xb6 MAX_TRAP_CNT
#else
#define HE1_0xb6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb7		
#define HE1_0xb7 MAX_TRAP_CNT
#else
#define HE1_0xb7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb8		
#define HE1_0xb8 MAX_TRAP_CNT
#else
#define HE1_0xb8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xb9		
#define HE1_0xb9 MAX_TRAP_CNT
#else
#define HE1_0xb9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xba		
#define HE1_0xba MAX_TRAP_CNT
#else
#define HE1_0xba 0
#endif

#ifdef ENABLE_HT1_Reserved_0xbb		
#define HE1_0xbb MAX_TRAP_CNT
#else
#define HE1_0xbb 0
#endif

#ifdef ENABLE_HT1_Reserved_0xbc		
#define HE1_0xbc MAX_TRAP_CNT
#else
#define HE1_0xbc 0
#endif

#ifdef ENABLE_HT1_Reserved_0xbd		
#define HE1_0xbd MAX_TRAP_CNT
#else
#define HE1_0xbd 0
#endif

#ifdef ENABLE_HT1_Reserved_0xbe		
#define HE1_0xbe MAX_TRAP_CNT
#else
#define HE1_0xbe 0
#endif

#ifdef ENABLE_HT1_Reserved_0xbf		
#define HE1_0xbf MAX_TRAP_CNT
#else
#define HE1_0xbf 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc0		
#define HE1_0xc0 MAX_TRAP_CNT
#else
#define HE1_0xc0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc1		
#define HE1_0xc1 MAX_TRAP_CNT
#else
#define HE1_0xc1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc2		
#define HE1_0xc2 MAX_TRAP_CNT
#else
#define HE1_0xc2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc3		
#define HE1_0xc3 MAX_TRAP_CNT
#else
#define HE1_0xc3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc4		
#define HE1_0xc4 MAX_TRAP_CNT
#else
#define HE1_0xc4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc5		
#define HE1_0xc5 MAX_TRAP_CNT
#else
#define HE1_0xc5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc6		
#define HE1_0xc6 MAX_TRAP_CNT
#else
#define HE1_0xc6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc7		
#define HE1_0xc7 MAX_TRAP_CNT
#else
#define HE1_0xc7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc8		
#define HE1_0xc8 MAX_TRAP_CNT
#else
#define HE1_0xc8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xc9		
#define HE1_0xc9 MAX_TRAP_CNT
#else
#define HE1_0xc9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xca		
#define HE1_0xca MAX_TRAP_CNT
#else
#define HE1_0xca 0
#endif

#ifdef ENABLE_HT1_Reserved_0xcb		
#define HE1_0xcb MAX_TRAP_CNT
#else
#define HE1_0xcb 0
#endif

#ifdef ENABLE_HT1_Reserved_0xcc		
#define HE1_0xcc MAX_TRAP_CNT
#else
#define HE1_0xcc 0
#endif

#ifdef ENABLE_HT1_Reserved_0xcd		
#define HE1_0xcd MAX_TRAP_CNT
#else
#define HE1_0xcd 0
#endif

#ifdef ENABLE_HT1_Reserved_0xce		
#define HE1_0xce MAX_TRAP_CNT
#else
#define HE1_0xce 0
#endif

#ifdef ENABLE_HT1_Reserved_0xcf		
#define HE1_0xcf MAX_TRAP_CNT
#else
#define HE1_0xcf 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd0		
#define HE1_0xd0 MAX_TRAP_CNT
#else
#define HE1_0xd0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd1		
#define HE1_0xd1 MAX_TRAP_CNT
#else
#define HE1_0xd1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd2		
#define HE1_0xd2 MAX_TRAP_CNT
#else
#define HE1_0xd2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd3		
#define HE1_0xd3 MAX_TRAP_CNT
#else
#define HE1_0xd3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd4		
#define HE1_0xd4 MAX_TRAP_CNT
#else
#define HE1_0xd4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd5		
#define HE1_0xd5 MAX_TRAP_CNT
#else
#define HE1_0xd5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd6		
#define HE1_0xd6 MAX_TRAP_CNT
#else
#define HE1_0xd6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd7		
#define HE1_0xd7 MAX_TRAP_CNT
#else
#define HE1_0xd7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd8		
#define HE1_0xd8 MAX_TRAP_CNT
#else
#define HE1_0xd8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xd9		
#define HE1_0xd9 MAX_TRAP_CNT
#else
#define HE1_0xd9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xda		
#define HE1_0xda MAX_TRAP_CNT
#else
#define HE1_0xda 0
#endif

#ifdef ENABLE_HT1_Reserved_0xdb		
#define HE1_0xdb MAX_TRAP_CNT
#else
#define HE1_0xdb 0
#endif

#ifdef ENABLE_HT1_Reserved_0xdc		
#define HE1_0xdc MAX_TRAP_CNT
#else
#define HE1_0xdc 0
#endif

#ifdef ENABLE_HT1_Reserved_0xdd		
#define HE1_0xdd MAX_TRAP_CNT
#else
#define HE1_0xdd 0
#endif

#ifdef ENABLE_HT1_Reserved_0xde		
#define HE1_0xde MAX_TRAP_CNT
#else
#define HE1_0xde 0
#endif

#ifdef ENABLE_HT1_Reserved_0xdf		
#define HE1_0xdf MAX_TRAP_CNT
#else
#define HE1_0xdf 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe0		
#define HE1_0xe0 MAX_TRAP_CNT
#else
#define HE1_0xe0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe1		
#define HE1_0xe1 MAX_TRAP_CNT
#else
#define HE1_0xe1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe2		
#define HE1_0xe2 MAX_TRAP_CNT
#else
#define HE1_0xe2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe3		
#define HE1_0xe3 MAX_TRAP_CNT
#else
#define HE1_0xe3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe4		
#define HE1_0xe4 MAX_TRAP_CNT
#else
#define HE1_0xe4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe5		
#define HE1_0xe5 MAX_TRAP_CNT
#else
#define HE1_0xe5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe6		
#define HE1_0xe6 MAX_TRAP_CNT
#else
#define HE1_0xe6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe7		
#define HE1_0xe7 MAX_TRAP_CNT
#else
#define HE1_0xe7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe8		
#define HE1_0xe8 MAX_TRAP_CNT
#else
#define HE1_0xe8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xe9		
#define HE1_0xe9 MAX_TRAP_CNT
#else
#define HE1_0xe9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xea		
#define HE1_0xea MAX_TRAP_CNT
#else
#define HE1_0xea 0
#endif

#ifdef ENABLE_HT1_Reserved_0xeb		
#define HE1_0xeb MAX_TRAP_CNT
#else
#define HE1_0xeb 0
#endif

#ifdef ENABLE_HT1_Reserved_0xec		
#define HE1_0xec MAX_TRAP_CNT
#else
#define HE1_0xec 0
#endif

#ifdef ENABLE_HT1_Reserved_0xed		
#define HE1_0xed MAX_TRAP_CNT
#else
#define HE1_0xed 0
#endif

#ifdef ENABLE_HT1_Reserved_0xee		
#define HE1_0xee MAX_TRAP_CNT
#else
#define HE1_0xee 0
#endif

#ifdef ENABLE_HT1_Reserved_0xef		
#define HE1_0xef MAX_TRAP_CNT
#else
#define HE1_0xef 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf0		
#define HE1_0xf0 MAX_TRAP_CNT
#else
#define HE1_0xf0 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf1		
#define HE1_0xf1 MAX_TRAP_CNT
#else
#define HE1_0xf1 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf2		
#define HE1_0xf2 MAX_TRAP_CNT
#else
#define HE1_0xf2 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf3		
#define HE1_0xf3 MAX_TRAP_CNT
#else
#define HE1_0xf3 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf4		
#define HE1_0xf4 MAX_TRAP_CNT
#else
#define HE1_0xf4 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf5		
#define HE1_0xf5 MAX_TRAP_CNT
#else
#define HE1_0xf5 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf6		
#define HE1_0xf6 MAX_TRAP_CNT
#else
#define HE1_0xf6 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf7		
#define HE1_0xf7 MAX_TRAP_CNT
#else
#define HE1_0xf7 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf8		
#define HE1_0xf8 MAX_TRAP_CNT
#else
#define HE1_0xf8 0
#endif

#ifdef ENABLE_HT1_Reserved_0xf9		
#define HE1_0xf9 MAX_TRAP_CNT
#else
#define HE1_0xf9 0
#endif

#ifdef ENABLE_HT1_Reserved_0xfa		
#define HE1_0xfa MAX_TRAP_CNT
#else
#define HE1_0xfa 0
#endif

#ifdef ENABLE_HT1_Reserved_0xfb		
#define HE1_0xfb MAX_TRAP_CNT
#else
#define HE1_0xfb 0
#endif

#ifdef ENABLE_HT1_Reserved_0xfc		
#define HE1_0xfc MAX_TRAP_CNT
#else
#define HE1_0xfc 0
#endif

#ifdef ENABLE_HT1_Reserved_0xfd		
#define HE1_0xfd MAX_TRAP_CNT
#else
#define HE1_0xfd 0
#endif

#ifdef ENABLE_HT1_Reserved_0xfe		
#define HE1_0xfe MAX_TRAP_CNT
#else
#define HE1_0xfe 0
#endif

#ifdef ENABLE_HT1_Reserved_0xff		
#define HE1_0xff MAX_TRAP_CNT
#else
#define HE1_0xff 0
#endif




#endif /* __DEFINES_H__ */
