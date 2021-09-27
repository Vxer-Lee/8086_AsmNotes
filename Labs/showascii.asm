assume  cs:code,ds:data
;>>>>>>>>>>>>>>>>
;数据段
;>>>>>>>>>>>>>>>>
data segment
  db 'hello,world!','$'
data ends

;>>>>>>>>>>>>>>>>
;代码段
;>>>>>>>>>>>>>>>>
code segment
start: 
      mov ax,data
      mov ds,ax
      
      ;调用DOS中断显示字符串
      mov dx,0 ;ds:[dx]
      mov ah,09h
      int 21h
      ;return dos
      mov ax,4c00h
      int 21h
code ends
end start