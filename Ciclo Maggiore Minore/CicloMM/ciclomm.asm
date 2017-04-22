.model small
.stack 100
.data

n db ?
magg db 0
min db 10
cont db 49
nu db ?

inse1 db 13,10,"Quanti numeri vuoi inserire?" ,13,10,"$"
ins2 db 13,10,"Inserisci il $"
ins23 db "o numero: $"
ilma db 13,10,13,10,"Il numero maggiore e': $"
ilmi db 13,10,"Il numero minore e': $"
acapo db 13,10,'$'

.code

inizio:

mov ax,@data
mov ds,ax

;Stampa Inserire numero
lea dx,inse1
mov ah,09
int 21h

;Aquisizione n volte
mov	ah, 01h
int	21h
mov	n, al

add n,1

;Stampa A Capo
lea dx,acapo
mov ah,09
int 21h

;Inizio ciclo

ciclo1:
mov dl,cont
cmp dl,n

jae fineciclo

;Stampa richiesta numero

lea dx,ins2
mov ah,09
int 21h

mov dl,cont
mov ah,02
int 21h

lea dx,ins23
mov ah,09
int 21h

;Acquisizione numero
mov	ah, 01h
int	21h
sub al,48
mov nu,al

;Inizio If

cmp al,min ;If(al<min)
ja SeMinore

mov al,nu
mov min,al

SeMinore:

cmp al,magg ;If(al>magg)
jb SeMaggiore

mov al,nu
mov magg,al

SeMaggiore:

;Fine If
  
inc cont			;Non mi funziona l'incremento di DL ho dovuto utilizzare cont.

jmp ciclo1 
fineciclo:

;Fine Ciclo

;Stampa Il Maggiore
lea dx,ilma
mov ah,09
int 21h

;Stampa Variabile Maggiore

add magg,48

mov dl,magg
mov ah,02
int 21h

;Stampa Il Minore
lea dx,ilmi
mov ah,09
int 21h

;Stampa Variabile Minore

add min,48

mov dl,min
mov ah,02
int 21h

;Stampa A Capo
lea dx,acapo
mov ah,09
int 21h

;Interruzione
mov ah,4ch
int 21h

end inizio