# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data 
 // la x13, inp_data
instr: 
la x5, inp_data
lw x11,0(x5)
lw x10,4(x5)
li x7,0
li x8,10

loop:
	add x6,x11,x10
	//sw x10,(x5)	
	//sw x11,4(x5)
	mv x11,x10//,0
	mv x10,x6//,0	
	
//load store loop
	//sw/ld x11,0(x10)
	//sw/ld x10,(x6)	
  	//sw/ld x10,(x6)
	//lw/sw x10,(x6)
 	addi x7,x7,1
 	bne x7,x8,loop
end:


//end:
	//nop 


  
 // bne x0, x1, instr

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA
inp_data:
	.word 0
	.word 1 



  RVTEST_DATA_END




