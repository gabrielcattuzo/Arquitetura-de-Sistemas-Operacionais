# 🔢 Entrada e Saída de Inteiro em C e Assembly MIPS

Programa desenvolvido em **C** e **Assembly MIPS** para demonstrar operações básicas de **entrada e saída de dados**.

A versão em C funciona como uma implementação de referência em linguagem de alto nível, enquanto a versão em Assembly MIPS permite observar de forma mais detalhada como a mesma lógica pode ser realizada utilizando **registradores**, **instruções** e **chamadas de sistema (`syscall`)**.

O programa solicita que o usuário digite um número inteiro, armazena o valor informado e, em seguida, exibe o mesmo número na tela.

---

## 📂 Arquivos

```text
Desenvolvimento 18-08-26/
│
├── README.md
├── eco.c
└── eco.asm
```

| Arquivo   | Linguagem     | Descrição                                                     |
| --------- | ------------- | ------------------------------------------------------------- |
| `eco.c`   | C             | Implementação de referência utilizando `scanf()` e `printf()` |
| `eco.asm` | Assembly MIPS | Implementação utilizando registradores e `syscall`            |

---

## 🎯 Objetivo

O objetivo deste exercício é introduzir conceitos básicos da linguagem **Assembly MIPS** através da comparação com uma implementação equivalente em C.

Entre os conceitos trabalhados estão:

* Utilização dos segmentos `.data` e `.text`;
* Declaração e utilização de strings;
* Uso de registradores;
* Entrada de números inteiros;
* Impressão de strings e números;
* Utilização de chamadas de sistema (`syscall`);
* Movimentação de valores entre registradores;
* Comparação entre uma linguagem de alto nível e Assembly;
* Relação entre variáveis em C e registradores em MIPS.

---

## ⚙️ Funcionamento

As duas versões do programa executam essencialmente as mesmas etapas:

1. Exibem uma mensagem solicitando um número inteiro.
2. Aguardam a entrada do usuário.
3. Armazenam o número digitado.
4. Exibem uma mensagem de saída.
5. Imprimem o número informado pelo usuário.
6. Encerram a execução.

O fluxo lógico pode ser representado como:

```text
Entrada do usuário
       │
       ▼
Solicita um número
       │
       ▼
Lê o número
       │
       ▼
Armazena o valor
       │
       ▼
Exibe o número
       │
       ▼
      Fim
```

---

# 💻 Implementação em C

A versão em C utiliza uma variável inteira para armazenar o valor digitado pelo usuário.

## Código

```c
#include <stdio.h>

int main()
{
    int a;

    printf("Digite um numero: ");
    scanf("%d", &a);

    printf("O numero digitado foi: %d\n", a);

    return 0;
}
```

---

## 🧠 Funcionamento da versão em C

Inicialmente, é declarada uma variável:

```c
int a;
```

Essa variável será responsável por armazenar o número digitado.

A entrada é realizada através de:

```c
scanf("%d", &a);
```

O valor é então exibido com:

```c
printf("O numero digitado foi: %d\n", a);
```

Em C, detalhes como leitura do teclado, gerenciamento de registradores e chamadas ao sistema ficam abstraídos pelas funções da biblioteca padrão.

---

# ⚙️ Implementação em Assembly MIPS

Na versão MIPS, as operações precisam ser realizadas explicitamente através de instruções e registradores.

## Código

```asm
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

# 🔄 Comparação C x Assembly MIPS

Apesar de produzirem o mesmo resultado, as duas versões utilizam mecanismos diferentes.

| Operação          | C          | Assembly MIPS |
| ----------------- | ---------- | ------------- |
| Armazenar número  | `int a`    | `$t0`         |
| Solicitar entrada | `printf()` | `syscall 4`   |
| Ler inteiro       | `scanf()`  | `syscall 5`   |
| Exibir texto      | `printf()` | `syscall 4`   |
| Exibir inteiro    | `printf()` | `syscall 1`   |
| Encerrar          | `return 0` | `syscall 10`  |

Podemos visualizar a correspondência da seguinte forma:

```text
C                                  MIPS

int a;                             $t0
  │                                 │
  │                                 │
scanf("%d", &a)                syscall 5
  │                                 │
  ▼                                 ▼
 variável a                        $v0
                                    │
                                  move
                                    │
                                    ▼
                                   $t0

printf("%d", a)                syscall 1
                                    │
                                    ▼
                                   $a0
