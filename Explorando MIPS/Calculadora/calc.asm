# Calculadora em MIPS Assembly.. Desenvolvendo
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

 # Encerra o programa
    li $v0, 10
    syscall