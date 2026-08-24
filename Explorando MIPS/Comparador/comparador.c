#include <stdio.h>

int main() 
{
    int a, b;

    printf("Digite o primeiro numero: ");
    scanf("%d", &a);

    printf("Digite o segundo numero: ");
    scanf("%d", &b);


    if (a == b) 
    {
        printf("Os numeros sao iguais: %d\n", a);
    } 
    
    if (a > b) 
    {
        printf("O maior numero eh: %d\n", a);
    } 
    else 
    {
        printf("O maior numero eh: %d\n", b);
    }

    return 0;
}