```

---

# 🧠 Registradores Utilizados

Durante a execução são utilizados três registradores principais:

| Registrador | Função                                                           |
| ----------- | ---------------------------------------------------------------- |
| `$v0`       | Define o código da chamada de sistema e recebe o número digitado |
| `$a0`       | Armazena o argumento utilizado pelas chamadas de impressão       |
| `$t0`       | Armazena temporariamente o número informado pelo usuário         |

---

## `$v0`

O registrador `$v0` é utilizado para indicar qual chamada de sistema deve ser executada.

Por exemplo:

```asm
li $v0, 5
syscall
```

Nesse caso, o código `5` indica que o programa deve realizar a leitura de um número inteiro.

Após a leitura, o valor informado pelo usuário também é retornado através de `$v0`.

Isso significa que `$v0` possui duas funções importantes neste exercício:

```text
Antes da syscall
      │
      ▼
Código da operação
      │
      ▼
   syscall
      │
      ▼
Depois da syscall
      │
      ▼
Valor retornado
```

---

## `$a0`

O registrador `$a0` é utilizado para passar argumentos para determinadas chamadas de sistema.

Para imprimir uma string:

```asm
li $v0, 4
la $a0, entrada
syscall
```

O endereço da string `entrada` é carregado em `$a0`.

Para imprimir um número inteiro:

```asm
li $v0, 1
move $a0, $t0
syscall
```

O número armazenado em `$t0` é copiado para `$a0` antes da chamada de sistema.

---

## `$t0`

O registrador `$t0` é utilizado como armazenamento temporário para preservar o número informado pelo usuário:

```asm
move $t0, $v0
```

Isso é necessário porque `$v0` será utilizado posteriormente para configurar outras chamadas de sistema.

Sem mover o valor para outro registrador, o número informado poderia ser perdido quando `$v0` recebesse um novo código de syscall.

Visualmente:

```text
Número digitado
      │
      ▼
     $v0
      │
    move
      │
      ▼
     $t0
      │
      ▼
Número preservado
```

---

# 📞 Syscalls Utilizadas

O programa utiliza quatro chamadas de sistema:

| Código | Operação      | Utilização                      |
| -----: | ------------- | ------------------------------- |
|    `1` | Print Integer | Exibe um número inteiro         |
|    `4` | Print String  | Exibe uma string                |
|    `5` | Read Integer  | Realiza a leitura de um inteiro |
|   `10` | Exit          | Encerra o programa              |

---

## Impressão de String

```asm
li $v0, 4
la $a0, entrada
syscall
```

Primeiro, o código da operação é colocado em `$v0`.

Depois, o endereço da string é carregado em `$a0`.

---

## Leitura de Inteiro

```asm
li $v0, 5
syscall
```

Após a execução da syscall, o valor digitado fica disponível em:

```text
$v0
```

---

## Impressão de Inteiro

```asm
li $v0, 1
move $a0, $t0
syscall
```

O valor que será exibido precisa estar no registrador `$a0`.

---

## Encerramento

```asm
li $v0, 10
syscall
```

A syscall `10` encerra a execução do programa.

---

# 🗃️ Segmento `.data`

O segmento:

```asm
.data
```

é utilizado para armazenar os dados utilizados pelo programa.

Neste caso:

```asm
entrada: .asciiz "Digite um numero: "
saida:   .asciiz "Numero digitado: "
```

As duas mensagens são armazenadas na memória.

---

## `.asciiz`

A diretiva:

```asm
.asciiz
```

é utilizada para armazenar uma sequência de caracteres terminada pelo caractere nulo.

Por exemplo:

```asm
entrada: .asciiz "Digite um numero: "
```

O label:

```text
entrada
```

representa o endereço onde essa string está armazenada.

---

# ⚙️ Segmento `.text`

O segmento:

```asm
.text
```

contém as instruções que serão executadas pelo processador.

O programa também utiliza:

```asm
.globl main
```

para indicar que:

```asm
main:
```

é o ponto principal de entrada do programa.

---

# 🧩 Instruções Utilizadas

Além das syscalls, o exercício utiliza algumas instruções fundamentais do MIPS.

| Instrução | Significado    | Função                                         |
| --------- | -------------- | ---------------------------------------------- |
| `li`      | Load Immediate | Carrega um valor diretamente em um registrador |
| `la`      | Load Address   | Carrega o endereço de um dado                  |
| `move`    | Move           | Copia um valor entre registradores             |
| `syscall` | System Call    | Solicita um serviço ao simulador               |

---

## `li`

Exemplo:

```asm
li $v0, 4
```

Carrega o valor:

```text
4
```

diretamente em:

```text
$v0
```

---

## `la`

Exemplo:

```asm
la $a0, entrada
```

Carrega em `$a0` o endereço correspondente ao label `entrada`.

---

## `move`

Exemplo:

```asm
move $t0, $v0
```

Copia o conteúdo existente em `$v0` para `$t0`.

É importante perceber que:

```text
$v0
 │
 │ copia
 ▼
$t0
```

o valor original não é removido de `$v0` imediatamente; ele apenas é copiado.

---

# 🔄 Fluxo do Programa

```text
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
│ Valor retornado      │
│ em $v0               │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│ move $t0, $v0        │
│                      │
│ Salva o número       │
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
│ move $a0, $t0        │
│                      │
│ Prepara impressão    │
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

