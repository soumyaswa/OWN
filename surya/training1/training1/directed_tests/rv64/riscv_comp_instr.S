# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64UF
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20



  # Addresses for test data 
  ld x30, inp_data
  ld x31,  inp_data
  la x1,  inp_data

li gp, 3
li x1, 20



instruction:

la x2, inp_data
la x4, inp_data



//lw x5, 0(x2)
//lw x6, 4(x4)
                  li x0, 0xffa2d736
                  li x1, 0x0
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
main:           
                  c.srai       a3, 12
                  c.sub        s1, a0
                  c.sub        s1, a0
                  c.nop
                  c.li         s1, -1
                  c.addiw      a5, -1
                  c.sub        s1, a0
                  c.or         s1, s0
                  c.addi4spn   a3, sp, 320
                  c.lui        t3, 2
                  c.or         s1, s0
                  c.xor        a2, a1
                  c.addw       s0, a2
                  c.addw       s0, a2
                  c.addi4spn   a3, sp, 320
                  c.slli       s0, 3
                  c.subw       a3, s1
                  c.mv         t1, a1
                  c.xor        a2, a1
                  c.addi4spn   a3, sp, 320
                  c.and        s0, a1
                  c.andi       s1, -1
                  c.add        s1, a2
                  c.lui        t3, 2
                  c.and        a5, a1
                  c.xor        a4, a1
                  c.sub        a5, a0
                  c.addw       a5, a2
                  c.subw       a0, s1
                  la x11, test_done
                  jalr x0, x11, 0
test_done:        
                  li gp, 1
                  ecall  
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











