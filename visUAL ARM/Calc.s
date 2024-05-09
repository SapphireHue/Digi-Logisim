valueA DCD     5
valueB DCD     7
addrC  DCD     0xAAAAAAAA ; 0xAAAAAAAA at mem[addrC] will be replaced by function result
       ;       set up r7,r8,r11,sp to known value (should be unchanged after the function call).
       MOV     r7,#0x00055000 ; r7 = caller r7 value
       MOV     r8,#0x00000AA0 ; r8 = caller r8 value
       MOV     r11,#0xFF000000 ; Set caller frame & stack pointers to known values
       ADD     r11,r11,#16 ; r11 = 0xFF000010 (VisUAL does not support the name fp)
       ADD     sp,sp,#44 ; sp = 0xFF00002c
       ;       push parameters onto the stack
       ADR     r0,valueA ; r0 = address of valueA
       LDR     r1,[r0] ; r1 = valueA
       STR     r1,[sp,#-4]! ; push valueA onto the stack
       ADR     r0,valueB ; r0 = address of valueB
       LDR     r1,[r0] ; r1 = valueB
       STR     r1,[sp,#-4]! ; push valueB onto the stack
       ADR     r0,addrC ; r0 = address of C
       STR     r0,[sp,#-4]! ; push addrC onto the stack
       ;       call function
       BL      calc
       LDR     r0, [r0]; r0 = C
       ADD     sp, sp, #12; restore stack pointer

       END     ; END OF PROGRAM

       ;       FUNCTION calc: parameters: valueA, valueB, addrC; modifies register r7 & r8; stores result at mem[addrC]
calc   STR     lr,[sp,#-4]! ; push link register (r14) onto the stack
       ;       function prologue
       STR     r7, [sp, #-4]!; push r7 onto the stack
       STR     r8, [sp, #-4]!; push r8 onto the stack
       STR     r11, [sp, #-4]!; push the frame pointer onto the stack
       MOV     r11,sp ; set the constant frame pointer (r11) for this function call
       SUB     sp,sp,#8 ; create a 2-word stack frame for intermediate results
       ;       function body
       LDR     r7, [r11, #24]; r7 = A
       LDR     r8, [r11, #20]; r8 = B
       ORR     r7, r7, r8; r7 = A or B
       ADD     r8, r8, r8, LSL #3; r8 = 9 * B = B + 8B = B + B << 3
       ADD     r7, r7, r8; r7 = [9*B + (A or B)]
       LDR     r8, [r11, #24]; r8 = A
       ;       27 * A = 9 * 3 * A
       ADD     r8, r8, r8, LSL #1; r8 = 3 * A = A + 2A = A + A << 1
       ADD     r8, r8, r8, LSL #3; r8 = 9 * 3A = 3A + 8*3A = 3A + 3A << 3
       SUB     r7, r8, r7; r7 = 27A - [9*B + (A or B)] = r8 - r7
       LDR     r8,[r11, #16]; r8 = addrC
       STR     r7, [r8]; mem[addrC] = r7
       ;       function cleanup
       ADD     sp,sp,#8 ; delete the 2-word stack frame
       LDR     r11, [sp], #4;
       LDR     r8, [sp], #4;
       LDR     r7, [sp], #4;
       LDR     r14, [sp], #4;
       MOV     r15, r14; return