# 🖥️ Exemplo de Execução

## Entrada

```text
Digite um numero: 25
```

## Saída

```text
Numero digitado: 25
```

A execução completa será semelhante a:

```text
Digite um numero: 25
Numero digitado: 25
```

O programa também aceita números negativos:

```text
Digite um numero: -15
Numero digitado: -15
```

---

# 🔍 Exemplo Passo a Passo

Considerando a entrada:

```text
25
```

podemos acompanhar os registradores.

### 1. Configuração da leitura

```asm
li $v0, 5
```

Estado:

```text
$v0 = 5
```

---

### 2. Usuário informa `25`

```asm
syscall
```

Agora:

```text
$v0 = 25
```

---

### 3. Preservação do valor

```asm
move $t0, $v0
```

Estado:

```text
$v0 = 25
$t0 = 25
```

---

### 4. Configuração da syscall de impressão

```asm
li $v0, 1
```

Agora:

```text
$v0 = 1
$t0 = 25
```

O valor original continua preservado em `$t0`.

---

### 5. Preparação do argumento

```asm
move $a0, $t0
```

Estado:

```text
$v0 = 1
$t0 = 25
$a0 = 25
```

---

### 6. Impressão

```asm
syscall
```

Resultado:

```text
25
```

Esse exemplo demonstra por que o uso de `$t0` é necessário para preservar a entrada do usuário.

---

# ▶️ Como Executar

O programa Assembly pode ser executado utilizando simuladores compatíveis com **MIPS**, como o **MARS**.

---

## 1. Abra o MARS

Inicie o **MARS MIPS Simulator**.

---

## 2. Abra o código

Acesse:

```text
File → Open
```

Selecione:

```text
eco.asm
```

---

## 3. Monte o programa

Acesse:

```text
Run → Assemble
```

ou pressione:

```text
F3
```

---

## 4. Execute

Acesse:

```text
Run → Go
```

ou pressione:

```text
F5
```

---

## 5. Informe um número

Na área **Run I/O**, digite o número solicitado pelo programa.

O valor será lido, armazenado e exibido em seguida.

---

# ▶️ Executando a versão em C

A implementação em C pode ser compilada utilizando GCC.

Dentro da pasta do exercício:

```bash
gcc eco.c -o eco
```

Depois:

```bash
./eco
```

No Windows:

```powershell
.\eco.exe
```

---

# 📚 Conceitos Trabalhados

Este exercício aborda conceitos fundamentais de programação em C e Assembly:

* Linguagem C;
* Assembly MIPS;
* Comparação C → MIPS;
* Registradores;
* Segmento de dados (`.data`);
* Segmento de código (`.text`);
* Strings com `.asciiz`;
* Labels;
* Instrução `li`;
* Instrução `la`;
* Instrução `move`;
* Entrada e saída;
* Chamadas de sistema;
* Syscalls;
* Armazenamento temporário de dados;
* Fluxo básico de execução;
* Relação entre variáveis e registradores;
* Relação entre software de alto nível e instruções de baixo nível.

---

# 📈 Evolução do Exercício

A atividade pode ser visualizada como uma transição entre duas formas de programação:

```text
Linguagem C
     │
     ├── int
     ├── scanf()
     └── printf()
     │
     ▼
Mesma lógica
     │
     ▼
Assembly MIPS
     │
     ├── Registradores
     ├── Syscalls
     ├── LI
     ├── LA
     └── MOVE
     │
     ▼
Maior proximidade
com o hardware
```

A versão em C demonstra **o que** o programa deve fazer.

A versão em Assembly ajuda a compreender com maior detalhe **como** essas operações podem ser executadas.

---

# 🎓 Contexto

Este exercício faz parte dos estudos de **Assembly MIPS** realizados durante a disciplina de **Arquitetura de Sistemas Operacionais** do curso de Engenharia de Computação.

O código tem finalidade acadêmica e busca demonstrar de forma simples o funcionamento de entrada e saída, registradores e chamadas de sistema na arquitetura MIPS.

A presença das versões `eco.c` e `eco.asm` também permite utilizar a linguagem C como referência para compreender gradualmente a tradução de estruturas de alto nível para Assembly.

---

# 👨‍💻 Autor

<div align="center">

### Gabriel Cattuzo

Computer Engineering Student at **PUC-Campinas**

[![GitHub](https://img.shields.io/badge/GitHub-gabrielcattuzo-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/gabrielcattuzo)
[![Website](https://img.shields.io/badge/Website-cattuzo.com-4285F4?style=for-the-badge\&logo=google-chrome\&logoColor=white)](https://cattuzo.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Gabriel%20Cattuzo-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://br.linkedin.com/in/gabrielcattuzo)

</div>
