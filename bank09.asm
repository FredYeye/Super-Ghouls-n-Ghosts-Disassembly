org $098000 : bank09:

{
    incsrc "stage_layouts/meta_tiles.asm"      ;8000 - CEDF
    fillbyte $00 : fill 288                    ;CEE0 - CFFF
    gfx_unk36: incbin "graphics/unknown36.bin" ;D000 - E197 two tilemaps? second one being "the end"
    fillbyte $00 : fill 1640                   ;E198 - E7FF
    incsrc "various/palette_bg.asm"            ;E800 - FBFF
    fillbyte $00 : fill 256                    ;FC00 - FCFF
}

{ ;FD00 - FDFF
_09FD00:
    db $7F, $00,  $7E, $FB,  $7E, $F4,  $7D, $EE,  $7C, $E8,  $7B, $E2,  $79, $DC,  $77, $D6
    db $75, $D0,  $72, $CA,  $6F, $C5,  $6C, $C0,  $69, $BA,  $65, $B5,  $61, $B0,  $5D, $AC
    db $59, $A7,  $54, $A3,  $50, $9F,  $4B, $9B,  $46, $97,  $40, $94,  $3B, $91,  $36, $8E
    db $30, $8B,  $2A, $89,  $24, $87,  $1E, $85,  $18, $84,  $12, $83,  $0C, $82,  $05, $82
    db $00, $81,  $FC, $82,  $F5, $82,  $EF, $83,  $E9, $84,  $E3, $85,  $DD, $87,  $D7, $89
    db $D1, $8B,  $CB, $8E,  $C6, $91,  $C1, $94,  $BB, $97,  $B6, $9B,  $B1, $9F,  $AD, $A3
    db $A8, $A7,  $A4, $AC,  $A0, $B0,  $9C, $B5,  $98, $BA,  $95, $C0,  $92, $C5,  $8F, $CA
    db $8C, $D0,  $8A, $D6,  $88, $DC,  $86, $E2,  $85, $E8,  $84, $EE,  $83, $F4,  $83, $FB
    db $82, $00,  $83, $05,  $83, $0C,  $84, $12,  $85, $18,  $86, $1E,  $88, $24,  $8A, $2A
    db $8C, $30,  $8F, $36,  $92, $3B,  $95, $40,  $98, $46,  $9C, $4B,  $A0, $50,  $A4, $54
    db $A8, $59,  $AD, $5D,  $B1, $61,  $B6, $65,  $BB, $69,  $C1, $6C,  $C6, $6F,  $CB, $72
    db $D1, $75,  $D7, $77,  $DD, $79,  $E3, $7B,  $E9, $7C,  $EF, $7D,  $F5, $7E,  $FC, $7E
    db $00, $7F,  $05, $7E,  $0C, $7E,  $12, $7D,  $18, $7C,  $1E, $7B,  $24, $79,  $2A, $77
    db $30, $75,  $36, $72,  $3B, $6F,  $40, $6C,  $46, $69,  $4B, $65,  $50, $61,  $54, $5D
    db $59, $59,  $5D, $54,  $61, $50,  $65, $4B,  $69, $46,  $6C, $40,  $6F, $3B,  $72, $36
    db $75, $30,  $77, $2A,  $79, $24,  $7B, $1E,  $7C, $18,  $7D, $12,  $7E, $0C,  $7E, $05
}

{ ;FE00 - FFFF
_09FE00: ;stage 4 rotation related, pairs of values
    dw $0100, $0000, $00FF, $FFF4, $00FE, $FFE7, $00FD, $FFDB
    dw $00FB, $FFCF, $00F8, $FFC2, $00F4, $FFB6, $00F1, $FFAA
    dw $00EC, $FF9F, $00E7, $FF93, $00E1, $FF88, $00DB, $FF7D
    dw $00D4, $FF72, $00CD, $FF68, $00C5, $FF5E, $00BD, $FF55
    dw $00B5, $FF4B, $00AB, $FF43, $00A2, $FF3B, $0098, $FF33
    dw $008E, $FF2C, $0083, $FF25, $0078, $FF1F, $006D, $FF19
    dw $0061, $FF14, $0056, $FF0F, $004A, $FF0C, $003E, $FF08
    dw $0031, $FF05, $0025, $FF03, $0019, $FF02, $000C, $FF01
    dw $0000, $FF00, $FFF4, $FF01, $FFE7, $FF02, $FFDB, $FF03
    dw $FFCF, $FF05, $FFC2, $FF08, $FFB6, $FF0C, $FFAA, $FF0F
    dw $FF9F, $FF14, $FF93, $FF19, $FF88, $FF1F, $FF7D, $FF25
    dw $FF72, $FF2C, $FF68, $FF33, $FF5E, $FF3B, $FF55, $FF43
    dw $FF4B, $FF4B, $FF43, $FF55, $FF3B, $FF5E, $FF33, $FF68
    dw $FF2C, $FF72, $FF25, $FF7D, $FF1F, $FF88, $FF19, $FF93
    dw $FF14, $FF9F, $FF0F, $FFAA, $FF0C, $FFB6, $FF08, $FFC2
    dw $FF05, $FFCF, $FF03, $FFDB, $FF02, $FFE7, $FF01, $FFF4
    dw $FF00, $0000, $FF01, $000C, $FF02, $0019, $FF03, $0025
    dw $FF05, $0031, $FF08, $003E, $FF0C, $004A, $FF0F, $0056
    dw $FF14, $0061, $FF19, $006D, $FF1F, $0078, $FF25, $0083
    dw $FF2C, $008E, $FF33, $0098, $FF3B, $00A2, $FF43, $00AB
    dw $FF4B, $00B5, $FF55, $00BD, $FF5E, $00C5, $FF68, $00CD
    dw $FF72, $00D4, $FF7D, $00DB, $FF88, $00E1, $FF93, $00E7
    dw $FF9F, $00EC, $FFAA, $00F1, $FFB6, $00F4, $FFC2, $00F8
    dw $FFCF, $00FB, $FFDB, $00FD, $FFE7, $00FE, $FFF4, $00FF
    dw $0000, $0100, $000C, $00FF, $0019, $00FE, $0025, $00FD
    dw $0031, $00FB, $003E, $00F8, $004A, $00F4, $0056, $00F1
    dw $0061, $00EC, $006D, $00E7, $0078, $00E1, $0083, $00DB
    dw $008E, $00D4, $0098, $00CD, $00A2, $00C5, $00AB, $00BD
    dw $00B5, $00B5, $00BD, $00AB, $00C5, $00A2, $00CD, $0098
    dw $00D4, $008E, $00DB, $0083, $00E1, $0078, $00E7, $006D
    dw $00EC, $0061, $00F1, $0056, $00F4, $004A, $00F8, $003E
    dw $00FB, $0031, $00FD, $0025, $00FE, $0019, $00FF, $000C
}
