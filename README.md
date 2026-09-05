<div align="center">

# 🖥️ Arquitetura de Sistemas Operacionais

### Assembly MIPS • C • Arquitetura de Computadores • Programação de Baixo Nível

Repositório acadêmico com estudos, exercícios e implementações desenvolvidos durante a disciplina de **Arquitetura de Sistemas Operacionais** do curso de Engenharia de Computação.

<br>

<img src="https://skillicons.dev/icons?i=c,git,github,vscode" alt="C, Git, GitHub e VS Code" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />
<img src="https://img.shields.io/badge/Simulator-MARS-F28C28?style=for-the-badge" alt="MARS" />
<img src="https://img.shields.io/badge/PUC-Campinas-C8102E?style=for-the-badge" alt="PUC-Campinas" />

</div>

---

# 📚 Sobre o Repositório

Este repositório reúne exercícios, estudos e implementações desenvolvidos durante a disciplina de **Arquitetura de Sistemas Operacionais**.

O principal objetivo é compreender como programas escritos em linguagens de alto nível são representados e executados em níveis mais próximos do hardware.

Para isso, diversos exercícios são implementados inicialmente em **C** e posteriormente traduzidos para **Assembly MIPS**, permitindo comparar diretamente as duas formas de programação.

Essa abordagem ajuda a visualizar como elementos comuns de linguagens de alto nível são transformados em instruções executadas pelo processador.

Entre os principais conceitos estudados estão:

* arquitetura de computadores;
* linguagem Assembly MIPS;
* linguagem C;
* registradores;
* memória;
* instruções do processador;
* operações aritméticas;
* entrada e saída;
* chamadas de sistema;
* estruturas condicionais;
* loops;
* branches;
* jumps;
* acesso à memória;
* vetores;
* tradução de C para Assembly;
* programação de baixo nível.

---

# 🎯 Objetivo

O principal objetivo deste repositório é estudar a relação entre **software e hardware**.

Em linguagens como C, diversas operações são abstraídas pela própria linguagem e pelo compilador.

Por exemplo:

```c id="18ndgv"
if (a > b) {
    resultado = a + b;
}
```

Em Assembly, essa mesma lógica precisa ser construída utilizando explicitamente:

```text id="v3b8n6"
registradores
     ↓
comparações
     ↓
branches
     ↓
operações aritméticas
     ↓
movimentação de dados
```

Dessa forma, é possível compreender com maior clareza como estruturas escritas em uma linguagem de alto nível são transformadas em operações executadas pelo processador.

---

# 🛠️ Tecnologias e Ferramentas

<div align="center">

### Linguagens

<img src="https://skillicons.dev/icons?i=c" alt="C" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />

### Ferramentas

<img src="https://skillicons.dev/icons?i=git,github,vscode" alt="Git, GitHub e VS Code" />

<br><br>

<img src="https://img.shields.io/badge/MARS-MIPS%20Simulator-F28C28?style=for-the-badge" alt="MARS MIPS Simulator" />

</div>

---

## 🔵 Linguagem C

A linguagem **C** é utilizada como referência para a implementação inicial dos algoritmos.

Ela permite representar de forma mais simples estruturas como:

```c id="kyfaii"
if
else
for
while
switch
variáveis
vetores
funções
```

A partir dessas implementações, os programas podem ser traduzidos para Assembly e comparados com suas versões de alto nível.

---

## 🟤 Assembly MIPS

O **Assembly MIPS** é utilizado para estudar diretamente o funcionamento das instruções executadas pelo processador.

Durante os exercícios são utilizados conceitos como:

* registradores;
* operações aritméticas;
* transferência de dados;
* branches;
* jumps;
* acesso à memória;
* chamadas de sistema;
* labels;
* controle de fluxo.

Algumas instruções utilizadas incluem:

```asm id="r4u51y"
li
la
move

add
addi
sub
mul
div

beq
bne

j

lw
sw
lb
sb

syscall
```

---

## 🟠 MARS

O **MARS — MIPS Assembler and Runtime Simulator** é utilizado para montar e executar os códigos Assembly presentes no repositório.

A ferramenta permite acompanhar a execução do programa e analisar:

* registradores;
* memória;
* instruções;
* valores armazenados;
* execução passo a passo;
* chamadas de sistema.

Isso é especialmente útil para compreender como cada instrução modifica o estado do processador durante a execução.

---

# 📂 Organização do Repositório

O repositório é dividido em pastas correspondentes aos exercícios e etapas de desenvolvimento realizadas durante a disciplina.

```text id="6h5n7c"
Arquitetura-de-Sistemas-Operacionais/
│
├── Explorando MIPS/
│   ├── README.md
│   ├── programas em C
│   └── programas em Assembly MIPS
│
├── Desenvolvimento 18-08-26/
│   ├── README.md
│   ├── código em C
│   └── código em Assembly MIPS
│
├── Desenvolvimento 25-08-26/
│   ├── README.md
│   ├── código em C
│   └── código em Assembly MIPS
│
├── .gitignore
└── README.md
```

