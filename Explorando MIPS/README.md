<div align="center">

# 🔬 Explorando MIPS

### C → Assembly MIPS • Exercícios Progressivos • Programação de Baixo Nível

Conjunto de exercícios desenvolvido para estudar **Assembly MIPS** através da comparação direta com implementações equivalentes em **C**.

<br>

<img src="https://skillicons.dev/icons?i=c" alt="C" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />
<img src="https://img.shields.io/badge/Simulator-MARS-F28C28?style=for-the-badge" alt="MARS" />

</div>

---

# 📖 Sobre

Esta pasta reúne uma sequência de exercícios desenvolvidos para praticar **Assembly MIPS** e compreender como estruturas escritas em C podem ser representadas utilizando instruções de baixo nível.

A proposta é utilizar programas simples escritos em C como referência e, a partir deles, analisar como a mesma lógica pode ser construída manualmente em Assembly.

Durante esse processo, operações que normalmente são abstraídas pela linguagem C passam a ser representadas explicitamente através de:

* registradores;
* instruções aritméticas;
* branches;
* jumps;
* labels;
* chamadas de sistema;
* movimentação de dados;
* acesso à memória;
* controle manual do fluxo de execução.

Os exercícios foram organizados de forma progressiva, começando com operações básicas e avançando gradualmente para estruturas mais complexas.

> [← Voltar ao README principal](../README.md)

---

# 🎯 Objetivo

O principal objetivo desta pasta é desenvolver familiaridade com a linguagem **Assembly MIPS** e compreender melhor o funcionamento interno de programas executados pelo processador.

Em uma linguagem de alto nível como C, diversas operações podem ser escritas utilizando construções simples.

Por exemplo:

```c id="bk7q8v"
resultado = a + b;
```

Em Assembly MIPS, essa mesma operação exige que os valores estejam previamente armazenados em registradores.

```asm id="rm0dmd"
add $t2, $t0, $t1
```

Nesse exemplo:

```text id="ig1c2q"
$t0 → valor de a
$t1 → valor de b
$t2 → resultado
```

Essa diferença ajuda a visualizar como o processador trabalha diretamente com registradores e instruções.

---

# 🔄 C e Assembly

A abordagem utilizada nos exercícios pode ser representada da seguinte forma:

```text id="o7yr5l"
Código em C
     │
     ▼
Estrutura de alto nível
     │
     ▼
Análise da lógica
     │
     ▼
Separação em operações
     │
     ▼
Assembly MIPS
     │
     ▼
Registradores + Memória
     │
     ▼
Resultado
```

O objetivo não é apenas produzir o mesmo resultado em ambas as linguagens, mas compreender **como a lógica é representada em diferentes níveis de abstração**.

---

# 🧠 Conceitos Praticados

Ao longo dos exercícios são trabalhados conceitos como:

* registradores;
* variáveis;
* operações aritméticas;
* entrada de dados;
* saída de dados;
* chamadas de sistema;
* comparações;
* condicionais;
* branches;
* jumps;
* loops;
* labels;
* memória;
* vetores;
* movimentação de dados;
* controle de fluxo;
* tradução de estruturas C para Assembly.

---

# 🧮 Operações Aritméticas

Uma das primeiras etapas do aprendizado consiste em representar operações matemáticas simples.

## Soma

### C

```c id="uj19bz"
resultado = a + b;
```

### Assembly MIPS

```asm id="apjvqy"
add $t2, $t0, $t1
```

---

## Subtração

### C

```c id="6d1a6g"
resultado = a - b;
```

### Assembly MIPS

```asm id="uplvpz"
sub $t2, $t0, $t1
```

---

## Incremento

### C

```c id="w8gevy"
i++;
```

### Assembly MIPS

```asm id="7yph6s"
addi $t0, $t0, 1
```

---

## Multiplicação

### C

```c id="dfxgwn"
resultado = a * b;
```

### Assembly MIPS

```asm id="wxia5r"
mul $t2, $t0, $t1
```

---

## Divisão

Dependendo da implementação e do simulador utilizado, a divisão pode envolver instruções específicas e registradores especiais.

Conceitualmente:

```c id="f5jj2g"
resultado = a / b;
```

em Assembly pode exigir uma operação de divisão seguida da recuperação do resultado.

Esse tipo de exercício ajuda a compreender que nem todas as operações de alto nível correspondem diretamente a uma única instrução simples.

---

