# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data

#Test case for fadd.d:
test_case_1:
  fld f2, (x1)
  fld f3, 0x8(x1)
  fadd.d f7, f2, f3
  
test_case_2:
  fld f4, 0x10(x1)
  fld f5, 0x18(x1)
  fadd.d f6, f4, f5

#Test case for fsub.d:
test_case_3:
  fld f2, (x1)
  fld f3, 0x8(x1)
  fsub.d f8, f3, f2

test_case_4:
  fld f4, 0x10(x1)
  fld f5, 0x18(x1)
  fsub.d f9, f5, f4

#Test case for fmul.d:

fmul_d:
test_case_5:
  fld f2, (x1)
  fld f3, 0x8(x1)
  fmul.d f10, f2, f3
  
test_case_6:
  fld f4, 0x10(x1)
  fld f5, 0x18(x1)
  fmul.d f11, f4, f5
  
#Test case for fdiv.d:
fdiv_d:
test_case_7:
  fld f2, (x1)
  fld f3, 0x8(x1)
  fdiv.d f12, f3, f2
  
test_case_8:
  fld f4, 0x10(x1)
  fld f5, 0x18(x1)
  fdiv.d f13, f5, f4

#Test case for fmin.d and fmax.d:
fmin_d:
test_case_9:
  fld f2, (x1)
  fld f3, 0x8(x1)
  fmin.d f14, f2, f3

fmax_d:  
test_case_10:
  fld f4, 0x10(x1)
  fld f5, 0x18(x1)
  fmax.d f15, f4, f5
  
fsqrt_d:
test_case_11:
  fld f3, 0x8(x1)
  fsqrt.d f16, f3
  
test_case_12:
  fld f5, 0x10(x1)
  fsqrt.d f17, f5


TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .double 12.25
  .double 45.75
  .double 999.9
  .double 1000.1
  .double 102.25
  .double 75.75
  .double 855.9
  .double 1010.1

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

