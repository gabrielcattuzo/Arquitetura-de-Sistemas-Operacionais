#include <stdio.h>

int fibonacci(int n)
{
    if (n == 0)
    {
        return 0;
    }

    if (n == 1)
    {
        return 1;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main()
{
    int numeros[12];

    for (int i = 0; i < 12; i++)
    {
        numeros[i] = fibonacci(i);
    }

    for (int i = 0; i < 12; i++)
    {
        printf("%d ", numeros[i]);
    }

    return 0;
}