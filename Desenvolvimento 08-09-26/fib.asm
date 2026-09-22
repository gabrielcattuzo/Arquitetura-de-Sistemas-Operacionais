# Nome: Gabriel Cattuzo
# RA: 24015324
# Lab03 - Fibonacci recursivo

.data
vetor: .space 48
msg:   .asciiz "Serie de Fibonacci: "

.text
.globl main

main:
    la $s0, vetor           # Ponteiro para o vetor
    li $s1, 0               # i = 0

preencher:
    bge $s1, 12, preparar_impressao

    move $a0, $s1 
    jal fibonacci

    sw $v0, 0($s0)

    addiu $s0, $s0, 4       # Proxima posicao
    addiu $s1, $s1, 1       # i++
    j preencher

preparar_impressao:
    li $v0, 4
    la $a0, msg
    syscall

    la $s0, vetor
    li $s1, 0

imprimir:
    bge $s1, 12, fim

    lw $a0, 0($s0)
    li $v0, 1
    syscall

    li $v0, 11
    li $a0, 32
    syscall

    addiu $s0, $s0, 4
    addiu $s1, $s1, 1
    j imprimir

fim:
    li $v0, 11
    li $a0, 10
    syscall

    li $v0, 10
    syscall


# fibonacci
# Entrada: $a0 = n
# Saida:   $v0 = fibonacci(n)

fibonacci:
    addiu $sp, $sp, -16
    sw $ra, 12($sp)         # Salva o endereco de retorno
    sw $a0, 8($sp)          # Salva n

    beq $a0, $zero, caso_base

    li $t0, 1
    beq $a0, $t0, caso_base

    addiu $a0, $a0, -1
    jal fibonacci

    sw $v0, 4($sp)          # Guarda fib(n - 1)

    lw $a0, 8($sp)
    addiu $a0, $a0, -2
    jal fibonacci

    lw $t0, 4($sp)
    addu $v0, $t0, $v0      # fib(n-1) + fib(n-2)

    j retornar

caso_base:
    move $v0, $a0

retornar:
    lw $a0, 8($sp)
    lw $ra, 12($sp)
    addiu $sp, $sp, 16

    jr $ra