# 🔢 Registradores

Os registradores são pequenas áreas de armazenamento localizadas diretamente no processador.

Eles são utilizados constantemente durante a execução de programas Assembly.

Alguns registradores comuns utilizados nos exercícios incluem:

```asm id="rgp5vl"
$t0
$t1
$t2
$t3
$s0
$s1
$a0
$v0
```

---

## Registradores Temporários

Os registradores:

```asm id="du3zpe"
$t0
$t1
$t2
$t3
```

são utilizados normalmente para armazenar valores temporários durante cálculos ou operações intermediárias.

Exemplo:

```asm id="2c5t7q"
li $t0, 10
li $t1, 20

add $t2, $t0, $t1
```

Nesse caso:

```text id="u3g2g4"
$t0 = 10
$t1 = 20
$t2 = 30
```

---

## Registradores Salvos

Registradores como:

```asm id="8eeq3x"
$s0
$s1
$s2
```

podem ser utilizados quando determinados valores precisam permanecer disponíveis por mais tempo durante a execução.

Exemplo:

```asm id="625jjg"
move $s0, $t0
```

---

# ⌨️ Entrada de Dados

Em C, a leitura de um número pode ser feita utilizando:

```c id="8tdlys"
scanf("%d", &numero);
```

Em Assembly MIPS, é necessário utilizar uma **syscall**.

```asm id="kg3l3z"
li $v0, 5
syscall
```

Depois da leitura, o valor digitado pelo usuário fica armazenado em:

```asm id="trg6tf"
$v0
```

Esse valor pode ser movido para outro registrador:

```asm id="e7d9lv"
move $t0, $v0
```

---

# 🖨️ Saída de Dados

Em C:

```c id="xb8x0n"
printf("%d", numero);
```

Em Assembly MIPS:

```asm id="rxn0sk"
li $v0, 1
move $a0, $t0
syscall
```

O valor que será exibido precisa estar disponível em:

```text id="g93bmr"
$a0
```

---

# 💬 Impressão de Strings

Strings geralmente são declaradas na seção `.data`.

Exemplo:

```asm id="h0xp6q"
.data

mensagem: .asciiz "Digite um numero: "
```

Para imprimir:

```asm id="5bsl8m"
li $v0, 4
la $a0, mensagem
syscall
```

---

# 📞 Syscalls

As syscalls permitem realizar operações de entrada, saída e controle de execução.

Algumas das mais utilizadas nos exercícios:

| `$v0` | Operação          |
| ----: | ----------------- |
|   `1` | Imprimir inteiro  |
|   `4` | Imprimir string   |
|   `5` | Ler inteiro       |
|  `10` | Encerrar programa |

---

## Leitura de inteiro

```asm id="i6ewlz"
li $v0, 5
syscall
move $t0, $v0
```

---

## Impressão de inteiro

```asm id="d8bkej"
li $v0, 1
move $a0, $t0
syscall
```

---

## Impressão de string

```asm id="8haz9n"
li $v0, 4
la $a0, mensagem
syscall
```

---

## Encerramento

```asm id="7e0hht"
li $v0, 10
syscall
```

---

# 🔀 Condicionais

Em C, uma estrutura condicional pode ser escrita diretamente:

```c id="jjwd76"
if (a == b) {
    resultado = 1;
}
```

Em MIPS, a comparação precisa ser realizada por uma instrução de branch.

```asm id="5l0hgj"
beq $t0, $t1, iguais
```

Depois:

```asm id="d0u01p"
iguais:
    li $t2, 1
```

---

# 🔀 Branches

Algumas instruções importantes:

```asm id="fhvnex"
beq
bne
```

---

## `beq`

Significa:

```text id="dqcxa4"
Branch if Equal
```

Exemplo:

```asm id="7gcv0e"
beq $t0, $t1, iguais
```

Caso os valores sejam iguais, a execução salta para o label:

```asm id="qjhgyv"
iguais:
```

---

## `bne`

Significa:

```text id="lzccmt"
Branch if Not Equal
```

Exemplo:

```asm id="gkqi1y"
bne $t0, $t1, diferentes
```

---

# ↪️ Jumps

A instrução:

```asm id="v4f4ai"
j
```

realiza um salto incondicional.

Exemplo:

```asm id="v8ek7j"
j inicio
```

Isso faz a execução continuar a partir do label:

```asm id="8by1fr"
inicio:
```

---

# 🔁 Loops

