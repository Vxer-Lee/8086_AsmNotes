	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "mul.c"
MUL_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:MUL_TEXT,ds:DGROUP
MUL_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E92A792E53056D756C2E63
	?debug	C E92A6C2D53112E2F696E636C7564655C737464696F2E68
	?debug	C E900501D1110696E636C7564652F7374646172672E68
_BSS	ends
MUL_TEXT	segment	byte public 'CODE'
;	?debug	L 2
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
;	?debug	L 5
	mov	si,20
;	?debug	L 6
	mov	di,20
;	?debug	L 7
	mov	ax,si
	mul	di
	mov	word ptr [bp-2],ax
;	?debug	L 8
	xor	ax,ax
	jmp	short @1
@1:
;	?debug	L 9
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
MUL_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
MUL_TEXT	segment	byte public 'CODE'
MUL_TEXT	ends
	public	_main
	end
