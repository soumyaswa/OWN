# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data
  la x5, inp_data 
  la x4, inp_data
fp_compute_test_s:
  flw f6, 4(x4)
  flw f7, 8(x4)
  flw f8, 12(x4)
  flw f9, 16(x4)
  fadd.s f10, f6, f7
  fadd.s f10, f6, f7
  fsub.s f11, f7, f6
  fsub.s f11, f7, f6
  fmul.s f12, f6, f7
  fmul.s f12, f6, f7
  fdiv.s f13, f6, f8
  fdiv.s f13, f6, f8
  fsqrt.s f14, f9
  fmin.s f15, f6, f7
  fmin.s f15, f6, f7
  fmax.s f16, f6, f7 
  fmax.s f16, f6, f7 
  fadd.s f10, f6, f7
  fadd.s f10, f6, f7
  fsub.s f10, f7, f6
  fsub.s f10, f7, f6
  fmul.s f10, f6, f7
  fmul.s f10, f6, f7
  fdiv.s f10, f6, f8
  fdiv.s f10, f6, f8
  fsqrt.s f10, f9
  fsqrt.s f10, f9
  fmin.s f10, f6, f7
  fmin.s f10, f6, f7
  fmax.s f10, f6, f7 
  fmax.s f10, f6, f7 
//Double precision
  la x5, inp_data_d 
  la x4, inp_data_d

  fld f6, (x4)
  fld f7, 8(x4)
  fld f8, 16(x4)
  fld f9, 24(x4)
  fadd.d f10, f6, f7
  fadd.d f10, f6, f7
  fsub.d f11, f7, f6
  fsub.d f11, f7, f6
  fmul.d f12, f6, f7
  fmul.d f12, f6, f7
  fdiv.d f13, f6, f8
  fdiv.d f13, f6, f8
  fsqrt.d f14, f9
  fmin.d f15, f6, f7
  fmin.d f15, f6, f7
  fmax.d f16, f6, f7 
  fmax.d f16, f6, f7 
  fadd.d f10, f6, f7
  fadd.d f10, f6, f7
  fsub.d f10, f7, f6
  fsub.d f10, f7, f6
  fmul.d f10, f6, f7
  fmul.d f10, f6, f7
  fdiv.d f10, f6, f8
  fdiv.d f10, f6, f8
  fsqrt.d f10, f9
  fsqrt.d f10, f9
  fmin.d f10, f6, f7
  fmin.d f10, f6, f7
  fmax.d f10, f6, f7 
  fmax.d f10, f6, f7 

#add x10, x7, x6

  #beq x10, x9, flw_test
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data_d:
  .double 0x5976484566279124
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










