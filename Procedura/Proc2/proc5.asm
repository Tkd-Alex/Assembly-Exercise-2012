model small
.stack 100h
.data
	
stringa  db 'Inserisci un carattere.',13,10,'$'

.code
inizio:
mov ax,@data
mov ds,ax

newline macro  
mov dl,13 
mov ah,02
int 21h 
mov dl,10
mov ah,02
int 21h
endm 

call sta

newline

mov ax,4c00h
int 21h

newline

sta proc     
  
mov cl,0

ciclo:
lea dx,stringa
mov ah,09
int 21h
inc cl
cmp cl,5
jne ciclo

ret            
sta endp


end inizio