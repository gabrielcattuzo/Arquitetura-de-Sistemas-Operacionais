.data
msg1:  .asciiz "\nDigite um numero: "          # Mensagem para pedir o numero
msg2:  .asciiz "\nFatorial: "                  # Mensagem antes do resultado
saida: .asciiz "\nPressione Enter para sair."  # Mensagem final

.text
.globl main

main:
    li $v0, 4                     # Syscall para imprimir string
    la $a0, msg1                  # Carrega a mensagem de entrada
    syscall                       # Mostra "Digite um numero"

    li $v0, 5                     # Syscall para ler inteiro
    syscall                       # Le o numero digitado
    move $a0, $v0                 # Passa o numero como argumento da funcao

    jal fatorial                  # Chama a funcao fatorial
    move $s0, $v0                 # Guarda o resultado retornado

    li $v0, 4                     # Syscall para imprimir string
    la $a0, msg2                  # Carrega a mensagem do resultado
    syscall                       # Mostra "Fatorial:"

    li $v0, 1                     # Syscall para imprimir inteiro
    move $a0, $s0                 # Passa o resultado para impressao
    syscall                       # Imprime o fatorial

    li $v0, 4                     # Syscall para imprimir string
    la $a0, saida                 # Carrega a mensagem para sair
    syscall                       # Mostra "Pressione Enter para sair"

esperar_enter:
    li $v0, 12                    # Syscall para ler um caractere
    syscall                       # Le o caractere digitado

    li $t0, 10                    # 10 em ASCII representa Enter
    bne $v0, $t0, esperar_enter   # Continua esperando enquanto nao for Enter

    li $v0, 10                    # Syscall para encerrar o programa
    syscall


# Entrada: $a0 = n
# Saida:   $v0 = fatorial(n)

fatorial:
    slti $t0, $a0, 2             # Verifica se n e menor que 2
    bne $t0, $zero, caso_base     # Se for 0 ou 1, vai para o caso base

    addiu $sp, $sp, -8            # Reserva 8 bytes na pilha
    sw $a0, 0($sp)                # Salva o valor atual de n
    sw $ra, 4($sp)                # Salva o endereco de retorno

    addiu $a0, $a0, -1            # Prepara n - 1
    jal fatorial                  # Calcula fatorial(n - 1)

    lw $a0, 0($sp)                # Recupera o n original
    lw $ra, 4($sp)                # Recupera o endereco de retorno
    addiu $sp, $sp, 8             # Libera o espaco usado na pilha

    mul $v0, $a0, $v0             # Multiplica n por fatorial(n - 1)
    jr $ra                        # Volta para quem chamou a funcao

caso_base:
    li $v0, 1                     # fatorial(0) e fatorial(1) valem 1
    jr $ra                        # Retorna para a chamada anterior