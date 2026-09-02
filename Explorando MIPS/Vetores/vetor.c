#include <stdio.h>
#include <locale.h>
#include <windows.h>

int main ()
{
    /* Configura a localidade para UTF-8 */ 
    setlocale(LC_ALL, ".UTF-8");
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);

    /* Variaveis declaradas*/
    int numeros[5];
    int maior, menor, soma = 0;
    float media;

    /*LOOP PRO USUARIO INSERIR 5 NUMEROS*/
    for (int i = 0; i < 5; i++)
    {
        printf("Digite o %dº numero: ", i + 1);
        scanf("%d", &numeros[i]);
    }

    /* Seto que o maior e o menor é 0 para percorrer todo o vetor */    
    maior = numeros[0];
    menor = numeros[0];

    /*LOOP PARA CALCULAR MAIOR, MENOR E SOMA*/
    for (int i=0; i<5;i++)
    {
        soma = soma + numeros[i];

        /* Verifica se o número atual é maior que o maior encontrado até agora */
        if (numeros[i] > maior)
        {
            maior = numeros[i];
        }

        /* Verifica se o número atual é menor que o menor encontrado até agora */
        if (numeros[i] < menor)
        {
            menor = numeros[i];
        }
    }

    /*Calculo de Média*/
    media = (float)soma / 5;

    /*Impressão de maior, menor, soma e média*/
    printf("\nMaior numero: %d\n", maior);
    printf("Menor numero: %d\n", menor);
    printf("Soma dos numeros: %d\n", soma);
    printf("Media dos numeros: %.2f\n", media);

    return 0;
}