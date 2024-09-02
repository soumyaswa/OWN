# See LICENSE.vyoma for more details
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64U
RVTEST_CODE_BEGIN
 
start:
       li x8,10
       li x6,2
       la x1, test_1
       jalr x1, x1, 0
       la x1, test_2
       jalr x1, x1, 0
       la x1, test_3
       jalr x1, x1, 0
       la x1, test_4
       jalr x1, x1, 0
       j exit 	
           
test_1:
       add  x4,x8,x6
       addi x2,x4,4
       jalr x1,x1,0 

test_2:
        addi x2,x4,4
        add  x4,x8,x6
        jalr x1,x1,0 
        
test_3:
       or x5,x6,x9
       ori x8,x7,1
       jalr x1,x1,0 
       
test_4:
       add x8,x4,x8
       jalr x1,x1,0 

exit:
        nop


 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
inp_data1:
  .word 0x11223344 #0
  .word 0x22334455 #4
  .word 0x99887766 #8
  .word 0x55443322 #12
  .word 0x44556611 #16
  .word 0x12345678 #20
  .word 0x98765432 #24
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
 
inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74
 
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5
 
RVTEST_DATA_END