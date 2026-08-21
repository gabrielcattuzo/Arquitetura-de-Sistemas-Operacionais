# Programa que verifica se um numero eh positivo

.data
entrada: .asciiz "Digite um numero inteiro: "
positivo: .asciiz "O numero eh positivo\n"
naoPositivo: .asciiz "O numero nao eh positivo\n"

.text
.globl main

main:

    # Exibe a mensagem de entrada
    li $v0, 4
    la $a0, entrada
    syscall

    # Le o numero inteiro
    li $v0, 5
    syscall
    move $t0, $v0

    # Se numero > 0, vai para positivo
    bgt $t0, $zero, ehPositivo

    # Caso contrario, imprime que nao eh positivo
    li $v0, 4
    la $a0, naoPositivo
    syscall

    # Pula para o final
    j fim

ehPositivo:

    # Imprime que o numero eh positivo
    li $v0, 4
    la $a0, positivo
    syscall

fim:

    # Encerra o programa
    li $v0, 10
    syscall