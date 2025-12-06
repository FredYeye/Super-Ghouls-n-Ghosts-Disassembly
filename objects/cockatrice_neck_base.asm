namespace cockatrice_neck_base

{
create:
    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $09 : ora #$40 : sta $09
    !A16
    lda.w _00ED00+$68 : sta $27
    lda #$010E : sta $29
    stz $31
    !A8
    lda #$FF : sta $26
    jsl update_animation_normal
    ldx #$26 : jsl _018E32
    stz $0F
.DBC4:
    jsr _02EBA8
    !A16
    lda.b obj.pos_x+1 ;do these three instructions even do anything?
    clc              ;
    adc #$0004       ;
    lda.w !obj_arthur.pos_x+1
    cmp #$1248
    bcs .DBDD

    lda #$1248 : sta.w !obj_arthur.pos_x+1
.DBDD:
    !A8
    brk #$00

;----- DBE1

    bra .DBC4

;-----

destroy:
    !X16
    ldx $2D
    lda #$8C : sta.w obj.active,X
    !X8
    lda $08 : ora #$10 : sta $08
    lda #$77 : cop #$00

;----- DBF8

    jmp _0281A8_81B5
}

namespace off
