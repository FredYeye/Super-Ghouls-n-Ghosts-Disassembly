;this block of code has a different location in the eu release

spc_0B11: ;0B11 - 0B4A
	mov  a, #$00
	mov  x, a
-:
	mov  (x+), a
	cmp  x, #$E0
	bne  -

	mov  x, a
-:
	mov  $0100+x, a
	inc  x
	cmp  x, #$80
	bne  -

	mov  x, a
-:
	mov  $0200+x, a
	inc  x
	bne  -

-:
	mov  a, spc_0BF9+x
	mov  y, a
	mov  a, spc_0C05+x
	call spc_0BF2
	inc  x
	cmp  x, #$0C
	bne  -

	mov  x, #$00
	mov  y, #$0F
-:
	mov  a, spc_0C11+x
	call spc_0BF2
	inc  x
	mov  a, y
	clrc
	adc  a, #$10
	mov  y, a
	bpl  -

	ret


spc_0B4B: ;0B4B - 0BCB, continues to 0BF2
	dec  y
	mov  $C1, y
	mov  $C0, a
	mov  a, y
	mov  y, #$00
	setc
	sbc  a, #$34
	bcs  spc_0B61

	mov  a, $C1
	setc
	sbc  a, #$13
	bcs  spc_0B65

	dec  y
	asl  a
spc_0B61:
	addw ya, $C0
	movw $C0, ya
spc_0B65:
	push x
	mov  a, $C1
	asl  a
	mov  y, #$00
	mov  x, #$18
	div  ya, x
	mov  x, a
	mov  a, spc_0C19+1+y
	mov  $C3, a
	mov  a, spc_0C19+0+y
	mov  $C2, a
	mov  a, spc_0C19+3+y
	push a
	mov  a, spc_0C19+2+y
	pop  y
	subw ya, $C2
	mov  y, $C0
	mul  ya
	mov  a, y
	mov  y, #$00
	addw ya, $C2
	mov  $C1, y
	asl  a
	rol  $C1
-:

if !version == 0 || !version == 1
	cmp  x, #$06
elseif !version == 2
	cmp  x, #$08
endif

	beq  spc_0B9A

	lsr  $C1
	ror  a
	inc  x
	bra  -

spc_0B9A:
	mov  $C0, a
	pop  x
	mov  a, $02B0+x
	mov  y, $C1
	mul  ya
	movw $C2, ya
	mov  a, $02B0+x
	mov  y, $C0
	mul  ya
	push y
	mov  a, $02A0+x
	mov  y, $C0
	mul  ya
	addw ya, $C2
	movw $C2, ya
	mov  a, $02A0+x
	mov  y, $C1
	mul  ya
	mov  y, a
	pop  a
	addw ya, $C2
	and  a, #$F0
	push y
	mov  y, #$02
	call spc_0BE8
	pop  a
	inc  y
	bra  spc_0BF2


spc_0BCC: ;0BCC - 0BD6, contines to 0BF2
	bbc5 $C9, spc_0BD2

	mov  a, y
	bra  spc_0BDC

spc_0BD2:
	push y
	mul  ya
	mov  a, y
	pop  y
	bbc5 $C7, spc_0BDC

	push a
	mov  a, y
	pop  y
spc_0BDC:
	mov  $C7, y
	mov  y, #$00
	call spc_0BE8
	mov  a, $C7
	inc  y
	bra  spc_0BF2

{ ;0BE8 - 0BF8
spc_0BE8:
	push a
	mov  $C6, y
	mov  a, $CC
	xcn  a
	or   a, $C6
	mov  y, a
	pop  a
}

spc_0BF2: ;0BF2 - 0BF8
	mov  !DSPADDR, y
	mov  !DSPDATA, a
	ret


spc_0BF9: ;0BF9 - 0C32
	db $4D, $0D, $2C, $3C, $6C, $7D, $6D, $5D, $0C, $1C, $2D, $3D

spc_0C05:

if !version == 0 || !version == 1
	db $00, $00, $00, $00, $20, $00, $0D, $58, $7F, $7F, $00, $00
elseif !version == 2
	db $00, $00, $00, $00, $20, $00, $0D, $63, $7F, $7F, $00, $00
endif

spc_0C11:
	db $7F, $00, $00, $00, $00, $00, $00, $00

spc_0C19:
	dw $085F, $08DE, $0965, $09F4, $0A8C, $0B2C, $0BD6
	dw $0C8B, $0D4A, $0E14, $0EEA, $0FCD, $10BE
