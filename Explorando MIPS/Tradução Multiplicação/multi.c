// Programa em C que realiza a multiplicação de dois números inteiros fornecidos pelo usuário.

#include <stdio.h>

int main() 
{
    
    int a, b, multi;

    printf("Digite um numero inteiro: ");
    scanf("%d", &a);

    printf("Digite outro numero inteiro: ");
    scanf("%d", &b);

    multi = a * b; // Realiza a multiplicação de dois numeros

    printf("A multiplicacao eh: %d\n", multi); 

    return 0;
}