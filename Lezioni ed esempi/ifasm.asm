model small ;Specifica il modello di memoria
.stack 100h  ;Specifica la dimensione dello stack
.data
;dichiarazione delle variabili
a db 0
b db ?
c dw 128
d db 0
mess db "Prova if$"
endl db 10,13,'$'
.code
inizio:
;istruzioni del programma	

;aggancio del segmento dati
mov ax,@data ;mov destinazione,sorgente
mov ds,ax

;stampa messaggio
lea dx,mess
mov ah,09
int 21h

lea dx,endl
mov ah,09
int 21h

; struttura a selezione semplice (if)

cmp a,0
jne fineif      ;(if a==0)
 ;istruzioni da eseguire
 mov dl,65 
 mov ah,02
 int 21h
fineif:

; struttura a selezione completa (if con else)

cmp d,1   ;(if d<=1)
jbe vero
 ;istruzioni da eseguire per falso
 mov dl,66 
 mov ah,02   ;stampa il carattere B
 int 21h
 jmp fineif1
vero: 
  ; istruzioni da eseguire per vero
  mov dl,67 
  mov ah,02 ;stampa il carattere C
  int 21h
fineif1:


; struttura a selezione completa (if con else) equivalente alla precedente
cmp d,1   ;(if d<=1)
ja falso
 ; istruzioni da eseguire per vero
  mov dl,67 
  mov ah,02 ;stampa il carattere C
  int 21h
  jmp fineif2
falso: 
  ;istruzioni da eseguire per falso
  mov dl,66 
  mov ah,02   ;stampa il carattere B
  int 21h
fineif2:



;ritorno al sistema (fine programma)
mov ax,4c00h
int 21h

end inizio

; esempi di salto condizionato
; numeri naturali
;_______________
; ja maggiore
; jae maggiore o uguale
; jb minore
; jbe minore o uguale
; jna minore o uguale
; jnb maggiore o uguale

; je uguale
; jne diverso

; numeri interi
;_______________
;jl minore
;jg maggiore
;jle minore o uguale
;jge maggiore o uguale

