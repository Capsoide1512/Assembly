;
; Programma per la visualizzazione di un numero di massimo 3 cifre

;
;
     ORG 100H
    .MODEL SMALL
    .STACK 100H
    .DATA          ;inizio segmento dati
    
MESIN DB 13,10,"Inserire il numero desiderato di cifre compreso tra 1 e 3",13,10,"$" 
MESIN1 DB 13,10,"Inserire la prima cifra compresa tra 0 e 9",13,10,"$"
MESIN11 DB 13,10,"Inserire la prima cifra compresa tra 1 e 9",13,10,"$"
MESIN2 DB 13,10,"Inserire la seconda cifra",13,10,"$"
MESIN3 DB 13,10,"Inserire la terza cifra",13,10,"$"
MESOUT DB 13,10,"Il numero e'",13,10,"$"
CIFRE DB ?
CIFRA1 DB ?
CIFRA2 DB ?
CIFRA3 DB ?
                   ;fine segmento dati
    
    .CODE          ;inizio codice programma
    MOV AX,@DATA
    MOV DS,AX
    
    SUB AX,AX      ;azzeramento registri
    SUB BX,BX
    SUB CX,CX
INP:    
    LEA DX,MESIN   ;si richiede l'inserimento del numero delle cifre
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"1"     ;controllo per verificare se il numero immesso e' compreso tra 1 e 3
    JB  INP
    CMP AL,"3"
    JG  INP
    MOV CL,AL      ;il valore di tale numero viene inserito in CL
    
    CMP CL,"1"     ;confronto tra il valore all'interno di CL ed il numero 1
    JE  CIF1       ;se CL e' uguale a 1 salta a CIF1
    JMP CONTR2     ;altrimenti salta a CONTR2

CIF1:
    
    LEA DX,MESIN1  ;si richiede l'inserimento della cifra
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"0"     ;controllo per verificare se il numero immesso e' compreso tra 0 e 9
    JB  CIF1
    CMP AL,"9"    
    JG  CIF1
    MOV CIFRA1,AL  ;sposta AL in CIFRA1
    
    LEA DX,MESOUT  ;si visualizza il numero inserito
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV DL,CIFRA1  ;si sposta in DL tale numero
    MOV AH,2       ;si visualizza il contenuto di DL
    INT 21H
    JMP FINE       ;viene eseguito un salto a FINE

CONTR2:
    
    CMP CL,"2"     ;confronto tra il valore di CL ed il numero 2
    JE  CIF21      ;se CL e' uguale a 2 salta a CIF21
    JMP CONTR3     ;altrimenti salta a CONTR3
    
CIF21:

    LEA DX,MESIN11 ;si richiede l'inserimento della prima cifra
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"1"     ;si verifica che tale numero sia compreso tra 1 e 9
    JB  CIF21
    CMP AL,"9"
    JG  CIF21
    MOV CIFRA1,AL  ;si sposta il valore di AL all'interno di CIFRA1
    
CIF22:
    
    LEA DX,MESIN2  ;si richiede l'inserimento della seconda cifra
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"0"     ;si verifica che tale numero sia compreso tra 0 e 9
    JB  CIF22
    CMP AL,"9"
    JG  CIF22
    MOV CIFRA2,AL  ;si sposta il valore di AL all'interno di CIFRA2
    
    LEA DX,MESOUT  ;si visualizza il numero
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    
    MOV DL,CIFRA1  ;il valore di CIFRA1 viene spostato all'interno di DL
    MOV AH,2       ;si visualizza il contenuto di DL
    INT 21H
    
    MOV DL,CIFRA2  ;il valore di CIFRA2 viene spostato all'interno di DL
    MOV AH,2       ;si visualizza il contenuto di DL
    INT 21H
    JMP FINE
    
CONTR3:

    CMP CL,"3"     ;si esegue un confronto tra il valore di CL ed il numero 3
    JE  CIF31      ;se tali valori sono uguali si salta a CIF31
    JMP FINE       ;altrimenti si salta a FINE
    
CIF31:

    LEA DX,MESIN11 ;si richiede l'inserimento della prima cifra
    MOV AH,9       ;viene visualizzata la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"1"     ;si verifica che tale numero sia compreso tra 1 e 9
    JB  CIF31
    CMP AL,"9"
    JG  CIF31
    MOV CIFRA1,AL  ;si sposta il valore di AL all'interno di CIFRA1
    
CIF32:

    LEA DX,MESIN2  ;si richiede l'inserimento della seconda cifra
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera 
    INT 21H
    CMP AL,"0"     ;si verifica che tale numero sia compreso tra 0 e 9
    JB  CIF32
    CMP AL,"9"
    JG  CIF32
    MOV CIFRA2,AL  ;si sposta il valore di AL all'interno di CIFRA2
    
CIF33:
    
    LEA DX,MESIN3  ;si richiede l'inserimento della terza cifra
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    MOV AH,1       ;si richiede l'inserimento di un numero da tastiera
    INT 21H
    CMP AL,"0"     ;si verifica che tale numero sia compreso tra 0 e 9
    JB  CIF33
    CMP AL,"9"
    JG  CIF33
    MOV CIFRA3,AL  ;si sposta il valore di AL all'interno di CIFRA3
    
    LEA DX,MESOUT  ;si visualizza il numero inserito
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    
    MOV DL,CIFRA1  ;il valore di CIFRA1 viene spostato all'interno di DL
    MOV AH,2       ;si visualizza il contenuto di DL
    INT 21H
    
    MOV DL,CIFRA2  ;il valore di CIFRA2 viene spostato all'interno di DL
    MOV AH,2       ;si visualizza il contenuto di DL 
    INT 21H
    
    MOV DL,CIFRA3  ;il valore di CIFRA3 viene spostato all'interno di DL
    MOV AH,2       ;si visualizza il contenuto di DL
    INT 21H
    JMP FINE
    
FINE:

    MOV AX,4c00H
    INT 21H
    END            ;fine programma     
    
    
    