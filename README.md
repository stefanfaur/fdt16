1. FIC Project

   ## Milestones

   ### Session 3 - Week 6 (2 Points)

   - **Topic Selection**
     - Choose project theme/set of instructions
   - **Team Specification**
   - **Role Distribution in Team**
   - **Team Name**
   - **Bibliography**

   ### Session 6 - Week 12 (Max Grade: 7)

   - **Hardware Design & GP Documentation** (2 Points)
   - **Implementation of General Purpose Processor** (2 Points)
   - **Testing General Purpose Processor** (1 Point)

   ### Session 7 - Week 14 (Max Grade: 10)

   - **Design & Implementation of GP Processor + ASIP** (1 Point)
   - **Testing ASIP** (1 Point)
   - **Final Project Presentation** - presentation, documentation (1 Point)

   _Testing of the core involves implementing applications using the proposed instruction set translated into machine code using an assembler or writing machine code directly._

   ### Team Composition

   ```plaintext
   - HW Design (2 People)
   - Development (2-4 People)
   - Developer (2-3 People)
   - Testing and QA + UX (1 Person)
   - Project Manager (1 Person): Team management, task assignment, timeline, presentations
   ```

2. ## General Purpose Processor (16-bit)

   ### Components

   - Registers:
     - 16-bit Accumulator
     - 2x 16-bit General Purpose (GP) Registers: X and Y
     - 4-bit Flag Register: Zero, Negative, Carry, Overflow
     - 16-bit Stack Pointer
   - **Program Counter**
   - **Instruction Size:** 16-bit
   - **Word Size:** 16-bit
   - **Stack Growth:** Inverse in memory

   ### Core Instruction Set

   - Instruction Size:

      16-bit

     - 6-bit Opcode
     - 1-bit Register Address
     - 9-bit Immediate Size

   #### Memory Instructions

   - Load, Store into Registers X or Y

     | Opcode | Register Address | Immediate |
     | ------ | ---------------- | --------- |
     | 6 bit  | 1 bit            | 9 bit     |

   #### Branch Instructions

   - BRZ, BRN, BRC, BRO, BRA, JMP, RET

     | Opcode | Address |
     | ------ | ------- |
     | 6 bit  | 10 bit  |

   #### Arithmetic and Logic Instructions

   - ADD, SUB, LSR, LSL, RSR, RSL, MOV, MUL, DIV, MOD, AND, OR, XOR, NOT, CMP, TST, INC, DEC

     | Opcode | Register Address | Immediate |
     | ------ | ---------------- | --------- |
     | 6 bit  | 1 bit            | 9 bit     |

   ### Minimum Required CPU Components

   - 2 General Purpose Registers: X, Y, and one Accumulator A
   - ALU (Arithmetic Logic Unit)
   - Control Unit
   - Instruction and Data Memory (includes Stack)
   - Sign Extend Unit
   - Processor Registers: PC (Program Counter), SP (Stack Pointer), Flag

   ## Application-Specific Instruction Set Processor (ASIP)

   1. Develop instructions for specific cores
   2. Essential for the final Milestone

   ### Possible Applications (Open to Other Ideas)

   1. Pocket Calculator
   2. Tensor Operations
   3. Floating Point Coprocessor
   4. Cryptographic Core
   5. Cryptocurrency Mining (Hashing) Core