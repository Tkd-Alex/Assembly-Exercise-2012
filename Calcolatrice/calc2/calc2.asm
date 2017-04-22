.model small
.stack 100
.data

prim db ?
ins1 db "Inserisci le cifre" ,13,10,"$"
addi db "Addizione" ,13,10,"$"
sott db "Sottrazione" ,13,10,"$"
divi db "Divisione" ,13,10,"$"
mol db "Moltiplicazione" ,13,10,"$"

.code

inizio:

mov ax,@data
mov ds,ax

;Stampa addizione
lea dx,addi
mov ah,09
int 21h

;Stampa Inserire le cifre
lea dx,ins1
mov ah,09
int 21h

;Aquisizione primo

mov	ah, 01h
int	21h
mov	prim, al

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa +

mov dl,43
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Aquisizione secondo 

mov	ah, 01h
int	21h

;Addizione

add prim, al

sub prim, 48 ;Sottrazione -48 per il codice ASCII

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa =

mov dl,61
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa risultato

mov dl, prim
mov ah,02
int 21h

;Stampa a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
int 21h

;Stampa sottrazione
lea dx,sott
mov ah,09
int 21h

;Stampa Inserire le cifre
lea dx,ins1
mov ah,09
int 21h

;Aquisizione primo

mov	ah, 01h
int	21h
mov	prim, al

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa -

mov dl,45
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Aquisizione secondo 

mov	ah,01h
int 21h

;Sottrazione

sub prim, al

add prim,48 ;Addizione +48 per il codice ASCII

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa =

mov dl,61
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa risultato

mov dl, prim
mov ah,02
int 21h

;Interruzione

mov ah,4ch
int 21h

end inizio
