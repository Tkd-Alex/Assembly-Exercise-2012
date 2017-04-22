.model small
.stack 100
.data

a db ?
b db ?
c db ?
d db ?

inse1 db "Inserisci il primo numero." ,13,10,"$"
inse2 db  13,10,"Inserisci il secondo numero." ,13,10,"$"
ris db  13,10,"Risultato: " ,13,10,"$"

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

sub a,48

;Aquisizione secondo su b
mov	ah, 01h
int	21h
mov	b, al

sub b,48

;Creazione numero intero
mov al,10
mul a

add al,b
mov c,al


;Stampa Inserire numero
lea dx,inse2
mov ah,09
int 21h

;Aquisizione primo su a
mov	ah, 01h
int	21h
mov	a, al

sub a,48

;Aquisizione secondo su b
mov	ah, 01h
int	21h
mov	b, al

sub b,48


;Stampa Risultato
lea dx,ris
mov ah,09
int 21h

;Creazione numero intero
mov al,10
mul a

add al,b
mov d,al


;Moltiplicazione c*d
mov al,d
mul c

;Divisione per stampa a due cifre

mov ah,0

mov d,100

div d

mov c,ah
add c,48

add al,48

;stampa risultato su al
mov dl,al
mov ah,02
int 21h

;stampa risultato su c
mov dl,c
mov ah,02
int 21h

;Interruzione
mov ah,4ch
int 21h

end inizio




