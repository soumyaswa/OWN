//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 6 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Continuos Loads/stores interleaved a non-load/non-store instruction (env will accept 8 instructions per cycle: 4 Loads/stores & 4 non-load/non-store instructions) 
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


q9_test:
  la x5, inp_data

   
    lw x10,4(x5)           //LOAD-STORE
    addi x11,x10,0x0245    //NON-LOAD/NON-STORE
    sw x11,4(x5)           //LOAD-STORE
    andi x12,x11,0x0011    //NON-LOAD/NON-STORE
    sw x12,8(x5)           //LOAD-STORE
    ori x13,x13,0x0212     //NON-LOAD/NON-STORE
    lw x14,4(x5)           //LOAD-STORE
    slti x15,x14,1000      //NON-LOAD/NON-STORE // 8 instruction

    lh x16,8(x5)           //LOAD-STORE
    add x17,x16,x16        //NON-LOAD/NON-STORE
	  
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























