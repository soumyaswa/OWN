# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data

  lw x4, 8(x1)
  addi x4, x4, 1

instr: 
  # multiply operation
  li x6, 8000
  sub x7, x6, x4

  beqz x4, end
  j instr

end:

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
RVTEST_DATA_END

