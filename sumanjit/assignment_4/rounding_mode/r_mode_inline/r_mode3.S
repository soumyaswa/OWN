//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 4
//    question no : 3 
//    Born-on Date: 26-2-2024
//**********************************************************************
//    Description: Floating point DIV instructions with rounding mode directly using using FRM(3-bits) in floating point arithmatic instruction
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


R_Mode_Test:
    la x5, inp_data

    frcsr x10          //Read FRM value

    lw x11, 0(x5)     //Load Integer value 
    lw x12, 8(x5)    
    fcvt.s.w f0,x11   //Converting to Integer -> Floating point
    fcvt.s.w f1,x12 
    
  //For Deafult/RNE Mode
  RNE_MODE:
    fdiv.s f13, f0, f1, rne    # f13 = f0 / f1 (division)

  //For RTZ Mode
  RTZ_MODE:
    fdiv.s f14, f0, f1, rtz    # f14 = f0 / f1 (division)
 
  //For RDN-Round Down(-∞)
  RDN_MODE:
    fdiv.s f15, f0, f1, rdn    # f15 = f0 / f1 (division)

  //For RUP-Round Up(+∞)
  RUP_MODE:  
    fdiv.s f16, f0, f1, rup    # f16 = f0 / f1 (division)

  result_int:
    fcvt.w.s x13,f13 
    fcvt.w.s x14,f14 
    fcvt.w.s x15,f15 
    fcvt.w.s x16,f16 
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
 // .word 0x4048f5c3 //3.14
 // .word 0x3f9ae148 //1.21
  .word 0x06627912
  .word 0x06627912
  .word 0x000004fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
   
RVTEST_DATA_END







