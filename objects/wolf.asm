{
struct wolf extends obj
    ._2D:        skip 2 ;2D
    .on_ground:  skip 1 ;2F
    .is_jumping: skip 1 ;30
endstruct
}

namespace wolf

{
create:
    ldx #$01 : jsl _018D5B
    jsl set_hp
    stz $15
    stz.b obj.wolf.is_jumping
    !A16
    lda.w _00ED00+$06 : sta $27
    lda.w #wolf_data_CD2E : sta $13
    !A8
    lda #$FF : sta $26
    lda $07 : sta.b obj.wolf.on_ground
    beq .E2E1

.E2D0:
    jsl _01A559
    bne .E2E1

    brk #$00

;----- E2D8

    clc
    lda.b obj.pos_y+1 : adc #$08 : sta.b obj.pos_y+1
    bra .E2D0

.E2E1:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl _02F9DA_F9E0
.E2ED:
    brk #$00

;----- E2EF

    bit $09
    bvc .E2ED

    jsl get_arthur_relative_side
    sta.b obj.direction
    sta.b obj.facing
.E2FB:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl get_rng_16
    lda.w wolf_data_idle_timer,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w wolf_data_idle_timer_modifier,X ;always adds $00 from $CE15 instead!
    !A16
    and #$00FF
    asl
    sta $2D
    !A8
.E31B:
    brk #$00

;----- E31D

    jsl get_arthur_relative_side
    cmp.b obj.facing
    beq .E341

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$2C : sta $2D
.E331:
    brk #$00

;----- E333

    dec $2D
    bne .E331

    lda.b obj.facing
    eor #$01
    sta.b obj.direction
    sta.b obj.facing
    bra .E2FB

.E341:
    !A16
    lda #$0880
    cmp.b obj.pos_x+1
    !A8
    bcc .E354

    ldy #$14 : jsl _0192AD
    bcc .E370

.E354:
    !A16
    dec $2D
    !A8
    bne .E31B

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$77 : sta $2D
.E368:
    brk #$00

;----- E36A

    dec $2D
    bne .E368
    bra .E2FB

.E370:
    jsl get_rng_16
    lda.w wolf_data_jump_cooldown,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w wolf_data_jump_cooldown_modifier,X ;always adds $01 from $CE29 instead!
    cop #$00

;----- E380

    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0E : sty.b obj.wolf.is_jumping
    stz.b obj.wolf.on_ground
    jsl call_rng
    and #$0F
    cmp #$08
    bcc .E399

    iny
.E399:
    jsl set_speed_xyg
.E39D:
    brk #$00

;----- E39F

    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .E39D

.E3A7:
    brk #$00

;----- E3A9

    jsl update_pos_xyg_add
    jsl _01A559
    beq .E3A7

    lda #$01 : sta.b obj.wolf.on_ground
    stz.b obj.wolf.is_jumping
    ldy #$24 : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- E3C5

    ldy #$1C : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- E3D1

    jmp .E2FB

;-----

destroy:
    lda $0E
    bne .E3DB

    jmp _028BEC
.E3DB:
    jsl _02F9DA_F9E0
    ldy #$22 : ldx #$22 : jsl set_sprite
.E3E7:
    brk #$00

;----- E3E9

    lda.b obj.anim_timer
    cmp #$70
    bne .E3E7

    jmp create_E2ED

;-----

_E3F2:
    lda.b obj.wolf.on_ground
    beq .E3FA

    jsl _01A5AF
.E3FA:
    rts

;-----

thing:
    jsl update_animation_normal
    ldx #$00 : jsl _018E32
    lda.b obj.wolf.is_jumping ;#$00 or #$0E
    bne .E41E

    jsr _E3F2
    lda.w current_cage
    bne .E427

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jsr .E427
    rts

.E41E:
    lda.w current_cage
    bne .E427

    jsl _0296FE

.E427:
    jmp _028074_80A7
}

namespace off