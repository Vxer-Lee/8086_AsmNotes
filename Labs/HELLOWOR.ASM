	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "hellowor.c"
HELLOWOR_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:HELLOWOR_TEXT,ds:DGROUP
HELLOWOR_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E93B992D530A68656C6C6F776F722E63
	?debug	C E92A6C2D53112E2F696E636C7564655C737464696F2E68
	?debug	C E900501D1110696E636C7564652F7374646172672E68
_BSS	ends
HELLOWOR_TEXT	segment	byte public 'CODE'
;	?debug	L 3
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
;	?debug	L 6
	mov	si,2
;	?debug	L 7
	mov	di,3
;	?debug	L 8
	mov	ax,si
	mul	di
	mov	word ptr [bp-2],ax
;	?debug	L 9
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	call	far ptr _printf
	pop	cx
	pop	cx
;	?debug	L 10
	xor	ax,ax
	jmp	short @1
@1:
;	?debug	L 11
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
HELLOWOR_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
	db	72
	db	101
	db	108
	db	108
	db	111
	db	44
	db	87
	db	111
	db	114
	db	108
	db	100
	db	33
	db	13
	db	10
	db	0
_DATA	ends
	extrn	_printf:far
HELLOWOR_TEXT	segment	byte public 'CODE'
HELLOWOR_TEXT	ends
	public	_main
	end
