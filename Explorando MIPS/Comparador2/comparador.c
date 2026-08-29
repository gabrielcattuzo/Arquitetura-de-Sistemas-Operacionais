#include <stdio.h>

int main()
{
    int num1, num2, num3, maior;

    printf("Este programa faz a leitura de tres numeros inteiros e determina qual o maior deles\n");

    printf("\nInsira o primeiro numero: ");
    scanf("%d", &num1);

    printf("\nInsira o segundo numero: ");
    scanf("%d", &num2);

    printf("\nInsira o terceiro numero: ");
    scanf("%d", &num3);

    maior = num1;

    if (num2 > maior)
    {
        maior = num2;
    }

    if (num3 > maior)
    {
        maior = num3;
    }

    if (num1 == maior && num2 == maior && num3 == maior)

    {

        printf("\nOs tres numeros empataram em %d", maior);

    }

    else if (num1 == maior && num2 == maior)

    {

        printf("\nO primeiro e o segundo numero empataram em %d", maior);

    }

    else if (num1 == maior && num3 == maior)

    {

        printf("\nO primeiro e o terceiro numero empataram em %d", maior);

    }

    else if (num2 == maior && num3 == maior)

    {

        printf("\nO segundo e o terceiro numero empataram em %d", maior);

    }

    else

    {

        printf("\nO maior numero eh %d", maior);

    }

    return 0;
}