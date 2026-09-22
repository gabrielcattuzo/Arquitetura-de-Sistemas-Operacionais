.data
vetor: .space 48                  # Reserva espaço para 12 inteiros
msg:   .asciiz "Serie de Fibonacci: "   # Mensagem antes de imprimir a sequência

.text
.globl main

main:
    la $s0, vetor                 # s0 aponta para o começo do vetor
    li $s1, 0                     # s1 vai funcionar como indice i

preencher:
    bge $s1, 12, preparar_impressao   # Se i chegou em 12, para de preencher

    move $a0, $s1                 # Passa i como argumento da funcao
    jal fibonacci                 # Calcula fibonacci(i)

    sw $v0, 0($s0)                # Salva o resultado no vetor

    addiu $s0, $s0, 4             # Vai para a proxima posicao do vetor
    addiu $s1, $s1, 1             # Incrementa i
    j preencher                   # Volta para calcular o proximo termo

preparar_impressao:
    li $v0, 4                     # Syscall para imprimir string
    la $a0, msg                   # Carrega a mensagem
    syscall                       # Imprime a mensagem

    la $s0, vetor                 # Volta o ponteiro para o inicio do vetor
    li $s1, 0                     # Reinicia o indice

imprimir:
    bge $s1, 12, fim              # Se ja imprimiu os 12 valores, termina

    lw $a0, 0($s0)                # Carrega o valor atual do vetor
    li $v0, 1                     # Syscall para imprimir inteiro
    syscall                       # Imprime o numero

    li $v0, 11                    # Syscall para imprimir caractere
    li $a0, 32                    # 32 em ASCII representa espaco
    syscall                       # Imprime um espaco entre os numeros

    addiu $s0, $s0, 4             # Vai para o proximo elemento do vetor
    addiu $s1, $s1, 1             # Incrementa i
    j imprimir                    # Continua imprimindo

fim:
    li $v0, 11                    # Syscall para imprimir caractere
    li $a0, 10                    # 10 em ASCII representa quebra de linha
    syscall                       # Pula uma linha no final

    li $v0, 10                    # Syscall para encerrar o programa
    syscall

fibonacci:
    addiu $sp, $sp, -16           # Reserva espaco na pilha para esta chamada
    sw $ra, 12($sp)               # Salva o endereco de retorno
    sw $a0, 8($sp)                # Salva o valor atual de n

    beq $a0, $zero, caso_base     # Se n for 0, cai no caso base

    li $t0, 1                     # Coloca 1 em t0 para comparar
    beq $a0, $t0, caso_base       # Se n for 1, tambem e caso base

    addiu $a0, $a0, -1            # Prepara n - 1
    jal fibonacci                 # Calcula fibonacci(n - 1)

    sw $v0, 4($sp)                # Guarda o resultado de fib(n - 1)

    lw $a0, 8($sp)                # Recupera o n original
    addiu $a0, $a0, -2            # Prepara n - 2
    jal fibonacci                 # Calcula fibonacci(n - 2)

    lw $t0, 4($sp)                # Recupera fib(n - 1)
    addu $v0, $t0, $v0            # Soma fib(n - 1) com fib(n - 2)

    j retornar                    # Vai restaurar os dados antes de voltar

caso_base:
    move $v0, $a0                 # fib(0)=0 e fib(1)=1

retornar:
    lw $a0, 8($sp)                # Recupera o n salvo
    lw $ra, 12($sp)               # Recupera o endereco de retorno
    addiu $sp, $sp, 16            # Libera o espaco usado na pilha

    jr $ra                        # Volta para quem chamou a funcao