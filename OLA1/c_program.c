// Garrett Johnson OLA1 Haiku 

#include <string.h>

void print_haiku(const char *haiku, unsigned int num_bytes);    // rdi, rsi argument order 

int main() {
    const char *haiku = "life’s little, our heads\nsad. Redeemed, wasting clay\nthis chance. Be of use.\nBy Ravi Shankar\n";    // char * pointer for haiku

    print_haiku(haiku, strlen(haiku));  // Call the assembly function

    return 1;
}