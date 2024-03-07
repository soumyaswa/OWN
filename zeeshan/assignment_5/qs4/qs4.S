//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : s4
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: RAW data dependency with store followed by load.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x4, inp_data_1
   la x5, inp_data_2
   li x6, 0
RAW_store_load:
   .rept 5
      sw x6, 0x0(x4)
      lw x6, 0x0(x4)
      addi x6, x6, 1 
   .endr
exit:
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
