#include <iostream>

int function(int m , int i)  {
    m = i-1;
    if(m < 20)
        function(m , i);

    return m;
}

int main(int argc, char *argv[])
{
    int a = 4.3;
    int b = 3 / 34;

    int result = function(a , b);

    return 0;
}
