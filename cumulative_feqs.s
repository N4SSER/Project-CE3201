.global cumulative_feqs

cumulative_feqs:
    PUSH {lr}
    MOV r1, #0
    MOV r2, r0
    LDR r3, =cu_feqs
    MOV r4, #0
    
loop:
    LDR r5, [r0, r1, LSL #2]
    ADD r4, r4, r5
    STR r4, [r3, r5, LSL #2]
    
    ADD r1, r1, #1
    CMP r1, r2
    BLT loop
    
    POP {pc}
