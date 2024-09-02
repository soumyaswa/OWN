# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

li gp,3
# store regs 10 to 14
# load regs 15 to 19

init:             
                  li x0, 0xa
                  li x1, 0x00000080
                  li x2, 0x80000000
                  li x3, 0x6
                  li x4, 0x79928114
                  li x5, 0xf0db3ad4
                  li x6, 0x3c19ad25
                  li x7, 0x0
                  li x8, 0xe4645e4
                  li x9, 0x0
                  li x10, 0x0
                  li x11, 0xfb44fda2
                  li x12, 0x0
                  li x15, 0xd
                  li x16, 0xa
                  li x17, 0xfb20bb2e
                  li x18, 0x80000000
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x21, 0xa
                  li x22, 0x78531537
                  li x23, 0x80000000
                  li x24, 0xb80da14d
                  li x25, 0xf2a018dc
                  li x26, 0x0
                  li x27, 0x258c0b05
                  li x28, 0x6
                  li x29, 0xf6ba25b1
                  li x30, 0xd
                  li x31, 0xf

main:             la t4 , inp_data
		  la t3 , ld_inp_data
		  c.addi       a7, -1
                  c.mv         s6, a3
                  li           s9, 0x0fffffff 
                  li           t0, 0x21aa9bba
                  li           a0, 0x707e429f
                  li           s7, 0x0
                  li           s1, 0x000000ff
                  li           t5, 0x7fffffff
                  li           tp, 0x0
                  li           t6, 0x45098046
          	  li           s2, 0x70000000

load_section:
                  lhu          t2, 18(t3)	
                  lb           s7, 3(t3)
                  lb           s6, 4(t3)
                  lb           s7, 7(t3)
                  lb           s7, 3(t3)
                  lh           tp, 6(t3)
		  lw	       a2, 0(t3) 
		  lw	       a2, 0(t3) 
		  lw	       a2, 0(t3) 
		  lw	       a2, 8(t3) 
		  lw	       a3, 4(t3) 
		  lw	       a4, 8(t3) 
		  ld	       t1, 12(t3) 
		  ld	       t2, 16(t3) 


mixed_ld_st:				
		  sb           s4, 5(t4)
                  lb           s7, 0(t4)	//sb
                  sb           s4, 2(t4)

                  add          s2, t1, gp	//sh
                  sh           s2, 4(t4)

                  mulhsu       a6, s1, ra	//sw
                  sw           a6, 12(t4)

                  slt          s1, a6, tp	//sd
                  sd           s1, 20(t4)
		  
   TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


ld_inp_data:
  .word 0x22221111
  .word 0x12124444
  .word 0x29995555
  .word 0x01016666
  .word 0x19197777
  .word 0x28288888
  .word 0x20209999
  .word 0x27274545
  
inp_data:
  .word 0x06827912
  .word 0x07627911
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74

RVTEST_DATA_END







