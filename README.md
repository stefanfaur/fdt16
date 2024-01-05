# FIC PROJECT

## MILESTONES:

**Sesiunea 3 - S6 (2 puncte)**
● Alegerea temei de proiect / set de instructiuni
● Specificarea echipei
● Impartirea rolurilor in echipa
● Nume echipa
● Bibliografie

**Sesiunea 6 - S12 ( maxim nota 7)**
● Design Hardware & Documentatie GP (2p)
● Implementare General Purpose Processor (2)
● Testare General Purpose Processor (1)

**Sesiunea 7 - S14 (maxim nota 10)**
● Design & Implementare GP processor + ASIP; (1p)
● Testare ASIP (1)
● Prezentarea finala a proiectului - prezentare, documentatie (1)

Testarea core-ului se face implementarea unor aplicatii folosind setul de instructiuni propus
tradus in cod masina folosind un assembler sau scrierea directa de cod masina.
( instruction file -> assembler/byte code -> memory -> execute instructions from memory)

## Echipa:

```
● HW Design (2 persoane)
● Development (2-4 persoane)
○ Developer (2-3)
○ Testing and QA + UX (1)
● Project Manager (1 persoana) : team management, impartire pe taskuri, timeline,
prezentari
```
## General Purpose Processor (16-bit)

```
● Registers:
○ 16-bit Accumulator;
○ 2 16-bit general purpose (GP) registers: X and Y;
○ 4-bit Flag register: Zero, Negative, Carry, Overflow
○ 16-bit stack pointer
```

```
○ Program Counter
● Instruction size: 16-bit
● Word size: 16-bit
● Stack grows inverse in memory.
```
### Core instruction set:

```
● Instruction size: 16-bit:
○ 6-bit opcode
○ 1-bit Register address
○ 9-bit Immediate size
```
**Memory instructions** : Load, Store into registers Xor Y

```
Opcode Register Address Immediate
```
```
6 bit 1 bit 9 bit
```
**Branch instructions** :
● BRZ = branch if zero
● BRN = branch if negative
● BRC = branch if carry
● BRO = branch if overflow
● BRA = branch always (unconditional branch)
● JMP = call procedure
● RET = return from procedure

```
Opcode Address
```
```
6 bit 10 bit
```
CALL/JMP push PC on stack. All procedure parameters are passed using stack.
RET pop PC from stack. Return value is passed usingstack.

**Arithmetic and Logic Instructions:
● ADD
● SUB
● LSR
● LSL
● RSR**


#### ● RSL

#### ● MOV

#### ● MUL

#### ● DIV

#### ● MOD

#### ● AND

#### ● OR

#### ● XOR

#### ● NOT

#### ● CMP

#### ● TST

#### ● INC

#### ● DEC

```
Opcode Register Address Immediate
```
```
6 bit 1 bit 9 bit
```
Only arithmetic and logic instructions should update the Flag register!

## Minimum required CPU Components

```
● 2 general purpose registers: X, Y, and one accumulator A
● ALU
● Control Unit
● Instruction and Data memory (includes Stack)
● Sign Extend unit
● Processor registers: PC, SP, Flag
```
## Application-Specific Instruction Set Processor (ASIP)

1. Come up with instructions for specific cores
2. Required for the final Milestone.


### Possible applications (can come up with other ideas):

1. Calculator de buzunar
2. Operatii cu tensori
3. Floating Point Coprocessor
4. Cryptographic core
5. Crypto currency mining (hashing) core


