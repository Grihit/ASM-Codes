
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h    

mov ax, 05h

mov bx, 09h 

add ax, bx

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

mov bx, 5000h 


mov [bx], 20h

inc bx

mov [bx], 42h

inc bx

mov [bx], 30h  



mov bx, 5000h  

mov al, 0h 


add al, [bx] ;bx=5000

inc bx 

add al, [bx] ;bx=5001

inc bx 


add al, [bx]  ;bx= 5002  


mov al, 04h

mov bl, 02h

div  bl

; div bl --- 8-bit, nu=al, de=bl   out -- q=al, r=ah

; div bx --- 16-bit, nu=ax, de=bx  out -- q=ax, r=dx 


; loop operation

 mov ax, 09h
 
 mov cx, 04h
 
 begin: dec ax
 
 loop begin 
 
 
 
 mov ax, 00h  
 
 mov bx, 5000h
 
 
 mov cx, 03h
 
 next: add al, [bx]
 
 inc bx
 
 loop next      
 
         
 mov bl, al
         
 mul bl


ret




