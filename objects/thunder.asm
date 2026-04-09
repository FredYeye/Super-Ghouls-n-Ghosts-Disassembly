namespace thunder

{
create:
    lda $07
    and #$03
    asl #2
    inc
    cop #$00

;----- EE7C

    lda $07
    cmp #$0B
    bne .EE85

    stz $14E3
.EE85:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .EEA4, .EEA4, .EEA4, .EEA4, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA

;-----

.EEA4:
    ldy #$40 : ldx #$21
    bra .EEB0

.EEAA:
    ldy #$42 : ldx #$21
    bra .EEB0

.EEB0:
    jsl set_sprite
    lda #$02 : sta.b obj.hp
    lda $08 : ora #$10 : sta $08
    lda $09 : ora #$88 : sta $09
    !A16
    lda #$0008 : sta.b obj.speed_x+1 : sta.b obj.speed_y+1
    lda #$0050 : sta $29
    !A8
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    lda $07
    sec
    sbc #$08
    bcc .EEE3

    inc.b obj.direction
    inc.b obj.facing
.EEE3:
    brk #$00

;----- EEE5

    lda $07 : asl : tax
    jmp (+,X) : +: dw .EF04, .EF04, .EF04, .EF04, .EF23, .EF23, .EF23, .EF23, .EF2F, .EF2F, .EF2F, .EF2F

;-----

.EF04:
    jsl update_pos_y
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_y+1
    clc
    adc #$0020
    sec
    sbc.w !obj_arthur.pos_y+1
    bcc .EF1F

    !A8
    bra _EF40

.EF1F:
    !A8
    bra .EEE3

;-----

.EF23:
    jsl update_pos_x
    lda $09
    and #$40
    bne .EEE3

    bra _EF40

;-----

.EF2F:
    jsl update_pos_x
    lda $09
    and #$40
    bne .EEE3

    bra _EF40

;-----

thing:
    jsl update_animation_normal
    rtl

;-----

_EF40:
    jml _028B0E
}

namespace off
