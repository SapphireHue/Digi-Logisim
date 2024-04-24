data   DCD     -9,3,16,27,-18,1,5
       mov     r0,#0x200 ; r0 = start data address
       add     r1,r0,#24 ; r1 = end data address (step pointer forward 6 words, each word is 4 bytes)
       ldr     r2,[r0] ; r2 = initial maximum

loop   ldr     r3, [r0, #4]!; r0+=1, r3 = curNum
       cmp     r3, r2;
       bmi     inc; if r3 (cur) < r2 (max), move to the next step
       mov     r2, r3; update max

inc    cmp     r0, r1
       bmi     loop; if r0 < r1, go back to top