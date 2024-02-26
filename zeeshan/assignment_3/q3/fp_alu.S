//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 3
//    question no : 3
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: floating point all alu operations.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

fp_alu:
   la x5, inp_data
   flw f6, 0(x5)
   flw f7, 4(x5)
   flw f8, 8(x5)
   flw f9, 12(x5)
   flw f10, 16(x5)
   flw f11, 20(x5)
   flw f12, 24(x5)
   flw f13, 28(x5)
   flw f14, 32(x5)
   flw f15, 36(x5)

   fadd.s f16, f6, f7
   fsub.s f17, f10, f8
   fmul.s f16, f6, f7
   fdiv.s f16, f10, f7
   fsqrt.s f16, f6
   fmin.s f16, f6, f7
   fmax.s f16, f6, f7
   fmadd.s f16, f6, f7, f8
   fmsub.s f16, f6, f7, f14
   fnmadd.s f16, f6, f7, f12
   fnmsub.s f16, f6, f7, f11

   fsrm x5, x0
   fdiv.s f16, f10, f7

TEST_PASSFAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN

TEST_DATA

inp_data:

   .float 1.16	  //0  
   .float 2.13	  //4
   .float 1.84	  //8
   .float 6.98	  //12
   .float 11	  //16
   .float 12.97  //20
   .float 69.96  //24
   .float 16.90  //28
   .float 22.22  //32
   .float 3.14	  //36

RVTEST_DATA_END

