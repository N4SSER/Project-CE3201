@ r0 holds the address of image_flattened

    MOV r1, #0             
    LDR r2, =max_pixel_value 
    LDR r3, =freqs           
    
loop:
    LDR r4, [r0, r1, LSL #2] 
    ADD r4, r4, #1          
    LDR r5, [r3, r4, LSL #2] 
    ADD r5, r5, #1           
    STR r5, [r3, r4, LSL #2]
    
    ADD r1, r1, #1           
    CMP r1, #image_size      
    BLT loop                 
    

    
    BX lr                    

.section .data
max_pixel_value: .word 256   

.section .bss
.comm freqs, 1024, 4       
