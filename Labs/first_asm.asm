;1.asm
assume cs:code ;代码段code和cs关联

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;代码段
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
code segment ;code是标号,最终会被编译成段地址
;程序入口
start: 
       mov ax,0123h
       mov bx,0456h
       add ax,bx
       add ax,ax
       
       ;返回到DOS
       mov ax,4c00h
       int 21h
code ends
;程序结束
end start
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>