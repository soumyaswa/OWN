//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 5
//    question no : 1 
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Executing Loads, Stores speculatively           
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  ass_5_1:
      	la x5,load_data
      	la x6,store_data
     	li x10,0x11221122
	li x11,0xABABABAB

     .rept 5
	lw x12,4(x5) 	
	addi x12,x12,0x0011
	sw x12,4(x6) 	
	addi x5,x5,4
	addi x6,x6,8	
     .endr 
   
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


load_data:
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
  .dword 0x3392ec7ACD12563F
  
store_data:
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
  .dword 0x3392ec7ACD12563F


 
RVTEST_DATA_END



















