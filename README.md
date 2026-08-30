<div align="center">

# 🖥️ Arquitetura de Sistemas Operacionais

### Estudos, exercícios e implementações em Assembly MIPS

![Assembly](https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge\&logo=intel\&logoColor=white)
![MARS](https://img.shields.io/badge/Simulator-MARS-orange?style=for-the-badge)
![C](https://img.shields.io/badge/Language-C-00599C?style=for-the-badge\&logo=c\&logoColor=white)
![Academic](https://img.shields.io/badge/Project-Academic-blue?style=for-the-badge)
![PUC Campinas](https://img.shields.io/badge/PUC-Campinas-red?style=for-the-badge)

</div>

---

## 📖 Sobre o Repositório

Este repositório reúne exercícios, atividades e implementações desenvolvidas durante a disciplina de **Arquitetura de Sistemas Operacionais** do curso de **Engenharia de Computação da PUC-Campinas**.

Os projetos são desenvolvidos principalmente utilizando **Assembly para arquitetura MIPS**, permitindo estudar na prática conceitos relacionados a registradores, memória, instruções, controle de fluxo e programação de baixo nível.

Além das atividades realizadas durante as aulas, o repositório possui a seção **Explorando MIPS**, na qual programas escritos em **C** são implementados novamente em **Assembly MIPS**.

A comparação entre as duas linguagens permite visualizar como estruturas de alto nível, como `if`, `for`, `while` e `switch`, podem ser representadas através de registradores, branches, labels e instruções do processador.

---

## 🎯 Objetivos

O repositório tem como objetivo documentar e organizar os conteúdos desenvolvidos durante a disciplina, incluindo:

* Arquitetura MIPS;
* Linguagem Assembly;
* Registradores;
* Memória;
* Entrada e saída;
* Syscalls;
* Operações aritméticas;
* Operações lógicas;
* Estruturas condicionais;
* Estruturas de repetição;
* Branches;
* Labels;
* Saltos;
* Load e Store;
* Tradução de C para Assembly;
* Relação entre software e hardware.

> O repositório será atualizado conforme novos conteúdos forem estudados durante a disciplina.

---

## 🛠️ Tecnologias e Ferramentas

<div align="center">

![Assembly](https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge\&logo=intel\&logoColor=white)
![C](https://img.shields.io/badge/C-00599C?style=for-the-badge\&logo=c\&logoColor=white)
![MARS](https://img.shields.io/badge/MARS-MIPS%20Simulator-orange?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge\&logo=github\&logoColor=white)

</div>

### Assembly MIPS

Utilizado para estudar programação de baixo nível, registradores, memória, instruções e fluxo de execução.

### C

Utilizada como linguagem de referência em diversos exercícios antes da implementação equivalente em Assembly.

### MARS

O **MARS (MIPS Assembler and Runtime Simulator)** é utilizado para montar, executar e analisar os programas desenvolvidos em MIPS.

---

# 📂 Organização do Repositório

```text
Arquitetura-de-Sistemas-Operacionais/
│
├── README.md
├── .gitignore
│
├── Desenvolvimento 18-08-26/
│   ├── README.md
│   ├── eco.c
│   └── eco.asm
│
├── Desenvolvimento 25-08-26/
│   ├── README.md
│   ├── teste.asm
│   │
│   ├── Abordagem 1/
│   │   ├── adivinhar_numero.c
│   │   └── adivinhar_numero.asm
│   │
│   └── Abordagem 2/
│       └── adivinhar_numero.asm
│
└── Explorando MIPS/
    ├── README.md
    │
    ├── Tradução Soma/
    ├── Tradução Multiplicação/
    ├── Tradução IF/
    ├── Par ou Impar/
    ├── Media/
    ├── Comparador/
    ├── Comparador2/
    ├── Contagem/
    ├── Somador/
    ├── Calculadora/
    └── Conversor/
```

---

# 📚 Atividades da Disciplina

## 📅 Desenvolvimento — 18/08/2026

A atividade introduz conceitos fundamentais de **entrada e saída em Assembly MIPS**.

Foram mantidas duas versões do mesmo programa:

```text
eco.c
eco.asm
```

O programa solicita um número inteiro e posteriormente exibe o mesmo valor.

### Fluxo

```text
Entrada
   │
   ▼
Lê um inteiro
   │
   ▼
Armazena o valor
   │
   ▼
Exibe o valor
   │
   ▼
Fim
```

Na implementação MIPS, o exercício introduz:

* `.data`;
* `.text`;
* `.asciiz`;
* `$v0`;
* `$a0`;
* `$t0`;
* `li`;
* `la`;
* `move`;
* `syscall`.

---

## 📅 Desenvolvimento — 25/08/2026

A atividade seguinte avança para **controle de fluxo, repetição e acesso à memória**.

Foram desenvolvidas duas abordagens para um programa no qual um número é informado inicialmente e o usuário deve continuar tentando até inserir o mesmo valor.

### Abordagem 1 — Registrador

O número inicial é armazenado diretamente em um registrador:

```asm
move $t0, $v0
```

O programa utiliza um loop e compara cada nova tentativa:

```asm
beq $v0, $t0, acertou
j loop
```

Fluxo:

```text
Número inicial
      │
      ▼
     $t0
      │
      ▼
Nova tentativa
      │
      ▼
É igual?
  /       \
Sim       Não
 │         │
 ▼         └──► tenta novamente
Acertou
```

### Abordagem 2 — Memória

Na segunda abordagem, o número é armazenado na memória utilizando:

```asm
sb $s0, numero
```

e recuperado posteriormente através de:

```asm
lb $s1, numero
```

Isso permite comparar duas formas de preservar dados:

```text
Abordagem 1              Abordagem 2

Registrador              Memória
    │                       │
   $t0                 numero: .byte
    │                       │
   BEQ                  SB / LB
```

A atividade também possui `teste.asm`, utilizado para observar o funcionamento da instrução `j` e dos labels.

---

# 🔬 Explorando MIPS

A pasta **Explorando MIPS** contém exercícios adicionais utilizados para praticar a tradução de programas em C para Assembly MIPS.

Atualmente estão presentes:

| Exercício              |  C  | MIPS | Principal conceito     |
| ---------------------- | :-: | :--: | ---------------------- |
| Tradução Soma          |  ✅  |   ✅  | `add`                  |
| Tradução Multiplicação |  ✅  |   ✅  | `mul`                  |
| Tradução IF            |  ✅  |   ✅  | `bgt`, `j`             |
| Par ou Ímpar           |  ✅  |   ✅  | `andi`, `beqz`         |
| Média                  |  ✅  |   ✅  | `div`, `mflo`, `bge`   |
| Comparador             |  ✅  |   ✅  | `beq`, `bgt`           |
| Comparador 2           |  ✅  |   —  | Condicionais e empates |
| Contagem               |  ✅  |   ⏳  | Estrutura de repetição |
| Somador                |  ✅  |   ⏳  | Acumulador e repetição |
| Calculadora            |  ✅  |   ✅  | Menu, operações e loop |
| Conversor              |  ✅  |   ✅  | Branches e conversões  |

> Os arquivos MIPS de **Contagem** e **Somador** ainda estão vazios na versão atual do repositório.

---

# 🧠 Conceitos Estudados

## Registradores

Os programas utilizam diferentes registradores MIPS:

| Registrador | Utilização                               |
| ----------- | ---------------------------------------- |
| `$zero`     | Valor constante zero                     |
| `$v0`       | Syscalls e valores retornados            |
| `$a0`       | Argumentos para syscalls                 |
| `$t0-$t5`   | Valores temporários                      |
| `$s0-$s1`   | Valores preservados em alguns exercícios |

---

## 📞 Syscalls

As principais syscalls utilizadas são:

| `$v0` | Operação          |
| ----: | ----------------- |
|   `1` | Imprimir inteiro  |
|   `4` | Imprimir string   |
|   `5` | Ler inteiro       |
|  `10` | Encerrar programa |

Exemplo:

```asm
li $v0, 5
syscall
move $t0, $v0
```

---

## 🔀 Controle de Fluxo

Estruturas como:

```c
if (a > b)
```

podem ser representadas através de branches:

```asm
bgt $t0, $t1, primeiroMaior
```

Também são utilizadas instruções como:

```asm
beq
bgt
blt
bge
beqz
j
```

---

## 💾 Memória

A atividade de 25/08 introduz explicitamente armazenamento e leitura da memória:

```asm
sb $s0, numero
lb $s1, numero
```

Isso permite observar a diferença entre manter um valor em um **registrador** e armazená-lo na **memória**.

---

## 🧮 Operações Aritméticas

Entre as instruções utilizadas nos exercícios estão:

```asm
add
addi
sub
mul
div
mflo
```

Essas operações são utilizadas em programas cada vez mais completos, como a calculadora e o conversor de temperaturas.

---

## 🔢 Operações Lógicas

O exercício de par ou ímpar utiliza:

```asm
andi $t1, $t0, 1
```

para analisar o bit menos significativo do número.

```text
Último bit = 0 → Par
Último bit = 1 → Ímpar
```

Isso demonstra como operações em nível de bits podem substituir determinadas operações aritméticas.

---

# 🔄 C → Assembly MIPS

Um dos principais objetivos dos exercícios é visualizar a tradução:

```text
C
│
├── Variáveis
├── Operadores
├── if / else
├── switch
├── while / for
├── scanf()
└── printf()
        │
        ▼
Assembly MIPS
│
├── Registradores
├── ADD / SUB / MUL / DIV
├── Branches
├── Labels
├── Jumps
└── Syscalls
        │
        ▼
Processador
```

Por exemplo:

```c
resultado = a + b;
```

pode ser representado como:

```asm
add $t2, $t0, $t1
```

Já uma estrutura:

```c
if (a == b)
```

pode ser representada através de:

```asm
beq $t0, $t1, iguais
```

---

# 📈 Evolução dos Estudos

```text
Arquitetura de Sistemas Operacionais
│
├── 18/08/2026
│   └── Entrada e saída
│       ├── Registradores
│       ├── Syscalls
│       └── MOVE
│
├── Explorando MIPS
│   ├── Operações aritméticas
│   ├── Condicionais
│   ├── Operações lógicas
│   ├── Comparações
│   ├── Repetições
│   ├── Menus
│   └── Conversões
│
└── 25/08/2026
    ├── Labels
    ├── Jump
    ├── Loop
    ├── BEQ
    ├── Registradores
    └── Memória
        ├── SB
        └── LB
```

---

# ▶️ Executando os Programas

## Assembly MIPS

Os arquivos `.asm` podem ser executados utilizando o **MARS MIPS Simulator**.

### Montar

```text
Run → Assemble
```

ou:

```text
F3
```

### Executar

```text
Run → Go
```

ou:

```text
F5
```

---

## C

Os arquivos `.c` podem ser compilados utilizando GCC:

```bash
gcc arquivo.c -o programa
```

E executados com:

```bash
./programa
```

No Windows:

```powershell
.\programa.exe
```

---

# 🎓 Contexto Acadêmico

Este repositório faz parte dos estudos da disciplina de **Arquitetura de Sistemas Operacionais** do curso de **Engenharia de Computação da PUC-Campinas**.

O objetivo é registrar a evolução das atividades e servir como material de consulta para os conceitos estudados.

---

# ⚠️ Finalidade

Este repositório possui finalidade **acadêmica e educacional**.

Os códigos representam exercícios e implementações desenvolvidos durante o aprendizado de arquitetura de computadores, sistemas operacionais e programação em Assembly MIPS.

---

# 👨‍💻 Autor

<div align="center">

### Gabriel Cattuzo

Computer Engineering Student at **PUC-Campinas**

[![GitHub](https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/gabrielcattuzo)
[![Website](https://img.shields.io/badge/Website-cattuzo.com-4285F4?style=for-the-badge\&logo=google-chrome\&logoColor=white)](https://cattuzo.com)

</div>
