#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int fib(int n)
{
    if (n < 2)
        return n;
    int x = cilk_spawn fib(n-1);
    int y =  fib(n-2);
    cilk_sync;
    return x + y;
}

int main(int argc, char *argv[])
{
    int n = 39;

    clock_t start = clock();
    int result = fib(n);
    clock_t end = clock();

    double duration = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Calculated in %.3f seconds using %d workers.\n", duration, __cilkrts_get_nworkers());


    return 0;
}
