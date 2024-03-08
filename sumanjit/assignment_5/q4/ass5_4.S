//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 5
//    question no : 4 
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: RAW data dependency with store followed by load           
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  ass_5_2:
      	la x5,inp_data

	li x12,0x01020304   	// load immediate x12 value //LOAD x12--> Read Operand
	li x14,0xAAAABB0B   	// load immediate x14 value //LOAD x14--> Read Operand
     .rept 2
	// For 0th Offset - seq1
	addi x12,x12,1		// x12--> Read Operand
	sw x12,0(x5) 		// x12--> Write operand, store x12 value to (x5+0) address //STORE RAW
	lw x13,0(x5)   		// Cross Check The Updated Write Value
	
	// For 0th Offset - seq2
	addi x14,x14,2		// x14--> Read Operand
	sw x14,0(x5) 		// x12--> Write operand, store x12 value to (x5+0) address //STORE RAW
	lw x15,0(x5)   		// Cross Check The Updated Write Value
     .endr 
   
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
  .dword 0x3392ec7ACD12563F
  

 
RVTEST_DATA_END


