.data
    msg1: .asciiz "Insira um numero para calcular o seu dobro: "
    msg2: .asciiz "O dobro do numero eh: "

.text
.globl main

main:
    # Exibe a mensagem pedindo para o usuario inserir um numero
    li $v0, 4 
    la $a0, msg1
    syscall 

    # Le o numero
    li $v0, 5
    syscall
    
    move $t0, $v0

    # Multiplica por 2
    sll $t1, $t0, 1

    # Exibe a mensagem com o resultado
    li $v0, 4  
    la $a0, msg2
    syscall

    # Imprime o resultado
    li $v0, 1
    move $a0, $t1
    syscall

    # Encerra
    li $v0, 10
    syscall