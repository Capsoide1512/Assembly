; multi-segment executable file template.

data segment
   pkey db "premi un tasto per continuare",'$'
   n db ?
   msg db  "inserisci numero asterischida stampare",'$'
   ends data
code segment
main:    
assume ds:data,cs:code
     mov ax, data
     mov ds, ax
     mov es, ax 
     lea dx, msg
     mov ah, 09h
     int 21h
     mov cl, 0
     mov ah, 01h
     int 21h
     sub al, 30h
     mov n,al
     mov dl, 10d
     mov ah, 02h
     int 21h
while:
      cmp cl, n
      je endwhile
      mov dl, '*'
      mov ah, 02h
      int 21h
      inc cl
      jmp while
endwhile:
      mov dl, 10d
      mov ah, 02h
      int 21h
      mov dl, 13d
      mov ah, 02d
      int 21h
      lea dx, pkey
      mov ah, 09h
      int 21h
      mov ah, 01h
      int 21h
exit: mov ax, 4c00h
      int 21h
ends code