// Programa em C que realiza a soma de dois números inteiros fornecidos pelo usuário.

#include <stdio.h>
#include <locale.h>

int main() {
    
    setlocale(LC_ALL, "Portuguese");

    int a, b, soma;

    printf("Digite um numero inteiro: ");
    scanf("%d", &a);

    printf("Digite outro numero inteiro: ");
    scanf("%d", &b);

    soma = a + b; // Realiza a soma dos dois números

    printf("A soma eh: %d\n", soma); 

    return 0;
}