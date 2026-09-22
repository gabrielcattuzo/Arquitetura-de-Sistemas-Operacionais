.data
msg: .asciiz "Serie de Fibonacci: "

.text
.globl main

main:
    # Imprime a mensagem
    li $v0, 4
    la $a0, msg
    syscall

    li $t0, 0          
    li $t1, 1          
    li $t2, 12          

loop:
    # Imprime anterior
    li $v0, 1
    move $a0, $t0
    syscall

    # Imprime um espaco
    li $v0, 11
    li $a0, 32
    syscall

    # Calcula e atualiza os numeros
    addu $t3, $t0, $t1   # proximo = anterior + atual
    move $t0, $t1       # anterior = atual
    move $t1, $t3       # atual = proximo

    # Reduz o contador e repete enquanto nao for zero
    addiu $t2, $t2, -1
    bnez $t2, loop
    nop

    # Encerra o programa
    li $v0, 10
    syscall