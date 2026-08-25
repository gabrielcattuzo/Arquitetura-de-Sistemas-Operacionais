/* Desenvolvendo conversor de temperaturas em C*/
/* Apenas aceita inserir em Celsius, em breve poderá ser inserido qualquer unidade e converter ela para qualquer unidade*/

#include <stdio.h>

int main()
{
    int celsius, fahrenheit, kelvin;
    int opcao;

    printf("Digite a temperatura em Celsius: ");
    scanf("%d", &celsius);

    printf("\nEscolha a conversao:\n");
    printf("1 - Fahrenheit\n");
    printf("2 - Kelvin\n");
    printf("3 - Fahrenheit e Kelvin\n");
    printf("Digite a opcao desejada: ");
    scanf("%d", &opcao);

    switch (opcao)
    {
        case 1:
            fahrenheit = (celsius * 9) / 5 + 32;
            printf("Temperatura em Fahrenheit: %d\n", fahrenheit);
            break;

        case 2:
            kelvin = celsius + 273;
            printf("Temperatura em Kelvin: %d\n", kelvin);
            break;

        case 3:
            fahrenheit = (celsius * 9) / 5 + 32;
            kelvin = celsius + 273;

            printf("Temperatura em Fahrenheit: %d\n", fahrenheit);
            printf("Temperatura em Kelvin: %d\n", kelvin);
            break;

        default:
            printf("Opcao invalida!\n");
    }

    return 0;
}