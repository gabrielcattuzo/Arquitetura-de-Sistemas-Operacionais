# Código Apresentado no slide 
# É declarado uma variável do tipo string e uma variável do tipo inteiro 
.data 

    minha_mensagem: .asciiz "Hello World!"
    meu_numero: .word 42 

# Seção de Código

.text
.globl main 

main:
    # Ele da jump para o label fim, que é onde o programa termina, sem sequer imprimir minha_mensagem
    j fim 
    li $v0, 4
    la $a0, minha_mensagem
    syscall

fim:

    # encerra o programa
    li $v0, 10
    syscall 