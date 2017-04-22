model small ;Specifica il modello di memoria
.stack 100h  ;Specifica la dimensione dello stack
.data
;dichiarazione delle variabili
a db 0
b db ?
c dw 2
d db 2
.code
inizio:
;istruzioni del programma	

;aggancio del segmento dati
mov ax,@data ;mov destinazione,sorgente
mov ds,ax

;input da tastiera
mov ah,01
int 21h
; il carattere inserito viene inserito nel registro 'al'

;il carattere inserito viene memorizzato nella variabile 'a'
mov a,al
;mov a,b INDIRIZZAMENTO ERRATO (MEMORIA/MEMORIA) 

;somma
add a,al

;sottrazione
sub al,48

;moltiplicazione a 8 bit
;operando sorgente al
mul  d ;moltiplica al per 2
;risultato in ax
;_________________________________
;moltiplicazione a 16 bit
;operando sorgente registro ax
mul c
;risultato in dx:ax
;__________________________________
;divisione a 8 bit
;dividendo registro ax
div d
;quoziente in al, resto in ah
;__________________________________
;divisione a 16 bit
;dividendo registri dx:ax
;div c
;quoziente in ax, resto in dx

;output sullo schermo
;il carattere da stampare deve essere inserito nel registro 'dl'
mov dl,al
mov ah,02
int 21h

;ritorno al sistema (fine programma)
mov ax,4c00h
int 21h

end inizio