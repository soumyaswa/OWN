//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 3 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: floating point all alu operations     
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

    # floating-point arithmetic operations
    fadd.s f10, f0, f1    # f10 = f0 + f1 (addition)
    fsub.s f11, f0, f1    # f11 = f0 - f1 (subtraction)
    fmul.s f12, f0, f1    # f12 = f0 * f1 (multiplication)
    fdiv.s f13, f0, f1    # f13 = f0 / f1 (division)
    fsqrt.s f14, f0       # f14 = sqrt(f0)(squareroot)
    fmax.s f15 ,f0, f1    # f15 = max(f0,f1) (Find MAX value)
    fmin.s f16 ,f0, f1    # f16 = min(f0,f1) (Find MIN value)
 

	  
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .float 3.14
  .float 3.14
  .float 1.21
  .float 3.14
  .float 1.21
  .float 3.14
  .float 1.21
  .float 3.14
  .float 1.21
  .float 3.14
  .float 1.21
  .float 1.21
   
RVTEST_DATA_END















