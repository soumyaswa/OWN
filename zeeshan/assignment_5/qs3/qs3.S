//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : s3
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Sequence of store follow by branch misprediction.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x4, inp_data_1
   la x5, inp_data_2
branch_misprediction:
   li x6, 0
   li x28, 1
   li x29, 11
   li x30, 111
   li x31, 1111

   code_1:
      sw x6, 0x0(x4)
      sw x28, 0x4(x4)
      sw x29, 0x8(x4)
      sw x30, 0xc(x4)
      sw x31, 0x10(x4)
      addi x30, x30, -1 
      bne x29, x30, code_1
      nop
      nop

exit:
   addi x6, x6, 786
   nop

TEST_PASSFAIL
RVTEST_CODE_END
RVTEST_DATA_BEGIN

TEST_DATA
.section .data
inp_data_1:
   .word 0x3f947ae1  //	1.16
   .word 0x400851ec  //	2.13
   .word 0x3feb851f  //	1.84
   .word 0x40df5c29  //	6.98
   .word 0x41300000  //	11
   .word 0x414f851f  //	12.97
   .word 0x428beb85  //	69.96
   .word 0x41873333  //	16.90
   .word 0x41b1c28f  //	22.22
   .word 0x4048f5c3  //	3.14

.section .data
inp_data_2:
   .word 0x3f947ae1  //	1.16 
   .word 0x400851ec  //	2.13
   .word 0x3feb851f  //	1.84
   .word 0x40df5c29  //	6.98
   .word 0x41300000  //	11
   .word 0x414f851f  //	12.97
   .word 0x428beb85  //	69.96
   .word 0x41873333  //	16.90
   .word 0x41b1c28f  //	22.22
   .word 0x4048f5c3  //	3.14
RVTEST_DATA_END
