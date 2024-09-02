# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV32U
RVTEST_CODE_BEGIN


  # Addresses for test data 
  ld x30, inp_data
  ld x31,  inp_data
  la x1,  inp_data

instruction:

la x2, inp_data
la x4, inp_data

init:
                  li x0, 0xffa2d736
                  li x2, 0x0
                  li x3, 0x0
                  li x5, 0x0
                  li x6, 0x0
                  li x7, 0xe545b3f4
                  li x8, 0x63152f86
                  li x9, 0xfb9cd819
                  li x10, 0x0
                  li x11, 0x80000000
                  li x12, 0x7037bcd1
                  li x13, 0x5c38cd9d
                  li x14, 0x80000000
                  li x15, 0x80000000
                  li x17, 0xe5edd29f
                  li x18, 0x8d3e1f3d
                  li x19, 0xf4fe6973
                  li x20, 0xf4619646
                  li x21, 0x80000000
                  li x22, 0x0
                  li x23, 0x60096e6a
                  li x24, 0xc
                  li x25, 0x80000000
                  li x26, 0x0
                  li x27, 0xcd5c14a2
                  li x28, 0x80000000
                  li x29, 0x2b0dcdd9
                  li x30, 0x80000000
                  li x31, 0x3
		  li gp,3
which_core:
		beq x5,0,th_main_0
		beq x5,1,th_main_0
	
th_main_0:	           
		sub x6,x22,x29
		add x9,x27,x28
		addi x5,x5,1
		
th_main_1:	           
		div x7,x22,x29
		mul x8,x27,x28

	TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x000000012
  .word 0x000000012
  .word 0x0000000fc
  .word 0x0000000fc
  .word 0x000000066
  .word 0x000000066
  .word 0x0000000b1
  .word 0x0000000b1
  .word 0x000000092
  .word 0x000000092
  .word 0x000000099
  .word 0x000000099
  .word 0x000000069
  .word 0x000000069
  .word 0x0000000c7
  .word 0x0000000c7
  .word 0x00000001e
  .word 0x00000001e
  .word 0x00000003d
  .word 0x00000003d
  .word 0x000000017
  .word 0x000000017
  .word 0x000000011
  .word 0x000000011
  .word 0x0000000f5
  .word 0x0000000f5
  .word 0x0000000b3
  .word 0x0000000b3
  .word 0x000000072
  .word 0x000000072
  .word 0x000000075
  .word 0x000000075
  .word 0x0000000db
  .word 0x0000000db
  .word 0x0000000f7
  .word 0x0000000f7
  .word 0x0000000ec
  .word 0x0000000ec
  .word 0x000000074
  .word 0x000000074

RVTEST_DATA_END











