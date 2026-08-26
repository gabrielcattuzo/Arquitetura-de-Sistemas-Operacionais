/* Desenvolvendo conversor de temperaturas em C */

#include <stdio.h>

int main()
{
    int temperatura, resultado;
    int entrada, saida;

    /* Escolhe a unidade da temperatura inserida */
    printf("Escolha a unidade da temperatura:\n");
    printf("1 - Celsius\n");
    printf("2 - Fahrenheit\n");
    printf("3 - Kelvin\n");
    printf("Digite a opcao desejada: ");
    scanf("%d", &entrada);

    /* Verifica se a unidade de entrada eh valida */
    if (entrada < 1 || entrada > 3)
    {
        printf("Opcao invalida!\n");
        return 0;
    }

    /* Le a temperatura */
    printf("\nDigite a temperatura: ");
    scanf("%d", &temperatura);

    /* Escolhe a unidade de saida */
    printf("\nEscolha para qual unidade deseja converter:\n");
    printf("1 - Celsius\n");
    printf("2 - Fahrenheit\n");
    printf("3 - Kelvin\n");
    printf("Digite a opcao desejada: ");
    scanf("%d", &saida);

    /* Verifica se a unidade de saida eh valida */
    if (saida < 1 || saida > 3)
    {
        printf("Opcao invalida!\n");
        return 0;
    }

    switch (entrada)
    {
        /* Entrada em Celsius */
        case 1:

            if (saida == 1)
                resultado = temperatura;

            else if (saida == 2)
                resultado = (temperatura * 9) / 5 + 32;

            else
                resultado = temperatura + 273;

            break;


        /* Entrada em Fahrenheit */
        case 2:

            if (saida == 1)
                resultado = (temperatura - 32) * 5 / 9;

            else if (saida == 2)
                resultado = temperatura;

            else
                resultado = (temperatura - 32) * 5 / 9 + 273;

            break;


        /* Entrada em Kelvin */
        case 3:

            if (saida == 1)
                resultado = temperatura - 273;

            else if (saida == 2)
                resultado = (temperatura - 273) * 9 / 5 + 32;

            else
                resultado = temperatura;

            break;
    }

    /* Exibe o resultado */
    printf("\nTemperatura convertida: %d\n", resultado);

    return 0;
}