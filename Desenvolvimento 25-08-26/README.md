# 🎯 Desenvolvimento — 25/08/2026

## Controle de Fluxo, Loops e Memória em Assembly MIPS

Nesta atividade foram explorados conceitos de **controle de fluxo e armazenamento de dados em Assembly MIPS**.

O exercício principal consiste em armazenar um número informado pelo usuário e solicitar novas tentativas até que o mesmo número seja digitado novamente.

Foram desenvolvidas duas abordagens para o problema:

1. armazenamento utilizando **registrador**;
2. armazenamento utilizando **memória**.

Também foi utilizado um programa simples para demonstrar o funcionamento da instrução de salto `j`.

---

# 📂 Estrutura

```text
Desenvolvimento 25-08-26/
│
├── README.md
├── teste.asm
│
├── Abordagem 1/
│   ├── adivinhar_numero.c
│   └── adivinhar_numero.asm
│
└── Abordagem 2/
    └── adivinhar_numero.asm
```

---

# 🧪 `teste.asm` — Jump e Labels

O arquivo `teste.asm` apresenta um exemplo simples do funcionamento da instrução:

```asm
j
```

O programa possui uma mensagem:

```asm
minha_mensagem: .asciiz "Hello World!"
```

mas executa:

```asm
j fim
```

antes das instruções responsáveis por imprimi-la.

Portanto:

```text
main
 │
 ▼
j fim ───────────────────────┐
 │                           │
 │  instruções de impressão │
 │  são ignoradas           │
 │                           │
 └──────────────────────────►fim
                              │
                              ▼
                         syscall 10
```

A mensagem não é exibida porque `j fim` altera diretamente o fluxo de execução.

---

# 🏷️ Labels

Labels identificam posições dentro do programa.

No exercício aparecem:

```asm
main:
```

e:

```asm
fim:
```

A instrução:

```asm
j fim
```

faz o processador continuar a execução a partir do label `fim`.

Isso permite implementar estruturas de controle de fluxo.

---

# 🎮 Programa de Adivinhação

O exercício principal solicita inicialmente um número ao usuário.

Depois disso, novas tentativas são solicitadas até que o usuário informe novamente o mesmo valor.

A lógica geral é:

```text
           Número inicial
                 │
                 ▼
            Armazena
                 │
                 ▼
        ┌── Nova tentativa ◄────┐
        │                       │
        ▼                       │
   Número é igual?              │
      /      \                  │
    Sim      Não ───────────────┘
     │
     ▼
  Acertou
     │
     ▼
    Fim
```

---

# 1️⃣ Abordagem 1 — Registrador

Na primeira abordagem, o valor informado inicialmente é armazenado diretamente em:

```asm
$t0
```

através de:

```asm
move $t0, $v0
```

Portanto:

```text
Usuário
   │
   ▼
syscall 5
   │
   ▼
  $v0
   │
  move
   │
   ▼
  $t0
```

O registrador `$t0` mantém o número que deverá ser comparado com as próximas tentativas.

---

## 🔁 Loop

O programa possui o label:

```asm
loop:
```

A cada tentativa, um novo inteiro é lido:

```asm
li $v0, 5
syscall
```

Depois é realizada a comparação:

```asm
beq $v0, $t0, acertou
```

Se os valores forem diferentes:

```asm
j loop
```

faz o programa voltar para o início do processo.

---

# 🔀 `beq`

A instrução:

```asm
beq $v0, $t0, acertou
```

significa:

```text
$v0 == $t0 ?
    /     \
  Sim     Não
   │       │
   ▼       ▼
acertou   loop
```

`beq` significa **Branch if Equal**.

Caso os dois registradores possuam o mesmo valor, a execução continua no label:

```asm
acertou:
```

---

# 🔄 Comparação com C

A mesma lógica foi implementada em `adivinhar_numero.c`.

Em C:

```c
while (1)
{
    scanf("%d", &b);

    if (b == a)
    {
        break;
    }
}
```

Em MIPS, a estrutura é representada por:

```asm
loop:

    li $v0, 5
    syscall

    beq $v0, $t0, acertou

    j loop
```

Assim:

| C             | MIPS                  |
| ------------- | --------------------- |
| `while`       | label + `j`           |
| `if (b == a)` | `beq`                 |
| `break`       | desvio para `acertou` |
| variável `a`  | `$t0`                 |

---

# 2️⃣ Abordagem 2 — Memória

