<div align="center">

# 🎯 Controle de Fluxo, Loops e Memória em MIPS

### Desenvolvimento — 25/08/2026

Estudo de **jumps, loops, branches, registradores e acesso à memória** utilizando C e Assembly MIPS.

<br>

<img src="https://skillicons.dev/icons?i=c" alt="C" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />
<img src="https://img.shields.io/badge/Simulator-MARS-F28C28?style=for-the-badge" alt="MARS" />

</div>

---

## 📖 Sobre a Atividade

Esta atividade dá continuidade aos conceitos introdutórios de Assembly MIPS e passa a explorar mecanismos utilizados para controlar de forma mais complexa o fluxo de execução de um programa.

Entre os principais conteúdos estão:

* labels;
* jumps;
* branches;
* loops;
* comparação entre valores;
* registradores;
* armazenamento em memória;
* leitura da memória;
* diferenças entre registradores e memória.

Um dos pontos centrais da atividade é comparar duas formas de preservar um determinado valor durante a execução:

1. manter o valor em um **registrador**;
2. armazenar o valor explicitamente na **memória**.

> [← Voltar ao README principal](../README.md)

---

# 🎯 Objetivos

A atividade busca desenvolver a compreensão sobre:

* controle de fluxo em Assembly;
* implementação de estruturas de repetição;
* funcionamento de jumps;
* funcionamento de branches;
* utilização de labels;
* armazenamento de dados;
* acesso à memória;
* diferença entre registradores temporários e salvos;
* instruções `sb` e `lb`.

---

# 🔀 Controle de Fluxo

Em linguagens de alto nível, estruturas de controle são representadas diretamente.

Exemplo:

```c id="ayuf1q"
if (opcao == 1) {
    // operação
}
```

Em Assembly MIPS, o fluxo precisa ser controlado utilizando instruções específicas.

Por exemplo:

```asm id="1ou1nc"
beq $t0, $t1, opcao_um
```

Caso os valores sejam iguais, a execução salta para:

```asm id="qsmjln"
opcao_um:
```

---

# 🏷️ Labels

Labels representam posições no código que podem ser utilizadas como destino de branches ou jumps.

Exemplo:

```asm id="0rf0g9"
inicio:

    # instruções

    j inicio
```

Nesse caso, a instrução:

```asm id="zyz2s1"
j inicio
```

faz com que a execução retorne ao label `inicio`.

---

# ↪️ Jumps

A instrução:

```asm id="5ddksk"
j
```

realiza um salto incondicional.

Exemplo:

```asm id="hfd6u9"
j menu
```

Isso significa que a execução continua diretamente a partir do label:

```asm id="yr0dt5"
menu:
```

Essa instrução pode ser utilizada para construir menus, loops e diferentes caminhos de execução.

---

# 🔀 Branches

Branches realizam desvios condicionais.

Algumas instruções utilizadas são:

```asm id="9k8shg"
beq
bne
```

## `beq`

```asm id="ntrf3s"
beq $t0, $t1, iguais
```

Executa o branch caso:

```text id="f9o04h"
$t0 == $t1
```

---

## `bne`

```asm id="4q9f47"
bne $t0, $t1, diferentes
```

Executa o branch caso:

```text id="4i37de"
$t0 != $t1
```

---

# 🔁 Loops

Loops em Assembly podem ser construídos combinando:

```text id="um3rb5"
Label
  │
  ▼
Instruções
  │
  ▼
Comparação
  │
  ▼
Branch / Jump
  │
  └───────────────┐
                  ▼
                Label
```

Por exemplo:

```asm id="ym2b72"
li $t0, 0

loop:

    addi $t0, $t0, 1

    j loop
```

Em uma implementação completa, uma condição é utilizada para determinar quando o loop deverá terminar.

---

# 🧠 Registradores Temporários

Registradores como:

```asm id="3d57yu"
$t0
$t1
$t2
```

são utilizados para valores temporários durante a execução.

Eles são adequados para cálculos e informações que não precisam necessariamente ser preservadas por longos períodos.

---

# 💾 Registradores Salvos

Registradores:

```asm id="v45jdf"
$s0
$s1
$s2
```

são utilizados quando existe interesse em preservar determinados valores.

Por exemplo:

```asm id="uqjfs8"
move $s0, $t0
```

Nesse caso, o valor armazenado em `$t0` é copiado para `$s0`.

---

# 💾 Armazenamento na Memória

Outra possibilidade é preservar o valor diretamente na memória.

Para isso, o programa precisa possuir uma área reservada.

Exemplo conceitual:

```asm id="l5v4o1"
.data

valor: .byte 0
```

O endereço pode ser carregado com:

```asm id="39jgnp"
la $t1, valor
```

---

# 📥 Store Byte — `sb`

A instrução:

```asm id="05h3d9"
sb
```

significa **Store Byte**.

Ela permite armazenar um byte na memória.

Exemplo:

```asm id="2f4vd4"
sb $t0, 0($t1)
```

Nesse caso:

```text id="iuk3dv"
$t0
 │
 │ valor
 ▼
Memória apontada por $t1
```

O conteúdo de `$t0` é armazenado na posição de memória indicada.

---

# 📤 Load Byte — `lb`

Para recuperar o valor armazenado:

```asm id="57ch5s"
lb $t2, 0($t1)
```

A instrução **Load Byte** lê o valor presente na memória e o coloca em um registrador.

Fluxo:

