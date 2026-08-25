# Nome: Gabriel Cattuzo

# Abordagem 1: Basicamente, o usuário insere um numero, e ele deve inserir o mesmo numero novamente para acertar.
# O numero inserido é armazenado em um registrador, e não em um byte na memoria.

.data 

    msgdigite: .asciiz "Digite um numero entre 0 e 100: "
    msgtentativa: .asciiz "Digite novamente: "
    msgacertou: .asciiz "Parabens, voce acertou!"

.text 
.globl main 

main:

    # imprime msgdigite para o usuário digitar um numero
    li $v0, 4
    la $a0, msgdigite
    syscall

    # lê o numero
    li $v0, 5
    syscall

    # armazena o numero digitado em $t0
    move $t0, $v0

loop:

    # imprime msgtentativa para o usuário inserir um numero novamente
    li $v0, 4
    la $a0, msgtentativa 
    syscall

    # lê o numero digitado
    li $v0, 5
    syscall

    # se for igual ao numero digitado inicialmente, vai para acertou
    beq $v0, $t0, acertou
    # caso contrário, volta para o loop
    j loop

acertou:

    # imprime msgacertou 
    li $v0, 4
    la $a0, msgacertou
    syscall

    # encerra o programa
    li $v0, 10
    syscall