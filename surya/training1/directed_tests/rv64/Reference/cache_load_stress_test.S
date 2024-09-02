# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  la x5, inp_data
  la x6, inp_data
  la x7, inp_float
 
load_compressed:
  lb x11, (x5)
  lh x12, 0x2(x5)
  lw x13, 0x4(x5)
  lw x14, (x5)
  lw x15, (x5)
  lw x16, (x5)
  lw x17, (x5)
  lw x18, (x5)
  lw x19, (x5)
  lw x20, (x5)
  ld x21, (x5)
  flw f13, (x5)
  fld f14, (x5)

store_compressed:
  c.sw x15, (x5)
  c.sd x16, (x5)
  c.fsw f17, (x4)
  c.fld f18, (x4)
  c.lwsp x11, 8(x2) 
  
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
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
RVTEST_DATA_END


