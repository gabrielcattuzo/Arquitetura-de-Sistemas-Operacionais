<div align="center">

# 🖥️ Arquitetura de Sistemas Operacionais

### Estudos, exercícios e implementações em Assembly MIPS

![Assembly](https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge\&logo=intel\&logoColor=white)
![MARS](https://img.shields.io/badge/Simulator-MARS-orange?style=for-the-badge)
![Academic](https://img.shields.io/badge/Project-Academic-blue?style=for-the-badge)
![PUC Campinas](https://img.shields.io/badge/PUC-Campinas-red?style=for-the-badge)

</div>

---

## 📖 Sobre o Repositório

Este repositório reúne exercícios, atividades e implementações desenvolvidas durante a disciplina de **Arquitetura de Sistemas Operacionais** do curso de **Engenharia de Computação da PUC-Campinas**.

Os projetos são desenvolvidos principalmente utilizando **Assembly para arquitetura MIPS**, permitindo estudar na prática conceitos relacionados à arquitetura de computadores, processadores, registradores, memória e programação de baixo nível.

---

## 🎯 Objetivos

O repositório tem como objetivo documentar e organizar os conteúdos desenvolvidos durante a disciplina, incluindo conceitos como:

* Arquitetura de computadores;
* Arquitetura MIPS;
* Linguagem Assembly;
* Registradores;
* Memória e endereçamento;
* Operações aritméticas e lógicas;
* Entrada e saída de dados;
* Desvios condicionais;
* Estruturas de repetição;
* Manipulação de memória;
* Chamadas de sistema (`syscall`);
* Pilha e procedimentos;
* Funcionamento de instruções em baixo nível.

---

## 🛠️ Tecnologias e Ferramentas

<div align="left">

![Assembly](https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge\&logo=intel\&logoColor=white)
![MARS](https://img.shields.io/badge/MARS-MIPS%20Simulator-orange?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge\&logo=github\&logoColor=white)

</div>

### Assembly MIPS

A arquitetura **MIPS** é utilizada nas atividades para estudar conceitos fundamentais de programação de baixo nível e compreender melhor a interação entre software e hardware.

### MARS

O **MARS (MIPS Assembler and Runtime Simulator)** é utilizado para escrever, montar, executar e depurar os programas Assembly desenvolvidos durante a disciplina.

---

## 📂 Organização do Repositório

O repositório é organizado conforme as atividades e conteúdos desenvolvidos durante a disciplina.

```text
Arquitetura-de-Sistemas-Operacionais/
│
├── README.md
│
├── Aula01/
│   ├── eco.asm
│   └── README.md
│
├── Aula02/
│   ├── exercicio01.asm
│   ├── exercicio02.asm
│   └── README.md
│
├── Aula03/
│   └── ...
│
└── ...
```

Cada diretório pode conter os códigos, exercícios e documentações referentes a uma determinada aula ou atividade.

---

## 🧠 Estrutura Básica de um Programa MIPS

Um programa em Assembly MIPS normalmente é dividido entre os segmentos de dados (`.data`) e de código (`.text`).

```asm
.data

mensagem: .asciiz "Hello, MIPS!"

.text
.globl main

main:
    li $v0, 4
    la $a0, mensagem
    syscall

    li $v0, 10
    syscall
```

### `.data`

O segmento `.data` é utilizado para declarar os dados que serão utilizados pelo programa.

```asm
mensagem: .asciiz "Hello, MIPS!"
```

### `.text`

O segmento `.text` contém as instruções que serão executadas pelo processador.

```asm
.text
.globl main
```

---

## 🧩 Principais Instruções

Algumas das instruções utilizadas durante as atividades:

| Instrução | Função                                      |
| --------- | ------------------------------------------- |
| `li`      | Carrega um valor imediato em um registrador |
| `la`      | Carrega o endereço de uma variável          |
| `move`    | Copia um valor entre registradores          |
| `add`     | Realiza uma soma                            |
| `sub`     | Realiza uma subtração                       |
| `mul`     | Realiza uma multiplicação                   |
| `div`     | Realiza uma divisão                         |
| `lw`      | Carrega uma palavra da memória              |
| `sw`      | Armazena uma palavra na memória             |
| `beq`     | Desvia caso os valores sejam iguais         |
| `bne`     | Desvia caso os valores sejam diferentes     |
| `j`       | Realiza um salto incondicional              |
| `jal`     | Chama um procedimento                       |
| `jr`      | Retorna de um procedimento                  |
| `syscall` | Executa uma chamada de sistema              |

---

## 📞 Principais Syscalls

No MARS, o registrador `$v0` é utilizado para definir qual operação será realizada pela instrução `syscall`.

| `$v0` | Operação           |
| ----: | ------------------ |
|   `1` | Imprimir inteiro   |
|   `4` | Imprimir string    |
|   `5` | Ler inteiro        |
|   `8` | Ler string         |
|  `10` | Encerrar programa  |
|  `11` | Imprimir caractere |
|  `12` | Ler caractere      |

Exemplo de impressão de uma string:

```asm
li $v0, 4
la $a0, mensagem
syscall
```

---

## 🧮 Registradores MIPS

Os registradores possuem diferentes finalidades dentro da arquitetura MIPS.

| Registradores | Utilização          |
| ------------- | ------------------- |
| `$zero`       | Valor constante `0` |
| `$v0 - $v1`   | Valores de retorno  |
| `$a0 - $a3`   | Argumentos          |
| `$t0 - $t9`   | Valores temporários |
| `$s0 - $s7`   | Valores preservados |
| `$sp`         | Stack Pointer       |
| `$fp`         | Frame Pointer       |
| `$ra`         | Return Address      |

---

## ▶️ Executando os Programas

Os códigos podem ser executados utilizando o **MARS MIPS Simulator**.

### 1. Abra o MARS

Inicie o simulador MARS.

### 2. Abra o arquivo

No menu superior:

```text
File → Open
```

Selecione o arquivo `.asm` desejado.

### 3. Monte o programa

Utilize:

```text
Run → Assemble
```

ou pressione:

```text
F3
```

### 4. Execute

Utilize:

```text
Run → Go
```

ou pressione:

```text
F5
```

A entrada e a saída do programa serão exibidas na área **Run I/O**.

---

## 📚 Conteúdos

Ao longo da disciplina, o repositório poderá incluir implementações relacionadas a:

```text
Assembly MIPS
     │
     ├── Entrada e Saída
     ├── Registradores
     ├── Operações Aritméticas
     ├── Operações Lógicas
     ├── Condicionais
     ├── Estruturas de Repetição
     ├── Vetores
     ├── Memória
     ├── Pilha
     ├── Procedimentos
     └── Syscalls
```

---

## 🎓 Contexto Acadêmico

Este repositório faz parte dos estudos da disciplina de **Arquitetura de Sistemas Operacionais** do curso de **Engenharia de Computação da PUC-Campinas**.

Seu objetivo é servir como registro das atividades desenvolvidas e como material de consulta para os conceitos estudados durante a disciplina.

---

## ⚠️ Finalidade

Este repositório possui finalidade **acadêmica e educacional**.

Os códigos representam exercícios e implementações desenvolvidos durante o processo de aprendizado de arquitetura de computadores, sistemas operacionais e programação em Assembly.

---

## 👨‍💻 Autor

<div align="center">

### Gabriel Cattuzo

Computer Engineering Student at **PUC-Campinas**

[![GitHub](https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/gabrielcattuzo)
[![Website](https://img.shields.io/badge/Website-cattuzo.com-4285F4?style=for-the-badge\&logo=google-chrome\&logoColor=white)](https://cattuzo.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Gabriel%20Cattuzo-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://br.linkedin.com/in/gabrielcattuzo)

</div>
