//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 2 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Loads with crossing Cache Boundaries unaligned, cache is 32B.need to access 4 cache line boundaries 32B,64B,128B,192B.             
//**********************************************************************




#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


q1_test:
  la x5, inp_data

//for 32 cache line boundry :- unalligned showing error
  c32:	li x10,0x11223344
	lh x11,28(x5)
	lw x12,28(x5)
	ld x13,24(x5) 
	//lh x12,31(x5) // unalligned showing error
//	ld x13,28(x5)  // crossing 32B boundary

//for 64 cache line boundry :- unalligned showing error
  c64:	li x14,0x55667788
	lh x15,62(x5)
	lw x16,60(x5)
	ld x17,56(x5) 
	//ld x17,60(x5) //Unalligned showing error

//for 128 cache line boundry :- unalligned showing error
  c128:	li x18,0x55667789
	lh x19,126(x5)
	lw x20,124(x5)
	ld x21,120(x5) 
	//ld x17,124(x5) //Unalligned showing error

//for 192 cache line boundry :- unalligned showing error
  c192:	li x22,0x55667787
	lh x23,190(x5)
	lw x24,188(x5)
	ld x25,184(x5) 
	//ld x17,188(x5) //Unalligned showing error

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
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
















