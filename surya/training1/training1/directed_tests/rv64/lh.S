# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


lh_test:
  # Addresses for test data
  la x5, inp_data 
  li x12, 8 
  li x13, 20
  li x14, 28
 # add x11, x12, x13
  lh x7, 20(x5)
  lh x7, 20(x5)
  lh x7, 26(x5)
  lh x7, 10(x5)
  lh x7, 30(x5)
  lw x7, 20(x5)
  lb x6, 11(x5)
  lb x6, 12(x5)
  lb x6, 13(x5)
  lb x6, 14(x5)
  lb x6, 15(x5)
  #add x7, x5, x6
  #jal x0, GO  	

  add x11, x12, x13
  beq x11, x14, GO
  bne x0, x1, lh_test
GO: lb x16, 16(x5)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x11223344 #0
  .word 0x22334455 #4
  .word 0x99887766 #8
  .word 0x55443322 #12
  .word 0x44556611 #16
  .word 0x12345678 #20
  .word 0x98765432 #24
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








