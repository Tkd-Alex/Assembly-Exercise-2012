.model small
.stack 100
.data

a db ?
b db ?
c db ?
f db ?
ins1 db "Inserisci la prima cifra." ,13,10,"$"
ins2 db 13,10,"Inserisci la seconda cifra." ,13,10,"$"
addi db 13,10,"Addizione" ,13,10,"$"
sott db 13,10,"Sottrazione" ,13,10,"$"
divi db 13,10,"Divisione" ,13,10,"$"
mol db 13,10,"Moltiplicazione" ,13,10,"$"

.code

inizio:

mov ax,@data
mov ds,ax

;Stampa Inserire 1 le cifre
lea dx,ins1
mov ah,09
int 21h

;Aquisizione a
mov	ah, 01h
int	21h
mov	a, al

;Stampa Inserire 2 le cifre
lea dx,ins2
mov ah,09
int 21h

;Aquisizione b
mov	ah, 01h
int	21h
mov	b, al

sub a,48
sub b,48

;Sposta a in c
mov al,a
mov c,al

mov al,b

;Addizione
add a,al

;Stampa addizione
lea dx,addi
mov ah,09
int 21h

add c,48
;stampa c
mov dl,c
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa +
mov dl,43
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

add b,48
;stampa b
mov dl,b
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa =
mov dl,61
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;---------------------------



mov ah,0
mov al,a

mov f,10

div f

mov f,ah
add f,48

add al,48



;-------------------------------

;addizione 48 per cod ascii
add a,48

;stampa al - risultato
mov dl,al
mov ah,02
int 21h
;stampa f - risultato
mov dl,f
mov ah,02
int 21h

;stampa sottrazione
lea dx,sott
mov ah,09
int 21h

sub c,48
sub b,48
;Sposta c in a
mov al,c
mov a,al

mov al,b

sub c,al

add a,48
;stampa a
mov dl,a
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa -
mov dl,45
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

add b,48
;stampa b
mov dl,b
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa =
mov dl,61
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;aggiunta 48 per cod ascii
add c,48

;stampa c - risultato
mov dl,c
mov ah,02
int 21h

;Stampa moltiplicazione
lea dx,mol
mov ah,09
int 21h

;stampa a
mov dl,a
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa *
mov dl,42
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa b
mov dl,b
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa =
mov dl,61
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

sub a,48
sub b,48

mov al,a

mul b


;---------------------------



mov ah,0

mov f,10

div f

mov f,ah
add f,48

add al,48



;-------------------------------

;stampa risultato su al
mov dl,al
mov ah,02
int 21h
;stampa risultato su f
mov dl,f
mov ah,02
int 21h

;stampa divisione
lea dx,divi
mov ah,09
int 21h

add a,48
add b,48

;stampa a
mov dl,a
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa /
mov dl,47
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa b
mov dl,b
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa =
mov dl,61
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

sub a,48
sub b,48

mov ah,0
mov al,a

div b

mov c,ah
add c,48

add al,48

;stampa risultato su al
mov dl,al
mov ah,02
int 21h

;stampa spazio
mov dl,32
mov ah,02
int 21h

;stampa r
mov dl,82
mov ah,02
int 21h

;stampa resto
mov dl,c
mov ah,02
int 21h


;Interruzione
mov ah,4ch
int 21h

end inizio


