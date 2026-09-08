#include <stdio.h>

int fatorial(int n)
{
    if (n <= 1)
    {
        return 1;
    }

    return n * fatorial(n - 1);
}

int main()
{
    int numero;
    int resultado;

    printf("Digite um numero: ");
    scanf("%d", &numero);

    resultado = fatorial(numero);

    printf("Fatorial: %d\n", resultado);

    return 0;
}