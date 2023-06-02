@ r0 holds the value of im_size

LDR r1, =max_pixel_value
MOV r2, r0
SDIV r3, r2, r1
MUL r3, r3, r1
SUB r4, r2, r3
MOV r5, r3
MOV r6, #0
LDR r7, =feqs

loop:
    STR r5, [r7, r6, LSL #2]
    ADD r6, r6, #1
    CMP r6, #max_pixel_value
    BLT loop

    STR r4, [r7, r6, LSL #2]

    BX lr

.section .data
max_pixel_value: .word 256

.section .bss
.comm feqs, 1024, 4
