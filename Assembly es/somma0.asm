
; 
; programma di somma di due valori predefiniti caricati in memoria 

; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 byte)
    .DATA           ;inizio segmento dati

NUM1  DB 25         ;primo addendo (byte)
NUM2  DB 40         ;secondo addendo (byte)
SOMMA DB ?          ;somma (byte)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      MOV AL,NUM1   ;copia in AL il primo addendo
      ADD AL,NUM2   ;somma NUM2 ad AL
      MOV SOMMA,AL  ;copia AL in SOMMA
      MOV AX,4C00H  ;fine elaborazione
      INT 21H
      END
