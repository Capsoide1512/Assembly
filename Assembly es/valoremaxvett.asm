;Si scriva un programma in linguaggio ASSEMBLER 8086, che dato un valore trovi il valore massimo
;in esso contenuto e lo memorizzi nella variabile max (che per me è il registro AH)




org 100h



     JMP START
     
     V1  DB 11,2,15,6
     MAX DB ?
     
     START:
     
      SUB AX,AX  ;AZZERO IL REGISTRO AX
      SUB BX,BX  ;AZZERO IL REGISTRO BX
      SUB CX,CX  ;AZZERO IL RESGISTRO CX
      SUB DX,DX  ;AZZERO IL REGISTRO DX 
      LEA SI,V1  ;
      MOV CX,4   ;INIZIALIZZO IL CONTATORE A 4, PERCHè IL VETTORE HA 4 ELEMNTI
      MOV AH,[SI];METTO IN AH IL PRIMO NUMERO CONTENUTO IN V1 
      
    CICLO:
      
      INC SI     ;IL PUNTATORE DELL'ARRAY SCORRE PER "PUNTARE" AL VALORE SUCCESSIVO 
      CMP AH,[SI];CONFRONTO IL VALORE CONTENUTO IN AH CON QUELLO DEL VETTORE
      JG CONTINUA:;SE AH è MAGGIORE DELL'ELEMENTO CONETENUTO NEL VETTORE
      MOV AH,[SI];METTO IL VALORE CONTENUTO NEL VETTORE IN AH
      
   CONTINUA:
      
      LOOP CICLO ; DECREMENTO IL CONTATORE CX FINO A CHE E' = 0
      
      HLT ;FINE PROGRAMMA
      
     
     