Loops em Assembly precisam ser construídos manualmente utilizando:

* labels;
* incremento;
* comparação;
* branch;
* jump.

Em C:

```c id="yrjpnm"
for (int i = 0; i < 10; i++) {
    printf("%d", i);
}
```

Uma representação conceitual em Assembly pode ser:

```asm id="d7k7ur"
li $t0, 0

loop:

    # instruções

    addi $t0, $t0, 1

    # comparação da condição

    j loop
```

Uma implementação completa precisa incluir a condição responsável por encerrar a repetição.

---

# 🔄 Estrutura de um Loop

```text id="4xk7tu"
Inicialização
      │
      ▼
   Condição
      │
   ┌──┴──┐
   │     │
 falso verdadeiro
   │     │
   │     ▼
   │   Corpo
   │     │
   │     ▼
   │ Incremento
   │     │
   │     └──────┐
   │            │
   └────────────▼
             Condição
```

Em Assembly, cada parte dessa estrutura precisa ser representada explicitamente.

---

# 📋 Menus

Menus são exemplos interessantes porque combinam diversos conceitos ao mesmo tempo:

* entrada de dados;
* comparação;
* branches;
* jumps;
* loops;
* diferentes caminhos de execução.

Uma lógica em C pode ser:

```c id="s6rjma"
switch (opcao) {
    case 1:
        // operação 1
        break;

    case 2:
        // operação 2
        break;
}
```

Em Assembly, o comportamento pode ser construído por meio de comparações sucessivas e branches.

Exemplo conceitual:

```asm id="e58jyt"
li $t1, 1
beq $t0, $t1, opcao1

li $t1, 2
beq $t0, $t1, opcao2
```

---

# 💾 Memória

Nem todos os dados precisam permanecer nos registradores.

Em programas maiores, é necessário armazenar informações na memória.

Algumas instruções importantes:

```asm id="oifwkv"
lw
sw
lb
sb
```

---

## Load Word

```asm id="xw0752"
lw $t0, 0($t1)
```

Carrega uma palavra da memória para um registrador.

---

## Store Word

```asm id="1r8u8i"
sw $t0, 0($t1)
```

Armazena uma palavra na memória.

---

## Load Byte

```asm id="1vzi9l"
lb $t0, 0($t1)
```

Carrega um byte.

---

## Store Byte

```asm id="up13ns"
sb $t0, 0($t1)
```

Armazena um byte.

---

# 📦 Vetores

Vetores permitem trabalhar com múltiplos valores armazenados sequencialmente na memória.

Em C:

```c id="9k6k2q"
int vetor[5];
```

Em MIPS, é necessário trabalhar diretamente com endereços de memória.

Exemplo conceitual:

```asm id="rtmzq8"
.data

vetor: .space 20
```

O endereço inicial pode ser carregado com:

```asm id="xapf2d"
la $t0, vetor
```

A partir daí, diferentes posições podem ser acessadas utilizando deslocamentos.

---

# 🔄 Registradores x Memória

Essa comparação aparece constantemente durante os exercícios.

```text id="py6n9s"
Registradores
     │
     ├── rápido acesso
     ├── pouca quantidade
     └── usados diretamente pelas instruções

Memória
     │
     ├── maior capacidade
     ├── precisa ser acessada
     └── dados são transferidos por load/store
```

---

# 🔄 Comparação C → MIPS

## Soma

### C

```c id="ccnhg4"
resultado = a + b;
```

### MIPS

```asm id="j1idvy"
add $t2, $t0, $t1
```

---

## Incremento

### C

```c id="vr7o1f"
i++;
```

### MIPS

```asm id="o9mep1"
addi $t0, $t0, 1
```

---

## Igualdade

### C

```c id="e15z4m"
if (a == b) {
    resultado = 1;
}
```

### MIPS

```asm id="ctiys6"
beq $t0, $t1, iguais

iguais:
    li $t2, 1
```

---

## Leitura

### C

```c id="l6p13g"
scanf("%d", &numero);
```

### MIPS

```asm id="qaewb6"
li $v0, 5
syscall
move $t0, $v0
```

---

## Impressão

### C

```c id="c7p4vq"
printf("%d", numero);
```

### MIPS

```asm id="v2v3j8"
li $v0, 1
move $a0, $t0
syscall
```

---

# 🧩 Fluxo de Execução

De maneira simplificada:

