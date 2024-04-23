data   DCD     0xDDDD20F2,0xEEEE3044,0xFFFFC4F8 ; P,Q,R
       mov     r0,#0x200 ; r0 = start data address
       ldr     r1,[r0],#4 ; r1 = P, r0 = r0 + 4
       ldr     r2, [r0], #4 ; r2 = Q, r0 = r0 + 4
       ldr     r3, [r0]; r3 = R
       eor     r4, r2, r3, LSR #4; r4_6:1 = S = Q_6:1 xor R_10:5
       orr     r5, r1, r4, LSL #8; r5_14:9 = T = P_14:9 or S
       LSR     r5, r5, #9; r5_5:0 = T
       and     r0, r5, #0b111110; r0_5:0 = F