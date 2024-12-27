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

      SUB CX,CX     ;azzera il registro CX   
      SUB DX,DX     ;azzera il registro DX
      SUB BX,BX     ;azzera registro BX
      MOV CL,EXP    ;copia l'esponente in CL 
      DEC CL        ;decrementa Cl di 1
LOOP_EXP:             
      SUB AX,AX     ;azzera registro AX
      SUB BX,BX     ;azzera registro BX
      MOV BL,BASE   ;copia la base in BL  
LOOP_INT:
      ADD AL,BASE   ;aggiunge BASE ad AL
      ADC AH,0      ;aggiunge il carry
      DEC BL        ;decrementa BL di 1
      CMP BL,0      ;confronta BL con 0
      JNE LOOP_INT  ;salta se BL <> 0 
      ADD DX,AX     ;aggiunge AX a DX   
      LOOP LOOP_EXP ;CX=CX-1 e ripete se CX <> 0
FINE_LOOP:
      MOV POT,DX    ;copia il risultato in POT
FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
