# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN
  li gp,3
  li x4, 20
  li x5, 10
  li x6, 5
  li x7, 6
 
  /*lw x8, 0(x4)
  lw x9, 0(x5)
  lw x10, 0(x6)*/
 
instr:
#RAW hazards
add x11, x4, x5
add x12, x11, x6
sub x13, x6, x7

#WAR
/*add x11, x4, x5
add x4, x5, x6
add x12, x4, x5*/

#WAW
/* add x11, x6, x5
 sub x11, x5, x6*/

/*control
  and x13, x4, x5
  and x14, x4, x5
  beq x13, x14, .new
  add x15, x6, x7
  .new:
  add x16, x5, x4*/

#structural
/* add x16, x9, x8
sub x17, x8, x9*/
 


 
 
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x06627912
  .word 0x06627912
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
