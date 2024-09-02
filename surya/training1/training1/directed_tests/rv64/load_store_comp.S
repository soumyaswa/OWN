# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x2, inp_data
  la x4, inp_float
 
load_compressed:
  lw x11, (x1)
  ld x12, (x1)
  flw f13, (x1)
  fld f14, (x1)

store_compressed:
  c.sw x15, (x1)
  c.sd x16, (x1)
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


