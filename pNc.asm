ASSUME CS:CODE, DS:DATA    

                  
    
DATA SEGMENT
    N DW 01H DUP (?)
    
    R DW 01H DUP (?)    
    
    NFAC DW 01H DUP (?)
    
    RFAC DW 01H DUP (?)
    
    NRFAC DW 01H DUP (?)
    
    P DW 01H DUP (?)
    
    C DW 01H DUP (?)
    
DATA ENDS    





CODE SEGMENT 
    

    
    START:
    
    MOV AX, DATA      
    
    MOV DS, AX
    
    ;Taking input N
    MOV AH, 01H
    
    INT 21H
    
    SUB AL, 30H ;converting from ascii
    
    MOV SI, OFFSET N
    
    MOV [SI], AL
    
    ;Taking input R
    MOV AH, 01H
    
    INT 21H
    
    SUB AL, 30H ;converting from ascii
    
    MOV SI, OFFSET R  
    
    MOV [SI], AL
    
    MOV SI, OFFSET N    
    
    MOV AX, 01H
    
    MOV CX, [SI]
    
LN: MUL CX ;Calculating N!
    
    LOOP LN
    
    MOV DI, OFFSET NFAC
    
    MOV [DI], AX
    
    MOV SI, OFFSET R    
    
    MOV AX, 01H
    
    MOV CX, [SI]
    
LR: MUL CX ;Calculating R!
    
    LOOP LR
    
    MOV DI, OFFSET RFAC
    
    MOV [DI], AX      
    
    MOV SI, OFFSET N    
    
    MOV CX, [SI]
    
    MOV SI, OFFSET R
    
    MOV AX, [SI]
    
    SUB CX, AX
    
    MOV AX, 01H
    
LNR: MUL CX ;Calculating (N-R)!
    
    LOOP LNR
    
    MOV DI, OFFSET NRFAC
    
    MOV [DI], AX
    
    MOV SI, OFFSET NFAC
    
    MOV AX, [SI]
    
    MOV SI, OFFSET NRFAC
    
    MOV BX, [SI]
    
    DIV BX  ;Calculating nPr
    
    MOV DI, OFFSET P
    
    MOV [DI], AX
    
    MOV SI, OFFSET RFAC
    
    MOV BX, [SI]
    
    DIV BX  ;Calculating nCr
    
    MOV DI, OFFSET C
    
    MOV [DI], AX
    
    MOV AH, 00H
    
    INT 21H 
    

    
    CODE ENDS

    END START
   

ret




