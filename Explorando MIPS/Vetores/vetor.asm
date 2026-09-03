.data
    msgDigite: .asciiz "Digite um numero: "
    msgMaior:  .asciiz "\nMaior numero: "
    msgMenor:  .asciiz "\nMenor numero: "
    msgSoma:   .asciiz "\nSoma dos numeros: "
    msgMedia:  .asciiz "\nMedia dos numeros: "

    numeros: .space 20

.text
.globl main

main:

    # $t0 = indice
    # $t1 = endereco atual do vetor
    # $t2 = valor lido
    # $t3 = maior
    # $t4 = menor
    # $t5 = soma
    # $t6 = valor atual do vetor
    # $t7 = auxiliar para media

    li $t0, 0
    la $t1, numeros

leitura:

    # Se i >= 5, termina a leitura
    bge $t0, 5, preparar_calculos

    # Mostra mensagem
    li $v0, 4
    la $a0, msgDigite
    syscall

    # Le inteiro
    li $v0, 5
    syscall

    move $t2, $v0

    # Salva o numero no vetor
    sw $t2, 0($t1)

    # Avanca para o proximo elemento
    addi $t1, $t1, 4

    # i++
    addi $t0, $t0, 1

    j leitura


preparar_calculos:

    # Volta para o inicio do vetor
    la $t1, numeros

    # Pega numeros[0]
    lw $t3, 0($t1)

    # maior = numeros[0]
    # menor = numeros[0]
    move $t4, $t3

    # soma = 0
    li $t5, 0

    # indice = 0
    li $t0, 0


calculos:

    # Se i >= 5, terminou
    bge $t0, 5, resultados

    # Carrega numeros[i]
    lw $t6, 0($t1)

    # soma = soma + numeros[i]
    add $t5, $t5, $t6

    # Se numeros[i] > maior
    bgt $t6, $t3, novoMaior

verificaMenor:

    # Se numeros[i] < menor
    blt $t6, $t4, novoMenor

continua:

    # Proximo endereco do vetor
    addi $t1, $t1, 4

    # i++
    addi $t0, $t0, 1

    j calculos


novoMaior:

    move $t3, $t6
    j verificaMenor


novoMenor:

    move $t4, $t6
    j continua


resultados:

    # Imprime maior
    li $v0, 4
    la $a0, msgMaior
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Imprime menor
    li $v0, 4
    la $a0, msgMenor
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    # Imprime soma
    li $v0, 4
    la $a0, msgSoma
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Calcula media inteira
    li $t7, 5
    div $t5, $t7
    mflo $t7

    # Imprime media
    li $v0, 4
    la $a0, msgMedia
    syscall

    li $v0, 1
    move $a0, $t7
    syscall

    # Encerra
    li $v0, 10
    syscall