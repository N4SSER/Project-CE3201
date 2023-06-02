@ r0 holds the address of freqs

MOV r1, #0
LDR r2, =max_pixel_value
LDR r3, =cu_freqs
MOV r4, #0

loop:
    LDR r5, [r0, r1, LSL #2]
    ADD r4, r4, r5
    STR r4, [r3, r5, LSL #2]
    
    ADD r1, r1, #1
    CMP r1, #max_pixel_value
    BLT loop
    
BX lr

.section .data
max_pixel_value: .word 256

.section .bss
.comm cu_freqs, 1024, 4
