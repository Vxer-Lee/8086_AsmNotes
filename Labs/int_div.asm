;*************************************
; 编写0号中断处理程序do0，当发生除法溢出时，
; 在`屏幕中间显示` "overflow！"，返回DOS。
;*************************************
assume cs:code,ds:data,ss:stack

;>>>>>>>>>>>>>>>>>>>>>>>
;数据段
;>>>>>>>>>>>>>>>>>>>>>>>
data segment
data ends

;>>>>>>>>>>>>>>>>>>>>>>>
;代码段
;>>>>>>>>>>>>>>>>>>>>>>>
code segment
_main:
    ;code
    mov ax,cs
    mov ds,ax
    mov si,offset do0 ;设置ds:si指向源地址
    ;2.
    mov ax,0
    mov es,ax
    mov di,200h ;设置es:di指向目标源地址 
    ;3.
    mov cx,offset d0end - offset do0 ;设置cx为传输长度,编译时给出do0部分代码长度
    cld ;设置传输方向位正
    rep movsb ; 挨个传送字节到 0:200处.
    ;4.
    mov ax,0 ;设置中断向量表
    mov es,ax
    mov word ptr es:[0*4],200h
    mov word ptr es:[0*4+2],0
    ;return 2 dos
    mov ax,4c00h
    int 21h

;>>>>>>>>>
;do0函数
;>>>>>>>>>
d0: 
     jmp short do0 start
     db "Overflow!"
do0start:
     mov ax,cs
     mov ds,ax
     mov si,202h ; 设置ds:si指向字符串
     ;2.
     mov ax,0b800h
     mov es,ax
     mov di,12*160+36*2; 设置es:di指向显存空间的中间位置
     ;3.
     mov cx,9 ;字符串长度
   s:mov al,[si]
     mov es:[di],al ;传送字符
     inc si
     add di,1
     ;
     mov al,02h ;设置颜色
     mov es:[di],al
     add di,1
     loop s

     ;return 2 dos
     mov ax,4c00h
     int 21h
do0end: nop

code ends
end _main