# 🔢 Entrada e Saída de Inteiro em Assembly MIPS

Programa desenvolvido em **Assembly MIPS** para demonstrar operações básicas de **entrada e saída de dados** utilizando chamadas de sistema (`syscall`).

O programa solicita que o usuário digite um número inteiro, armazena o valor informado em um registrador e, em seguida, exibe o mesmo número na tela.

---

## 🎯 Objetivo

O objetivo deste exercício é introduzir conceitos básicos da linguagem **Assembly MIPS**, incluindo:

* Utilização dos segmentos `.data` e `.text`;
* Declaração e utilização de strings;
* Uso de registradores;
* Entrada de números inteiros;
* Impressão de strings e números;
* Utilização de chamadas de sistema (`syscall`);
* Movimentação de valores entre registradores.

---

## ⚙️ Funcionamento

O programa executa as seguintes etapas:

1. Exibe uma mensagem solicitando um número inteiro.
2. Aguarda a entrada do usuário.
3. Armazena o número digitado no registrador `$t0`.
4. Exibe uma mensagem de saída.
5. Imprime o número informado pelo usuário.
6. Encerra a execução.

---

## 💻 Código

```asm id="h6cpvo"
.data

entrada: .asciiz "Digite um numero: "
saida:   .asciiz "Numero digitado: "

.text
.globl main

main:
    # Exibe a mensagem pedindo para o usuário inserir um número
    li $v0, 4
    la $a0, entrada
    syscall

    # Leitura do número inteiro inserido
    li $v0, 5
    syscall

    # Salva o número inserido pelo usuário
    move $t0, $v0

    # Exibe a mensagem de saída do programa
    li $v0, 4
    la $a0, saida
    syscall

    # Exibe o número digitado
    li $v0, 1
    move $a0, $t0
    syscall

    # Encerra o programa
    li $v0, 10
    syscall
```

---

## 🧠 Registradores Utilizados

Durante a execução são utilizados três registradores principais:

| Registrador | Função                                                           |
| ----------- | ---------------------------------------------------------------- |
| `$v0`       | Define o código da chamada de sistema e recebe o número digitado |
| `$a0`       | Armazena o argumento utilizado pelas chamadas de impressão       |
| `$t0`       | Armazena temporariamente o número informado pelo usuário         |

### `$v0`

O registrador `$v0` é utilizado para indicar qual chamada de sistema deve ser executada.

Por exemplo:

```asm id="v1rmbe"
li $v0, 5
syscall
```

Nesse caso, o código `5` indica que o programa deve realizar a leitura de um número inteiro.

Após a leitura, o valor informado pelo usuário também é retornado através de `$v0`.

---

### `$a0`

O registrador `$a0` é utilizado para passar argumentos para determinadas chamadas de sistema.

Para imprimir uma string:

```asm id="1n1vrx"
li $v0, 4
la $a0, entrada
syscall
```

O endereço da string `entrada` é carregado em `$a0`.

Para imprimir um número inteiro:

```asm id="26m2da"
li $v0, 1
move $a0, $t0
syscall
```

O número armazenado em `$t0` é copiado para `$a0` antes da chamada de sistema.

---

### `$t0`

O registrador `$t0` é utilizado como armazenamento temporário para preservar o número informado pelo usuário:

```asm id="kclb4y"
move $t0, $v0
```

Isso é necessário porque `$v0` será utilizado posteriormente para configurar outras chamadas de sistema.

---

## 📞 Syscalls Utilizadas

O programa utiliza quatro chamadas de sistema:

| Código | Operação      | Utilização                      |
| -----: | ------------- | ------------------------------- |
|    `1` | Print Integer | Exibe um número inteiro         |
|    `4` | Print String  | Exibe uma string                |
|    `5` | Read Integer  | Realiza a leitura de um inteiro |
|   `10` | Exit          | Encerra o programa              |

### Impressão de String

```asm id="rzm0ag"
li $v0, 4
la $a0, entrada
syscall
```

### Leitura de Inteiro

```asm id="v5jfg1"
li $v0, 5
syscall
```

### Impressão de Inteiro

```asm id="2srxb3"
li $v0, 1
move $a0, $t0
syscall
```

### Encerramento

```asm id="y5vubv"
li $v0, 10
syscall
```

---

## 🔄 Fluxo do Programa

```text id="mg2p4e"
        Início
           │
           ▼
┌──────────────────────┐
│ Exibe "Digite um     │
│ numero:"             │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ Aguarda entrada      │
│ do usuário           │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ Armazena número      │
│ em $t0               │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ Exibe "Numero        │
│ digitado:"           │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ Exibe o número       │
│ armazenado em $t0    │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ Encerra o programa   │
└──────────┬───────────┘
           │
           ▼
          Fim
```

---

## 🖥️ Exemplo de Execução

### Entrada

```text id="b5u0h8"
Digite um numero: 25
```

### Saída

```text id="1czewp"
Numero digitado: 25
```

A execução completa será semelhante a:

```text id="fxw46s"
Digite um numero: 25
Numero digitado: 25
```

O programa também aceita números negativos:

```text id="ay5sll"
Digite um numero: -15
Numero digitado: -15
```

---

## ▶️ Como Executar

O programa pode ser executado utilizando simuladores compatíveis com **Assembly MIPS**, como o **MARS**.

### 1. Abra o MARS

Inicie o **MARS MIPS Simulator**.

### 2. Abra o código

Acesse:

```text id="ybjbhq"
File → Open
```

Selecione o arquivo `.asm`.

### 3. Monte o programa

Acesse:

```text id="6xz1gv"
Run → Assemble
```

ou pressione:

```text id="kuzx7s"
F3
```

### 4. Execute

Acesse:

```text id="4h74qz"
Run → Go
```

ou pressione:

```text id="4udumz"
F5
```

### 5. Informe um número

Na área **Run I/O**, digite o número solicitado pelo programa.

O valor será lido, armazenado e exibido em seguida.

---

## 📚 Conceitos Trabalhados

Este exercício aborda conceitos fundamentais de programação em Assembly:

* Assembly MIPS;
* Registradores;
* Segmento de dados (`.data`);
* Segmento de código (`.text`);
* Strings com `.asciiz`;
* Instrução `li`;
* Instrução `la`;
* Instrução `move`;
* Entrada e saída;
* Chamadas de sistema;
* Armazenamento temporário de dados;
* Fluxo básico de execução de um programa.

---

## 🎓 Contexto

Este exercício faz parte dos estudos de **Assembly MIPS** realizados durante a disciplina de **Arquitetura de Sistemas Operacionais** do curso de Engenharia de Computação.

O código tem finalidade acadêmica e busca demonstrar de forma simples o funcionamento de registradores e chamadas de sistema na arquitetura MIPS.

---

## 👨‍💻 Autor

<div align="center">

### Gabriel Cattuzo

Computer Engineering Student at **PUC-Campinas**

[![GitHub](https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/gabrielcattuzo)
[![Website](https://img.shields.io/badge/Website-cattuzo.com-4285F4?style=for-the-badge\&logo=google-chrome\&logoColor=white)](https://cattuzo.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Gabriel%20Cattuzo-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://br.linkedin.com/in/gabrielcattuzo)

</div>
