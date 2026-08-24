## programa que pega o numero digitado e verifica se ele eh par ou impar

.DATA

msg1: .asciiz "Digite um numero inteiro: "
par: .asciiz "O numero eh par.\n"
impar: .asciiz "O numero eh impar.\n"

.text
.globl main

main:

    # Exibe a mensagem de entrada
    li $v0, 4
    la $a0, msg1
    syscall

    # Le o numero inteiro
    li $v0, 5
    syscall
    move $t0, $v0

    # Verifica se o numero eh par ou impar
    andi $t1, $t0, 1   # Faz uma AND bit a bit com 1 para verificar o bit menos significativo

    beqz $t1, ehPar     # Se o resultado for zero, o numero eh par

    # Caso contrario, imprime que eh impar
    li $v0, 4
    la $a0, impar
    syscall

    j fim

    ehPar:

    # Imprime que o numero eh par
    li $v0, 4
    la $a0, par
    syscall

    fim:

    # Encerra o programa
    li $v0, 10
    syscall