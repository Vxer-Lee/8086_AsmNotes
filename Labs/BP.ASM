	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "bp.c"
BP_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:BP_TEXT,ds:DGROUP
BP_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E9D1892E530462702E63
	?debug	C E92A6C2D53112E2F696E636C7564655C737464696F2E68
	?debug	C E900501D1110696E636C7564652F7374646172672E68
_BSS	ends
BP_TEXT	segment	byte public 'CODE'
;	?debug	L 2
_test	proc	far
	push	bp
	mov	bp,sp
	push	si
;	?debug	L 5
	mov	si,word ptr [bp+6]
	add	si,word ptr [bp+8]
;	?debug	L 6
	mov	si,word ptr [bp+8]
	add	si,word ptr [bp+10]
;	?debug	L 7
	mov	si,word ptr [bp+10]
	add	si,word ptr [bp+12]
;	?debug	L 8
	mov	si,word ptr [bp+14]
	add	si,word ptr [bp+16]
@1:
;	?debug	L 9
	pop	si
	pop	bp
	ret	
_test	endp
;	?debug	L 11
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,6
;	?debug	L 14
	mov	word ptr [bp-6],1
;	?debug	L 15
	mov	word ptr [bp-4],2
;	?debug	L 16
	mov	word ptr [bp-2],3
;	?debug	L 17
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	mov	ax,4
	push	ax
	mov	ax,3
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	push	cs
	call	near ptr _test
	add	sp,12
;	?debug	L 18
	xor	ax,ax
	jmp	short @2
@2:
;	?debug	L 19
	mov	sp,bp
	pop	bp
	ret	
_main	endp
BP_TEXT	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
BP_TEXT	segment	byte public 'CODE'
BP_TEXT	ends
	public	_test
	public	_main
	end
