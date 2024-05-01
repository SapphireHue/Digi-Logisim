data   DCD     0xE1C2C376,0xE5A8B272,0x6D9C3DC,0xF75D447E,0x489B2990,0x89DB7B56,0x6C5CF8,0x2A4A00EC,0x911130B1,0x62E7446,0x93161F85,0x58E5DA45,0xCB108BCB,0x75F01129,0xE88BD1C3,0xDA733781,0x2293462A,0xBD374569,0x9D366EE2,0xCBA93D60,0x4B661023,0xD778B670,0xBF5DDC1C,0xD259A99A,0x2AB7DE21,0x6F9FBD4D,0x1B83F0C1,0x6D077E39,0x4E8ED760,0xE0553AE8,0xDA9CBBF,0xEDB879D8,0xEC7C9427,0x265E3781,0x8C797995,0x1E8B650F,0x322BABFF,0xE23C590F,0x88DEC87,0x15DD2A40,0xABA09473,0x417A2281,0x753427E,0xEF06C231,0x6447D076,0x8B4D07AB,0x163959B9,0xF3FDEC8F,0x312B6D39,0x17774FB5,0xD032BA01,0x4362BC53,0x43E9D195,0x5988383,0xE90B8B5A,0x7EF83768,0x7643104B,0x9C04E712,0xECBC60A5,0xBDD51A47,0x180823C8,0x590B0AB7,0x23214A8,0x6568B4CE,0x9BAAAEAE,0xA50F0EA9,0xBFC2D56A,0x8F2F5244,0x6FDB8344,0x2AF095BF,0xD6F8D672,0xF4BB1FC2,0x42890CEB,0xD53E3516,0xE12548A0,0x59C44CB,0xFE1B2B47,0x7274B8CF,0x25EB9FD7,0x3741CE9A,0x45DC6417,0x47F4360A,0x647F2A2C,0x671D6994,0xBEA5F95,0x6694EC47,0x458CF5B2,0x2693ED54,0xC47B7A8,0x4705F976,0x210C079A,0x6F84B6A5,0x11E915B8,0xF5FDAD7,0x306DE1EF,0x8F71D0D6,0xEBD7A279,0xE694C120,0x1AE95B08,0xE92F217
       mov     r0,#0x200 ; r0 = start data address
       add     r1,r0,#0x018C ; r1 = end data address (step pointer forward 99 words, each word is 4 bytes)
       ldr     r2,[r0] ; r2 = initial maximum

loop   ldr     r3, [r0, #4]!; r0+=1, r3 = curNum
       cmp     r3, r2;
       movgt   r2, r3; update max

inc    cmp     r0, r1
       bmi     loop; if r0 < r1, go back to top