//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 7 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: implementation of the load store stack pointer.             
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  la x2,inp_data

start_test:
        c.li x10,25
		c.li x11,20
        c.lwsp x8,0(x2)
        c.ldsp x9,16(x2)
        c.swsp x10,0(x2)
        c.sdsp x11,16(x2)
        c.lwsp x8,0(x2)
        c.ldsp x9,16(x2)

   TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x1234
  .word 0x5634
  .word 0x5678
  .word 0x7812
  .dword 0x0662791211223344
  .dword 0x06627912AABBCCDD
  .dword 0x584944fc14151617
  .dword 0x584944fc15161819 //32B
  .dword 0x558f5366ACD12563
  .dword 0x558f5366BCDA5678
  .dword 0x29df2fb114875656
  .dword 0x29df2fb115141326 //64B
  .dword 0x40053e9211223344
  .dword 0x40053e92AABBCCDD
  .dword 0x1701069c14151617
  .dword 0x1701069c15161819 //128B
  .dword 0x594b916ACD12563F
  .dword 0x594b916BCDA56788
  .dword 0x64cd11c148756562
  .dword 0x64cd11c151413262 //160B
  .dword 0x6133a31211223344
  .dword 0x6133a312AABBCCDD
  .dword 0x2a9e3a3c14151617
  .dword 0x2a9e3a3c15161819 //192B
  .dword 0x59f8611ACD12563F
  .dword 0x59f8611BCDA56788
  .dword 0x3921461148756562
  .dword 0x3921461151413262 //224B
  .dword 0x6ec633f211223344
  .dword 0x6ec633f2AABBCCDD
  .dword 0x4910a7bc14151617
  .dword 0x4910a7bc15161819
  .dword 0x3392ec7ACD12563F
  

 
RVTEST_DATA_END






















