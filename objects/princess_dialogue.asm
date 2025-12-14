namespace princess_dialogue

{
create:
    lda #$0F : cop #$00

;----- 9C0D

    lda #$F1 : jsl _018049_8053
    lda #$14 : jsl _018049_8053
    lda $02D5 : and #$FB : sta $02D5
    !AX16
    lda.w stage : pha
    lda #$0011 : sta.w stage
    jsl _019136_9150
    !A16
    pla : sta.w stage
    !A8
    brk #$00

;----- 9C3B

    stz $032E
    stz $02F0
    !A16
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    stz $1889
    stz $188D
    !X16
if !version == 0
    lda #$21BF
elseif !version == 1 || !version == 2
    lda #$21C5
endif
    !AX8
    jsl _018061_8064
    inc $0323
    brk #$00

;----- 9C65

if !version == 0
    ldy #$27 : jsl _01A21D
    lda #$15 : sta $031E
elseif !version == 1 || !version == 2
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldy #$2C : jsl _01A21D
    lda #$1A : sta $031E
endif
    lda #$05 : sta $02E1
    lda $02D9 : ora #$08 : sta $02D9
    lda #$04 : cop #$00

;----- 9C81

    !AX16
    lda #$0007 : sta $31
.9C88:
    lda #$0060 : sta $0004
    ldx #$0000
.9C91:
    lda $7EF440,X : and #$001F           : jsr _9CF2                                   : sta $0000
    lda $7EF440,X : and #$03E0 : lsr #5  : jsr _9CF2 : asl #5                          : sta $0002
    lda $7EF440,X : and #$7C00 : lsr #10 : jsr _9CF2 : asl #10 : ora $0000 : ora $0002 : sta $7EF440,X
    inx #2
    dec $0004
    bne .9C91

    dec $31
    beq _9CF6

    !AX8
    lda #$0A : cop #$00

;----- 9CEE

    !AX16
    bra .9C88

;-----

_9CF2:
    beq .9CF5

    dec
.9CF5:
    rts

;-----

_9CF6:
    !AX8
    lda $02D5 : ora #$04 : sta $02D5
    ldx #$2A : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.9D0A:
    brk #$00

;----- 9D0C

    lda $00DE
    bne .9D0A

    !X8
    !A16
    lda #$04B8 : sta.b obj.pos_x+1
    lda #$0148 : sta.b obj.pos_y+1
    !A8
    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    !A16
    lda #$0100 : sta $29
    lda.w _00ED00+$5E : sta $27
    !A8
    lda #$1D : sta $31
.9D3F:
    lda #$00 : sta $02EB
    lda #$90 : sta $02EC
    lda $31 : ora #$E0 : sta $02EE
    dec $31
    beq .9D62

    lda #$07 : cop #$00

;----- 9D58

    jsl update_animation_normal
    jsl _018E32_8E73
    bra .9D3F

.9D62:
    lda $02D7 : ora #$04 : sta $02D7
    lda #$0F : cop #$00

;----- 9D6E

    ldx #$00
    lda.w loop
    beq .9D77

    ldx #$01
.9D77:
    ldy #$90
    lda.b #_01FF00_18
    jsl _01A6FE
.9D7F:
    brk #$00

;----- 9D81

    lda $00DE
    bne .9D7F

    lda #$F6 : jsl _018049_8053
    lda #$A0 : jsl _018049_8053
    lda #$FF : cop #$00

;----- 9D96

    ldx #$04 : ldy #$78 : lda.b #_01FF00_0C : jsl _01A6FE
.9DA0:
    brk #$00

;----- 9DA2

    lda $00C6
    bne .9DA0

    bra .9DB3

;-----

    ;unused, probably supposed to open the gate
    lda #!id_gate2 : jsl prepare_object
    jml _0281A8_81B5

;-----

.9DB3:
    ldx #$00
    lda.w loop
    beq .9DBC

    ldx #$07
.9DBC:
    lda #$07 : sta $0278
    stx $1F9D
    stz.w checkpoint
    inc.w loop
    lda.w armor_state
    bne .9DD2

    inc.w armor_state
.9DD2:
    jsl _01DCCF
    jml _0281A8_81B5
}

namespace off