```text id="w00hf0"
        Entrada
           │
           ▼
        syscall
           │
           ▼
          $v0
           │
           ▼
      Registradores
           │
     ┌─────┼─────┐
     │     │     │
     ▼     ▼     ▼
 Cálculo Branch Memória
     │     │     │
     └─────┼─────┘
           ▼
        Resultado
           │
           ▼
          $a0
           │
           ▼
        syscall
           │
           ▼
         Saída
```

---

# 📈 Progressão dos Exercícios

Os exercícios seguem uma evolução gradual.

```text id="ta8zdx"
Operações básicas
       │
       ▼
Entrada e saída
       │
       ▼
Registradores
       │
       ▼
Operações aritméticas
       │
       ▼
Comparações
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
Menus
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

Essa progressão permite aprender os conceitos sem começar diretamente por programas grandes e difíceis de analisar.

---

# 🛠️ Tecnologias

<div align="center">

<img src="https://skillicons.dev/icons?i=c" alt="C" />

<br><br>

<img src="https://img.shields.io/badge/Assembly-MIPS-6E4C13?style=for-the-badge&logo=intel&logoColor=white" alt="Assembly MIPS" />
<img src="https://img.shields.io/badge/MARS-MIPS%20Simulator-F28C28?style=for-the-badge" alt="MARS" />

</div>

---

# ▶️ Como Executar

## Programas em C

Com GCC instalado:

```bash id="7cczb8"
gcc programa.c -o programa
```

No Linux:

```bash id="jhy9g7"
./programa
```

No Windows:

```bash id="i2nhhl"
programa.exe
```

---

## Programas em Assembly MIPS

Abra o arquivo `.asm` utilizando o MARS.

Fluxo básico:

```text id="vuumhv"
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
       ├── Console
       ├── Registradores
       └── Memória
```

Também é possível utilizar a execução passo a passo para observar cada instrução individualmente.

---

# 🔎 Análise no MARS

O MARS permite analisar elementos importantes da execução.

## Registradores

É possível acompanhar alterações em registradores como:

```asm id="5yy3zx"
$t0
$t1
$t2
$s0
$a0
$v0
```

---

## Data Segment

Quando os exercícios utilizam memória, o **Data Segment** permite observar os valores armazenados.

---

## Execução Passo a Passo

A execução individual das instruções ajuda a visualizar:

```text id="f8c9ak"
Instrução atual
      │
      ▼
Alteração de registradores
      │
      ▼
Alteração da memória
      │
      ▼
Próxima instrução
```

Esse recurso é especialmente útil para entender branches e loops.

---

# 🧠 O que os Exercícios Demonstram

Ao trabalhar com C e Assembly em paralelo, torna-se mais fácil perceber que estruturas de alto nível são abstrações construídas sobre operações menores.

Por exemplo, algo simples como:

```c id="9zwxzx"
if (numero > 10) {
    numero++;
}
```

pode envolver:

```text id="jrtxse"
carregar valor
      │
      ▼
comparar valor
      │
      ▼
executar branch
      │
      ▼
realizar incremento
      │
      ▼
continuar execução
```

Em Assembly, o programador precisa controlar diretamente cada uma dessas etapas.

---

# 🎓 Relação com Arquitetura de Computadores

Os exercícios também ajudam a conectar programação com conceitos de arquitetura.

```text id="w6081p"
          Programa
             │
             ▼
        Instruções
             │
             ▼
          CPU
       ┌─────┴─────┐
       ▼           ▼
 Registradores   Memória
       │           │
       └─────┬─────┘
             ▼
         Resultado
```

Essa relação torna mais claro como o software utiliza os recursos disponíveis no hardware.

---

# 📚 Finalidade Acadêmica

Esta pasta possui finalidade **acadêmica e educacional**.

Ela funciona como:

* registro dos exercícios desenvolvidos;
* documentação do aprendizado de MIPS;
* material de revisão;
* comparação prática entre C e Assembly;
* estudo de arquitetura de computadores;
* prática de programação de baixo nível.

---

# 🚀 Continuidade

Os conceitos praticados nesta pasta servem como base para conteúdos mais avançados, como:

* stack;
* funções;
* procedimentos;
* passagem de parâmetros;
* chamadas de função;
* manipulação avançada de memória;
* strings;
* arrays;
* estruturas de dados;
* entrada e saída;
* arquitetura do processador.

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

<br><br>

[⬅️ Voltar ao repositório principal](../README.md)

</div>
