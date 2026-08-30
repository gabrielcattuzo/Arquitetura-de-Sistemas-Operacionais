# 🔬 Explorando MIPS

### Exercícios e traduções de C para Assembly MIPS

Esta pasta reúne exercícios desenvolvidos para praticar **Assembly MIPS** através da comparação com programas equivalentes escritos em **C**.

A proposta é começar com operações simples e aumentar gradualmente a complexidade, passando por operações aritméticas, condicionais, operações lógicas, estruturas de repetição, menus e programas com múltiplos caminhos de execução.

---

# 📂 Estrutura

```text
Explorando MIPS/
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
├── Tradução IF/
│   ├── if.c
│   └── if.asm
│
├── Par ou Impar/
│   ├── teste.c
│   └── teste.asm
│
├── Media/
│   ├── media.c
│   └── media.asm
│
├── Comparador/
│   ├── comparador.c
│   └── comparador.asm
│
├── Comparador2/
│   └── comparador.c
│
├── Contagem/
│   ├── contagem.c
│   └── contagem.asm
│
├── Somador/
│   ├── somador.c
│   └── somador.asm
│
├── Calculadora/
│   ├── calc.c
│   └── calc.asm
│
└── Conversor/
    ├── conversor.c
    └── conversor.asm
```

> `contagem.asm` e `somador.asm` ainda estão vazios na versão atual.
> O exercício `Comparador2` possui atualmente apenas a implementação em C.

---

# 📊 Exercícios

| Exercício              |  C  | MIPS | Conceitos principais            |
| ---------------------- | :-: | :--: | ------------------------------- |
| Tradução Soma          |  ✅  |   ✅  | Soma e registradores            |
| Tradução Multiplicação |  ✅  |   ✅  | Multiplicação                   |
| Tradução IF            |  ✅  |   ✅  | Condicional e branch            |
| Par ou Ímpar           |  ✅  |   ✅  | Operação lógica e bits          |
| Média                  |  ✅  |   ✅  | Soma, divisão e comparação      |
| Comparador             |  ✅  |   ✅  | Comparações                     |
| Comparador 2           |  ✅  |   ⏳  | Três valores e empates          |
| Contagem               |  ✅  |   ⏳  | Estrutura `for`                 |
| Somador                |  ✅  |   ⏳  | Loop e acumulador               |
| Calculadora            |  ✅  |   ✅  | Menu, switch e operações        |
| Conversor              |  ✅  |   ✅  | Conversões e múltiplos branches |

---

# ➕ 1. Tradução Soma

O primeiro exercício realiza a soma de dois inteiros.

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

Este exercício introduz:

* leitura de inteiros;
* registradores temporários;
* `add`;
* impressão de resultados;
* syscalls.

---

# ✖️ 2. Tradução Multiplicação

O segundo exercício modifica a operação anterior para realizar uma multiplicação.

Em C:

```c
multi = a * b;
```

Em MIPS:

```asm
mul $t2, $t0, $t1
```

A estrutura de entrada e saída permanece semelhante, permitindo concentrar o estudo na instrução aritmética.

---

# 🔀 3. Tradução IF

Este exercício verifica se um número é positivo.

Em C:

```c
if (numero > 0)
```

Em MIPS:

```asm
bgt $t0, $zero, ehPositivo
```

A atividade introduz:

* branches;
* `$zero`;
* labels;
* `bgt`;
* `j`;
* implementação de `if/else`.

Fluxo:

```text
Número
  │
  ▼
> 0 ?
 /   \
Sim  Não
 │    │
 ▼    ▼
Pos. Não Pos.
```

---

# 🔢 4. Par ou Ímpar

Este exercício verifica se um número é par ou ímpar.

Em C, a verificação utiliza:

```c
numero % 2 == 0
```

Na versão MIPS é utilizada uma abordagem em nível de bits:

```asm
andi $t1, $t0, 1
```

seguida de:

```asm
beqz $t1, ehPar
```

A operação verifica o **bit menos significativo**.

```text
Número em binário
       │
       ▼
   último bit
     /     \
    0       1
    │       │
   Par    Ímpar
```

