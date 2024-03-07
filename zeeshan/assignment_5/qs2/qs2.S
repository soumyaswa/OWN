//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : s2
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Newer Load can get the data forwarded from older store.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x2, inp_data_1
   la x3, inp_data_2
speculative_load_store_forwarding:
   .rept 5
   lw x5, 0x0(x2)
   addi x5, x5, 4
   sw x5, 0x0(x3)
   
   lw x5, 0x0(x3)
   addi x5, x5, 4
   sw x6, 0x0(x2)
   addi x2, x2, 4
   addi x3, x3, 4
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
