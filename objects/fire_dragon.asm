namespace fire_dragon

{
create:
    lda $07
    beq .F00C

    sta $2F
    asl
    clc
    adc $2F
    cop #$00

;----- EFE4

    lda $07 : dec : asl : tax
    jmp (+,X) : +: dw .EFFA, .EFFA, .EFFA, .F000, .F000, .F006, .F006

;-----

.EFFA:
    ldy #$BA : ldx #$20
    bra .F010

.F000:
    ldy #$BC : ldx #$20
    bra .F010

.F006:
    ldy #$BE : ldx #$20
    bra .F010

.F00C:
    ldy #$B8 : ldx #$20
.F010:
    jsl set_sprite
    lda #$02 : sta.b obj.hp
    lda $09 : ora #$88 : sta $09
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    !A16
    lda #$0008 : sta.b obj.speed_x+1 : sta.b obj.speed_y+1
    lda #$0050 : sta $29
    !A8
    stz $0F
    lda #$09 : sta $2D
.F038:
    brk #$00

;----- F03A

    lda $0F : asl : tax
    jmp (.F041,X)

.F041:
    dw .F063, .F07D, .F09D, .F0B2, .F0D5, .F0FD, .F119, .F135
    dw .F151, .F16F, .F18E, .F1AA, .F1C6, .F1E8, .F204, .F223
    dw .F23B

;-----


.F063:
    !A16
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
    !A8
    dec $2D
    bne .F038

    inc $0F
    lda #$03 : sta $2D
    bra .F038

;-----

.F07D:
    jsr .F24A
    jsr .F24A
    !A16
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
    !A8
    dec $2D
    bne .F038

    inc $0F
    lda #$02 : sta $2D
    bra .F038

;-----

.F09D:
    jsr .F24A
    jsr .F24A
    jsr .F24A
    dec $2D
    bne .F038

    inc $0F
    lda #$03 : sta $2D
    bra .F038

;-----

.F0B2:
    jsr .F24A
    jsr .F24A
    !A16
    inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1
    !A8
    dec $2D
    bne .F0D2

    inc $0F
    lda #$09 : sta $2D
    bra .F0D2

.F0D2:
    jmp .F038

;-----

.F0D5:
    !A16
    inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1
    !A8
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F0F7

    lda #$05 : sta.b obj.direction
    bra .F0D2

.F0F7:
    lda #$03 : sta.b obj.direction
    bra .F0D2

;-----

.F0FD:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F115

    inc.b obj.direction
    bra .F0D2
.F115:

    dec.b obj.direction
    bra .F0D2

;-----

.F119:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F131

    inc.b obj.direction
    bra .F0D2

.F131:
    dec.b obj.direction
    bra .F0D2


;-----

.F135:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$09 : sta $2D
    lda.b obj.facing
    beq .F14D

    inc.b obj.direction
    bra .F18B

.F14D:
    dec.b obj.direction
    bra .F18B

;-----

.F151:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F169

    inc.b obj.direction
    bra .F18B

.F169:
    lda #$0F : sta.b obj.direction
    bra .F18B

;-----

.F16F:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F187

    inc.b obj.direction
    bra .F18B

.F187:
    dec.b obj.direction
    bra .F18B

.F18B:
    jmp .F038

;-----

.F18E:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F1A6

    inc.b obj.direction
    bra .F18B

.F1A6:
    dec.b obj.direction
    bra .F18B

;-----

.F1AA:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$0D : sta $2D
    lda.b obj.facing
    beq .F1C2

    inc.b obj.direction
    bra .F18B

.F1C2:
    dec.b obj.direction
    bra .F18B

;-----

.F1C6:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F1E4

    dec.b obj.direction
    bra .F220

.F1E4:
    inc.b obj.direction
    bra .F220

;-----

.F1E8:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F200

    dec.b obj.direction
    bra .F220

.F200:
    inc.b obj.direction
    bra .F220

;-----

.F204:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F21C

    dec.b obj.direction
    bra .F220

.F21C:
    inc.b obj.direction
    bra .F220

.F220:
    jmp .F038

;-----

.F223:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda.b obj.facing
    beq .F237

    dec.b obj.direction
    bra .F220

.F237:
    stz.b obj.direction
    bra .F220

;-----

.F23B:
    ldx #$48 : jsl update_pos_xy_2
    lda $09
    and #$40
    beq _F260

    jmp .F038

;-----

.F24A:
    lda.b obj.facing
    bne .F254

    !A16
    inc.b obj.pos_x+1
    bra .F258

.F254:
    !A16
    dec.b obj.pos_x+1
.F258:
    !A8
    rts

;-----

thing:
    jsl update_animation_normal
    rtl

;-----

_F260:
    jml _028B0E
}

namespace off
