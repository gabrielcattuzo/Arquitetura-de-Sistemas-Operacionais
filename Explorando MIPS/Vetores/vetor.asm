# em desenvolvimento - inserir 5 numeros, calcular a media, qual o maior/menor e a soma de todos os elementos, no caso 5
.DATA
    msg1: .asciiz "\nDigite um numero: "
    msg2: .asciiz "\nA media dos numeros eh: "
    msg3: .asciiz "\nO maior numero eh: "
    msg4: .asciiz "\nO menor numero eh: "
    msg5: .asciiz "\nA soma dos numeros eh: "

    numeros: .space 20

.globl main
main:
    
    li $t0, 0          # Inicializa o índice do vetor
    la $t1, numeros    # Carrega o endereço do vetor

    # Loop para ler 5 números
    
    
    # Encerra o programa
    li $v0, 10
    syscall    
