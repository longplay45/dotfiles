#include <stdio.h>

int main() {
    int x = 10;  // Declare an integer variable and initialize it
    int *pX = &x; // Pointer pX stores the address of x

    // Print the value of x and its address
    printf("Value of x: %d\n", x);
    printf("Address of x: %p\n", (void*)&x);

    // Print the value of x using the pointer
    printf("Value of x using pointer: %d\n", *pX);
    printf("Address stored in pointer pX: %p\n", (void*)pX);

    return 0;
}
