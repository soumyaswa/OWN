# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x2, inp_double
  la x4, inp_float
csr_instr:  
  la x5, 10
  lw x6, 8(x1)
 # Write 10 to mymcsr
li a0, 10          # Load immediate value 10 into register a0
csrw 0x300, a0     # Write the value in a0 to the CSR register 0x300 MSTATUS

# Read the value from MSTATUS
csrr a1, 0x300 

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
  .dword 50
  .dword 60
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
RVTEST_DATA_END




