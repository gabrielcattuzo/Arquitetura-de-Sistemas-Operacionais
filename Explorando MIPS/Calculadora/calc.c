/* Calculadora em C */

#include <stdio.h>

int main()
{
    int a, b;
    int operacao;

    while (1)
    {
        printf("\nEscolha a operacao:\n");
        printf("1 - Adicao\n");
        printf("2 - Subtracao\n");
        printf("3 - Multiplicacao\n");
        printf("4 - Divisao\n");
        printf("0 - Sair\n");

        printf("Digite o numero da operacao desejada: ");
        scanf("%d", &operacao);

        /* Encerra a calculadora */
        if (operacao == 0)
        {
            printf("\nSaindo da calculadora.\n");
            break;
        }

        /* Verifica se a operacao existe */
        if (operacao < 1 || operacao > 4)
        {
            printf("\nOperacao invalida!\n");
            continue;
        }

        /* Le os operandos */
        printf("\nInsira o primeiro operando: ");
        scanf("%d", &a);

        printf("Insira o segundo operando: ");
        scanf("%d", &b);

        /* Realiza a operacao escolhida */
        switch (operacao)
        {
            case 1:
                printf("\nResultado: %d\n", a + b);
                break;

            case 2:
                printf("\nResultado: %d\n", a - b);
                break;

            case 3:
                printf("\nResultado: %d\n", a * b);
                break;

            case 4:
                if (b != 0)
                    printf("\nResultado: %d\n", a / b);
                else
                    printf("\nErro: Divisao por zero!\n");
                break;
        }
    }

    return 0;
}