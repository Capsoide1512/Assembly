
; 
; calcolare il Massimo Comun Divisore (MCD) di due valori predefiniti 
; caricati in memoria (1 byte)
; il risultato va su un byte 
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
NUM1  DB 60         ;primo numero (Byte)
NUM2  DB 25         ;secondo numero (Byte)
MCD   DB ?          ;Massimo Comun Divisore (byte)
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati

      MOV BH,NUM1   ;copia in BH il primo numero     
      MOV BL,NUM2   ;copia in BL il secondo numero 
CONFRONTA:
      CMP BH,BL     ;confronta i due numeri
      JE  FINE      ;se BH = BL va a fine
      JA  DECREMENTA;se BH > BL va a decrementare BH
      SUB BL,BH     ;BL > BH sottrae BH a BL
      JMP CONFRONTA
DECREMENTA:
      SUB BH,BL     ;sottrae BL a BH  
      JMP CONFRONTA
FINE:
      MOV MCD,BH    ;copia il Massimo Comun Divisore su MCD
                    ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
