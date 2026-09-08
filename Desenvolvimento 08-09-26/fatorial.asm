.data
    msg1: .asciiz "\nDigite um numero: "
    msg2: .asciiz "\nFatorial: "

.text
.globl main

main:
    # Imprime mensagem
    li $v0, 4
    la $a0, msg1
    syscall

    # Le numero
    li $v0, 5
    syscall

    # Coloca o argumento da funcao em $a0
    move $a0, $v0

    # Chama fatorial
    jal fatorial

    # Resultado volta em $v0
    move $t0, $v0

    # Imprime mensagem
    li $v0, 4
    la $a0, msg2
    syscall

    # Imprime resultado
    li $v0, 1
    move $a0, $t0
    syscall

    # Encerra
    li $v0, 10
    syscall


fatorial:

    # Caso base:
    # if (n <= 1)
    ble $a0, 1, caso_base

    # Reserva 8 bytes na pilha
    addi $sp, $sp, -8

    # Salva o endereco de retorno
    sw $ra, 4($sp)

    # Salva o valor atual de n
    sw $a0, 0($sp)

    # n - 1
    addi $a0, $a0, -1

    # Chamada recursiva
    jal fatorial

    # Recupera n original
    lw $a0, 0($sp)

    # Recupera endereco de retorno
    lw $ra, 4($sp)

    # Libera espaco da pilha
    addi $sp, $sp, 8

    # resultado = n * fatorial(n - 1)
    mul $v0, $a0, $v0

    # Volta para quem chamou
    jr $ra


caso_base:

    li $v0, 1
    jr $ra