//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 4
//    question no : 1 
//    Born-on Date: 26-2-2024
//**********************************************************************
//    Description: Floating point flag exceptions
//**********************************************************************


#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


R_Mode_Test:
    la x5, inp_data

    frrm x10         
 
    flw f1, 0(x5)    
    flw f2, 4(x5)    
    flw f3, 8(x5)    
    
  // Invalid Operation:- an operation is invalid or unsupported-> Squareroot of a negative number
  NV:
    fsqrt.s f4,f2
    frflags x13
  
  // Divided by zero(0):- a division operation attempted to divide by zero
  DZ:
    fdiv.s f5,f1,f3
    frflags x14

  // Overflow:- cross the maximum range of single precision floating point 
  OF:
    flw f6,16(x5)
    fadd.s f7,f6,f6
    frflags x15

  // Underflow:- where the result is very close to zero but falls below the minimum representable value could trigger underflow.  
  UF:
    flw f8,20(x5)
    fmul.s f9,f8,f8
    frflags x16

  // Inexact:- result is not exact, typically in floating-point arithmetic where rounding occurs.
  NX:
    fdiv.s f10,f1,f2
    frflags x18


   TEST_PASSFAIL  

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .float 3.14
  .float -1.21
  .float 0
  .float 1.21
  .float 3.402823466e+38   # Largest positive single-precision floating-point numbe3.402823466 E + 38
  .float 1.17549435e-38    # Smallest positive single-precision floating-point number.float 3.402823466e+38 
  .word 0xFFFFFFFF
  .word 0xbf9ae148//-ve value
  .word 0x000004fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
   
RVTEST_DATA_END