Cada pasta possui seu próprio `README.md` com informações específicas sobre os exercícios desenvolvidos naquela etapa.

---

# 🧭 Conteúdo do Repositório

## 🔬 Explorando MIPS

📁 [`Explorando MIPS`](./Explorando%20MIPS/README.md)

Esta pasta reúne uma sequência de exercícios desenvolvidos para praticar a tradução de programas escritos em C para **Assembly MIPS**.

Os exercícios evoluem gradualmente em complexidade.

Entre os conteúdos abordados estão:

* operações matemáticas;
* leitura de valores;
* impressão de resultados;
* condicionais;
* comparações;
* loops;
* menus;
* vetores;
* diferentes caminhos de execução;
* manipulação de registradores.

A proposta é observar como estruturas relativamente simples em C precisam ser construídas utilizando instruções específicas em Assembly.

---

## 🔢 Desenvolvimento — 18/08/2026

📁 [`Desenvolvimento 18-08-26`](./Desenvolvimento%2018-08-26/README.md)

Atividade introdutória focada em **entrada e saída de dados**.

O programa foi desenvolvido tanto em C quanto em Assembly MIPS para permitir uma comparação direta entre as duas linguagens.

Entre os conceitos utilizados estão:

* entrada de dados;
* saída de dados;
* registradores;
* movimentação de valores;
* chamadas de sistema;
* execução de instruções MIPS.

---

## 🎯 Desenvolvimento — 25/08/2026

📁 [`Desenvolvimento 25-08-26`](./Desenvolvimento%2025-08-26/README.md)

Atividade voltada para conceitos mais avançados de controle de fluxo e manipulação de dados.

São estudados:

* loops;
* branches;
* jumps;
* registradores;
* memória;
* armazenamento de valores;
* leitura de valores armazenados.

Um dos pontos principais do exercício é comparar duas formas de preservar informações durante a execução:

```text id="v7vb26"
Registrador             Memória
    │                      │
    ▼                      ▼
 valor em $s0        endereço de memória
                           │
                           ▼
                        sb / lb
```

Essa comparação ajuda a visualizar a diferença entre dados mantidos diretamente nos registradores do processador e dados armazenados na memória.

---

# 🧠 Conceitos Estudados

## 🧮 Registradores

Os registradores são pequenas áreas de armazenamento localizadas diretamente no processador.

Eles permitem acesso extremamente rápido aos valores utilizados durante a execução.

No MIPS existem diferentes grupos de registradores.

### Registradores temporários

```asm id="jn01ab"
$t0
$t1
$t2
$t3
...
```

São normalmente utilizados para valores temporários durante cálculos e operações.

---

### Registradores salvos

```asm id="99r8ax"
$s0
$s1
$s2
...
```

São utilizados quando um valor precisa ser preservado por mais tempo durante a execução.

---

### Registradores de argumentos

```asm id="k9yvx4"
$a0
$a1
$a2
$a3
```

São utilizados para passagem de argumentos.

O registrador `$a0`, por exemplo, também é frequentemente utilizado nas `syscalls` de impressão.

---

### Registrador `$v0`

O registrador:

```asm id="18dm21"
$v0
```

é utilizado para valores de retorno e também para informar ao sistema qual **syscall** deverá ser executada.

---

# 💾 Memória

Nem todos os dados precisam permanecer nos registradores.

O programa também pode armazenar informações na memória.

Em MIPS, instruções de load e store são utilizadas para realizar a comunicação entre memória e registradores.

Exemplos:

```asm id="24ohzd"
lw
sw
lb
sb
```

Onde:

| Instrução | Função     |
| --------- | ---------- |
| `lw`      | Load Word  |
| `sw`      | Store Word |
| `lb`      | Load Byte  |
| `sb`      | Store Byte |

Por exemplo:

```asm id="juxah6"
sb $t0, 0($t1)
```

armazena um byte presente em `$t0` no endereço de memória apontado por `$t1`.

Para recuperar esse valor:

```asm id="fzhjz7"
lb $t2, 0($t1)
```

---

# 🔀 Controle de Fluxo

Em C, estruturas de decisão podem ser escritas diretamente:

```c id="7otstf"
if (a == b) {
    printf("Valores iguais");
}
```

Em Assembly, é necessário utilizar uma comparação e um branch.

Exemplo:

```asm id="qxvii0"
beq $t0, $t1, valores_iguais
```

Caso os valores armazenados nos registradores sejam iguais, a execução é desviada para:

```asm id="jqt8ve"
valores_iguais:
```

---

# 🔁 Loops

Loops também precisam ser construídos utilizando labels, branches e jumps.

Um loop simples em C:

```c id="ug20rx"
for (int i = 0; i < 10; i++) {
    printf("%d", i);
}
```

pode ser representado em Assembly utilizando uma estrutura semelhante a:

```asm id="03vd5y"
li $t0, 0

loop:

    # corpo do loop

    addi $t0, $t0, 1

    # comparação

    j loop
```

