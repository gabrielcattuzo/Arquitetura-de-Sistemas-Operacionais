/* Teste se o numero é par ou impar através do resto*/

#include <stdio.h>

int main ()
{
    
    int numero;
    printf("Digite um numero: ");
    scanf("%d", &numero);

    if (numero % 2 == 0)
    {
        printf("O numero %d eh par. \n", numero);  
    }
    else 
    {
        printf("O numero %d eh impar. \n", numero);
    }
}