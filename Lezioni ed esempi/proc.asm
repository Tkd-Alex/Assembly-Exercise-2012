model small
.stack 100h
.data
.code
inizio:
mov ax,@data
mov ds,ax
nuovalinea macro  ;dichiarazione macro
  mov dl,13 
  mov ah,02
  int 21h 
  mov dl,10
  mov ah,02
  int 21h
endm 
mov dl,'b'
call prova  ;richiamo della procedura
nuovalinea  ;richiamo della macro

mov dl,66
call prova

mov al,'W'
call prova

nuovalinea
mov ax,4c00h
int 21h

prova proc     ;dichiarazione della procedura
  mov ah,02
  int 21h
  ret            ;ritorno al programma chiamante
prova endp

end inizio