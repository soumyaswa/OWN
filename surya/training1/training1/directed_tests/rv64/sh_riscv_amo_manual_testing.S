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



amoswap.w x9, x2, (x4)
amoadd.w x9, x2, (x4)
amoand.w x9, x2, (x4)
amoor.w x9, x2, (x4)
amoxor.w x9, x2, (x4)
amoswap.w x9, x2, (x4)
amoadd.w x9, x2, (x4)
amoand.w x9, x2, (x4)
amoor.w x9, x2, (x4)
amoxor.w x9, x2, (x4)

amoswap.d x10, x2, (x4)
amoadd.d x9, x4, (x2)
amoand.d x9, x4, (x4)
amoor.d x9, x4, (x4)
amoxor.d x9, x4, (x4)
amoswap.d x9, x2, (x4)
amoadd.d x9, x2, (x4)
amoand.d x9, x2, (x4)
amoor.d x9, x2, (x4)
amoxor.d x9, x2, (x4)


sw x5, 0(x4)
sw x6, 4(x4)
sw x7, 8(x4)
sw x8, 12(x4)
sw x9, 16(x4)



la x2, inp_data
la x4, inp_data




amoswap.d x5, x2, (x4)
amoadd.d x5, x2, (x4)
amoand.d x5, x2, (x4)
amoor.d  x5, x2, (x4)
amoxor.d x5, x2, (x4)



sw x5, 0(x4)
sw x6, 4(x4)
sw x7, 8(x4)
sw x8, 12(x4)
sw x9, 16(x4)

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











