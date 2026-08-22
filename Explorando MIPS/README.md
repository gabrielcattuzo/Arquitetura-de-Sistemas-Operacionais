# 🔬 Explorando MIPS

### Tradução de programas em C para Assembly MIPS

Esta pasta reúne exercícios desenvolvidos para compreender como estruturas e operações escritas em **linguagem C** podem ser traduzidas para **Assembly MIPS**.

A proposta é partir de programas simples em C e implementar o mesmo comportamento em Assembly, permitindo comparar uma linguagem de alto nível com instruções executadas em um nível mais próximo do processador.

---

## 📂 Estrutura

```text
Explorando MIPS/
│
├── Tradução Soma/
│   ├── soma.c
│   └── soma.asm
│
├── Tradução Multiplicação/
│   ├── multi.c
│   └── multi.asm
│
├── Tradução IF/
│   ├── if.c
│   └── if.asm
│
└── README.md
```

Cada diretório contém duas versões do mesmo programa:

* `.c` — implementação utilizando linguagem C;
* `.asm` — implementação equivalente utilizando Assembly MIPS.

---

# 🔄 C → Assembly MIPS

Em uma linguagem de alto nível como C, diversas operações são representadas através de comandos simples.

Por exemplo:

```c
soma = a + b;
```

Em Assembly, é necessário determinar explicitamente onde os valores serão armazenados.

```asm
add $t2, $t0, $t1
```

Nesse caso:

```text
C                           MIPS

a          ──────────────►  $t0
b          ──────────────►  $t1
soma       ──────────────►  $t2

soma = a + b              add $t2, $t0, $t1
```

Essa comparação ajuda a compreender como operações de linguagens de alto nível podem ser representadas através de instruções do processador.

---

# ➕ Tradução — Soma

O primeiro programa realiza a **soma de dois números inteiros** fornecidos pelo usuário.

## Implementação em C

A lógica principal é:

```c
int a, b, soma;

scanf("%d", &a);
scanf("%d", &b);

soma = a + b;
```

Em C, as variáveis armazenam os valores utilizados durante a execução.

---

## Implementação em MIPS

Na versão Assembly, os valores são armazenados em registradores:

```text
Primeiro número  → $t0
Segundo número   → $t1
Resultado        → $t2
```

A soma é realizada através da instrução:

```asm
add $t2, $t0, $t1
```

Portanto:

```text
$t0 + $t1
    │
    ▼
   ADD
    │
    ▼
   $t2
```

---

## 🔄 Comparação

| C          | MIPS                      |
| ---------- | ------------------------- |
| `a`        | `$t0`                     |
| `b`        | `$t1`                     |
| `soma`     | `$t2`                     |
| `a + b`    | `add $t2, $t0, $t1`       |
| `scanf()`  | `syscall 5`               |
| `printf()` | `syscall 1` e `syscall 4` |

Por exemplo, considerando:

```text
a = 10
b = 20
```

temos:

```text
$t0 = 10
$t1 = 20

      10
       │
       ▼
     ┌─────┐
     │ ADD │ ─────► 30 ─────► $t2
     └─────┘
       ▲
       │
      20
```

---

# ✖️ Tradução — Multiplicação

O segundo programa segue praticamente a mesma estrutura, porém realiza uma **multiplicação**.

## Implementação em C

```c
multi = a * b;
```

## Implementação em MIPS

```asm
mul $t2, $t0, $t1
```

Os registradores continuam seguindo:

```text
$t0 → primeiro número
$t1 → segundo número
$t2 → resultado
```

Portanto:

```text
$t0 × $t1
    │
    ▼
   MUL
    │
    ▼
   $t2
```

---

## 🔄 Comparação

| C          | MIPS                      |
| ---------- | ------------------------- |
| `a`        | `$t0`                     |
| `b`        | `$t1`                     |
| `multi`    | `$t2`                     |
| `a * b`    | `mul $t2, $t0, $t1`       |
| `scanf()`  | `syscall 5`               |
| `printf()` | `syscall 1` e `syscall 4` |

A principal diferença em relação ao programa anterior está na instrução utilizada:

```text
Soma:

add $t2, $t0, $t1


Multiplicação:

mul $t2, $t0, $t1
```

---

# 🔀 Tradução — IF

O terceiro exercício introduz **controle de fluxo**.

O programa recebe um número inteiro e verifica se ele é positivo.

---

## Implementação em C

A condição utilizada é:

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

Em C, a própria estrutura `if/else` controla qual trecho deverá ser executado.

---

# 🔀 IF em Assembly MIPS

Assembly não utiliza uma estrutura `if` da mesma forma que C.

O controle de fluxo é realizado através de **instruções de desvio e salto**.

No programa:

```asm
bgt $t0, $zero, ehPositivo
```

é utilizado para verificar:

```text
$t0 > 0 ?
```

O registrador:

```asm
$zero
```

possui sempre o valor:

```text
0
```

Portanto:

```text
             $t0 > $zero?
                /     \
              Sim     Não
               │       │
               ▼       ▼
         ehPositivo   continua
               │       │
               ▼       ▼
          "positivo"  "não positivo"
```

---

# 🏷️ Labels

No Assembly, **labels** são utilizados para identificar pontos do programa.

O código possui:

```asm
ehPositivo:
```

e:

```asm
fim:
```

Esses labels funcionam como destinos para instruções de desvio ou salto.

