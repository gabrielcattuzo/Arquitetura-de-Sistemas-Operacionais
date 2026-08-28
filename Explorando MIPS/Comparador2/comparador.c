#include <stdio.h>

int main()
{
    int num1, num2, num3;

    printf("Este programa faz a leitura de tres numeros inteiros e determina qual o maior deles\n");

    printf("\nInsira o primeiro numero: ");
    scanf("%d", &num1);

    printf("\nInsira o segundo numero: ");
    scanf("%d", &num2);

    printf("\nInsira o terceiro numero: ");
    scanf("%d", &num3);

    if (num1 > num2)
    {

        if (num1 > num3)
        {

            printf("\nO maior numero eh %d", num1);

        }
        else

        {

            printf("\nO maior numero eh %d", num3);

        }
    }

    else

    {

        if (num2 > num3)

        {

            printf("\nO maior numero eh %d", num2);

        }

        else

        {

            printf("\nO maior numero eh %d", num3);

        }
        
    }

    return 0;
}