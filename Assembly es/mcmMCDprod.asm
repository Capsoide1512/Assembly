;===========================================================================
;Calcolare il Minimo Comune Multiplo (MCM) e il Massimo Comun Divisore (MCD)
;tra due numeri (1 byte) memorizzati su due variabili e successivamente, 
;usando il metodo delle somme ripetute, calcolare il prodotto tra MCM e MCD
;memorizzarlo su una variabile (PROD).

;===========================================================================
 
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
NUM1  DB 15         ;primo numero (Byte)
NUM2  DB 40         ;secondo numero (Byte)
MCM   DB ?          ;Minimo Comune Multiplo (byte) 
MCD   DB ?          ;Massimo Comun Divisore (byte)
PROD  DW ?          ;prodotto (word) 

    .CODE           ;inizio segmento codice
       
INIZIO:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati 
;
;===== inizio parte per il calcolo del Minimo Comune Multiplo 
;
      MOV BH,NUM1   ;copia in BH il primo numero     
      MOV BL,NUM2   ;copia in BL il secondo numero 
CONFR1:
      CMP BH,BL     ;confronta i due numeri
      JE  FINEMCM   ;se BH = BL va a FINEMCM
      JB  INCREM1   ;se BH > BL va a incrementare BH
      ADD BL,NUM2   ;BL > aggiunge NUM2 a BL
      JMP CONFR1    ;ritorna a confrontare
INCREM1:
      ADD BH,NUM1   ;aggiunge NUM1 a BH  
      JMP CONFR1    ;ritorna a confrontare
FINEMCM:
      MOV MCM,BH    ;copia il Minimo Comune Multiplo su MCM
;                    
;===== inizio parte per il calcolo del Massimo Comun Divisore
; 
      MOV BH,NUM1   ;copia in BH il primo numero     
      MOV BL,NUM2   ;copia in BL il secondo numero 
CONFR2:
      CMP BH,BL     ;confronta i due numeri
      JE  FINEMCD   ;se BH = BL va a FINEMCD
      JA  DECREM2   ;se BH > BL va a decrementare BH
      SUB BL,BH     ;BL > BH sottrae BH a BL
      JMP CONFR2    ;ritorna a confrontare
DECREM2:
      SUB BH,BL     ;sottrae BL a BH  
      JMP CONFR2    ;ritorna a confrontare
FINEMCD:
      MOV MCD,BH    ;copia il Massimo Comun Divisore su MCD
; 
;===== inizio parte per il calcolo del prodotto per somme successive
; 
      SUB AX,AX     ;azzera il registro AX
      SUB CX,CX     ;azzera il registro CX
      MOV CL,MCD    ;copia in CL il secondo fattore MCD
INIZ_LOOP:
      ADD AL,MCM    ;aggiunge MCM ad AL
      ADC AH,0      ;aggiunge il carry
      LOOP INIZ_LOOP;CX=CX-1 e ripete il ciclo iterativo se CX <> 0 
FINE_LOOP:
      MOV PROD,AX   ;copia il risultato in PROD
FINEPROGRAMMA:      ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
