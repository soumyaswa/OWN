# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN
  li gp, 3
  li x1, 20

	li a0, 12
	li a1,13
	li a2,14
	li a3,15
	li a4,16
	li a5,17
	li x5,5
	li x6,0
	li x10,34
	li x12,32
	li x13,23
	li x14,56
	li x15,45
	li x16,34
	li x17,45
	li x18,23
	li x21,5
	li x22,8
	li x20,40
	li x21,22
start:  
	
        la x10, main_isr
        csrw mtvec, x10 
        li x1, 0xa00001808      
    	csrw mstatus,x1
	li x1,0x88
	csrw mie,x1
						// load address misaligned
	lw x12,1(x13)		
	lw x14,3(x13)	
	lw x15,5(x13)	
	lw x16,7(x13)	
	lw x17,9(x13)	

	nop

	add x12,x13,x12
	add x7,x8,x9
	nop
	nop

j code_pass
	
	main_isr:   
        
	li  a5, 4
      	csrr    a7, mepc    			//read mepc value
        addi    a7, a7, 4
        csrw    mepc, a7
        csrr    a6, mcause
        beq a5, a6, Post_trap_handling  
	mret

Post_trap_handling:

    	csrw    mie, x0  			//update the mie register
    	csrw    mip, 0
    	mret

code_pass:
nop
nop

  TEST_PASSFAIL


RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

data : .dword 0x41f4241011b45e53
RVTEST_DATA_END

