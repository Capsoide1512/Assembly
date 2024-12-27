; 
; calcolare il Minimo Comune Multiplo (MCM) di due valori predefiniti 
; caricati in memoria (1 byte)
; il risultato va su un byte - senza carry
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
NUM1  DB 3          ;primo numero (Byte)
NUM2  DB 2          ;secondo numero (Byte)
MCM   DB ?          ;Minimo Comune Multiplo (byte)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati

      MOV BH,NUM1   ;copia in BH il primo numero     
      MOV BL,NUM2   ;copia in BL il secondo numero 
CONFRONTA:
      CMP BH,BL     ;confronta i due numeri
      JE  FINE      ;se BH = BL va a fine
      JB  INCREMENTA;se BH > BL va a decrementare BH
      ADD BL,NUM2   ;BL > aggiunge NUM2 a BL
      JMP CONFRONTA
INCREMENTA:
      ADD BH,NUM1   ;aggiunge NUM1 a BH  
      JMP CONFRONTA
FINE:
      MOV MCM,BH    ;copia il Minimo Comune Multiplo su MCD
                    ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
