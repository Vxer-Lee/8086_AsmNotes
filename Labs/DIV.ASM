	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "div.c"
DIV_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:DIV_TEXT,ds:DGROUP
DIV_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E9BB5C2E53056469762E63
	?debug	C E92A6C2D53112E2F696E636C7564655C737464696F2E68
	?debug	C E900501D1110696E636C7564652F7374646172672E68
_BSS	ends
DIV_TEXT	segment	byte public 'CODE'
;	?debug	L 3
_div	proc	far
	push	bp
	mov	bp,sp
	push	si
;	?debug	L 6
	mov	ax,word ptr [bp+6]
	cwd	
	idiv	word ptr [bp+8]
	mov	si,dx
;	?debug	L 7
	mov	ax,si
	jmp	short @1
@1:
;	?debug	L 8
	pop	si
	pop	bp
	ret	
_div	endp
;	?debug	L 10
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
;	?debug	L 15
	mov	si,12
;	?debug	L 16
	mov	di,4
;	?debug	L 17
	push	di
	push	si
	push	cs
	call	near ptr _div
	pop	cx
	pop	cx
	mov	word ptr [bp-2],ax
;	?debug	L 18
	push	word ptr [bp-2]
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	call	far ptr _printf
	add	sp,6
@2:
;	?debug	L 19
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
DIV_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	37
	db	100
	db	10
	db	0
_DATA	ends
	extrn	_printf:far
DIV_TEXT	segment	byte public 'CODE'
DIV_TEXT	ends
	public	_main
	public	_div
	end
