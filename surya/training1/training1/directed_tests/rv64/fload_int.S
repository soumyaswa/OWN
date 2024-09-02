# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data
  la x5, inp_data 
la x21, inp_data1 
 # la f4, inp_data
flw_test:
  li x12, 8 
  li x13, 20
  li x14, 28
 # add x11, x12, x13
  lh x7, 20(x21)
  lh x7, 20(x21)
  lh x7, 26(x21)
  lh x7, 10(x21)
  lh x7, 30(x21)
  lw x7, 20(x21)
  lb x6, 11(x21)
  lb x6, 12(x21)
  lb x6, 13(x21)
  lb x6, 14(x21)
  lb x6, 15(x21)

  li x6, 20
  li x7, 30
  li x9, 50
  flw f8, 0(x5)
  flw f9, 4(x5)
  flw f10, 8(x5)
  flw f11, 12(x5)
  fld f12, 16(x5)
  fld f13, 24(x5)
  fld f14, 32(x5)
  fsw f15, 8(x5)
  fsw f16, 8(x5)
  fsw f17, 20(x5)
  fsw f18, 24(x5)
  fsw f19, 24(x5)
  fsd f19, 32(x5)
  fsd f19, 40(x5)
  fsd f19, 48(x5)
  fsd f19, 56(x5)
  fld f11, 24(x5)
    #add x10, x7, x6
  #beq x10, x9, flw_test
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

inp_data1:
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

inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5

RVTEST_DATA_END









