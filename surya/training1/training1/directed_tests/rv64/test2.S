# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
 # li x1, 20

  la x1, inp_data
  #li x12, 8
  #li x13, 20
  #li x14, 28
  lw x4, 4(x1)
  #lw x16, 4(x5)
 # add x20, x15, x16
#instr_test2:
 # add x11, x12, x13
  #beq x11, x14, GO
  #bne x0, x1, instr_test2
#GO: lb x18, 16(x5)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0xdeadbeaf
  .word 0x11223344
RVTEST_DATA_END
 

