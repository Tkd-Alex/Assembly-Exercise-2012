.model small

.stack 100h

.data

prim db 0

.code 

inizio:

mov ax,@data
mov ds,ax

;Stampa A

mov dl,65
mov ah,02
int 21h

;Stampa d

mov dl,100
mov ah,02
int 21h

;Stampa d

mov dl,100
mov ah,02
int 21h

;Stampa a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
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

;Stampa S

mov dl,83
mov ah,02
int 21h

;Stampa o

mov dl,111
mov ah,02
int 21h

;Stampa t

mov dl,116
mov ah,02
int 21h

;Stampa a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
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

;Stamp a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
int 21h

;Stampa M

mov dl,77
mov ah, 02
int 21h

;Stampa o

mov dl,111
mov ah,02
int 21h

;Stampa l
mov dl,108
mov ah,02
int 21h

;Stamp a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
int 21h

;Aquisizione primo

mov	ah, 01h
int	21h
mov	prim, al

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa *

mov dl,42
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Aquisizione secondo 

mov	ah,01h
int 21h

;Moltiplicazione

mul prim

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

;Stampa Risultato

;mov dl,ax
;mov ah,02
;int 21h

;Stamp a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
int 21h

;Stampa D

mov dl,68
mov ah, 02
int 21h

;Stampa i

mov dl,105
mov ah,02
int 21h

;Stampa v
mov dl,118
mov ah,02
int 21h

;Stamp a capo

mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02
int 21h

;Aquisizione primo

mov	ah, 01h
int	21h
mov	prim, al

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa /

mov dl,47
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Aquisizione secondo 

mov	ah,01h
int 21h
;mov	ax, al

;Divisione

div prim

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

;Stampa Risultato

mov dl,al
mov ah,02
int 21h

;Stampa spazio

mov dl,32
mov ah,02
int 21h

;Stampa r

mov dl,114
mov ah,02
int 21h

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

;Stampa resto

mov dl,ah
mov ah,02
int 21h

;Interruzione

mov ah,4ch
int 21h

end inizio

