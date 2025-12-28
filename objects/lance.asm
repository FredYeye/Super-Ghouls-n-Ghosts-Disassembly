namespace lance

{
create:
    lda #!sfx_lance : jsl _018049_8053
    ldy #$3E : ldx #$20 : jsl set_sprite
    stz $2D
    jsr _01DD90 ;bug? incorrect setup to call the depth/layer function
    ldy #$4B : jsl set_speed_x
.E2C4:
    brk #$00

;----- E2C6

    jsl update_pos_x
    jsr _01E224_E26A
    bra .E2C4
}

{
upgraded_create:
    lda #!sfx_lance2 : jsl _018049_8053
    ldy #$40 : ldx #$20 : jsl set_sprite
    ldy #$99 : jsl set_speed_x
    lda #$34 : sta $1D
    stz $2D
    stz $2F
    stz $30
    lda #$01 : sta $2E ;delay until creating fire trail
    jsr _01DD90
.E2F4:
    brk #$00

;----- E2F6

    jsl update_pos_x
    jsr _01E224_E26A
    lda $2E
    bmi .E307

    dec $2E
    bpl .E30A

    bra .E30A

.E307:
    jsr _E311
.E30A:
    jsl update_animation_normal
    jmp .E2F4

;-----

_E311:
    dec $2D
    bpl .E350

    lda #$02 : sta $2D
    jsr get_weapon_slot_local
    bmi .E350

    jsr _01DD90
    lda #$0C : sta.w obj.active,X
    lda #!id_lance2_fire_trail : sta.w obj.type,X
    lda $08 : and #$27 : ora #$90 : sta $0008,X
    lda #$08 : ora $0009,X : sta $0009,X
    lda $12 : sta.w obj.direction,X : sta.w obj.facing,X
    jsl set_spawn_offset
    !AX8
    lda $2F : eor #$01 : sta $2F
.E350:
    rts
}

namespace off
