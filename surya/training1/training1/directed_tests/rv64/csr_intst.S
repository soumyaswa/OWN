# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64S
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x2, inp_double
  la x4, inp_float
csr_instr:  
  la x5, 10
  lw x6, 8(x1)
  csrrw x0, sscratch, x5
  csrrs x11, sstatus, x0
  csrrc x12, sie, x0
  csrrwi x0, sip, 20
  csrrsi, x14, scause, 20
  csrrci, x15, stvec, 30 
  #csrrs x12, x5
  #csrrc x13, x5
  #csrrwi x14, 
  

  
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
  .dword 40
  .dword 50
  .dword 60
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
RVTEST_DATA_END




