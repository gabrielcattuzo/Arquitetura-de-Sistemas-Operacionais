#include <stdio.h>

int main() 
{
    int numero;

    printf("Digite um numero inteiro: ");
    scanf("%d", &numero);

    if (numero > 0) 
    {
        printf("O numero eh positivo\n");
    } 
    else 
    {
        printf("O numero nao eh positivo\n");
    }

    return 0;
}