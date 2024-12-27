; 
; trovare il massimo valore tra quelli presenti in un array
; i singoli elementi dell'array hanno la dimensione del byte
; il valore massimo e la sua posizione vengono posti in memoria
; 
;
;    DOSSEG         ;non viene accettata come direttiva assembler 
;  
     ORG 100H       ;origine del programma all'indirizzo 100H
    .MODEL SMALL
    .STACK 100H     ;ampiezza dello stack (256 Byte)
    .DATA  
                    ;inizio segmento dati
VET   DB 3,1,7,4,9,2;dichiarazione del vettore con valori predefiniti
LV    EQU $-VET     ;definisce lunghezza del vettore 
MAX   DB ?          ;valore massimo
PM    DB ?          ;posizione nel vettore del valore massimo
    .CODE           ;inizio segmento codice
    
INIZ:  
      MOV AX,@DATA
      MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
      SUB CX,CX     ;azzera il registro CX (contatore)
      SUB SI,SI     ;azzera il registro indice SI
      MOV CL,LV     ;copia il numero di elementi (LV) in CL  
      SUB BX,BX     ;azzera registro BX
      MOV BL,VET[SI];copia il primo elemento in BL 
                    ;in BL va a finire il massimo provvisorio
;      MOV BH,SI     ;in bh va l'indice del massimo              
LOOP_MMM:
      INC SI             
      CMP BL,VET[SI];confronta BL con VET[SI] 
      JB  AGG_MAX   ;se BL < VET[SI] va ad aggiornare BL
      LOOP LOOP_MMM ;CX=CX-1 e ripete se CX <> 0   
      JMP RISULTATI
AGG_MAX: 
      MOV BL,VET[SI];nuovo massimo in BL
;      MOV BH,SI     ;indice del massimo in BH
      JMP LOOP_MMM  ;ritorna a inizio loop 
RISULTATI: 
      MOV MAX,BL    ;copia il massimo in MAX
;      MOV PM,BH     ;copia la sua posizione in PM 
FINE:               ;fine elaborazione
      MOV AX,4C00H
      INT 21H
      END
