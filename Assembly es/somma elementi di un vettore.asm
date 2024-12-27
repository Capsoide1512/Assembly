  org 100h
  
  jmp start
  v1    dw 2,5,16,17,38
  somma dw ? 
  
  start:
  
  mov ax,0
  mov cx,5
  mov di,0
  
  sommaa:
  add ax,v1[di]
  add di,2
  dec cx
  cmp cx,0
  jnz sommaa
  mov somma,ax
  hlt