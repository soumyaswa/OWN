//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 4
//    question no : 1 
//    Born-on Date: 26-2-2024
//**********************************************************************
//    Description: Floating point DIV instructions with rounding mode using FCSR register
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


R_Mode_Test:
    la x5, inp_data

    li x7,0x00000020  // RTZ Mode fcsr[7:5]=3'b001
    li x8,0x00000040  // RDN Mode fcsr[7:5]=3'b010
    li x9,0x00000060  // RUP Mode fcsr[7:5]=3'b011
    frcsr x10         //Read Fcsr value

    lw x11, 0(x5)     //Load Integer value 
    lw x12, 8(x5)    
    fcvt.s.w f0,x11   //Converting to Integer -> Floating point
    fcvt.s.w f1,x12 
    
  //For Deafult/RNE Mode
  RNE_MODE:
    fscsr x14,x0      //Enable RNE Mode by writing to FCSR Register
    frcsr x15
    fdiv.s f13, f0, f1    # f13 = f0 / f1 (division)

  //For RTZ Mode
  RTZ_MODE:
    fscsr x14,x7      //Enable RTZ Mode by writing to FCSR Register
    frcsr x15
    fdiv.s f14, f0, f1    # f13 = f0 / f1 (division)
 
  //For RDN-Round Down(-∞)
  RDN_MODE:
    fscsr x14,x8      //Enable RNE Mode by writing to FCSR Register
    frcsr x15
    fdiv.s f15, f0, f1    # f13 = f0 / f1 (division)

  //For RUP-Round Up(+∞)
  RUP_MODE:  
    fscsr x14,x9      //Enable RTZ Mode by writing to FCSR Register
    frcsr x15
    fdiv.s f16, f0, f1    # f13 = f0 / f1 (division)
 
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  /*.float 3.14
  .float 1.21254535
  .float 3.14
  .float 1.21
*/
  .word 0x06627912
  .word 0x06627912
  .word 0x000004fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
   
RVTEST_DATA_END








