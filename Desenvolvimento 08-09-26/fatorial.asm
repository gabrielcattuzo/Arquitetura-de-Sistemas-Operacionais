
.data
msg1:  .asciiz "\nDigite um numero: "
msg2:  .asciiz "\nFatorial: "
saida: .asciiz "\nPressione Enter para sair."

.text
.globl main

main:
    # Le o numero
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    # Calcula o fatorial
    jal fatorial
    move $s0, $v0

    # Imprime o resultado
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    # Espera Enter para sair
    li $v0, 4
    la $a0, saida
    syscall

esperar_enter:
    li $v0, 12
    syscall

    li $t0, 10
    bne $v0, $t0, esperar_enter

    li $v0, 10
    syscall


# Entrada: $a0 = n
# Saida:   $v0 = fatorial(n)

fatorial:
    slti $t0, $a0, 2
    bne $t0, $zero, caso_base

    addiu $sp, $sp, -8
    sw $a0, 0($sp)          # Salva n
    sw $ra, 4($sp)          # Salva retorno

    addiu $a0, $a0, -1
    jal fatorial

    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8

    mul $v0, $a0, $v0
    jr $ra

caso_base:
    li $v0, 1
    jr $ra