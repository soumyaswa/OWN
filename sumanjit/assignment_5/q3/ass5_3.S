//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 5
//    question no : 3 
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Sequence of store follow by branch misprediction        
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  la x5,load_data
  li x20,2
  li x11,0x11001100

  ass_5_3:
        li x10,2
     loop1:
	sw x11,0(x5)      // Store
        addi x11,x11,4    // Next store value
	addi x5,x5,4      // Next store address
	addi x10,x10,-1
	bgt x10,x0,loop1  // Followed by Branch Mis-Prediction  // T->NT->T->NT ....
   
	addi x20,x20,-1
	bnez x20,ass_5_3  // For repetition of loop1 multiple times to get branch prediction
	
	j exit

     exit:
	nop
	
       
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
   
RVTEST_DATA_END



