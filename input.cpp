#include <iostream>

int fib(int n)
{
    if (n < 2)
        return n;
    int x =fib(n-1);
    int y = fib(n-2);
    return x + y;
}

int main(int argc, char *argv[])
{
    int n = 39;

    int result = fib(n);

    return 0;
}
