# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data
  la x5, inp_data 
 # la f4, inp_data
div_test:
  
  lw x6, 8(x5)
  lw x7, 16(x5)
  
  ld x8, 24(x5)
  ld x9, 32(x5)
  
  li x20, 0x0
  li x25, 0xf47d592f
  li x10, 0x0
  li x5, 0x9c52894e

  remuw x18, x5, x10  # x18=s2,x5=t0=0x9c52894e,x10=a0=0
  sub x12, x7, x6
  divuw x9, x5 ,x10   # x9=s1,x5=t0=0x9c52894e,x10=a0=0
  mul x13, x7, x6
  sll x14, x7, x6
  divw x15, x25, x20  # x15=a5, x25=s9=0xf47d592f,x20=s4=0
  xor x16, x9, x8
  remw x17, x25, x20  # x17=a7, x25=s9=0xf47d592f,x20=s4=0
  add x10, x7, x6
  
  
  
 # beq x10, x9 , 
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
