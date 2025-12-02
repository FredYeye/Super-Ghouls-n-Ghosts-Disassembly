namespace death_crawler_projectile

{
create:
    lda #$C0 : sta $09
    ldy #$C8 : ldx #$21 : jsl set_sprite
    stz $3B
    ldx $07
    txa
    lsr #3
    and #$03
    sta $3C
    lda.w death_crawler_projectile_data_D14F,X : sta.b obj.facing : sta.b obj.direction
    ldy.w death_crawler_projectile_data_D137,X : jsl set_speed_xyg
    lda #$35 : jsl _018049_8053
.B668:
    brk #$00

;----- B66A

    lda $3C : asl : tax
    jsr (.B673,X)
    bra .B668

.B673: dw .B679, .B693, .B6B0

;-----

.B679:
    jsl update_pos_xyg_add
    !A16
    clc
    lda.w camera_y+1
    adc #$0100
    cmp.b obj.pos_y+1
    !A8
    bcs .B692

    pla
    pla
    jml _0281A8_81B5
.B692:
    rts

;-----

.B693:
    jsl _01884B_8860
    jsr .B6C9
    !A16
    clc
    lda.w camera_x+1
    adc #$0100
    cmp.b obj.pos_x+1
    !A8
    bcs .B6AF

    pla
    pla
    jml _0281A8_81B5
.B6AF:
    rts

;-----

.B6B0:
    jsl _01884B
    jsr .B6C9
    !A16
    lda.w camera_x+1
    cmp.b obj.pos_x+1
    !A8
    bcc .B6C8

    pla
    pla
    jml _0281A8_81B5
.B6C8:
    rts

;-----

.B6C9:
    lda $3B
    bne .B6FD

    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc.b obj.pos_x+1
    clc
    adc #$0090
    cmp #$0120
    !A8
    bcc .B6FD

    lda $07
    and #$07
    asl
    tax
    !A16
    clc : lda.w camera_y+1 : adc.w death_crawler_projectile_data_D12D,X : sta.b obj.pos_y+1
    stz.b obj.speed_y
    !A8
    stz.b obj.speed_y+2
    inc $3B
.B6FD:
    rts

;-----

thing:
    jsl update_animation_normal
    jsl _02F9BE
    jsl _02F9B2
    ldy #$1E : jsl _02F9CE
    rtl
}

namespace off
