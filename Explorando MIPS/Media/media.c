#include <stdio.h>

int main ()
{
    float nota1, nota2, media;


    printf("Programa para calcular a media de duas notas\n");
    /* Le as notas */
    printf("Digite a primeira nota: ");
    scanf("%f", &nota1);

    printf("Digite a segunda nota: ");
    scanf("%f", &nota2);

    /* Calcula a media */
    
    media = (nota1 + nota2)/2;

    if (media >= 5)
    {
        printf("Aprovado! Media: %.2f\n", media);
    }
    else
    {
        printf("Reprovado! Media: %.2f\n", media);
    }
    return 0;
}