                   ;
; Programma per la visualizzazione di un numero di massimo 3 cifre

;
;
     ORG 100H
    .MODEL SMALL
    .STACK 100H
    .DATA          ;inizio segmento dati
    
MESOUT   DB 13,10,"Il numero e'",13,10,"$"
CIFRA1   DB ?
CIFRA2   DB ?
CIFRA3   DB ?
NUMERO   DW 819
BASE1    DB 10

    
                   ;fine segmento dati
    .CODE          ;inizio programma
    MOV AX,@DATA
    MOV DS,AX
    
    SUB AX,AX      ;azzeramento registri
    SUB BX,BX
    SUB CX,CX
    
    MOV AX,NUMERO  ;sposto il valore di NUMERO in AX
    DIV BASE1      ;divido il valore di AX per il valore di BASE1
    ADD AH,48      ;sommo 48 ad AH
    MOV CIFRA3,AH  ;sposto il valore di AH all'interno di CIFRA3
    
    SUB AH,AH      ;azzero AH
    DIV BASE1      ;divido il valore di AX per il valore di BASE1
    ADD AH,48      ;sommo 48 ad AH
    MOV CIFRA2,AH  ;sposto il valore di AH all'interno di CIFRA2
    ADD AL,48      ;sommo 48 ad AL
    MOV CIFRA1,AL  ;sposto il valore di AL all'interno di CIFRA3
    
    LEA DX,MESOUT  ;si visualizza il numero inserito
    MOV AH,9       ;si visualizza la stringa
    INT 21H
    
    MOV DL,CIFRA1  ;sposto il valore di CIFRA1 in DL
    MOV AH,2       ;richiedo l'inserimento di un numero da tastiera
    INT 21H
    
    MOV DL,CIFRA2  ;sposto il valore di CIFRA2 in DL
    MOV AH,2       ;richiedo l'inserimento di un numero da tastiera
    INT 21H
    
    MOV DL,CIFRA3  ;sposto il valore di CIFRA3 in DL
    MOV AH,2       ;richiedo l'inserimento di un numero da tastiera
    INT 21H
    
    MOV AX,4c00H
    INT 21H
    END            ;fine del programma
    