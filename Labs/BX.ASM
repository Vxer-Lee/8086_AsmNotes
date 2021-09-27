	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "bx.c"
BX_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:BX_TEXT,ds:DGROUP
BX_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E9DB682E530462782E63
	?debug	C E92A6C2D53112E2F696E636C7564655C737464696F2E68
	?debug	C E900501D1110696E636C7564652F7374646172672E68
_BSS	ends
BX_TEXT	segment	byte public 'CODE'
;	?debug	L 2
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,24
	push	si
	push	di
;	?debug	L 6
	mov	si,1
	jmp	short @5
@4:
;	?debug	L 8
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-24]
	add	bx,ax
	mov	word ptr ss:[bx],si
@3:
	inc	si
@5:
	cmp	si,10
	jle	@4
@2:
;	?debug	L 10
	mov	word ptr [bp-4],6
;	?debug	L 11
	mov	word ptr [bp-2],2
;	?debug	L 12
	mov	di,3
;	?debug	L 13
	mov	word ptr [bp-14],di
;	?debug	L 14
	push	word ptr [bp-14]
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	call	far ptr _printf
	add	sp,6
@1:
;	?debug	L 15
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
BX_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	37
	db	100
	db	13
	db	10
	db	0
_DATA	ends
	extrn	_printf:far
BX_TEXT	segment	byte public 'CODE'
BX_TEXT	ends
	public	_main
	end
