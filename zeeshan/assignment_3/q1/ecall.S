//**********************************************************************
//    Originator: Zeeshan Hussain
//    assignment : 3
//    question no : 1
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: study the ecall, and implement it.
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

   li gp, 3
   li x1, 20

user_mtvec:
   la x4, main_irs
   csrw mtvec, x4

ecall_test:
   la x5, inp_data
   li x6, 11
   li x7, 69

loop1:
   add x5, x6, x7
   addi x6, x6, 10
   addi x7, x7, -5
   bge x7, x6, loop1
   
   ecall

loop2:
   sub x5, x6, x7
   addi x6, x6, 5
   addi x7, x7, -10
   bgez x7, loop2
   nop
   j exit

main_irs:
   # Handles the interrupt
   csrr a1, mcause
   csrr a1, mepc
   addi a1, a1, 4
   csrw mepc, a1
   mret

exit:
   la x5, trap_vector
   csrw mtvec, x5

TEST_PASSFAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN

TEST_DATA

inp_data:

   .word 0x00000000
   .word 0x11111111
   .word 0x22222222
   .word 0x33333333
   .word 0x44444444
   .word 0x55555555
   .word 0x66666666
   .word 0x77777777
   .word 0x0ffffff0

RVTEST_DATA_END