Esse exercício introduz uma aplicação prática de operações lógicas em Assembly.

---

# 📊 5. Média

O programa calcula a média de duas notas e determina se o resultado representa aprovação ou reprovação.

A implementação MIPS realiza:

```asm
add $t2, $t0, $t1
```

seguido de:

```asm
div $t2, $t3
mflo $t2
```

Depois, compara a média com `5`:

```asm
bge $t2, $t3, aprovado
```

O exercício trabalha:

* soma;
* divisão;
* `mflo`;
* comparação;
* `bge`;
* labels.

> A versão MIPS atual trabalha com inteiros, enquanto o programa C utiliza `float`. Portanto, as duas versões demonstram a mesma ideia geral, mas não possuem exatamente a mesma precisão numérica.

---

# ⚖️ 6. Comparador

O comparador recebe dois números e determina:

* se os números são iguais;
* qual deles é maior.

A implementação utiliza:

```asm
beq $t0, $t1, numerosIguais
```

e:

```asm
bgt $t0, $t1, primeiroMaior
```

Fluxo:

```text
           A == B?
           /    \
         Sim    Não
          │      │
          ▼      ▼
       Iguais   A > B?
                /   \
              Sim   Não
               │     │
               ▼     ▼
               A     B
             maior maior
```

---

# 🔢 7. Comparador 2

O segundo comparador aumenta a complexidade do problema.

Agora são recebidos **três números inteiros** e o programa determina o maior valor.

Também são tratados empates entre:

* os três números;
* primeiro e segundo;
* primeiro e terceiro;
* segundo e terceiro.

A implementação atual está disponível em:

```text
Comparador2/comparador.c
```

A versão MIPS ainda poderá ser desenvolvida posteriormente.

---

# 🔁 8. Contagem

O programa C realiza uma contagem regressiva:

```c
for (cont = 10; cont >= 0; cont--)
```

produzindo:

```text
10
9
8
7
...
1
0
FIM!
```

Esse exercício é útil para estudar a tradução de estruturas:

```text
for
 │
 ▼
Inicialização
 │
 ▼
Condição
 │
 ▼
Corpo
 │
 ▼
Atualização
 │
 └──────► condição
```

O arquivo `contagem.asm` existe, porém ainda está vazio na versão atual.

---

# ➕ 9. Somador de 1 até N

O programa recebe um número `N` e soma todos os valores de `1` até ele.

Em C:

```c
for (contador = 1; contador <= numero; contador++)
{
    soma += contador;
}
```

Exemplo:

```text
N = 5

1 + 2 + 3 + 4 + 5 = 15
```

O exercício trabalha principalmente:

* contador;
* acumulador;
* repetição;
* condição de parada.

O arquivo `somador.asm` existe, porém ainda está vazio na versão atual.

---

# 🧮 10. Calculadora

A calculadora representa um avanço importante em relação aos primeiros exercícios.

O programa oferece:

```text
1 - Adição
2 - Subtração
3 - Multiplicação
4 - Divisão
0 - Sair
```

A versão em C utiliza:

```c
switch (operacao)
```

Já em MIPS, o comportamento é implementado através de comparações:

```asm
beq $t0, $t4, adicao
beq $t0, $t4, subtracao
beq $t0, $t4, multiplicacao
beq $t0, $t4, divisao
```

---

## Operações

### Soma

```asm
add $t3, $t1, $t2
```

### Subtração

```asm
sub $t3, $t1, $t2
```

### Multiplicação

```asm
mul $t3, $t1, $t2
```

### Divisão

```asm
div $t1, $t2
mflo $t3
```

Também existe uma verificação para impedir divisão por zero:

```asm
beq $t2, $zero, divisaoZero
```

O programa retorna ao menu após cada operação, implementando um loop completo de execução.

---

# 🌡️ 11. Conversor de Temperaturas

O conversor permite escolher:

```text
1 - Celsius
2 - Fahrenheit
3 - Kelvin
```

tanto para a unidade de entrada quanto para a unidade de saída.

O programa suporta:

