# Conversor de temperaturas em MIPS
# 1 - Celsius
# 2 - Fahrenheit
# 3 - Kelvin

.data

msgEntrada: .asciiz "Escolha a unidade da temperatura:\n1 - Celsius\n2 - Fahrenheit\n3 - Kelvin\nDigite a opcao desejada: "
msgTemperatura: .asciiz "\nDigite a temperatura: "
msgSaida: .asciiz "\nEscolha para qual unidade deseja converter:\n1 - Celsius\n2 - Fahrenheit\n3 - Kelvin\nDigite a opcao desejada: "

msgResultado: .asciiz "\nTemperatura convertida: "
msgInvalida: .asciiz "\nOpcao invalida!\n"

.text
.globl main

main:

    # Exibe menu da unidade de entrada
    li $v0, 4
    la $a0, msgEntrada
    syscall

    # Le a unidade de entrada
    li $v0, 5
    syscall
    move $t0, $v0

    # Verifica se entrada < 1
    li $t5, 1
    blt $t0, $t5, invalida

    # Verifica se entrada > 3
    li $t5, 3
    bgt $t0, $t5, invalida

    # Pede a temperatura
    li $v0, 4
    la $a0, msgTemperatura
    syscall

    # Le a temperatura
    li $v0, 5
    syscall
    move $t1, $v0

    # Exibe menu da unidade de saida
    li $v0, 4
    la $a0, msgSaida
    syscall

    # Le a unidade de saida
    li $v0, 5
    syscall
    move $t2, $v0

    # Verifica se saida < 1
    li $t5, 1
    blt $t2, $t5, invalida

    # Verifica se saida > 3
    li $t5, 3
    bgt $t2, $t5, invalida


    # Verifica a unidade de entrada
    li $t5, 1
    beq $t0, $t5, entradaCelsius

    li $t5, 2
    beq $t0, $t5, entradaFahrenheit

    li $t5, 3
    beq $t0, $t5, entradaKelvin


entradaCelsius:

    # Celsius -> Celsius
    li $t5, 1
    beq $t2, $t5, manterTemperatura

    # Celsius -> Fahrenheit
    li $t5, 2
    beq $t2, $t5, celsiusFahrenheit

    # Celsius -> Kelvin
    li $t5, 3
    beq $t2, $t5, celsiusKelvin


entradaFahrenheit:

    # Fahrenheit -> Celsius
    li $t5, 1
    beq $t2, $t5, fahrenheitCelsius

    # Fahrenheit -> Fahrenheit
    li $t5, 2
    beq $t2, $t5, manterTemperatura

    # Fahrenheit -> Kelvin
    li $t5, 3
    beq $t2, $t5, fahrenheitKelvin


entradaKelvin:

    # Kelvin -> Celsius
    li $t5, 1
    beq $t2, $t5, kelvinCelsius

    # Kelvin -> Fahrenheit
    li $t5, 2
    beq $t2, $t5, kelvinFahrenheit

    # Kelvin -> Kelvin
    li $t5, 3
    beq $t2, $t5, manterTemperatura


manterTemperatura:

    move $t3, $t1

    j imprimir


celsiusFahrenheit:

    # resultado = (temperatura * 9) / 5 + 32

    li $t4, 9
    mul $t3, $t1, $t4

    li $t4, 5
    div $t3, $t4
    mflo $t3

    addi $t3, $t3, 32

    j imprimir


celsiusKelvin:

    # resultado = temperatura + 273

    addi $t3, $t1, 273

    j imprimir


fahrenheitCelsius:

    # resultado = (temperatura - 32) * 5 / 9

    addi $t3, $t1, -32

    li $t4, 5
    mul $t3, $t3, $t4

    li $t4, 9
    div $t3, $t4
    mflo $t3

    j imprimir


fahrenheitKelvin:

    # resultado = (temperatura - 32) * 5 / 9 + 273

    addi $t3, $t1, -32

    li $t4, 5
    mul $t3, $t3, $t4

    li $t4, 9
    div $t3, $t4
    mflo $t3

    addi $t3, $t3, 273

    j imprimir


kelvinCelsius:

    # resultado = temperatura - 273

    addi $t3, $t1, -273

    j imprimir


kelvinFahrenheit:

    # resultado = (temperatura - 273) * 9 / 5 + 32

    addi $t3, $t1, -273

    li $t4, 9
    mul $t3, $t3, $t4

    li $t4, 5
    div $t3, $t4
    mflo $t3

    addi $t3, $t3, 32

    j imprimir


imprimir:

    # Imprime mensagem
    li $v0, 4
    la $a0, msgResultado
    syscall

    # Imprime resultado
    li $v0, 1
    move $a0, $t3
    syscall

    j fim


invalida:

    li $v0, 4
    la $a0, msgInvalida
    syscall


fim:

    li $v0, 10
    syscall