```text id="fylp9x"
Memória
   │
   │ lb
   ▼
  $t2
```

---

# 🆚 Registrador x Memória

Um dos principais pontos desta atividade é observar a diferença entre armazenar um valor em um registrador e armazená-lo na memória.

## Registrador

```asm id="bbg8ol"
move $s0, $t0
```

Fluxo:

```text id="u2a4bl"
$t0
 │
 ▼
$s0
```

O valor permanece diretamente em um registrador do processador.

---

## Memória

```asm id="8x6qt2"
sb $t0, 0($t1)
```

Depois:

```asm id="3f9r0o"
lb $t2, 0($t1)
```

Fluxo:

```text id="wxxu4r"
$t0
 │
 │ sb
 ▼
Memória
 │
 │ lb
 ▼
$t2
```

Nesse segundo caso, existe uma transferência explícita entre registrador e memória.

---

# ⚡ Diferença Conceitual

De forma simplificada:

| Registradores                           | Memória                                |
| --------------------------------------- | -------------------------------------- |
| Dentro do processador                   | Fora do conjunto de registradores      |
| Acesso muito rápido                     | Acesso relativamente mais lento        |
| Quantidade limitada                     | Maior capacidade                       |
| Utilizados diretamente pelas instruções | Dados precisam ser carregados          |
| Ideais para valores em uso              | Ideal para armazenamento de mais dados |

Essa diferença é fundamental para compreender a organização de um computador.

---

# 🔄 Comparação com C

Em C, uma variável pode ser utilizada sem que o programador precise decidir explicitamente onde cada operação será realizada.

```c id="dbws0o"
int valor = 10;
```

O compilador é responsável por decidir como esse valor será tratado durante a execução.

Em Assembly, o programador trabalha diretamente com:

```text id="j6m6vh"
registradores
     +
memória
```

Por isso, operações de armazenamento e recuperação precisam ser descritas explicitamente.

---

# 🧩 Fluxo da Atividade

A lógica estudada pode ser representada de forma simplificada por:

```text id="6smf34"
           Entrada
              │
              ▼
          Registrador
              │
       ┌──────┴──────┐
       │             │
       ▼             ▼
Registrador       Memória
  salvo              │
       │             │
       │             ▼
       │          Store
       │             │
       │             ▼
       │          Memória
       │             │
       │             ▼
       │           Load
       │             │
       └──────┬──────┘
              ▼
           Resultado
```

Essa comparação permite visualizar diferentes formas de manipular e preservar informações em baixo nível.

---

# 🛠️ Tecnologias

<div align="center">

<img src="https://skillicons.dev/icons?i=c" alt="C" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />
<img src="https://img.shields.io/badge/MARS-MIPS%20Simulator-F28C28?style=for-the-badge" alt="MARS" />

</div>

---

# ▶️ Execução

## Código C

Para compilar utilizando GCC:

```bash id="y3wkyq"
gcc programa.c -o programa
```

No Linux:

```bash id="bdv9ve"
./programa
```

No Windows:

```bash id="bq13is"
programa.exe
```

---

## Assembly MIPS

Abra o arquivo `.asm` utilizando o MARS.

```text id="8q3ojp"
Arquivo .asm
    │
    ▼
Assemble
    │
    ▼
Run
    │
    ├── Console
    ├── Registers
    └── Data Segment
```

Para esta atividade, a área **Data Segment** é particularmente útil, pois permite observar as alterações realizadas diretamente na memória.

---

# 🔎 Análise no MARS

Durante a execução passo a passo, é possível acompanhar:

### Registradores

Observar valores presentes em:

```asm id="yq3klq"
$t0
$t1
$t2
$s0
```

### Memória

Observar o endereço utilizado pelas instruções:

```asm id="ve4v44"
sb
lb
```

### Program Counter

Também é possível acompanhar a mudança no fluxo de execução causada por:

```asm id="fw0a7i"
beq
bne
j
```

Isso torna o MARS uma ferramenta importante para visualizar o funcionamento interno do programa.

---

# 📚 Conceitos Praticados

Esta atividade trabalha principalmente:

* Assembly MIPS;
* controle de fluxo;
* labels;
* jumps;
* branches;
* loops;
* registradores temporários;
* registradores salvos;
* memória;
* endereçamento;
* `sb`;
* `lb`;
* movimentação de dados;
* comparação entre memória e registradores.

---

# 🎓 Relação com Arquitetura de Computadores

A atividade ajuda a demonstrar uma característica fundamental da arquitetura dos computadores:

```text id="98h3dd"
             CPU
              │
       ┌──────┴──────┐
       ▼             ▼
 Registradores     Memória
       │             │
       └──────┬──────┘
              │
              ▼
          Instruções
```

O processador realiza operações principalmente sobre valores presentes em registradores.

Quando um dado está armazenado na memória, ele normalmente precisa ser carregado para um registrador antes de ser utilizado.

Essa relação aparece constantemente em programação de baixo nível.

---

# 🚀 Continuidade

Os conceitos desta atividade servem como base para conteúdos mais avançados, como:

* vetores;
* strings;
* stack;
* funções;
* procedimentos;
* passagem de parâmetros;
* manipulação de blocos de memória;
* estruturas de dados;
* chamadas de funções em Assembly.

---

<div align="center">

### Gabriel Cattuzo

Computer Engineering — PUC-Campinas

[⬅️ Voltar ao repositório principal](../README.md)

</div>
