#include <stdio.h>

int main ()
{
    int a, b;

    printf("Digite um numero: ");
    scanf("%d", &a);

    while (1)
    {
        printf("Digite outro numero: ");
        scanf("%d", &b);
        
        if (b == a)
        {
            printf("Parabens! Voce acertou o numero!\n");
            break;
        }
        else
        {
            printf("Tente novamente!\n");
        }
    }
}