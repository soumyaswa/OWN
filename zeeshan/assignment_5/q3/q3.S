//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : 3
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description:Indirect jumps (jalr) in straight line code (no loops). 
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x2, inp_data

jump_and_link_reg_inst:
   la x5, code_1
   jalr x0, x5, 0x0
   nop

code_2:
   c.li x9, 19
   c.li x8, 23
   c.addi x9, 4
   c.addi x8, 6
   c.add x8, x9
   c.sub x9, x8
   la x10, inp_data
   c.sw x8, 0x0(x10)
   la x1, exit
   c.jalr x1
   nop

code_1:
   li x7, 13
   li x8, 17
   addi x7, x7, 4
   addi x8, x8, 2
   add x9, x8, x7
   sub x10, x8, x7
   sw x5, 0x0(x2)
   la x5, code_2
   jalr x0, x5
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
