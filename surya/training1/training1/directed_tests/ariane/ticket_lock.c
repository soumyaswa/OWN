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
// Description: Simple hello world program that prints 32 times "hello world".
//

#include <stdint.h>
#include <stdio.h>
#include "util.h"
int init=0;

volatile unsigned int next_ticket=0 ;
volatile unsigned int now_serving=0 ;
   

/*

void ticket_init (struct ticket_lock *lock) {
    lock->now_serving = 0;
    lock->next_ticket = 0;
}

void ticket_destroy (struct ticket_lock *lock) {
    lock->now_serving = 0;
    lock->next_ticket = 0;
}
*/

inline void ticket_acquire () {
    unsigned int my_ticket;
    int spin = 0;
    ATOMIC_FETCH_OP(my_ticket,next_ticket, 1, add, w);
    //my_ticket = __sync_fetch_and_add(&(lock->s.next_ticket), 1);
    while (now_serving != my_ticket){
        spin++;
    }
   // return(spin);
}

inline void ticket_release () {
    //ATOMIC_OP(lock->now_serving, 1, add, w);
    now_serving += 1;
}

int main(int argc, char ** argv) {

	volatile int a,b,c;
	int core;
	a=5;
	b=5;
	c=0;
	core = argv[0][0];
	//ticket_init(&tl);

//	printf("Hello world, I am ticket= %d",now_serving);
	//while(tl.now_serving!=0);

        ticket_acquire();
	// assemble number and print
	
//	printf("Hello world, I am ticket= %d",argv[0][0]);

	c=c+a+b;
	
	ticket_release ();
	
	if(core==0)
	{
		while(now_serving!=3);
                printf("TEST PASSED");
                printf("TEST PASSED ticket= %d",argv[0][1]);
                printf("TEST PASSED ticket= %d",argv[0][1]);

	}
	
//	printf("Done!");
	return 0;
}
