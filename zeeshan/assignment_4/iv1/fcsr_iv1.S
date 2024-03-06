#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64UF
RVTEST_CODE_BEGIN
 
   li gp, 3
   li x1, 20

.equiv IV1, 5		      # Reserved/Invalid
.equiv IV1_CSR, 0xa0	      # Reserved/Invalid

   la x4, inp_float

rounding_mode_test:


Invalid_Rounding_mode1_1:
   frrm x7	     # reading current status of rounding mode bits
   li x6, IV1
   fsrm x5, x6	     # enabling RNE mode by direct injecting into rounding mode register
   frrm x7	     # cross cheaking for enabling
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3 (fail)
   fcvt.w.s x6, f6   # 2.50 --> 2 (fail)
   fcvt.w.s x7, f7   # 3.50 --> 4 (fail)
   fcvt.w.s x8, f8   # 3.49 --> 3 (fail)
   
Arithmatic_operation_1:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01 (fail)
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51 (fail)
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699 (fail)
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49 (fail)
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 3 (fail)
   fcvt.w.s x10, f10	   # 1.51 --> 2 (fail)
   fcvt.w.s x11, f11	   # 5.2699 --> 4 (fail)
   fcvt.w.s x12, f12	   # 3.49 --> 3 (fail)

Invalid_Rounding_mode1_2:
   frcsr x6	     # cheacking initial fcsr value
   li x6, IV1_CSR    
   fscsr x5, x6	     # changing rounding mode to invalid by swaping method
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3 (fail)
   fcvt.w.s x6, f6   # 2.50 --> 2 (fail)
   fcvt.w.s x7, f7   # 3.50 --> 4 (fail)
   fcvt.w.s x8, f8   # 3.49 --> 3 (fail)
   
Arithmatic_operation_2:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01 (fail)
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51 (fail)
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699 (fail)
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49 (fail)
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 3 (fail)
   fcvt.w.s x10, f10	   # 1.51 --> 2 (fail)
   fcvt.w.s x11, f11	   # 5.2699 --> 4 (fail)
   fcvt.w.s x12, f12	   # 3.49 --> 3 (fail)

Invalid_Rounding_mode1_3:
   li x6, IV1_CSR
   csrw fcsr, x6     # changing rounding mode to invalid by csr write method
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3 (fail)
   fcvt.w.s x6, f6   # 2.50 --> 2 (fail)
   fcvt.w.s x7, f7   # 3.50 --> 4 (fail)
   fcvt.w.s x8, f8   # 3.49 --> 3 (fail)
   
Arithmatic_operation_3:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01 (fail)
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51 (fail)
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699 (fail)
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49 (fail)
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 5 (fail)
   fcvt.w.s x10, f10	   # 1.51 --> 2 (fail)
   fcvt.w.s x11, f11	   # 5.2699 --> 5 (fail)
   fcvt.w.s x12, f12	   # 3.49 --> 3 (fail)

Arithmatic_operation_4:
   fadd.s f9, f5, f6, rtz	   # 2.51 + 2.50 = 5.01 (fail)
   fsub.s f10, f9, f7, rdn	   # 5.01 - 3.50 = 1.51 (fail)
   fmul.s f11, f10, f8, rup	   # 1.51 * 3.49 = 5.2699 (fail)
   fdiv.s f12, f11, f10, rmm	   # 5.2699 / 1.51 = 3.49 (fail)
   # converting the results
   fcvt.w.s x9, f9, rtz		 # 5.01 --> 5 (fail)
   fcvt.w.s x10, f10, rdn	   # 1.51 --> 1 (fail)
   fcvt.w.s x11, f11, rup	   # 5.2699 --> 5 (fail)
   fcvt.w.s x12, f12, rmm	   # 3.49 --> 3 (fail)


TEST_PASSFAIL
RVTEST_CODE_END
RVTEST_DATA_BEGIN
TEST_DATA
inp_float:
   .float 2.51	  //0  
   .float 2.50	  //4
   .float 3.50	  //8
   .float 3.49	  //12
   .float -2.51   //16
   .float -2.50	  //20
   .float -3.50	  //24
   .float -3.49	  //28
   .float 22	  //32
   .float 7	  //36
RVTEST_DATA_END
