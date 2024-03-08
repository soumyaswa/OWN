//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 5
//    question no : 2 
//    Born-on Date: 4-3-2024
//**********************************************************************
//    Description: Newer Load can get the data forwarded from older store            
//**********************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  ass_5_2:
      	la x5,inp_data
     	li x10,0x11221122
	li x11,0xABABABAB

     .rept 5
	lw x12,12(x5) 	// load data x12=0x06627912
	sw x10,12(x5) 	// store 0x12121212 to (x5+12) address
	lw x13,12(x5)   // load data x13 to check wherther getting updated value or not // TESTPASS
        addi x10,x10,10
        
	lw x14,0(x5) 	// load data x12=0x06627912
	sw x11,0(x5) 	// store 0x12121212 to (x5+12) address
	lw x15,0(x5)   // load data x13 to check wherther getting updated value or not // TESTPASS
        addi x11,x11,2
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













































