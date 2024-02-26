//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 3
//    question no : 4
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Mix loads / stores with interleaved Floating point DIV instructions.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

fp_ls_div:
   la x4, inp_data
   la x5, float_inp

   flw f6, 0(x5)
   flw f7, 4(x5)

   fdiv.s f16, f6, f7   
   fsw f16, 0(x5)	//store

   flw f8, 8(x5)
   flw f9, 12(x5)

   fdiv.s f16, f8, f9   
   fsw f16, 4(x5)	//store

   flw f10, 16(x5)
   flw f11, 20(x5)

   fdiv.s f16, f10, f11   
   fsw f16, 8(x5)	//store

   flw f12, 24(x5)
   flw f13, 28(x5)

   fdiv.s f16, f12, f13
   fsw f16, 12(x5)	   //store

   flw f14, 32(x5)
   flw f15, 36(x5)

   fdiv.s f16, f14, f15   
   fsw f16, 16(x5)	   //store

   li x6, 0
   fsrm x7, x6		   //RNE mode
   
   flw f14, 32(x5)
   flw f15, 36(x5)

   fdiv.s f16, f14, f15   
   fsw f16, 16(x5)	   //store
	
   lw x7, 0(x4)
   fcvt.s.w f25, x7	   // int->fp conv

TEST_PASSFAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN

TEST_DATA
inp_data:
   .word 0x12345678
   .word 0x00000000
   .word 0x11111111
   .word 0x22222222
   .word 0x33333333
   .word 0x44444444
   .word 0x55555555
   .word 0x66666666
   .word 0x77777777
   .word 0x0ffffff0

float_inp:
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