Por exemplo:

```asm
bgt $t0, $zero, ehPositivo
```

significa:

```text
Se $t0 > 0
      │
      ▼
vá para ehPositivo
```

---

# 🦘 Salto incondicional

Após imprimir que o número não é positivo, o programa utiliza:

```asm
j fim
```

A instrução:

```asm
j
```

realiza um **salto incondicional**.

Isso é necessário para evitar que o programa continue executando as instruções existentes no bloco `ehPositivo`.

O fluxo completo pode ser representado como:

```text
              Entrada
                 │
                 ▼
         Lê número em $t0
                 │
                 ▼
            $t0 > 0?
            /       \
          Sim       Não
           │         │
           ▼         ▼
    ehPositivo   nãoPositivo
           │         │
           │         ▼
           │       j fim
           │         │
           └────┬────┘
                ▼
               fim
                │
                ▼
          encerra programa
```

---

# 📞 Entrada e Saída

Os três exercícios utilizam **syscalls** para realizar entrada e saída.

## Imprimir string

```asm
li $v0, 4
la $a0, mensagem
syscall
```

## Ler inteiro

```asm
li $v0, 5
syscall
```

Após a leitura, o número está em:

```text
$v0
```

Por isso é utilizado:

```asm
move $t0, $v0
```

para preservar o valor.

---

## Imprimir inteiro

```asm
li $v0, 1
move $a0, $t2
syscall
```

O valor que será impresso deve estar em:

```text
$a0
```

---

## Encerrar

```asm
li $v0, 10
syscall
```

---

# 🧮 Registradores Utilizados

Nos exercícios atuais são utilizados principalmente:

| Registrador | Utilização                             |
| ----------- | -------------------------------------- |
| `$v0`       | Código da syscall e retorno da leitura |
| `$a0`       | Argumento utilizado pelas syscalls     |
| `$t0`       | Primeiro número / número analisado     |
| `$t1`       | Segundo número                         |
| `$t2`       | Resultado da operação                  |
| `$zero`     | Valor constante `0`                    |

---

# 🧩 Instruções Utilizadas

Até o momento, os exercícios utilizam:

| Instrução | Função                                  |
| --------- | --------------------------------------- |
| `li`      | Carrega um valor imediato               |
| `la`      | Carrega um endereço                     |
| `move`    | Copia um valor entre registradores      |
| `add`     | Soma dois valores                       |
| `mul`     | Multiplica dois valores                 |
| `bgt`     | Desvia caso o primeiro valor seja maior |
| `j`       | Realiza um salto incondicional          |
| `syscall` | Executa uma chamada de sistema          |

---

# 📈 Evolução dos Exercícios

Os exercícios foram organizados de maneira a aumentar gradualmente a complexidade:

```text
Entrada e saída
      │
      ▼
Soma de inteiros
      │
      ├── Registradores
      └── ADD
      │
      ▼
Multiplicação
      │
      └── MUL
      │
      ▼
Estrutura IF
      │
      ├── Comparação
      ├── BGT
      ├── Labels
      └── Jump
```

Inicialmente são utilizadas operações aritméticas simples.

Em seguida, o controle de fluxo começa a ser explorado através da tradução de uma estrutura `if/else`.

---

# ⚖️ C x Assembly MIPS

| Característica | C                       | Assembly MIPS     |
| -------------- | ----------------------- | ----------------- |
| Nível          | Alto nível              | Baixo nível       |
| Variáveis      | `int a`                 | Registradores     |
| Entrada        | `scanf()`               | `syscall`         |
| Saída          | `printf()`              | `syscall`         |
| Soma           | `+`                     | `add`             |
| Multiplicação  | `*`                     | `mul`             |
| Condicional    | `if/else`               | Branches + labels |
| Fluxo          | Estruturas da linguagem | Desvios e saltos  |

Uma instrução simples em C pode exigir diferentes operações em Assembly.

Isso permite visualizar com maior clareza o que acontece em um nível mais próximo do processador.

---

# ▶️ Executando os Programas

## C

Os programas C podem ser compilados utilizando GCC.

Por exemplo:

```bash
gcc soma.c -o soma
```

Execução:

```bash
./soma
```

No Windows:

```powershell
.\soma.exe
```

---

## Assembly MIPS

Os arquivos `.asm` podem ser executados utilizando o **MARS MIPS Simulator**.

### 1. Abra o arquivo

```text
File → Open
```

### 2. Monte

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

A entrada e a saída serão exibidas na área **Run I/O**.

---

# 📚 Conceitos Trabalhados

Até o momento, os exercícios desta pasta abordam:

* tradução de C para Assembly;
* Assembly MIPS;
* registradores;
* entrada e saída;
* syscalls;
* operações aritméticas;
* soma;
* multiplicação;
* estruturas condicionais;
* branches;
* labels;
* saltos;
* fluxo de execução;
* relação entre linguagem de alto e baixo nível.

---

# 🎯 Objetivo

O objetivo desta pasta é explorar gradualmente a tradução de programas escritos em **C** para **Assembly MIPS**.

Ao manter as duas implementações lado a lado, é possível comparar como operações simples de uma linguagem de alto nível são representadas utilizando registradores, instruções, desvios e chamadas de sistema.

Isso permite compreender melhor a relação entre **software, linguagem Assembly e arquitetura do processador**.
