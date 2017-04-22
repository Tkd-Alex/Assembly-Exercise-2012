.model small
.stack 100
.data

n db ?
n2 db ?

magg db 0
min db 255

cont db 0

nu db ?
nu2 db ?

p1 db ?

inse1 db 13,10,"Quanti numeri vuoi inserire?" ,13,10,"$"
ins2 db 13,10,"Inserisci il numero: $"
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

sub n,48

mov	ah, 01h
int	21h
mov	n2, al

sub n2,48

;Numero intero
mov al,10
mul n
add n2,al

;Stampa A Capo
lea dx,acapo
mov ah,09
int 21h

;Inizio ciclo

ciclo1:
mov dl,cont
cmp dl,n2

jae fineciclo

;Stampa richiesta numero

lea dx,ins2
mov ah,09
int 21h

;Acquisizione numero
mov	ah, 01h
int	21h
mov nu,al

mov	ah, 01h
int	21h
mov nu2,al

sub nu2,48
sub nu,48

;Creazione numero intero
mov al,10
mul nu

add al,nu2

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

;Stampa doppia cifra
mov al,magg
mov ah,0

mov p1,10

div p1

mov p1,ah
add p1,48

add al,48

;stampa risultato su al
mov dl,al
mov ah,02
int 21h
;stampa risultato su p1
mov dl,p1
mov ah,02
int 21h

;Stampa Il Minore
lea dx,ilmi
mov ah,09
int 21h

;Stampa Variabile Minore

;Stampa doppia cifra
mov al,min
mov ah,0

mov p1,10

div p1

mov p1,ah
add p1,48

add al,48

;stampa risultato su al
mov dl,al
mov ah,02
int 21h
;stampa risultato su p1
mov dl,p1
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