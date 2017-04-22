.model small
.stack
.data
;QUI inserire variabili
newline db  13,10,'$'
stringa  db 'esempio dei cicli',13,10,'$'
due db 2
.code
inizio:
 MOV AX, @DATA
 MOV DS, AX
 
;stampa della stringa
lea dx,stringa
mov ah,09
int 21h
;_______________________ ciclo con controllo in coda
;inizializzazione
mov dl,'Z' ;codice 65
ciclo:
;istruzioni da ripetere
mov ah,02
int 21h
dec dl
;controllo e salto
cmp dl,64
jne ciclo

;________________________nuova linea
lea dx,newline
mov ah,09
int 21h
;________________________nuova linea
lea dx,newline
mov ah,09
int 21h
;________________________controllo in coda con LOOP
;inizializzazione
mov cx,26
mov dl,'z'
ciclo2:
;istruzioni da ripetere
mov ah,02
int 21h
dec dl
loop ciclo2 ; decrementa cx e lo confronta con 0 salta se non è 0

 
 MOV AX, 4C00h     ; fine programma
 INT 21h
 END inizio

