# Conversor de temperaturas em MIPS desenvolvendo
# 1 - Celsius
# 2 - Fahrenheit
# 3 - Kelvin

.data
# Mensagens para serem impressas
msgEntrada: .asciiz "Escolha a unidade da temperatura:\n1 - Celsius\n2 - Fahrenheit\n3 - Kelvin\nDigite a opcao desejada: "
msgTemperatura: .asciiz "\nDigite a temperatura: "
msgSaida: .asciiz "\nEscolha para qual unidade deseja converter:\n1 - Celsius\n2 - Fahrenheit\n3 - Kelvin\nDigite a opcao desejada: "

msgResultado: .asciiz "\nTemperatura convertida: "
msgInvalida: .asciiz "\nOpcao invalida!\n"

.text
.globl main

 # Encerra o programa
    li $v0, 10
    syscall