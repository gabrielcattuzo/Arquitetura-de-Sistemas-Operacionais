# Compara dois numeros inteiros

.data
msg1:       .asciiz "Digite o primeiro numero: "
msg2:       .asciiz "Digite o segundo numero: "
iguais:     .asciiz "Os numeros sao iguais.\n"
primeiro:   .asciiz "O primeiro numero eh maior.\n"
segundo:    .asciiz "O segundo numero eh maior.\n"

.text
.globl main

main:

    # Pede o primeiro numero
    li $v0, 4
    la $a0, msg1
    syscall

    # Le o primeiro numero
    li $v0, 5
    syscall
    move $t0, $v0

    # Pede o segundo numero
    li $v0, 4
    la $a0, msg2
    syscall

    # Le o segundo numero
    li $v0, 5
    syscall
    move $t1, $v0

    # Verifica se os numeros sao iguais
    beq $t0, $t1, numerosIguais

    # Verifica se o primeiro eh maior
    bgt $t0, $t1, primeiroMaior

    # Se nao eh igual e o primeiro nao eh maior,
    # entao o segundo eh maior

segundoMaior:

    li $v0, 4
    la $a0, segundo
    syscall

    j fim

primeiroMaior:

    li $v0, 4
    la $a0, primeiro
    syscall

    j fim

numerosIguais:

    li $v0, 4
    la $a0, iguais
    syscall

fim:

    li $v0, 10
    syscall