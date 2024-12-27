ORG 100H
   
   JMP START
   F1 DB "INSERISCI UN NUMERO","$"
   V1 DB DUP 10 (?)
   V2 DB DUP 10 (?)
   
      START:
   
      MOV CX,0
      LEA SI,V1
      LEA DI,V2
      MOV CX,10
CICLO:LEA DX,F1
      MOV AH,9
      INT 21H 
      MOV AH,1
      INT 21H
      CMP AL,'0'
      JB CICLO
      CMP AL,'9'
      JA CICLO
      SUB AL,48
      CMP AL,5
      JB INSEV1
      CMP AL,6
      JA INSEV2
      
INSEV1:
      MOV [SI],AL
      INC SI
      LOOP CICLO
      JMP FINE
INSEV2:
      MOV [DI],AL
      INC DI
      LOOP CICLO
FINE: HLT
   





