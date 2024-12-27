; 
; legge una stringa da tastiera, la memorizza
; e la visualizza a video
; 
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
MESIN   DB 10,?,10 DUP(?) 
                    ;MES: stringa messaggio seguita da
                    ; 13 (carriage return), 
                    ; 10 (new line) e 
                    ; $ (fine stringa)

MESOUT   DB 13,10,"carattere letto: ","$" 
                    ;MESOUT: stringa messaggio preceduta da
                    ; 13 (carriage return), 
                    ; 10 (new line) e seguita da  
                    ; $ (fine stringa)
CAR   DB ?          ;carattere letto da tastiera                    
    .CODE           ;inizio segmento codice
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzera registro AX

; visualizzazione stringa di domanda
      LEA DX,MESIN  ;carica in DX l'indirizzo della stringa MESIN
      MOV AH,9      ;in AH servizio 9: visualizzazione stringa
      INT 21H       ;chiamata Sistema Operativo

; lettura carattere da tastiera
      MOV AH,1      ;in AH servizio 1: lettura tastiera
      INT 21H       ;chiamata Sistema Operativo 
      
      MOV CAR,AL    ;copia carattere letto da AL in CAR   

; visualizzazione stringa di output
      LEA DX,MESOUT ;carica in DX l'indirizzo della stringa MESOUT
      MOV AH,9      ;in AH servizio 9: visualizzazione stringa
      INT 21H       ;chiamata Sistema Operativo 

; visualizzazione del carattere letto
      MOV DL,CAR    ;carica in DL il carattere letto
      MOV AH,2      ;in AH servizio 2: visualizzazione carattere
      INT 21H       ;chiamata Sistema Operativo


FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
