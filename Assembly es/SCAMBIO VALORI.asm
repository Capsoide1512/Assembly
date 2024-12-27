;Si scriva un programma in linguaggio Assembler 8086 che date due variabili di tipo word, ne
;scambi il valore.
 ORG 0100H               
  
      JMP START            
      A DB 08H           
      B DB 03H             

      START:  
     
      MOV AX, A
      MOV BX, B
      MOV AX, BX
      MOV AH, 4CH 
      INT 21H
      HLT
      
     



