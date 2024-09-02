# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x2, inp_double
  
  lw x4, 4(x1)
  lw x5, 8(x1)
  ld x6, 16(x2)
  ld x7, 8(x2)
auto_single: 
  amoswap.w x11, x5, (x1)
  amoadd.w  x12, x5, (x1)
  amoand.w  x13, x5, (x1)
  amoor.w   x14, x5, (x1)
  amoxor.w  x16, x5, (x1)
  amomaxu.w x17, x5, (x1)
  amominu.w x18, x5, (x1)
  
auto_double:
  amoswap.d x19, x6, (x2)
  amoadd.d  x20, x6, (x2)
  amoand.d  x21, x6, (x2)
  amoor.d   x22, x6, (x2)
  amoxor.d  x23, x6, (x2)
  amomaxu.d x24, x6, (x2)
  amominu.d x25, x6, (x2)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
  .word 6
  .word 7
inp_double:
  .double 40
  .double 50
  .double 60
RVTEST_DATA_END

