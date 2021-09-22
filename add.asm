
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



ASSUME CS:CODE, DS:DATA    

                  
    
DATA SEGMENT
    
    NUMLIST DB 01H, 02H, 03H, 03H, 02H  
    
    COUNT EQU 05H    
    
    RESULT DW 01H DUP (?)
    
DATA ENDS    



ORG 0100H

CODE SEGMENT 
    

    
    START:
    
    MOV AX, DATA
    
    MOV DS, AX
    
    MOV CX, COUNT 
    
    MOV AX, 0000H
    
    MOV BX, 0000H
    
    MOV SI, OFFSET NUMLIST
    
LP: MOV BL, [SI] 
    
    ADD AX, BX
    
    INC SI
    
    DEC CX
    
    JNZ LP
    
    MOV DI, OFFSET RESULT
    
    MOV AH, 00H
    
    INT 21H 
    

    
    CODE ENDS

    END START
   

ret