Na segunda abordagem, o valor inicial não permanece apenas em um registrador.

É criada uma posição na memória:

```asm
numero: .byte 1
```

Depois da leitura, o número é armazenado através de:

```asm
sb $s0, numero
```

---

# 💾 `sb` — Store Byte

A instrução:

```asm
sb
```

significa **Store Byte**.

No programa:

```asm
sb $s0, numero
```

o byte menos significativo armazenado em `$s0` é salvo na posição identificada por `numero`.

Visualmente:

```text
$s0
 │
 │ sb
 ▼
┌──────────────┐
│   Memória    │
│              │
│ numero: byte │
└──────────────┘
```

---

# 📥 `lb` — Load Byte

Quando o valor precisa ser utilizado novamente:

```asm
lb $s1, numero
```

é executado.

`lb` significa **Load Byte**.

Assim:

```text
┌──────────────┐
│   Memória    │
│              │
│ numero: byte │
└──────┬───────┘
       │
       │ lb
       ▼
      $s1
```

Depois:

```asm
beq $v0, $s1, acertou
```

compara a tentativa atual com o valor recuperado da memória.

---

# ⚖️ Abordagem 1 x Abordagem 2

| Característica          | Abordagem 1    | Abordagem 2     |
| ----------------------- | -------------- | --------------- |
| Armazenamento principal | Registrador    | Memória         |
| Valor inicial           | `$t0`          | `numero: .byte` |
| Store                   | `move`         | `sb`            |
| Load                    | Não necessário | `lb`            |
| Comparação              | `$v0` x `$t0`  | `$v0` x `$s1`   |
| Loop                    | `j loop`       | `j loop`        |
| Condição                | `beq`          | `beq`           |

Visualmente:

```text
ABORDAGEM 1

Entrada
   │
   ▼
  $v0
   │
 move
   ▼
  $t0
   │
   └──────► comparação


ABORDAGEM 2

Entrada
   │
   ▼
  $v0
   │
 move
   ▼
  $s0
   │
  sb
   ▼
Memória
   │
  lb
   ▼
  $s1
   │
   └──────► comparação
```

---

# 🧠 Registradores Utilizados

## Abordagem 1

| Registrador | Função                    |
| ----------- | ------------------------- |
| `$v0`       | Syscall e tentativa atual |
| `$a0`       | Endereço das mensagens    |
| `$t0`       | Número inicial            |

## Abordagem 2

| Registrador | Função                         |
| ----------- | ------------------------------ |
| `$v0`       | Syscall e tentativa atual      |
| `$a0`       | Endereço das mensagens         |
| `$s0`       | Número antes de ser armazenado |
| `$s1`       | Número recuperado da memória   |

---

# 🧩 Instruções Trabalhadas

| Instrução | Função                              |
| --------- | ----------------------------------- |
| `li`      | Carrega um valor imediato           |
| `la`      | Carrega um endereço                 |
| `move`    | Copia valores entre registradores   |
| `beq`     | Desvia se dois valores forem iguais |
| `j`       | Salto incondicional                 |
| `sb`      | Armazena um byte na memória         |
| `lb`      | Carrega um byte da memória          |
| `syscall` | Executa uma chamada de sistema      |

---

# 📈 Evolução da Atividade

```text
Jump
 │
 ▼
Labels
 │
 ▼
Loop
 │
 ▼
Comparação com BEQ
 │
 ▼
Armazenamento
 │
 ├──────────────┐
 ▼              ▼
Registrador   Memória
                 │
                 ├── SB
                 └── LB
```

A atividade parte do controle simples do fluxo de execução e evolui para a comparação entre diferentes formas de armazenar dados.

---

# 📚 Conceitos Trabalhados

* Assembly MIPS;
* registradores;
* memória;
* `.byte`;
* labels;
* loops;
* `j`;
* `beq`;
* `move`;
* `sb`;
* `lb`;
* syscalls;
* estruturas de repetição;
* estruturas condicionais;
* comparação entre registradores e memória;
* tradução de C para Assembly.

---

# 🎯 Objetivo

O objetivo da atividade é compreender como estruturas comuns de programação podem ser implementadas em Assembly.

A primeira abordagem demonstra como um valor pode permanecer em um **registrador**, enquanto a segunda utiliza explicitamente a **memória** através das instruções `sb` e `lb`.

Dessa forma, é possível observar na prática a diferença entre armazenamento em registradores e armazenamento em memória dentro de um programa MIPS.
