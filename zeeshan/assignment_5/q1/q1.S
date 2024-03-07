//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 5
//    question no : 1
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Conditional Branches in straight line code (no loops)both for compressed and non-compressed.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

   la x2, inp_data

conditional_branch:
   lw x5, 0x0(x2)
   lw x6, 0x4(x2)
   li x7, 1
   li x8, 11
   branch_equal_to:
      beq x5, x6, exit
      addi x7, x7, 5
   branch_not_equal:
      bne x5, x6, branch_less_than
      add x7, x7, x8
   branch_less_than:
      blt x5, x6, branch_great_equal
      sub x8, x8, x7
   branch_great_equal:
      bge x5, x6, exit
      xor x9, x8, x7
   branch_less_unsigned:
      bltu x5, x6, branch_great_unsigned
      slli x9, x9, 2
   branch_great_unsigned:
      bgeu x5, x6, exit
      addi x9, x9, 786
   branch_equal_zero:
      beqz x5, exit
      addi x7, x7, 5
   branch_not_zero:
      bnez x6, branch_less_zero
      or x9, x9, x8
   branch_less_zero:
      bltz x5, exit
      ori x7, x7, 1
   branch_great_eq_zero:
      bgez x6, exit
      and x9, x8, x7
   branch_great_than:
      bgt x5, x6, exit
      sub x8, x9, x7
   branch_great_than_unsigned:
      bgtu x5, x6, exit
      add x8, x9, x7
   branch_great_than_zero:
      bgtz x6, exit
      srli x8, x7, 2
   branch_less_eq:
      ble x5, x6, branch_less_eq
      andi x8, x7, 11 
   branch_less_eq_unsigned:
      bleu x5, x6, branch_less_eq_zero
      xori x10, x7, 2
   branch_less_eq_zero:
      blez x5, exit
      sra x11, x8, x10

   li x7, 1
//   branch_eq_zero_compressed:
//      c.beqz x7, exit
//   branch_not_zero_compressed:
//      c.bnez x7, exit

exit:

TEST_PASSFAIL
RVTEST_CODE_END
RVTEST_DATA_BEGIN

TEST_DATA
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

