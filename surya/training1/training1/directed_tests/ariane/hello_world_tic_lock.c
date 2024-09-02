#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>

// Define the ticket lock structure
typedef struct {
    atomic_int now_serving;
    atomic_int next_ticket;
} TicketLock;

// Initialize the ticket lock
void ticket_lock_init(TicketLock *lock) {
    atomic_init(&lock->now_serving, 0);
    atomic_init(&lock->next_ticket, 0);
}

// Acquire the ticket lock
void ticket_lock_acquire(TicketLock *lock) {
    int my_ticket = atomic_fetch_add(&lock->next_ticket, 1);
    
    while (atomic_load(&lock->now_serving) != my_ticket) {
        // Spin until it's our turn
    }
}

// Release the ticket lock
void ticket_lock_release(TicketLock *lock) {
    atomic_fetch_add(&lock->now_serving, 1);
}

TicketLock g_ticket_lock; // Global ticket lock

void *worker(void *arg) {
    int hart_id = *((int *)arg);
    
    for (int k = 0; k < 32; k++) {
        // Acquire the lock
        ticket_lock_acquire(&g_ticket_lock);

        // Print the message
        printf("Hello world, I am HART %d! Counting (%d of 32)...\n", hart_id, k);

        // Release the lock
        ticket_lock_release(&g_ticket_lock);
    }

    return NULL;
}

int main(int argc, char **argv) {
    ticket_lock_init(&g_ticket_lock);
    
    pthread_t threads[32];
    int hart_ids[32];

    for (int i = 0; i < 32; i++) {
        hart_ids[i] = atoi(argv[1]);
        pthread_create(&threads[i], NULL, worker, &hart_ids[i]);
    }

    for (int i = 0; i < 32; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("Done!\n");

    return 0;
}
