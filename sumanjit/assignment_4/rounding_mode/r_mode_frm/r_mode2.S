//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 4
//    question no : 2 
//    Born-on Date: 26-2-2024
//**********************************************************************
//    Description: Floating point DIV instructions with rounding mode using FRM(3-bits) only
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


R_Mode_Test:
    la x5, inp_data

    li x7,0x00000001  // RTZ Mode fcsr[7:5]=frm=3'b001
    li x8,0x00000002  // RDN Mode fcsr[7:5]=frm=3'b010
    li x9,0x00000003  // RUP Mode fcsr[7:5]=frm=3'b011
    li x6,0x00000005  // ERR Mode fcsr[7:5]=frm=3'b011
    frrm x10          //Read FRM value

    lw x11, 0(x5)     //Load Integer value 
    lw x12, 8(x5)    
    fcvt.s.w f2,x11   //Converting to Integer -> Floating point
    fcvt.s.w f1,x12 
    
  //For Deafult/RNE Mode
  RNE_MODE:
    fsrm x14,x0       //Enable RNE Mode by writing to FCSR Register
    frrm x15
    fdiv.s f13, f2, f1    # f13 = f2 / f1 (division)

  //For RTZ Mode
  RTZ_MODE:
    fsrm x14,x7      //Enable RTZ Mode by writing to FCSR Register
    frrm x15
    fdiv.s f14, f2, f1    # f14 = f2 / f1 (division)
 
  //For RDN-Round Down(-∞)
  RDN_MODE:
    fsrm x14,x8      //Enable RNE Mode by writing to FCSR Register
    frrm x15
    fdiv.s f15, f2, f1    # f15 = f2 / f1 (division)

  //For RUP-Round Up(+∞)
  RUP_MODE:  
    fsrm x14,x9      //Enable RTZ Mode by writing to FCSR Register
    frrm x15
    fdiv.s f16, f2, f1    # f16 = f2 / f1 (division)
 
  //For Invalid case
  INVALID_MODE:  
    fsrm x14,x6      //Enable INVALID Mode by writing to FCSR Register
    frrm x15
    fdiv.s f17, f2, f1    # f16 = f2 / f1 (division)
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






