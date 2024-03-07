//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : 4
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description:Call (jalr with rd != x0) and matching return in straight line code (no loops).
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x2, inp_data
   j jump_and_link_reg_inst

code_1:
   li x9, 19
   li x8, 23
   addi x9, x9, 4
   addi x8, x8, 6
   add x8, x9, x8
   sub x9, x8, x9
   nop
   jr x1

jump_and_link_reg_inst:
   la x5, code_1
   jalr x1, x5, 0x0
   nop

   li x7, 13
   li x8, 17
   addi x7, x7, 4
   addi x8, x8, 2
   add x9, x8, x7
   sub x10, x8, x7
   sw x5, 0x0(x2)
   la x5, code_1
   jalr x1, x5, 0x0
   nop

exit:
   nop

TEST_PASSFAIL
RVTEST_CODE_END
RVTEST_DATA_BEGIN

TEST_DATA
.section .data
inp_data:
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