O controle da repetição passa a ser realizado explicitamente pelo programa.

---

# 🖨️ Syscalls

Em Assembly MIPS, operações de entrada e saída podem ser realizadas utilizando **syscalls**.

O registrador `$v0` informa qual operação deverá ser executada.

---

## Imprimir inteiro

```asm id="m7i1sk"
li $v0, 1
move $a0, $t0
syscall
```

---

## Imprimir string

```asm id="a9llv5"
li $v0, 4
la $a0, mensagem
syscall
```

---

## Ler inteiro

```asm id="y69qxp"
li $v0, 5
syscall

move $t0, $v0
```

---

## Encerrar programa

```asm id="jol7i7"
li $v0, 10
syscall
```

---

# 🔄 Comparação entre C e Assembly

Uma das principais propostas deste repositório é comparar diretamente as duas linguagens.

## Operação aritmética

### C

```c id="1g8vcp"
resultado = a + b;
```

### Assembly MIPS

```asm id="7v3f9n"
add $t2, $t0, $t1
```

---

## Incremento

### C

```c id="pgsnuc"
i++;
```

### Assembly MIPS

```asm id="afkmhd"
addi $t0, $t0, 1
```

---

## Condicional

### C

```c id="p11f23"
if (a == b) {
    resultado = 1;
}
```

### Assembly MIPS

```asm id="ypmzj8"
beq $t0, $t1, iguais

iguais:
    li $t2, 1
```

---

## Loop

### C

```c id="i09cfw"
while (i < 10) {
    i++;
}
```

### Assembly MIPS

```asm id="jn3fui"
loop:

    # verifica condição

    addi $t0, $t0, 1

    j loop
```

Essas comparações ajudam a compreender o trabalho realizado pelo compilador ao transformar código de alto nível em instruções de máquina.

---

# 🧩 Fluxo de Execução

De forma simplificada, os exercícios seguem a seguinte relação:

```text id="z8qvm5"
        Código em C
             │
             ▼
     Estruturas de alto nível
             │
             ▼
      Tradução da lógica
             │
             ▼
      Assembly MIPS
             │
             ▼
       Instruções MIPS
             │
             ▼
        Registradores
        /          \
       ▼            ▼
    Memória      Operações
       \            /
        \          /
             ▼
          Resultado
```

O objetivo não é apenas obter o mesmo resultado nas duas linguagens, mas entender **como esse resultado é produzido em um nível mais próximo do hardware**.

---

# ▶️ Como Executar

## C

Para compilar os arquivos escritos em C utilizando GCC:

```bash id="e5wmpg"
gcc programa.c -o programa
```

Depois:

### Linux

```bash id="edrtmq"
./programa
```

### Windows

```bash id="l9b97r"
programa.exe
```

---

## Assembly MIPS

Os arquivos `.asm` podem ser executados utilizando o **MARS**.

Fluxo básico:

```text id="25gh6u"
Abrir arquivo .asm
        │
        ▼
     Assemble
        │
        ▼
       Run
        │
        ▼
Analisar execução
        │
        ├── Registradores
        ├── Memória
        └── Console
```

Também é possível utilizar a execução passo a passo para observar cada instrução individualmente.

---

# 📈 Evolução dos Exercícios

Os exercícios do repositório seguem uma progressão de dificuldade.

```text id="5u20ue"
Operações básicas
       │
       ▼
Entrada e saída
       │
       ▼
Registradores
       │
       ▼
Condicionais
       │
       ▼
Branches
       │
       ▼
Loops
       │
       ▼
Memória
       │
       ▼
Vetores
       │
       ▼
Programas mais complexos
```

Essa progressão permite construir gradualmente uma compreensão mais completa sobre a arquitetura e a programação em baixo nível.

---

# 📚 Finalidade Acadêmica

Este repositório possui finalidade **acadêmica e educacional**.

Ele funciona como:

* registro dos exercícios realizados;
* documentação dos conteúdos estudados;
* material de revisão;
* demonstração da evolução em Assembly MIPS;
* comparação prática entre C e Assembly;
* referência para estudos de arquitetura de computadores.

---

# 🚀 Próximos Conteúdos

Conforme o avanço da disciplina, o repositório poderá receber implementações envolvendo:

* stack;
* funções;
* procedimentos;
* passagem de parâmetros;
* manipulação avançada de memória;
* arrays;
* representação de dados;
* arquitetura do processador;
* interrupções;
* entrada e saída;
* interação entre software e hardware.

---

<div align="center">

## 👨‍💻 Autor

### Gabriel Cattuzo

Computer Engineering Student — **PUC-Campinas**

<br>

<a href="https://cattuzo.com">
  <img src="https://img.shields.io/badge/Portfolio-cattuzo.com-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white" alt="Portfolio" />
</a>

<a href="https://github.com/gabrielcattuzo">
  <img src="https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
</a>

<a href="https://br.linkedin.com/in/gabrielcattuzo">
  <img src="https://img.shields.io/badge/LinkedIn-Gabriel%20Cattuzo-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
</a>

</div>
