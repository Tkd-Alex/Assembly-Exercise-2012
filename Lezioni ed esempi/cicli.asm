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
mov dl,'A' ;codice 65
ciclo:
;istruzioni da ripetere
mov ah,02
int 21h
inc dl
;controllo e salto
cmp dl,91 
jne ciclo

;________________________nuova linea
lea dx,newline
mov ah,09
int 21h

;________________________ciclo con controllo in testa
;inizializzazione
mov dl,48   
ciclo1:
;controllo e salto
cmp dl,58
jae fineciclo
 ;istruzioni da ripetere
  mov ah,0
  mov al,dl
  div due
  cmp ah,0   ;stampa i numeri pari
  jne fineif
	mov ah,02
	int 21h
  fineif:
 inc dl
jmp ciclo1   ; salto incondizionato all'inizio del ciclo
fineciclo:
;________________________nuova linea
lea dx,newline
mov ah,09
int 21h
;________________________controllo in coda con LOOP
;inizializzazione
mov cx,26
mov dl,97
ciclo2:
;istruzioni da ripetere
mov ah,02
int 21h
inc dl
loop ciclo2 ; decrementa cx e lo confronta con 0 salta se non è 0

 
 MOV AX, 4C00h     ; fine programma
 INT 21h
 END inizio
