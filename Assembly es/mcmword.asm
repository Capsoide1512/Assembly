; 
; calcolare il Minimo Comune Multiplo (MCM) di due valori predefiniti 
; caricati in memoria (1 byte)
; il risultato va su una word a causa del carry 
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
NUM1  DB 200        ;primo numero (Byte)
NUM2  DB 150        ;secondo numero (Byte)
MCM   DW ?          ;Minimo Comune Multiplo (word)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzera AX
      SUB BX,BX     ;azzera BX
      MOV AL,NUM1   ;copia in AL il primo numero     
      MOV BL,NUM2   ;copia in BL il secondo numero 
CONFRONTA:
      CMP AX,BX     ;confronta i due numeri
      JE  FINE      ;se AX = BX va a FINE
      JB  INCREMENTA;se AX < BX va a incrementare AX
      ADD BL,NUM2   ;AX > BX aggiunge NUM2 a BL  
      ADC BH,0      ;aggiunge il carry a BH
      JMP CONFRONTA
INCREMENTA:
      ADD AL,NUM1   ;aggiunge NUM1 a AL
      ADC AH,0      ;aggiunge il carry a AH  
      JMP CONFRONTA
FINE:
      MOV MCM,AX    ;copia il Minimo Comune Multiplo su MCM
                    ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
