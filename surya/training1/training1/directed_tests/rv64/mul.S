# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data
  la x5, inp_data 
  la x4, inp_double
mul_test:
  
  lw x6, 8(x5)
  lw x7, 4(x5)
  ld x8, 16(x4)
  ld x9, 24(x4)
  

  mul x11, x6, x7
  mulh x12, x6, x7
  mulhsu x13, x6, x7
  mulhu x14, x6, x7
  mulw x15, x8, x9   
    #add x10, x7, x6
  #beq x10, x9, flw_test
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

inp_double:
  .word 0x06627912584944fc
  .word 0x584944fc558f5366
  .word 0x584944fc29df2fb1
  .word 0x558f536629df2fb1
  .word 0x558f53662584944c
  .word 0x29df2fb12584944c
  .word 0x29df2fb1584944fc
 

RVTEST_DATA_END












