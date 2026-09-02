#include <stdio.h>

int main (){

    int num, prod;

    printf("Digite um numero: ");
    scanf("%d", &num);

    prod = num * 2;

    printf("O dobro de %d eh %d\n", num, prod);

    return 0;
}