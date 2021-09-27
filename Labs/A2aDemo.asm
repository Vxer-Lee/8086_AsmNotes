;**********************************
;*                                *
;* 要求：将所有字符串转换成小写字符串  *
;**********************************

assume cs:code,ds:data
;>>>>>>>>>>>>>>>>>
;数据段
;>>>>>>>>>>>>>>>>>
data segment
	db 'Hello,World!','$'
data ends
;>>>>>>>>>>>>>>>>>
;代码段
;>>>>>>>>>>>>>>>>>
code segment
main:
	 mov ax,data ;ds段
	 mov ds,ax
	 
	 ;大小写转换
	 mov bx,0
	 mov cx,11
  s: mov al,ds:[bx] ;将ASCII码从 ds:bx单元中取出
	 or al,00100000b;让第5位无论如何都变1
	 mov ds:[bx],al
	 inc bx
	 loop s
	 
	 ;输出字符串
	 mov dx,0; ds:[0]
	 mov ah,09h
	 int 21h
	 
	 ;retun 2 dos
	 mov ax,4c00h
	 int 21h
code ends
end main