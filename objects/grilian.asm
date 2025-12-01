namespace grilian

{
create:
    ldx.w stage
    lda.w grilian_data_D5C7-2,X : sta $3B
    lda $07
    beq .DD5A

    brk #$00

;----- DD4A

    jsl _028053
    bcs create

    ldx #$01 : jsl _018D5B
    !A16
    bra .DD61

.DD5A:
    !A16
    lda #$01C0 : sta $29
.DD61:
    lda.w _00ED00+$10 : sta $27
    !A8
    jsl set_hp
    lda #$01 : sta $08
    lda #$2E : sta $1D
    stz $2D
    stz $2E
    lda #$FF : sta $26
    lda #$10 : sta $09
    ldy #$B6 : ldx #$21 : jsl set_sprite
    !A16
    lda.w #grilian_data_D5CD : sta $13
    !A8
    stz $15
    jsl _02F9DA_F9E0
    jsl get_rng_bool : sta.b obj.direction
.DD9D:
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DDA5:
    brk #$00

;----- DDA7

    ldy #$20 : jsl _0192AD
    bcs .DDA5

    jsl get_rng_bool : sta.b obj.direction
    jsl get_rng_16
    lda.w grilian_data_D5D9,X : sta $37
    ldy #$3F : jsl set_speed_x
.DDC4:
    lda #$02 : sta $2D
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DDD0:
    brk #$00

;----- DDD2

    jsl update_pos_x
    lda $07
    beq .DDEC

    ldy #$08 : jsl _01A4E2_A4E8
    bcs .DDF2

    ldy #$04 : jsl _01A4E2_A4E8
    bcs .DDFA

    bra .DDF2

.DDEC:
    jsl _01A593
    bne .DDFA

.DDF2:
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    bra .DDFE

.DDFA:
    dec $37
    bne .DDD0

.DDFE:
    lda #$04 : sta $2D
    ldy #$C4 : ldx #$21 : jsl set_sprite
.DE0A:
    brk #$00

;----- DE0C

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .DE0A

    sta $2E
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta $30
    lda #$06 : sta $2D
    lda #$0A : sta $2F
    lda #!id_grilian_projectile : ldx $30 : ldy #$00 : jsl _018C55
    lda #$18 : cop #$00

;----- DE38

.DE38:
    lda #!id_grilian_projectile : ldx $30 : ldy #$02 : jsl _018C55
    lda #$0A : cop #$00

;----- DE46

    dec $2F
    bne .DE38

    stz $2E
    lda #$08 : sta $2D
    jsl get_rng_16
    lda.w grilian_data_D5E9,X
    ldx.w difficulty
    clc
    adc.w grilian_data_D5F8,X
    sta $37
.DE60:
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DE68:
    brk #$00

;----- DE6A

    dec $37
    bne .DE68

    jmp .DDC4

;-----

.DE71:
    ldy #$C4 : ldx #$21 : jsl set_sprite
    lda #$01 : sta $24
    jsl update_animation_normal
    bra .DE38

destroy:
    ldy #$AE : ldx #$21 : jsl set_sprite
    ldx $3B : jsl _018E32
    lda $0E
    beq .DEAF

.DE95:
    brk #$00

;----- DE97

    jsl update_animation_normal
    ldx $3B : jsl _018E32
    lda $24
    dec
    bne .DE95

    jsl _02F9DA_F9E0
    ldx $2D
    jmp (.DED3,X)

.DEAF:
    ldy #$1F : jsl update_score
    lda #$04 : sta $1D
    stz $07
    lda #!id_explosion_spawner : jsl prepare_object
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$20 : cop #$00

;----- DECF

    jml _0281A8_81B5

;-----

.DED3: dw create_DD9D, create_DDC4, create_DDFE, create_DE71, create_DE60

;-----

thing:
    lda $2E
    bne .DEEB

    jsl get_arthur_relative_side : sta.b obj.facing
    jsl update_animation_normal
.DEEB:
    ldx $3B : jsl _018E32
    jsl _02F9B6
    jsl _02F9BA
    jsl _02F9B2
    lda $07
    !A16
    beq .DF0E

    lda.b obj.pos_y+1
    clc
    adc #$0020
    cmp.w camera_y+1
    bra .DF16

.DF0E:
    lda.w camera_y+1
    adc #$0100
    cmp.b obj.pos_y+1
.DF16:
    !A8
    bcc .DF1B

    rtl

.DF1B:
    jml _0281DD
}

namespace off
