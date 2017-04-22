.model small
.stack 100h
.data
char01 db ?
char02 db ?
char03 db ?
char04 db ?

.code

inzio:
	
mov ax,@data                         
mov ds,ax

;Aquisizione primo carattere

mov	ah, 01h
int	21h
mov	char01, al

;Aquisizione secondo carattere

mov	ah, 01h
int	21h
mov	char02, al

;Aquisizione terzo carattere

mov	ah, 01h
int	21h
mov	char03, al

;Aquisizione quarto carattere

mov	ah, 01h
int	21h
mov	char04, al

;Stampa quarto carattere

mov	dl, char04
mov	ah, 02h	
int	21h	 

;Stampa terzo carattere

mov	dl, char03
mov	ah, 02h	
int	21h	 

;Stampa secondo carattere

mov	dl, char02
mov	ah, 02h	
int	21h	

;Stampa primo carattere

mov	dl, char01
mov	ah, 02h	
int	21h	

;Interruzione

mov ah,4ch
int 21h

end inizio
