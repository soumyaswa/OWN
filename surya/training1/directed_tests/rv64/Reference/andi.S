# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

	la x20, inp_data // addr = inp_data +8 = 0x7000+8 = 0x7008
	la x20, inp_data // addr = inp_data +8 = 0x7000+8 = 0x7008
	ld x20, 8(x20)	 // 0-7= 8 bytes

  li x10, 300
  li x11, 400
andi_instr:
  andi x5, x11, 5
  addi x1,x1,-1
  bne x0, x1, andi_instr
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:		// 0x70000
  .word 0x06627912      // 0
  .word 0x06627912	// 4
  .word 0x584944fc	// 8
  .word 0x584944fc	// 0xc
  .word 0x558f5366	// 0x10
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

RVTEST_DATA_END

