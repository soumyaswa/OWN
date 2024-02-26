//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 5 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Mix loads / stores with interleaved other random instruction 
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


q6_test:
  la x5, inp_data

  lw x10,4(x5)          //LOAD
  li x12,0x3c4d         //LOAD
  sw x12,4(x5)          //STORE
  addi x11,x11,0x0245   //NON
  andi x13,x12,0x0011   //NON
  lw x14,4(x5)          //LOAD
  add x15,x14,x13       //NON
  lh x16,12(x5)         //LOAD


  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
   
RVTEST_DATA_END





