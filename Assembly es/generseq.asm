 ORG 100H       ;origine del programma all'indirizzo 100H

.DATA
        g1 DB 13,10,"GENERAZIONE SEQUENZA","$"
        g2 DB 13,10,"SEQUENZA GENERATA","$"


.CODE           ;inizio segmento codice
INIZ:
        MOV AX,@DATA
        MOV DS,AX     ;carica in DS l'indirizzo del segmento dati
        SUB AX,AX     ;azzera registro AX

                      ; visualizzazione stringa 
        LEA DX,g1  ;carica in DX l'indirizzo della stringa g1
        MOV AH,9      ;in AH servizio 9: visualizzazione stringa
        INT 21H       ;chiamata Sistema Operativo
  


        mov di,0200h  
        mov ax,0050h
        mov [di],ax
 ciclo: add ax,64h
        add di,02h
        mov [di],ax
        cmp ax,0500h 
        jne ciclo
  
        
fine:   sub ax,ax
        lea dx,g2
        mov ah,09h
        int 21h
        hlt 
        


