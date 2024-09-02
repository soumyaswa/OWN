// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
// Date: 26.11.2018
// Description: Simple hello world program that prints the core id.
// Also runs correctly on manycore configs.
//

#include <stdint.h>
#include <stdio.h>
#include "util.h"

int main(int argc, char** argv) {

  // synchronization variables
  volatile static uint32_t next_ticket = 0;
  volatile static uint32_t now_serving = 0;

  // Get the ticket
  // ATOMIC_OP(amo_cnt, 1, add, w);
  uint32_t my_ticket = __sync_fetch_and_add(&next_ticket, 1);
  
  // synchronize with other cores and wait until it is this core's turn
  while(my_ticket != now_serving){
  };  

  printf("Hello world, this is hart %d of %d harts!\n", argv[0][0], argv[0][1]);

  // I am done
  __sync_fetch_and_add(&now_serving, 1);

  return 0;
}
