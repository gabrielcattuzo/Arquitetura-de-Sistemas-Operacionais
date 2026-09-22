#include <stdio.h>

int main()
{
    int anterior = 0;
    int atual = 1;
    int proximo;

    printf("Serie de Fibonacci: ");

    for (int i = 0; i < 12; i++)
    {
        printf("%d ", anterior);

        proximo = anterior + atual;
        anterior = atual;
        atual = proximo;
    }

    return 0;
}