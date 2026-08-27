.DATA
    msg1: .asciiz "\nInsira uma nota: "
    msg2: .asciiz "\nInsira outra nota: "
    msg3: .asciiz "\nA media das notas e: "
    msg4: .asciiz "\nVocê foi aprovado!"
    msg5: .asciiz "\nVocê foi reprovado!"

.text
.globl main

main:

    li $v0, 4          # syscall para imprimir string
    la $a0, msg1       # carregar endereço da primeira mensagem
    syscall             # chamar syscall para imprimir

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t2, $t0, $t1

    li $t3, 2
    div $t2, $t3    
    mflo $t2

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $t3, 5
    bge $t2, $t3, aprovado

    li $v0, 4
    la $a0, msg5
    syscall
    j fim

    aprovado:
    
    li $v0, 4
    la $a0, msg4
    syscall

    fim:

    li $v0, 10
    syscall 