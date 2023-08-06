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

    CMP R5, #gradea         // Compare R5 with grade a
    BGE prnta       // moving to prnta if the value of R5 is greater than gradea

    CMP R5, #gradeb         // Compare R5 with grade b
    BGE prntb       // moving to prntb if value of R5 is grater than gradeb

    CMP R5, #gradec         // Compare R5 with grade c
    BGE prntc        // moving to prntc if value of R5 is grater than gradec

    // If the grade is 0 or less the printing grade F 
    b prntf

prnta:
    // Print "Congratulations! You got an A."
    //ADD R1, R1, #0
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