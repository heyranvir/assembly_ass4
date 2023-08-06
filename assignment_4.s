.global _start

// defining constant for grades 
.equ gradea, 90
.equ gradeb, 75
.equ gradec, 50

_start:
    MOV R5, #78 //The assignment grade
    LDR R6, = gradea //This will save the address of gradea constant into resister 6 
    LDR R7, = gradeb //This will save the address of gradeb constant into resister 7 
    LDR R8, = gradec //This will save the address of gradec constant into resister 8 

    MOV R1, #gradea    // Load the value of gradea into R1
    CMP R5, R1         // Compare R5 with the value store in R1
    BGE prnta       // moving to prnta if the value of R5 is greater than R1

    MOV R1, #gradeb    // Load 75 into R1 (B grade lower boundary)
    CMP R5, R1         // Compare R5 with value store in R1
    BGE prntb       // moving to prntb if value of R5 is grater than R1

    MOV R1, #gradec    // Load 50 into R1 (C grade lower boundary)
    CMP R5, R1         // Compare R5 with value store in R1
    BGE prntc        // Branch to prntc if value of R5 is grater than R1

    // If the grade is 0 or less the printing grade F 
    b prntf

prnta:
    // Print "Congratulations! You got an A."
    ADD R1, R1, #0
    MOV R7, #4 // Syscall code for write
    SWI 0

prntb:
    // Print "Good job! You got a B."
    MOV R7, #4 // Syscall code for write
    SWI 0

prntc:
    // Print "Not bad, you got a C."
    MOV R7, #4 // Syscall code for write
    SWI 0

prntf:
    // Print "Sorry, you got an F."
    MOV R7, #4 // Syscall code for write
    SWI 0

    LDR R1, =amessage 
    LDR R2, =alen
    MOV R7, #4
    SWI 0

    MOV R7, #1
    SWI 0

.data
amessage:
    .asciz "Congratulation, You got an A.\n"
    .asciz "Good job! You got a B.\n"
    .asciz "Not bad, you got a C.\n"
    .asciz "Sorry, you got an F.\n"
alen = .-amessage