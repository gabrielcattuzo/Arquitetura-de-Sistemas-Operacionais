#include <stdio.h>

int main ()
{
    int numero, contador;
    int soma = 0;

    printf("Programa para somar os numeros de 1 a N\n");
    scanf("%d", &numero);

    for (contador = 1; contador <= numero; contador++)
    {
        soma += contador;
    }

    printf("A soma dos numeros de 1 a %d e: %d\n", numero, soma);

    return 0;
}