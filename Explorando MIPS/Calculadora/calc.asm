# Calculadora em MIPS

.data

menu: .asciiz "\nEscolha a operacao:\n1 - Adicao\n2 - Subtracao\n3 - Multiplicacao\n4 - Divisao\n0 - Sair\n"
msgOperacao: .asciiz "Digite o numero da operacao desejada: "
msgA: .asciiz "\nInsira o primeiro operando: "
msgB: .asciiz "Insira o segundo operando: "
msgResultado: .asciiz "\nResultado: "
msgInvalida: .asciiz "\nOperacao invalida!\n"
msgDivZero: .asciiz "\nErro: Divisao por zero!\n"
msgSaida: .asciiz "\nSaindo da calculadora.\n"

.text
.globl main

main:

inicio:

    # Imprime o menu
    li $v0, 4
    la $a0, menu
    syscall

    # Pede a operacao
    li $v0, 4
    la $a0, msgOperacao
    syscall

    # Le a operacao
    li $v0, 5
    syscall
    move $t0, $v0

    # Se operacao == 0, sai
    beq $t0, $zero, sair

    # Verifica se operacao < 1
    li $t4, 1
    blt $t0, $t4, invalida

    # Verifica se operacao > 4
    li $t4, 4
    bgt $t0, $t4, invalida

    # Pede o primeiro operando
    li $v0, 4
    la $a0, msgA
    syscall

    # Le o primeiro operando
    li $v0, 5
    syscall
    move $t1, $v0

    # Pede o segundo operando
    li $v0, 4
    la $a0, msgB
    syscall

    # Le o segundo operando
    li $v0, 5
    syscall
    move $t2, $v0

    # Equivalente ao switch

    li $t4, 1
    beq $t0, $t4, adicao

    li $t4, 2
    beq $t0, $t4, subtracao

    li $t4, 3
    beq $t0, $t4, multiplicacao

    li $t4, 4
    beq $t0, $t4, divisao


adicao:

    add $t3, $t1, $t2
    j imprimirResultado


subtracao:

    sub $t3, $t1, $t2
    j imprimirResultado


multiplicacao:

    mul $t3, $t1, $t2
    j imprimirResultado


divisao:

    # Verifica divisao por zero
    beq $t2, $zero, divisaoZero

    div $t1, $t2
    mflo $t3

    j imprimirResultado


imprimirResultado:

    # Imprime "Resultado: "
    li $v0, 4
    la $a0, msgResultado
    syscall

    # Imprime o resultado
    li $v0, 1
    move $a0, $t3
    syscall

    # Volta para o menu
    j inicio


divisaoZero:

    li $v0, 4
    la $a0, msgDivZero
    syscall

    j inicio


invalida:

    li $v0, 4
    la $a0, msgInvalida
    syscall

    j inicio


sair:

    li $v0, 4
    la $a0, msgSaida
    syscall

    # Encerra o programa
    li $v0, 10
    syscall