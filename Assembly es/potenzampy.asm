; 
; calcolare la potenza di un numero (base) il cui valore predefinito 
; si trova in memoria (1 byte) 
; anche l'esponente predefinito si trova in memoria (byte)
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
BASE  DB 2          ;base della potenza (Byte) 
EXP   DB 4          ;esponente
POT   DW ?          ;quadrato (word)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB AX,AX     ;azzera il registro AX    
      INC AL        ;pone a 1 il registro AL
      SUB CX,CX     ;azzera il registro CX   
      SUB BX,BX     ;azzera registro BX   
      MOV BL,BASE   ;copia la base su BL
      MOV CL,EXP    ;copia l'esponente in CL 
LOOP_EXP:             
      MUL BL        ;moltiplica la base per se stessa EXP volte
      LOOP LOOP_EXP ;CX=CX-1 e ripete se CX <> 0
FINE_LOOP:
      MOV POT,AX    ;copia il risultato in POT
FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
