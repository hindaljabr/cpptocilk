#include <iostream>

void test()
{
    cilk_spawn test();
}

int main(int argc, char *argv[])
{

    test();

    return 0;
}