```text
Celsius    → Celsius
Celsius    → Fahrenheit
Celsius    → Kelvin

Fahrenheit → Celsius
Fahrenheit → Fahrenheit
Fahrenheit → Kelvin

Kelvin     → Celsius
Kelvin     → Fahrenheit
Kelvin     → Kelvin
```

---

## Validação

As opções são validadas utilizando:

```asm
blt
```

e:

```asm
bgt
```

para garantir que estejam entre `1` e `3`.

---

## Conversões

### Celsius → Fahrenheit

```text
(C × 9) / 5 + 32
```

### Celsius → Kelvin

```text
C + 273
```

### Fahrenheit → Celsius

```text
(F - 32) × 5 / 9
```

### Fahrenheit → Kelvin

```text
(F - 32) × 5 / 9 + 273
```

### Kelvin → Celsius

```text
K - 273
```

### Kelvin → Fahrenheit

```text
(K - 273) × 9 / 5 + 32
```

A implementação utiliza instruções como:

```asm
addi
mul
div
mflo
beq
blt
bgt
j
```

Esse é um dos exercícios mais completos da pasta até o momento.

---

# 🧠 Instruções MIPS Utilizadas

Ao longo dos exercícios aparecem:

| Instrução | Função                           |
| --------- | -------------------------------- |
| `li`      | Carregar valor imediato          |
| `la`      | Carregar endereço                |
| `move`    | Copiar valor entre registradores |
| `add`     | Soma                             |
| `addi`    | Soma com valor imediato          |
| `sub`     | Subtração                        |
| `mul`     | Multiplicação                    |
| `div`     | Divisão                          |
| `mflo`    | Recuperar resultado da divisão   |
| `andi`    | AND lógico com valor imediato    |
| `beq`     | Branch se igual                  |
| `beqz`    | Branch se igual a zero           |
| `bgt`     | Branch se maior                  |
| `blt`     | Branch se menor                  |
| `bge`     | Branch se maior ou igual         |
| `j`       | Salto incondicional              |
| `syscall` | Chamada de sistema               |

---

# 📈 Evolução dos Exercícios

```text
Soma
 │
 ▼
Multiplicação
 │
 ▼
IF
 │
 ▼
Par ou Ímpar
 │
 ├── ANDI
 │
 └── Bits
 │
 ▼
Média
 │
 ├── DIV
 │
 └── Comparação
 │
 ▼
Comparadores
 │
 ▼
Repetições
 │
 ├── Contagem
 │
 └── Somador
 │
 ▼
Calculadora
 │
 ├── Menu
 │
 ├── Loop
 │
 └── Múltiplas operações
 │
 ▼
Conversor
    ├── Validação
    ├── Múltiplos caminhos
    └── Conversões
```

---

# 🔄 C x Assembly MIPS

Os exercícios permitem observar equivalências importantes:

| C               | Assembly MIPS                 |
| --------------- | ----------------------------- |
| Variáveis       | Registradores / memória       |
| `scanf()`       | Syscalls de leitura           |
| `printf()`      | Syscalls de impressão         |
| `+`             | `add` / `addi`                |
| `-`             | `sub` / `addi` negativo       |
| `*`             | `mul`                         |
| `/`             | `div` + `mflo`                |
| `if`            | Branches                      |
| `else`          | Labels + jumps                |
| `switch`        | Sequência de branches         |
| `while` / `for` | Labels + branches + jumps     |
| `% 2`           | Pode ser analisado com `andi` |

---

# 🎯 Objetivo

A pasta **Explorando MIPS** funciona como ambiente de prática para compreender gradualmente como estruturas conhecidas da linguagem C podem ser representadas em Assembly.

A evolução dos exercícios permite passar de:

```text
Operações simples
        │
        ▼
Condicionais
        │
        ▼
Operações em bits
        │
        ▼
Repetições
        │
        ▼
Múltiplos caminhos
        │
        ▼
Programas completos
```

Dessa forma, os exercícios ajudam a compreender a relação entre **linguagens de alto nível, Assembly e o funcionamento do processador**.
