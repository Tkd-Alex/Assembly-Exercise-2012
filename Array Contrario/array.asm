.model small
.stack
.data
;QUI inserire variabili
newline db  13,10,'$'
a db ?
array db  50 dup(?)
a2 db '0','a','z','k','c','i','a','o'
mess db "stampa dell'array$"
.code
inizio:
 MOV AX, @DATA
 MOV DS, AX


; caricamento dell'array
lea bx,a2
mov cx,8
mov di,0
caricamento:
	mov ah,01
	int 21h
	mov [bx+di],al
	inc di
loop caricamento


; modifico il terzo carattere dell'array a2
lea bx,a2
mov cl,'x'
mov [bx+2],cl

;stampa il messaggio
lea dx,mess
mov ah,09
int 21h

lea dx,newline
mov ah,09
int 21h

; stampa dell'array
lea bx,a2
mov di,0
mov cx,8
ciclo:
mov dl,[bx+di]
mov ah,02
int 21h
inc di
loop ciclo
;________________________nuova linea
 ; fine programma
 MOV AX, 4C00h
 INT 21h
 END inizio
 
; metodi di indirizzamento indicizzato
; mov cl, [20h]; mov [20h],al
;indiretto con base;
;mov cx,[bx]       si possono utilizzare bx, bp, di, si
;mov [bx+di],cl     ;indiretto indicizzato

;con spiazzamento
;mov cl,[bx+di+1]  ; registri base bx e bp; registri indice di e si

;immediato in memoria
;mov byte ptr [bx],55 

;errato da memoria a memoria
;mov a,[bx]
;mov [bx],[di]



