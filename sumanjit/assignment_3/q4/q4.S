//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 4 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Mix loads / stores with interleaved Floating point DIV instructions 
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


q6_test:
  la x5, inp_data

    # Load floating-point constants into registers
    flw f0, 0(x5)    # Load 3.14 into f0 from the address in a0
    flw f1, 4(x5)    # Load 1.21 into f1 from the address in a0
    li x6,0x12345678
    li x7,0x5A2B3C4D
   
    #Load Store Instruction with Floating Div Instruction Interleaved
    lw x10,16(x5)
    lw x11,0(x5)

    fdiv.s f13, f0, f1    # f13 = f0 / f1 (division)

    sw x6,16(x5)
    sw x7,0(x5)
    fdiv.s f13, f0, f1    # f13 = f0 / f1 (division)
    lw x12,16(x5)
    lw x13,0(x5)

    flw f0, 0(x5)    # Load new updated value into f0 from the address in a0
    flw f1, 4(x5)    # Load new updated value into f1 from the address in a0

    fdiv.s f13, f0, f1    # f13 = f0 / f1 (division)
    lh x14,14(x5)
    lw x14,12(x5)
 

	  
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .float 3.14
  .float 1.21
  .float 3.14
  .float 1.21
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
   
RVTEST_DATA_END





