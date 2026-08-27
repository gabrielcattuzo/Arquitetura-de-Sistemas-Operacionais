# Nome: Gabriel Cattuzo

# Abordagem 2: Basicamente, o usuário insere um numero, e ele deve inserir o mesmo numero novamente para acertar. 
# Diferente da Abordagem 2, o numero inserido é armazenado em um byte na memoria, e não em um registrador.

.data 

    msgdigite: .asciiz "Digite um numero entre 0 e 100: "
    msgtentativa: .asciiz "Digite novamente: "
    msgacertou: .asciiz "Parabens, voce acertou!"

    numero: .byte 1

.text 
.globl main 

main:

    # imprime msgdigite para o usuario digitar um numero
    li $v0, 4
    la $a0, msgdigite
    syscall

    # le o numero
    li $v0, 5
    syscall

    # armazena o numero digitado em $s0
    move $s0, $v0

    # armazena o numero em um byte na memoria
    sb $s0, numero

loop:

    # imprime msgtentativa
    li $v0, 4
    la $a0, msgtentativa 
    syscall

    # le o numero digitado
    li $v0, 5
    syscall

    # recupera o numero armazenado no byte
    lb $s1, numero

    # se for igual ao numero inicial, vai para acertou
    beq $v0, $s1, acertou

    # caso contrario, volta para o loop
    j loop

acertou:

    # imprime msgacertou 
    li $v0, 4
    la $a0, msgacertou
    syscall

    # encerra o programa
    li $v0, 10
    syscall