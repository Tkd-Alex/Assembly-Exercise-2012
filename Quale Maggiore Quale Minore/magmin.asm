.model small
.stack 100
.data

a db ?
b db ?

inse1 db "Inserisci il primo numero." ,13,10,"$"
inse2 db  13,10,"Inserisci il secondo numero." ,13,10,"$"
uguali db  13,10,"I numeri inseriti sono uguali." ,13,10,"$"
primo db 13,10,"Il primo numero e' maggiore del secondo.",13,10,"$"
secondo db 13,10,"Il primo numero e' minore del secondo.",13,10,"$"

.code

inizio:

mov ax,@data
mov ds,ax

;Stampa Inserire numero
lea dx,inse1
mov ah,09
int 21h

;Aquisizione primo su a
mov	ah, 01h
int	21h
mov	a, al

;Stampa Inserire numero
lea dx,inse2
mov ah,09
int 21h

;Aquisizione primo su a
mov	ah, 01h
int	21h
mov	b, al

;Istruzione compare
cmp a,al

;Salta se non è maggiore
jna semagg

lea dx,primo
mov ah,09
int 21h

;Salta se non è minore
jnb semin

semagg:

lea dx,secondo
mov ah,09
int 21h
semin:

;Interruzione
mov ah,4ch
int 21h

end inizio
