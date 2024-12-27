
; 
; programma di somma con carry di due valori predefiniti caricati in memoria (1 byte)
; il risultato va su una word (2 byte) 
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
NUM1  DB 150        ;primo addendo (Byte)
NUM2  DB 200        ;secondo addendo (Byte)
SOMMA DW ?          ;somma (word)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzerare ax
      MOV AL,NUM1   ;copia in AL il primo addendo     
      ADD AL,NUM2   ;somma NUM2 ad AL   
      ADC AH,0
      MOV SOMMA,AX  ;copia AL in SOMMA
                    ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
