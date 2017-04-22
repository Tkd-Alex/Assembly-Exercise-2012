model small
.stack 100h
.data
		
a2 db  50 dup(?)	
inseris db " Inserisci la stringa. (Max 8 Caratteri)$"
caricata db "La stringa caricata e' :   $"
levoc db "Le vocali sono :   $"
lecon db "Le consonanti sono :   $"
icar db "I simboli sono :   $"
dim dw ?
vo dw 0
co dw 0
alt dw 0

.code
inizio:
mov ax,@data
mov ds,ax

nuovalinea macro  ;Macro a capo
  mov dl,13 
  mov ah,02
  int 21h 
  mov dl,10
  mov ah,02
  int 21h
  mov dl,32
  mov ah,02
  int 21h
endm 

;Stampa inserimento stringa.
lea dx,inseris
mov ah,09
int 21h

nuovalinea  ;Richiamo della macro

call caric  ;Richiamo procedura

nuovalinea  ;Richiamo della macro

;Stampa stringa caricata.
lea dx,caricata
mov ah,09
int 21h

call stamp  ;Richiamo procedura

nuovalinea  ;Richiamo della macro

call cont  ;Richiamo procedura

;Stampa le vocali.
lea dx,levoc
mov ah,09
int 21h

add vo,48

mov dx,vo
mov ah,02
int 21h

nuovalinea  ;Richiamo della macro

;Stampa le consonanti.
lea dx,lecon
mov ah,09
int 21h

add co,48

mov dx,co
mov ah,02
int 21h

nuovalinea  ;Richiamo della macro

;Stampa i simboli.
lea dx,icar
mov ah,09
int 21h

add alt,48

mov dx,alt
mov ah,02
int 21h

;Fine Programma

mov ax,4c00h
int 21h

caric proc ;Procedura di caricamento

	;Caricamento dell'array
	lea bx,a2
	mov di,0
	
	Ciclo:
	
		cmp al,13
		je Caricamento
				
			cmp di,8
			je Caricamento2
			
				mov ah,01
				int 21h
				mov [bx+di],al
				
				inc di
						
	jmp Ciclo ;Ciclo non condizionato 
		
			Caricamento2:	
		Caricamento:
	
	;Aggiunta del dollaro
	inc di
	mov al,"$"
	mov [bx+di],al
	
	ret  
caric endp

stamp proc	;Procedura di stampa

	mov dim,di

	lea bx,a2
	mov di,0
	mov cx,dim
	
	CStampa:
		mov dl,[bx+di]
		mov ah,02
		int 21h
		inc di
	loop CStampa

ret  	
stamp endp

cont proc ;Procedura di conteggio 

	lea bx,a2
	mov di,0
	mov cx,dim
	
		CContr:
		
			;a = 97 / e = 101 / i = 105 / o = 111 / u = 117
			;caratteri minuscoli da 97 a 122
			
			cmp byte ptr [bx+di],97
			
			jb altricar
			
			cmp byte ptr [bx+di],122
			
			ja altricar
			
			cmp byte ptr [bx+di],97
			
			jne vero
			
			inc vo
			
			jmp vero1
			vero: 
			
			cmp byte ptr [bx+di],101
			
			jne vero2
			
			inc vo
			
			jmp vero1
			
			vero2:
			
			cmp byte ptr [bx+di],105
			
			jne vero4
			
			inc vo
			
			jmp vero1
			
			vero4:
			
			cmp byte ptr [bx+di],111
			
			jne vero6
			
			inc vo
			
			jmp vero1
			
			vero6:
			
			cmp byte ptr [bx+di],117
			
			jne vero1
			
			inc vo
			
			altricar:
			
			inc alt
			
			vero1:

			inc di
		loop CContr

	sub dim,1
	
	sub alt,1
	
	mov cx,dim
	sub cx,vo
	
	sub cx,alt
	
	mov co,cx
	
ret  	
cont endp

end inizio