# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  # Your assembly code here
	li gp, 3
    # Save a value in mscratch
    li a0, 42        # Load the value 42 into register a0
    csrrw a1, mscratch, a0  # Swap the value in mscratch with the value in a0, and store the previous value in a1

    # Perform other operations

    # Retrieve the value from mscratch
    csrr a2, mscratch   # Load the value from mscratch into register a2
  
end:

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
RVTEST_DATA_END

