; 
; riempire un vettore con N valori interi presi in input, 
; sommare i valori contenuti nel vettore,
; e stamparlo in ordine inverso
; 

; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
;    ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
VETT  DB ?,?,?,?,?  ;dichiarazione di un vettore 

DIM   EQU $-VETT    ; definisce lunghezza del vettore
SOMMA DW            ;variabile somma
                    
    .CODE           ;inizio segmento codice
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      MOV CX,DIM    ;carica in CX la dimensione del vettore
      SUB DI,DI     ;AZZERA IL REGISTRO DI

;riempie il vettore con caratteri presi in input  

      MOV AH,1      ;in AH servizio 1: lettura tastiera
LEGGE:
      INT 21H       ;chiamata Sistema Operativo INT 21h     
      MOV VETT[DI], AL  ;copia carattere letto nel vettore
      INC DI        ; incrementa registro indice
      DEC CX        ; decrementa registro cx (contatore)
      CMP CX,0      ;confronta contatore con zero
      JNZ LEGGE     ;ae diverso da zero torna a leggere 

;somma i valori contenuti nel vettore 

      MOV CX,DIM    ;ricarica in CX la dimensione del vettore
      SUB AX,AX     ; azzera reg. AX  
      SUB DI,DI     ; azzera reg. DI
SOMMA:
      ADD AL,VETT[DI] 
      ADC AH,0      ; somma eventuale carry
      INC DI        ; incrementa registro DI (indice)
      LOOP SOMMA    ; decrementa CX e salta a SOMMA se <> 0     





;stampa il vettore in ordine inverso



      MOV CX,DIM    ;ricarica in CX la dimensione del vettore




FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
