# Nome: Gabriel Cattuzo
# RA: 24015324
# Turma: 01

.data
entrada: .asciiz "Digite um numero: " # mensagem para o usuário inserir o numero de entrada
saida:    .asciiz "Numero digitado: " # mensagem que acompanha o numero inserido sendo impresso

.text
.globl main

main:
    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4 
    la $a0, entrada 
    syscall 

    # Leitura do numero inteiro inserido
    li $v0, 5 
    syscall 

    # Salva o numero inserido pelo usuário
    move $t0, $v0

    # Exibe a mensagem de saida do programa 
    li $v0, 4
    la $a0, saida
    syscall

    # Exibe o numero digitado
    li $v0, 1
    move $a0, $t0
    syscall

    # Encerra o programa 
    li $v0, 10 
    syscall