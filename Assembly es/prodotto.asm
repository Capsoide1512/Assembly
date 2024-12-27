; 
; calcolare il prodotto per somme successive di due valori predefiniti 
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
FAT1  DB 90          ;primo fattore (Byte)
FAT2  DB 3          ;secondo fattore (Byte)
PROD  DW ?          ;prodotto (word)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzera il registro AX
      SUB CX,CX     ;azzera il registro CX
      MOV CL,FAT2   ;copia in CL il secondo fattore FAT2
INIZIO_LOOP:
      ADD AL,FAT1   ;aggiunge FAT1 ad AL
      ADC AH,0      ;aggiunge il carry
      LOOP INIZIO_LOOP ;CX=CX-1 e ripete il ciclo iterativo se CX <> 0 
FINE_LOOP:
      MOV PROD,AX   ;copia il risultato in PROD
FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
