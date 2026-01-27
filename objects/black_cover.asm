namespace black_cover

{
create:
    ldx #$00
    ldy #$01
    lda $07
    beq .C5B2

    ldx #$09
    iny
.C5B2:
    sty.b obj.direction
    !A16
    lda.w black_cover_data+0,X
    sta.b obj.speed_y+1
    sec
    sbc #$0004
    sta $2D
    lda.w black_cover_data+2,X
    sta.b obj.pos_y
    clc
    adc #$0008
    sta $2F
    ldy.w black_cover_data+4,X : sty $31
    lda.w black_cover_data+5,X : sta.b obj.speed_x
    lda.w black_cover_data+7,X : sta.b obj.pos_x+1
    phd
    pla
    clc
    adc #$0033
    sta.b obj.speed_x+2
    !A8
    stz $02E6
    lda #$02 : sta $02E7
    stz $02E8
    lda #$48 : sta $33
    stz $34
    stz $35
    lda #$01 : sta $39
    stz $3A
    stz $3B
    stz $3C
    stz.b obj.facing
.C604:
    brk #$00

;----- C606

    jsr .C69E
    !A16
    lda.b obj.pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs .C61E

    lda $07
    beq .C61B

    stz $02E7
.C61B:
    jmp _0281A8_81B5

.C61E:
    lda.w current_cage
    cmp.b obj.direction
    beq .C627

    bra .C604

.C627:
    !A16
    sec
    lda.b obj.speed_y+1
    sbc.w !obj_arthur.pos_x+1
    bcs .C635

    adc.b obj.pos_y
    bcs .C63C

.C635:
    clc
    adc.w !obj_arthur.pos_x+1
    sta.w !obj_arthur.pos_x+1
.C63C:
    !A8
    sec
    lda $31
    sbc.w !obj_arthur.pos_y+1
    bcc .C656

    clc
    adc.w !obj_arthur.pos_y+1
    sta.w !obj_arthur.pos_y+1
    stz.w !obj_arthur.speed_y+0
    stz.w !obj_arthur.speed_y+1
    stz.w !obj_arthur.speed_y+2
.C656:
    !X16
    ldy.w #!obj_weapons.base
    lda #$0A
.C65D:
    pha
    lda.w obj.active,Y
    beq .C68B

    lda.w obj.type,Y
    !A16
    lda $2D
    sbc.w obj.pos_x+1,Y
    bcs .C673

    adc $2F
    bcs .C67C

.C673:
    !A8
    phy
    jsr _02810D_local
    ply
    bra .C68B

.C67C:
    !A8
    sec
    lda $31
    sbc.w obj.pos_y+1,Y
    bcc .C68B

    phy
    jsr _02810D_local
    ply
.C68B:
    !A16
    clc
    tya
    adc.w #obj.ext.len
    tay
    !A8
    pla
    dec
    bne .C65D

    !X8
    jmp .C604

;-----

.C69E:
    !A16
    sec
    lda.b obj.speed_x
    sbc.w camera_x+1
    cmp #$00FF
    bcc .C6B0

    bpl .C6EB

    lda #$0000
.C6B0:
    tax
    sec
    lda.b obj.pos_x+1
    sbc.w camera_x+1
    bcc .C6EB

    cmp #$00FF
    !A8
    bcc .C6C2

    lda #$FF
.C6C2:
    ldy #$50
    sty $36
    stx $37
    sta $38
    !X16
    ldx.b obj.speed_x+2 : stx !A1T2L
    !X8
    stz !A1B2
    lda #$01 : sta !DMAP2
    lda #$26 : sta !BBAD2
    lda $02F0 : ora #$04 : sta $02F0
    sta.b obj.facing
    rts

.C6EB:
    !A8
    lda.b obj.facing
    beq .C6FB

    lda $02F0 : and #$FB : sta $02F0
    stz.b obj.facing
.C6FB:
    rts
}

namespace off
