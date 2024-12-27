; Dati due numeri interi  effettuare la moltiplicazione  per somme successive 
; e mettere il risultato in una variabile molt.

org 100h
    jmp start:
    db molt ?
    db a 10d
    db b 3d
start:    sub ax,ax
          sub bx,bx
          sub dx,dx

          mov al,10d
          mov bl,3d
          mov cx,bx
ciclo:
          cmp cx,0
          jz fine
          add dl,al
          dec cx
          jmp ciclo
          fine:
          mov molt,dl
hlt







