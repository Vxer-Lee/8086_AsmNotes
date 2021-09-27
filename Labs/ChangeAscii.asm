;*************************************
;*                                   *
;*    将如下的doSASM转换成DOSasm       *
;*************************************

assume cs:code,ds:data

;>>>>>>>>>>>>>>>>>>>>>
;数据段
;>>>>>>>>>>>>>>>>>>>>>
data segment
    db 'doS'
    db 'asm','$'
data ends

;>>>>>>>>>>>>>>>>>>>>>
;代码段
;>>>>>>>>>>>>>>>>>>>>>
code segment
main:
      ;
      mov ax,data
      mov ds,ax

      ;大小写转换
      mov bx,0
      mov cx,3
    s:mov al,0[bx]
      and al,11011111b;转大写
      mov 0[bx],al
      mov al,3[bx];
      or al,00100000b;转小写
      mov 3[bx],al
      inc bx
      loop s 

      ;输出字符串
      mov dx,0
      mov ah,09h
      int 21h

      ;return 2 DOS
      mov ax,4c00h
      int 21h
code ends
end main