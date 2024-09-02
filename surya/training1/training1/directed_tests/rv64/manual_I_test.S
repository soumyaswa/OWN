# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data 
  la x13, inp_data


instr:
  addi x1, x1, -1

  lw x14, 0(x13) 
  lw x24, 4(x13) 

  #General Form: ADD RegD,Reg1,Reg2 
  #The contents of Reg1 is added to the contents of Reg2 and the result is placed in RegD.
//WAW Hazards
  add x31,x14, x24
  sub x31,x24, x14
// c out of order...
  add x31,x14, x24
  flw f6, 4(x13)
  flw f7, 8(x13)
  flw f8, 12(x13)
  flw f9, 16(x13)
  fadd.s f10, f6, f7
  fsub.s f11, f7, f6
  fmul.s f12, f6, f7
  fdiv.s f13, f6, f8
  sub x31,x24, x14
//RAW Hazards
  add x31,x14, x24
  sub x14,x24, x31

  addi x13, x13, 8
  bne x0, x1, instr

  TEST_PASSFAIL

RVTEST_CODE_END

/*

instr:
  addi x1, x1, -1

  lw x14, 0(x13) 
  lw x24, 4(x13) 

  #General Form: ADD RegD,Reg1,Reg2 
  #The contents of Reg1 is added to the contents of Reg2 and the result is placed in RegD.
//WAW Hazards
  add x31,x14, x24
  sub x31,x24, x14
//RAW Hazards
  add x31,x14, x24
  sub x14,x24, x31

  addi x13, x13, 8
  bne x0, x1, instr

  TEST_PASSFAIL

RVTEST_CODE_END */

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


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

RVTEST_DATA_END
