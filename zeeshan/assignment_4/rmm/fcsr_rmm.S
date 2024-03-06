#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64UF
RVTEST_CODE_BEGIN
 
   li gp, 3
   li x1, 20

.equiv RMM, 2		      # Round to Nearest, tie to max magnitude
.equiv RMM_CSR, 0x40	       

   la x4, inp_float
rounding_mode_test:


Round_to_nearest_ties_max_1:
   frrm x7	     # reading current status of rounding mode bits
   li x6, RMM
   fsrm x5, x6	     # enabling RNE mode by direct injecting into rounding mode register
   frrm x7	     # cross cheaking for enabling
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3
   fcvt.w.s x6, f6   # 2.50 --> 3
   fcvt.w.s x7, f7   # 3.50 --> 4
   fcvt.w.s x8, f8   # 3.49 --> 3
   
Arithmatic_operation_1:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 5
   fcvt.w.s x10, f10	   # 1.51 --> 2
   fcvt.w.s x11, f11	   # 5.2699 --> 5
   fcvt.w.s x12, f12	   # 3.49 --> 3

Round_to_nearest_ties_max_2:
   frcsr x6	     # cheacking initial fcsr value
   li x6, RMM_CSR    
   fscsr x5, x6	     # changing rounding mode to invalid by swaping method
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3
   fcvt.w.s x6, f6   # 2.50 --> 3
   fcvt.w.s x7, f7   # 3.50 --> 4
   fcvt.w.s x8, f8   # 3.49 --> 3
   
Arithmatic_operation_2:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 5
   fcvt.w.s x10, f10	   # 1.51 --> 2
   fcvt.w.s x11, f11	   # 5.2699 --> 5
   fcvt.w.s x12, f12	   # 3.49 --> 3

Round_to_nearest_ties_max_3:
   li x6, RMM_CSR
   csrw fcsr, x6     # changing rounding mode to invalid by csr write method
   flw f5, 0(x4)     # stored 2.51 in f5 register
   flw f6, 4(x4)     # stored 2.50 in f6 register
   flw f7, 8(x4)     # stored 3.50 in f7 register
   flw f8, 12(x4)    # stored 3.49 in f8 register
   # converting float to integer
   fcvt.w.s x5, f5   # 2.51 --> 3
   fcvt.w.s x6, f6   # 2.50 --> 3
   fcvt.w.s x7, f7   # 3.50 --> 4
   fcvt.w.s x8, f8   # 3.49 --> 3
   
Arithmatic_operation_3:
   fadd.s f9, f5, f6	   # 2.51 + 2.50 = 5.01
   fsub.s f10, f9, f7	   # 5.01 - 3.50 = 1.51
   fmul.s f11, f10, f8	   # 1.51 * 3.49 = 5.2699
   fdiv.s f12, f11, f10	   # 5.2699 / 1.51 = 3.49
   # converting the results
   fcvt.w.s x9, f9	   # 5.01 --> 5
   fcvt.w.s x10, f10	   # 1.51 --> 2
   fcvt.w.s x11, f11	   # 5.2699 --> 5
   fcvt.w.s x12, f12	   # 3.49 --> 3

Arithmatic_operation_4:
   fadd.s f9, f5, f6, rtz	# 2.51 + 2.50 = 5.01
   fsub.s f10, f9, f7, rdn	# 5.01 - 3.50 = 1.51
   fmul.s f11, f10, f8, rup	# 1.51 * 3.49 = 5.2699
   fdiv.s f12, f11, f10, rmm	# 5.2699 / 1.51 = 3.49
   # converting the results
   fcvt.w.s x9, f9, rtz		# 5.01 --> 5
   fcvt.w.s x10, f10, rdn	# 1.51 --> 1
   fcvt.w.s x11, f11, rup	# 5.2699 --> 6
   fcvt.w.s x12, f12, rmm	# 3.49 --> 3


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
