# verifica se o numero eh par ou impar usando a instrução mfhi - armazena o resto de um div
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
    div $t0, $t0, 2   # Divide o numero por 2
    mfhi $t1          # Move o resto da divisao para $t1

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