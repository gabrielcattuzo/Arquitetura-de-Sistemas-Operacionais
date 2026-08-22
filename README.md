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

Os projetos são desenvolvidos principalmente utilizando **Assembly para arquitetura MIPS**, permitindo estudar na prática conceitos relacionados à arquitetura de computadores, processadores, registradores, memória e programação de baixo nível.

Além das atividades realizadas durante as aulas, o repositório possui exercícios de exploração nos quais programas escritos em **C** são traduzidos para **Assembly MIPS**, permitindo comparar linguagens de alto e baixo nível.

---

## 🎯 Objetivos

O repositório tem como objetivo documentar e organizar os conteúdos desenvolvidos durante a disciplina, incluindo:

* Arquitetura de computadores;
* Arquitetura MIPS;
* Linguagem Assembly;
* Registradores;
* Entrada e saída;
* Syscalls;
* Operações aritméticas;
* Controle de fluxo;
* Desvios condicionais;
* Saltos;
* Memória e endereçamento;
* Tradução de C para Assembly;
* Relação entre software e hardware.

> O repositório será atualizado conforme novos conteúdos forem estudados durante a disciplina.

---

## 🛠️ Tecnologias e Ferramentas

<div align="left">

![Assembly](https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge\&logo=intel\&logoColor=white)
![C](https://img.shields.io/badge/C-00599C?style=for-the-badge\&logo=c\&logoColor=white)
![MARS](https://img.shields.io/badge/MARS-MIPS%20Simulator-orange?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge\&logo=github\&logoColor=white)

</div>

### Assembly MIPS

Utilizado para estudar conceitos de programação de baixo nível, registradores, instruções e fluxo de execução.

### C

Utilizada nos exercícios de exploração como linguagem de referência antes da tradução para Assembly.

### MARS

O **MARS (MIPS Assembler and Runtime Simulator)** é utilizado para escrever, montar, executar e depurar os programas MIPS.

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
│   └── eco.asm
│
└── Explorando MIPS/
    │
    ├── README.md
    │
    ├── Tradução Soma/
    │   ├── soma.c
    │   └── soma.asm
    │
    ├── Tradução Multiplicação/
    │   ├── multi.c
    │   └── multi.asm
    │
    └── Tradução IF/
        ├── if.c
        └── if.asm
```

---

# 📚 Atividades

## 📅 Desenvolvimento — 18/08/2026

A primeira atividade registrada no repositório introduz conceitos fundamentais de **entrada e saída utilizando Assembly MIPS**.

O arquivo:

```text
eco.asm
```

recebe um número inteiro informado pelo usuário, armazena esse valor em um registrador e posteriormente imprime o mesmo número.

### Fluxo

```text
Entrada
   │
   ▼
Exibe mensagem
   │
   ▼
Lê inteiro
   │
   ▼
$v0
   │
   ▼
move $t0, $v0
   │
   ▼
$t0
   │
   ▼
Exibe resultado
```

### Conceitos utilizados

* `.data`;
* `.text`;
* `.asciiz`;
* registradores;
* `li`;
* `la`;
* `move`;
* `syscall`;
* entrada de inteiro;
* saída de string;
* saída de inteiro.

---

# 🔬 Explorando MIPS

A pasta **Explorando MIPS** contém exercícios desenvolvidos para estudar a tradução de programas escritos em **C** para **Assembly MIPS**.

Cada exercício possui as duas implementações lado a lado.

Atualmente existem três traduções:

| Exercício     | C         | MIPS        | Conceito principal |
| ------------- | --------- | ----------- | ------------------ |
| Soma          | `soma.c`  | `soma.asm`  | `add`              |
| Multiplicação | `multi.c` | `multi.asm` | `mul`              |
| IF            | `if.c`    | `if.asm`    | `bgt` e `j`        |

---

## ➕ Soma de dois inteiros

Em C:

```c
soma = a + b;
```

Em MIPS:

```asm
add $t2, $t0, $t1
```

Correspondência:

```text
a     → $t0
b     → $t1
soma  → $t2
```

---

## ✖️ Multiplicação de dois inteiros

Em C:

```c
multi = a * b;
```

Em MIPS:

```asm
mul $t2, $t0, $t1
```

A estrutura do programa é semelhante à soma, alterando principalmente a operação aritmética utilizada.

---

## 🔀 Estrutura IF

O terceiro exercício verifica se um número é positivo.

Em C:

```c
if (numero > 0)
{
    printf("O numero eh positivo\n");
}
else
{
    printf("O numero nao eh positivo\n");
}
```

Em MIPS, a condição é implementada através de:

```asm
bgt $t0, $zero, ehPositivo
```

e o controle de fluxo também utiliza:

```asm
j fim
```

Esse exercício introduz conceitos importantes de:

* comparação;
* branch;
* labels;
* salto incondicional;
* controle do fluxo de execução.

---

# 🔄 Evolução dos Estudos

```text
Arquitetura de Sistemas Operacionais
│
├── 📅 18/08/2026
│   │
│   └── Entrada e Saída
│       ├── Registradores
│       ├── Syscalls
│       ├── LI
│       ├── LA
│       └── MOVE
│
└── 🔬 Explorando MIPS
    │
    ├── ➕ Soma
    │   └── ADD
    │
    ├── ✖️ Multiplicação
    │   └── MUL
    │
    └── 🔀 IF
        ├── BGT
        ├── Labels
        └── Jump
```

---

# 🧠 Estrutura Básica de um Programa MIPS

Um programa MIPS normalmente possui os segmentos:

```asm
.data
```

e:

```asm
.text
```

### `.data`

Contém os dados utilizados pelo programa.

Por exemplo:

```asm
mensagem: .asciiz "Hello, MIPS!"
```

### `.text`

Contém as instruções executadas:

```asm
.text
.globl main

main:
```

---

# 🧮 Registradores Utilizados

Nos programas desenvolvidos até o momento são utilizados principalmente:

| Registrador | Utilização                                |
| ----------- | ----------------------------------------- |
| `$zero`     | Valor constante `0`                       |
| `$v0`       | Código da syscall e retorno de leituras   |
| `$a0`       | Argumento das syscalls                    |
| `$t0`       | Armazenamento temporário / primeiro valor |
| `$t1`       | Segundo valor                             |
| `$t2`       | Resultado de operações                    |

---

# 🧩 Instruções Utilizadas

| Instrução | Função                                    |
| --------- | ----------------------------------------- |
| `li`      | Carrega um valor imediato                 |
| `la`      | Carrega o endereço de uma variável        |
| `move`    | Copia um valor entre registradores        |
| `add`     | Realiza uma soma                          |
| `mul`     | Realiza uma multiplicação                 |
| `bgt`     | Desvia caso um valor seja maior que outro |
| `j`       | Realiza um salto incondicional            |
| `syscall` | Executa uma chamada de sistema            |

> Esta tabela representa as principais instruções presentes nos códigos atuais do repositório e poderá ser expandida conforme novas atividades forem adicionadas.

---

# 📞 Syscalls Utilizadas

| `$v0` | Operação          |
| ----: | ----------------- |
|   `1` | Imprimir inteiro  |
|   `4` | Imprimir string   |
|   `5` | Ler inteiro       |
|  `10` | Encerrar programa |

### Exemplo — leitura

```asm
li $v0, 5
syscall
move $t0, $v0
```

### Exemplo — impressão

```asm
li $v0, 1
move $a0, $t0
syscall
```

---

# 🔄 C x Assembly MIPS

Os exercícios de exploração permitem observar como instruções de alto nível são representadas em Assembly.

```text
C
│
├── Variáveis
├── Operadores
├── IF / ELSE
├── scanf()
└── printf()
        │
        ▼
Assembly MIPS
│
├── Registradores
├── ADD / MUL
├── Branches
├── Labels / Jumps
└── Syscalls
        │
        ▼
Arquitetura
```

Uma instrução simples em C:

```c
soma = a + b;
```

pode ser traduzida para:

```asm
add $t2, $t0, $t1
```

desde que os valores estejam previamente armazenados nos registradores correspondentes.

---

# ▶️ Executando os Programas

## Assembly MIPS

Os arquivos `.asm` podem ser executados utilizando o **MARS MIPS Simulator**.

### 1. Abra o arquivo

```text
File → Open
```

### 2. Monte o programa

```text
Run → Assemble
```

ou:

```text
F3
```

### 3. Execute

```text
Run → Go
```

ou:

```text
F5
```

A entrada e a saída aparecem na área **Run I/O**.

---

## C

Os arquivos utilizados como referência podem ser compilados com GCC:

```bash
gcc arquivo.c -o programa
```

Execução:

```bash
./programa
```

No Windows:

```powershell
.\programa.exe
```

---

# 📈 Próximos Conteúdos

Conforme o avanço da disciplina, o repositório poderá incluir:

```text
Assembly MIPS
│
├── Entrada e Saída
├── Operações Aritméticas
├── Condicionais
├── Estruturas de Repetição
├── Operações Lógicas
├── Memória
├── Vetores
├── Pilha
└── Procedimentos
```

---

# 🎓 Contexto Acadêmico

Este repositório faz parte dos estudos da disciplina de **Arquitetura de Sistemas Operacionais** do curso de **Engenharia de Computação da PUC-Campinas**.

Seu objetivo é servir como registro das atividades desenvolvidas e como material de consulta para os conceitos estudados durante a disciplina.

---

# ⚠️ Finalidade

Este repositório possui finalidade **acadêmica e educacional**.

Os códigos representam exercícios e implementações desenvolvidos durante o processo de aprendizado de arquitetura de computadores, sistemas operacionais e programação em Assembly.

---

# 👨‍💻 Autor

<div align="center">

### Gabriel Cattuzo

Computer Engineering Student at **PUC-Campinas**

[![GitHub](https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/gabrielcattuzo)
[![Website](https://img.shields.io/badge/Website-cattuzo.com-4285F4?style=for-the-badge\&logo=google-chrome\&logoColor=white)](https://cattuzo.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Gabriel%20Cattuzo-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://br.linkedin.com/in/gabrielcattuzo)

</div>
