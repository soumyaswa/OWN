//**********************************************************************
//    Originator: SUMANJIT PATTANAYAK
//    assignment : 3
//    question no : 1 
//    Born-on Date: 20-2-2024
//**********************************************************************
//    Description: Study ECALL and implement it.   For Machine Mode    
//**********************************************************************



#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  load_mtvec:	# Load interrupt handling address in mtvec
  	la x4,interupt_handle
  	csrw mtvec,x4
 
  before_ecall:
	li x10,10;
	addi x11,x10,2
	ecall

  after_ecall:
	addi x12,x11,1
	li x12,0x1234ABCD
   	nop
	j exit

  interupt_handle:
	csrr x20,mcause
	csrr x21,mepc
	addi x21,x21,4
	csrw mepc,x21
	mret

  exit:
	nop
	la x6,trap_vector
	csrw mtvec,x6
	
  	
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

  RVTEST_DATA_END































