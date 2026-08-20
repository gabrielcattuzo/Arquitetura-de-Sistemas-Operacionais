# programa para soma de dois numeros inteiros

.data
soma1: .asciiz "Digite um numero inteiro: " # mensagem para o usuário inserir o numero de entrada
soma2: .asciiz "Digite outro numero inteiro: " # mensagem para o usuario inserir o outro numero de entrada para soma
saida: .asciiz "A soma eh: " # mensagem que acompanha a soma sendo impressa
.text
.globl main

main:

    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4 
    la $a0, soma1
    syscall 

    # Lê o primeiro número
    li $v0, 5
    syscall
    move $t0, $v0

    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4 
    la $a0, soma2
    syscall 

    # Lê o segundo número
    li $v0, 5
    syscall
    move $t1, $v0

    # soma = a + b
    add $t2, $t0, $t1

    # Exibe a mensagem com o resultado
    li $v0, 4  
    la $a0, saida
    syscall

    # Imprime a soma
    li $v0, 1
    move $a0, $t2
    syscall

    # Encerra
    li $v0, 10
    syscall