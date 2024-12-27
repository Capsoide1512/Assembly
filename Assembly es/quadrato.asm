; 
; calcolare il quadrato di un valore predefinito 
; caricato in memoria (1 byte)
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
BASE  DB 25         ;base della potenza (Byte)
QUAD  DW ?          ;quadrato (word)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzera il registro AX
      SUB CX,CX     ;azzera il registro CX 
      MOV CL,BASE   ;copia la base in CL
INIZIO_LOOP:
      ADD AL,BASE   ;aggiunge BASE ad AL
      ADC AH,0      ;aggiunge il carry
      LOOP INIZIO_LOOP ;CX=CX-1 e ripete il ciclo iterativo se CX <> 0 
FINE_LOOP:
      MOV QUAD,AX   ;copia il risultato in QUAD
FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
