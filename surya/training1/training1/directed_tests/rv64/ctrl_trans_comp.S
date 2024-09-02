# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x2, inp_double
  la x4, inp_float
 
  lw x5, (x1)
  lw x6, (x1)
ctrl_tranfer:
  beqz x6, end

  bnez x6, jal_comp


jal_comp:
  j end
  jal x5, end
end:
  
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



