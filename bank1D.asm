org $1D8000

incbin "graphics/astaroth.bin":$22B1..$0
incbin "graphics/nebiroth.bin"
incbin "graphics/unknown13.bin" ;intro stuff, but also 2bpp graphics! sort out later
incbin "graphics/veil_allocen.bin"
incbin "graphics/unknown14.bin"

{ ;F642 - FFFF
    ;unused data
    ;not sure if this is compressed data, i wasn't able to decompress/recompress it properly
    db $2C, $AF, $AE, $CB, $EB, $EA, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $EF, $EF
    db $FF, $FF, $FF, $FF, $FF, $FF, $77, $57, $5D, $5F, $FF, $75, $FF, $D5, $FF, $BB
    db $FB, $AF, $B6, $AA, $E0, $8A, $FF, $DD, $FF, $F7, $FB, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FF, $FF, $BB, $DF, $DD, $77, $F7, $FD, $77, $FF, $D7, $5D, $BB, $FB
    db $AE, $FE, $BA, $EA, $EF, $BA, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $BF, $FF, $DF
    db $F7, $FF, $FF, $FF, $FF, $EF, $17, $D7, $57, $DC, $D7, $75, $7F, $D7, $BF, $FB
    db $AE, $EA, $AF, $FA, $BF, $EB, $FF, $DB, $FF, $FD, $FF, $FF, $FF, $FF, $FB, $FD
    db $FF, $FF, $FF, $FF, $EF, $DD, $7F, $DD, $F7, $FC, $D7, $FD, $D7, $BF, $9F, $ED
    db $AB, $BA, $AE, $FE, $BF, $BD, $FF, $FF, $EF, $FB, $FF, $FF, $FF, $FF, $FF, $FF
    db $FE, $FF, $FF, $FE, $FF, $FD, $F7, $DD, $D5, $FD, $FD, $F5, $FD, $FF, $AE, $A2
    db $BB, $AA, $AE, $EA, $A2, $AE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F9, $FF, $FC
    db $FF, $FE, $FF, $FF, $FF, $FB, $7D, $DF, $5D, $F7, $FF, $77, $FD, $7F, $8E, $BB
    db $AE, $FB, $BB, $AE, $EA, $FA, $DD, $FF, $FF, $FF, $FB, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FF, $FE, $FB, $BF, $77, $D5, $D7, $77, $D7, $5F, $55, $FD, $FE, $AA
    db $AA, $BB, $BA, $AC, $AF, $EE, $F7, $FF, $FF, $FF, $BF, $DF, $FF, $FF, $FF, $FF
    db $FD, $BF, $FF, $FF, $FF, $BF, $7C, $5F, $71, $75, $7F, $D9, $FF, $7D, $BE, $EE
    db $EB, $AA, $AF, $EA, $AA, $AA, $DF, $FB, $F7, $FE, $FF, $FF, $FF, $FF, $B3, $BF
    db $FF, $FE, $FF, $FF, $FF, $FF, $F5, $D5, $F7, $C7, $57, $7F, $75, $5F, $AE, $CA
    db $A7, $A7, $FA, $6B, $EF, $CA, $FF, $FF, $EF, $FB, $FF, $FF, $FF, $FF, $FF, $FF
    db $7B, $FF, $7F, $7D, $BF, $BE, $D7, $DD, $7D, $EF, $FF, $77, $71, $5F, $AB, $BA
    db $BB, $EB, $BA, $9B, $FA, $BB, $FF, $FF, $FF, $7F, $DF, $FF, $FF, $FF, $FF, $BF
    db $FF, $FF, $FF, $FF, $FF, $FF, $1F, $31, $5D, $D5, $FD, $DF, $FF, $75, $BA, $EB
    db $2B, $FA, $AA, $BE, $BA, $AB, $FF, $FE, $FF, $FB, $DF, $FF, $FF, $B3, $FF, $FF
    db $FF, $FF, $BF, $FF, $BF, $FF, $DF, $55, $77, $7D, $5D, $D5, $D7, $FF, $FE, $EB
    db $EA, $9B, $BB, $8A, $2E, $AB, $1F, $FF, $7F, $FF, $FF, $DF, $FF, $BF, $F7, $FF
    db $FF, $FF, $EA, $EF, $FF, $BF, $FD, $55, $DF, $7F, $5D, $5F, $FF, $FF, $EA, $BA
    db $BE, $EF, $FB, $FB, $AB, $E9, $FB, $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FB, $EF, $FF, $FF, $7F, $D5, $FD, $7D, $5D, $57, $74, $FD, $88, $88
    db $88, $88, $02, $08, $20, $A2, $00, $00, $00, $00, $40, $48, $20, $08, $15, $86
    db $E8, $09, $05, $43, $A0, $00, $00, $00, $00, $00, $00, $10, $40, $50, $28, $88
    db $82, $00, $00, $02, $00, $00, $20, $00, $20, $85, $08, $2A, $00, $A0, $40, $07
    db $58, $02, $49, $04, $92, $60, $10, $00, $04, $11, $40, $00, $10, $00, $AA, $08
    db $00, $08, $02, $00, $00, $20, $00, $0C, $21, $E1, $98, $44, $28, $18, $80, $06
    db $81, $00, $31, $38, $02, $20, $00, $10, $00, $10, $41, $40, $00, $10, $88, $00
    db $00, $8A, $20, $02, $08, $00, $04, $44, $92, $04, $15, $1A, $4E, $15, $A0, $00
    db $0A, $02, $00, $01, $00, $03, $14, $10, $04, $04, $11, $00, $00, $15, $AA, $22
    db $88, $00, $80, $00, $08, $80, $00, $48, $04, $00, $00, $24, $20, $50, $10, $08
    db $76, $06, $62, $84, $4A, $22, $00, $00, $01, $00, $00, $00, $00, $00, $22, $80
    db $82, $00, $00, $20, $00, $08, $00, $29, $C4, $80, $60, $04, $00, $22, $11, $02
    db $18, $04, $20, $28, $00, $04, $00, $00, $10, $10, $14, $04, $14, $01, $8A, $A8
    db $08, $20, $08, $22, $02, $20, $1A, $10, $00, $44, $00, $51, $44, $2C, $60, $03
    db $01, $08, $0A, $42, $80, $01, $04, $10, $01, $04, $11, $40, $10, $00, $8A, $00
    db $82, $00, $00, $20, $00, $00, $18, $04, $41, $80, $02, $28, $12, $03, $00, $0C
    db $00, $00, $10, $22, $01, $00, $00, $44, $10, $04, $00, $40, $50, $44, $80, $00
    db $AA, $0A, $00, $2A, $02, $08, $00, $81, $01, $08, $00, $00, $40, $41, $BC, $CB
    db $1A, $01, $B0, $03, $10, $98, $00, $10, $44, $00, $00, $50, $00, $00, $00, $80
    db $28, $02, $00, $00, $20, $20, $00, $61, $A0, $00, $68, $10, $40, $D0, $07, $41
    db $21, $11, $10, $00, $80, $22, $00, $11, $10, $00, $00, $10, $05, $40, $02, $A0
    db $80, $08, $28, $00, $A0, $00, $01, $24, $02, $09, $8C, $90, $10, $00, $10, $00
    db $94, $0A, $A0, $46, $80, $00, $00, $10, $14, $00, $10, $00, $00, $44, $48, $8A
    db $00, $08, $00, $00, $02, $00, $24, $00, $4B, $00, $16, $80, $E9, $40, $80, $51
    db $04, $08, $00, $80, $01, $80, $40, $00, $10, $44, $00, $10, $01, $01, $04, $00
    db $00, $00, $08, $A0, $00, $20, $00, $54, $00, $0A, $00, $02, $08, $8C, $98, $18
    db $7E, $45, $E1, $40, $B2, $94, $00, $04, $00, $00, $00, $01, $40, $00, $2A, $00
    db $02, $08, $02, $00, $22, $08, $00, $10, $24, $C2, $02, $24, $80, $90, $08, $00
    db $C2, $08, $50, $09, $0C, $10, $40, $00, $40, $14, $00, $05, $05, $44, $8A, $00
    db $80, $02, $20, $02, $88, $0A, $40, $12, $30, $10, $0C, $40, $50, $03, $66, $20
    db $00, $00, $05, $88, $01, $D1, $40, $20, $00, $01, $01, $10, $00, $05, $02, $00
    db $00, $00, $00, $00, $00, $00, $04, $C8, $04, $A1, $3D, $F2, $18, $14, $BD, $24
    db $08, $84, $02, $02, $00, $00, $00, $55, $41, $00, $05, $10, $00, $00, $08, $00
    db $08, $22, $00, $00, $00, $00, $00, $00, $0C, $00, $00, $C8, $20, $10, $21, $A0
    db $01, $12, $00, $B2, $01, $91, $04, $00, $00, $40, $00, $00, $10, $40, $A0, $8A
    db $08, $00, $08, $00, $00, $00, $00, $80, $81, $01, $02, $02, $19, $20, $05, $0A
    db $06, $F0, $30, $08, $12, $00, $00, $00, $11, $00, $00, $05, $14, $10, $2A, $20
    db $00, $00, $80, $A0, $80, $30, $20, $00, $00, $00, $60, $00, $00, $C0, $51, $11
    db $43, $56, $41, $95, $42, $82, $00, $01, $44, $40, $00, $10, $00, $11, $88, $08
    db $82, $00, $00, $A0, $00, $80, $80, $00, $32, $88, $8A, $08, $A0, $00, $21, $00
    db $02, $08, $00, $00, $20, $02, $40, $44, $00, $00, $14, $00, $01, $00, $0E, $02
    db $80, $2A, $A0, $08, $00, $20, $04, $38, $81, $50, $00, $20, $23, $09, $84, $20
    db $8C, $50, $00, $B1, $20, $60, $10, $41, $40, $14, $00, $00, $00, $00, $0A, $02
    db $A0, $00, $00, $20, $00, $22, $00, $82, $90, $01, $07, $88, $F4, $12, $19, $20
    db $10, $84, $20, $08, $00, $01, $04, $50, $01, $50, $04, $00, $00, $10, $08, $00
    db $00, $08, $8A, $20, $88, $02, $00, $32, $00, $21, $01, $08, $08, $17, $91, $1A
    db $12, $B8, $41, $A0, $B0, $04, $00, $00, $11, $00, $00, $00, $00, $00, $00, $80
    db $20, $02, $80, $08, $00, $02, $84, $04, $28, $04, $84, $29, $88, $82, $04, $02
    db $40, $00, $05, $30, $00, $04, $40, $00, $00, $01, $15, $05, $04, $40, $28, $08
    db $08, $08, $20, $00, $88, $00, $00, $06, $82, $03, $08, $04, $28, $81, $68, $04
    db $10, $22, $F1, $A9, $60, $1D, $00, $04, $00, $00, $00, $00, $00, $04, $22, $20
    db $02, $00, $00, $00, $08, $80, $28, $11, $C1, $02, $13, $04, $D4, $30, $01, $30
    db $40, $00, $08, $59, $E8, $92, $00, $40, $04, $04, $40, $01, $40, $00, $02, $88
    db $20, $80, $20, $20, $A8, $00, $80, $13, $00, $01, $09, $52, $24, $00, $2A, $08
    db $00, $44, $02, $21, $30, $46, $00, $04, $50, $14, $10, $01, $00, $10, $00, $00
    db $00, $80, $00, $80, $80, $00, $20, $D3, $82, $12, $14, $10, $23, $C0, $12, $40
    db $22, $84, $00, $04, $40, $00, $11, $11, $41, $04, $05, $40, $00, $41, $2A, $A0
    db $88, $00, $82, $20, $80, $A0, $88, $10, $00, $00, $80, $00, $10, $24, $8C, $B4
    db $04, $03, $8A, $5B, $90, $65, $00, $00, $01, $00, $00, $14, $00, $00, $08, $00
    db $00, $08, $00, $20, $00, $02, $00, $31, $33, $A8, $84, $1A, $98, $45, $00, $01
    db $04, $40, $10, $05, $20, $51, $40, $00, $10, $00, $01, $00, $01, $50, $20, $20
    db $80, $08, $08, $80, $22, $20, $00, $88, $00, $E1, $08, $09, $20, $85, $83, $52
    db $00, $85, $24, $22, $40, $00, $14, $10, $10, $00, $00, $10, $00, $00, $00, $00
    db $80, $00, $00, $00, $00, $00, $08, $00, $00, $10, $80, $08, $20, $0A, $00, $40
    db $40, $00, $01, $04, $00, $02, $00, $00, $01, $10, $04, $50, $00, $00, $80, $08
    db $88, $80, $20, $AA, $00, $20, $80, $20, $00, $08, $22, $C0, $80, $10, $10, $13
    db $04, $48, $0A, $04, $20, $30, $00, $00, $01, $00, $00, $04, $10, $44, $A2, $00
    db $00, $00, $08, $22, $00, $02, $00, $4A, $00, $00, $04, $42, $12, $1B, $41, $00
    db $00, $E0, $14, $14, $4A, $40, $40, $41, $00, $00, $10, $10, $04, $04, $00, $08
    db $00, $00, $0A, $02, $00, $08, $94, $02, $41, $03, $40, $61, $40, $44, $91, $00
    db $E0, $50, $80, $00, $28, $C8, $10, $00, $45, $04, $05, $40, $04, $10, $08, $08
    db $28, $00, $00, $00, $00, $00, $22, $90, $4B, $22, $84, $05, $44, $02, $08, $02
    db $60, $19, $40, $00, $10, $04, $00, $00, $00, $14, $00, $00, $00, $01, $00, $20
    db $00, $20, $22, $00, $00, $28, $08, $00, $12, $20, $01, $08, $06, $01, $80, $20
    db $AA, $01, $98, $02, $C9, $84, $01, $44, $01, $01, $00, $01, $40, $41, $10, $00
    db $00, $80, $00, $00, $02, $A0, $13, $80, $00, $22, $00, $08, $90, $70, $40, $29
    db $44, $00, $0B, $76, $24, $12, $00, $00, $04, $00, $04, $50, $00, $05, $82, $8A
    db $2A, $8A, $88, $00, $20, $08, $00, $98, $60, $11, $A0, $80, $80, $68, $08, $03
    db $24, $08, $87, $80, $A4, $00, $04, $01, $10, $40, $00, $00, $14, $00, $28, $20
    db $00, $20, $00, $00, $22, $88, $C0, $00, $00, $00, $08, $88, $40, $00, $10, $01
    db $56, $00, $48, $0C, $24, $01, $00, $10, $45, $40, $00, $00, $01, $00, $A2, $02
    db $08, $00, $28, $80, $02, $20, $20, $00, $00, $20, $20, $00, $00, $24, $89, $42
    db $4C, $81, $A2, $09, $55, $02, $40, $00, $01, $00, $04, $00, $00, $40, $A8, $80
    db $02, $00, $28, $00, $0A, $02, $9C, $40, $8C, $03, $42, $40, $00, $03, $00, $00
    db $A0, $CB, $00, $00, $20, $81, $50, $04, $10, $15, $00, $10, $01, $41, $80, $28
    db $08, $08, $08, $00, $02, $00, $84, $80, $80, $01, $80, $01, $60, $06, $41, $4C
    db $04, $00, $38, $20, $08, $65, $40, $01, $01, $00, $04, $00, $00, $04, $00, $82
    db $00, $00, $82, $00, $28, $00, $80, $A0, $88, $10, $48, $8E, $ED, $08, $00, $69
    db $38, $30, $02, $64, $00, $20, $10, $00, $10, $40, $00, $84, $50, $45, $20, $A2
    db $08, $80, $00, $00, $02, $82, $04, $02, $20, $10, $C8, $40, $00, $22, $41, $D8
    db $20, $64, $14, $52, $38, $A9, $00, $00, $00, $11, $01, $00, $00, $40, $20, $00
    db $00, $20, $08, $00, $00, $08, $22, $19, $04, $05, $08, $00, $48, $20, $48, $A0
    db $87, $01, $08, $81, $00, $18, $01, $41, $51, $01, $14, $00, $04, $00, $00, $00
    db $20, $02, $02, $02, $02, $28, $88, $45, $00, $A0, $20, $C1, $00, $22, $16, $20
    db $0E, $C8, $00, $20, $08, $30, $01, $01, $40, $44, $04, $10, $10, $04, $00, $02
    db $00, $00, $00, $02, $80, $00, $02, $04, $06, $0C, $06, $40, $18, $68, $05, $00
    db $20, $00, $00, $00, $20, $40, $40, $01, $14, $00, $04, $04, $00, $11, $00, $00
    db $00, $02, $00, $00, $08, $A0, $04, $00, $84, $40, $02, $1C, $00, $24, $82, $00
    db $82, $00, $49, $00, $50, $04, $00, $00, $00, $50, $44, $00, $01, $00, $80, $08
    db $08, $20, $82, $02, $88, $00, $01, $00, $29, $24, $CA, $50, $CB, $1A, $45, $19
    db $58, $20, $07, $93, $00, $44, $00, $44, $40, $10, $10, $00, $10, $40, $20, $00
    db $82, $88, $20, $80, $00, $02, $A3, $24, $C0, $01, $04, $A0, $40, $6A, $2D, $14
    db $52, $06, $0B, $14, $00, $00, $50, $10, $00, $04, $00, $00, $00, $44, $80, $00
    db $20, $00, $20, $00, $00, $80, $84, $20, $30, $08, $10, $30, $C0, $06, $34, $83
    db $40, $00, $04, $40, $00, $80, $00, $00, $00, $00, $00, $10, $40, $11, $00, $20
    db $08, $00, $00, $82, $08, $A2, $10, $2A, $C2, $10, $A0, $20, $22, $12, $20, $17
    db $24, $30, $92, $89, $00, $88, $00, $00, $40, $00, $00, $00, $40, $10, $00, $80
    db $00, $00, $00, $22, $20, $20, $40, $24, $40, $16, $00, $22, $48, $25, $00, $17
    db $0A, $40, $00, $00, $C8, $01, $00, $10, $14, $00, $04, $04, $00, $10, $0A, $88
    db $88, $20, $80, $02, $00, $20, $20, $25, $9D, $30, $81, $C0, $84, $22, $40, $88
    db $14, $47, $10, $27, $04, $72, $08, $00, $04, $00, $01, $00, $00, $49, $82, $02
    db $00, $00, $20, $00, $08, $00, $04, $C8, $0C, $80, $00, $81, $18, $34, $20, $84
    db $00, $88, $08, $00, $20, $24, $05, $40, $10, $44, $01, $44, $00, $10, $08, $80
    db $A0, $28, $22, $28, $0A, $20, $00, $04, $04, $00, $00, $8C, $55, $00, $42, $00
    db $05, $52, $88, $03, $10, $12, $00, $00, $00, $00, $41, $40, $00, $41, $08, $20
    db $00, $00, $00, $00, $08, $02, $21, $20, $10, $00, $42, $A8, $A0, $48, $01, $16
    db $24, $08, $00, $08, $30, $42, $40, $10, $00, $11, $00, $40, $51, $11, $00, $02
    db $00, $00, $00, $00, $0A, $00, $29, $00, $44, $02, $38, $80, $50, $21, $25, $00
    db $00, $A0, $9A, $08, $08, $00, $01, $50, $00, $44, $00, $00, $01, $00, $20, $00
    db $20, $00, $20, $00, $0A, $00, $0A, $84, $18, $D0, $CB, $00, $04, $14, $40, $08
    db $82, $40, $08, $16, $04, $90, $05, $24, $40, $01, $00, $40, $04, $44, $00, $20
    db $20, $80, $00, $82, $00, $88, $02, $00, $C0, $10, $00, $80, $82, $20, $10, $2A
    db $05, $80, $00, $34, $28, $38, $00, $00, $00, $00, $00, $10, $00, $04, $00, $A2
    db $20, $00, $00, $08, $08, $82, $8C, $24, $85, $14, $42, $40, $41, $00, $02, $A8
    db $40, $01, $8E, $00, $00, $08, $00, $00, $50, $20, $01, $10, $01, $10, $80, $00
    db $02, $00, $88, $80, $08, $80, $0C, $44, $40, $00, $00, $84, $08, $50, $04, $E2
    db $0A, $07, $40, $50, $C8, $CB, $01, $00, $10, $00, $00, $43, $01, $04, $00, $00
    db $02, $00, $00, $00, $20, $00, $04, $00, $60, $00, $00, $20, $00, $CA, $04, $00
    db $08, $00, $10, $01, $00, $5F, $00, $10, $00, $00, $00, $00, $40, $00
}
