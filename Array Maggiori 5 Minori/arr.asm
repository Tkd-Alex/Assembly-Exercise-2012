.model small
.stack
.data
	
;QUI inserire variabili
newline db  13,10,'$'

a dw ?
ma db ?
mi db ?

a2 db  50 dup(?)

		;mess db "Stampa dell'array:   $"
quant db "Quanti elementi vuoi caricare?   $"
car db "Inserisci gli elementi:   $"
ima db "I numeri maggiori a 5 sono:   $"
imi db "I numeri minori a 5 sono:   $"

.code
inizio:
 MOV AX, @DATA
 MOV DS, AX
 
 ;Stampa Quanti?
lea dx,quant
mov ah,09
int 21h

;Caricamento quantità array.
mov	ah, 01h
int	21h
mov ah,0
mov a,ax

sub a,48

 ;Stampa newline
lea dx,newline
mov ah,09
int 21h

 ;Stampa Quanti?
lea dx,car
mov ah,09
int 21h

;Caricamento dell'array
lea bx,a2
mov cx, a
mov di,0
Caricamento:
	mov ah,01
	int 21h
	sub al,48
	mov [bx+di],al
	inc di
loop Caricamento

 ;Stampa newline
lea dx,newline
mov ah,09
int 21h

			;Stampa stamp
			;lea dx,mess
			;mov ah,09
			;int 21h

		; stampa dell'array
		;lea bx,a2
		;mov di,0
		;mov cx,a
		;ciclo:
		;mov dl,[bx+di]
		;mov ah,02
		;int 21h
		;inc di
		;loop ciclo

;Controllo
mov ma,0
mov mi,0

lea bx,a2
mov di,0
mov cx,a
ciclo1:
cmp byte ptr [bx+di],5
ja vero
 ;Istruzioni da eseguire per falso
inc mi
jmp fineif1
vero: 
  ; Istruzioni da eseguire per vero
inc ma  
fineif1:

inc di
loop ciclo1

add ma,48
add mi,48

 ;Stampa newline
lea dx,newline
mov ah,09
int 21h

 ;Stampa I maggiori
lea dx,ima
mov ah,09
int 21h

mov dl,ma
mov ah,02
int 21h

 ;Stampa newline
lea dx,newline
mov ah,09
int 21h

 ;Stampa I maggiori
lea dx,imi
mov ah,09
int 21h

mov dl,mi
mov ah,02
int 21h

 ; fine programma
 MOV AX, 4C00h
 INT 21h
 END inizio
 
