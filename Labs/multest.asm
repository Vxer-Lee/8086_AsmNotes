assume cs:codesg,ds:datasg
;>>>>>>>数据段>>>>>>>>>
datasg segment

datasg ends


;>>>>>>>代码段>>>>>>>>>
codesg segment
start:
    mov ax,datasg
    mov ds,ax

    ;乘法指令 0x190 * 0x190 = 0x27100(超过0xFFFF)
    mov ax,190h
    mov bx,190h
    mul bx    ;0x190 * 0x190
    ;此时来看看ax 和 dx的值


    mov ax,4c00h
    int 21h

codesg ends
end start