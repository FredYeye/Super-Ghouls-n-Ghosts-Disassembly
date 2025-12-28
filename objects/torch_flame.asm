namespace torch_flame

{
create:
    stz $3C
    !A16
    lda.w #coord_offsets_torch : sta $13
    !A8
    lda $08 : and #$DF : ora #$80 : sta $08
    jsl _01A593
    jsl _01A4E2_A52B
    bcs .E7A3 ;branch if encountering a non-solid tile

    brk #$00

;----- E77D

    lda $07
    beq .E7AD

    !A16
    lda #$0008 : sta $2D
    clc
    lda.w camera_y+1
    adc #$0100
    sec
    sbc.b obj.pos_y+1
    lsr #3
    !A8
    inc
    sta $2F
    lda #$01 : sta $1F32
.E79F:
    dec $2F
    bne .E7A7

.E7A3:
    jml _0280CB_remove_weapon

.E7A7:
    jsl _01939D
    beq .E79F

.E7AD:
    lda #$52 : sta $1D
    lda #$03 : sta.b obj.hp
    lda $07
    beq .E7C3

    lda #$08 : cop #$00

;----- E7BD

    lda $07
    cmp #$03
    beq .E7D3

.E7C3:
    lda #!id_torch_flame
    ldy $07
    iny
    jsr _01D371_D4D8
    bmi .E7D3

    jsl set_spawn_offset
    !X8
.E7D3:
    lda #$24 : jsl _018049_8053 ;torch sfx
    lda $08 : and #$7F : sta $08
    lda #$82 : ora $09 : sta $09
    stz $40
    ldy #$6C : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E7F3

    ldy #$48 : jsl set_speed_y
    lda #$08 : sta $2F
    ldy #$A0 : ldx #$20 : jsl set_sprite
    inc $3C
.E807:
    brk #$00

;----- E809

    jsl update_pos_y
    dec $2F
    bne .E807

    ldy #$B6 : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E81D

    jml _0280CB_remove_weapon

;-----

thing:
    lda $C3
    and #$03
    bne .E829

    inc $40
.E829:
    jsl update_animation_normal
    lda $3C
    bne .E835

    jsl _01A593
.E835:
    rtl
}

{
upgraded_create:
    stz $3C
    !A16
    lda.w #coord_offsets_torch : sta $13
    !A8
    lda $08 : and #$DF : ora #$80 : sta $08
    jsl _01A593
    jsl _01A4E2_A52B
    bcs .E87B

    brk #$00

;----- E855

    lda $07
    beq .E885

    !A16
    lda #$0008 : sta $2D
    clc
    lda.w camera_y+1
    adc #$0100
    sec
    sbc.b obj.pos_y+1
    lsr #3
    !A8
    inc
    sta $2F
    lda #$01 : sta $1F32
.E877:
    dec $2F
    bne .E87F

.E87B:
    jml _0280CB_remove_weapon

.E87F:
    jsl _01939D
    beq .E877

.E885:
    lda #$52 : sta $1D
    lda #$03 : sta.b obj.hp
    lda $07
    beq .E89B

    lda #$08 : cop #$00

;----- E895

    lda $07
    cmp #$03
    beq .E8AB

.E89B:
    lda #$2B
    ldy $07
    iny
    jsr _01D371_D4D8
    bmi .E8AB

    jsl set_spawn_offset
    !X8
.E8AB:
    lda #$24 : jsl _018049_8053
    lda $08 : and #$7F : sta $08
    lda #$82 : ora $09 : sta $09
    stz $40
    ldy #$6E : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E8CB

    ldy #$48 : jsl set_speed_y
    lda #$14 : sta $2F
    ldy #$70 : ldx #$20 : jsl set_sprite
    inc $3C
.E8DF:
    brk #$00

;----- E8E1

    jsl update_pos_y
    dec $2F
    bne .E8DF

    ldy #$E0 : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E8F5

    jml _0280CB_remove_weapon
}

namespace off
