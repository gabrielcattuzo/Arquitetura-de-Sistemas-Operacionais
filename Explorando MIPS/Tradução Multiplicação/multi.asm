# programa para multiplicaçao de dois inteiros

.data
multi1: .asciiz "Digite um numero inteiro: " # mensagem para o usuário inserir o numero de entrada
multi2: .asciiz "Digite outro numero inteiro: " # mensagem para o usuario inserir o outro numero de entrada para multiplicação
saida: .asciiz "A multiplicacao eh: " # mensagem que acompanha a multiplicação sendo impressa
.text
.globl main

main:

    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4 
    la $a0, multi1
    syscall 

    # Lê o primeiro número
    li $v0, 5
    syscall
    move $t0, $v0

    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4 
    la $a0, multi2
    syscall 

    # Lê o segundo número
    li $v0, 5
    syscall
    move $t1, $v0

    # multi = a * b
    mul $t2, $t0, $t1

    # Exibe a mensagem com o resultado
    li $v0, 4  
    la $a0, saida
    syscall

    # Imprime o resultado da multiplicação
    li $v0, 1
    move $a0, $t2
    syscall

    # Encerra
    li $v0, 10
    syscall