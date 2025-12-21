namespace _03A2FC

{
create: ;unused?
    lda $07 : and #$03 : asl : ldy #$06 : ldx #$22 : jsl set_sprite_8480
    lda $07
    and #$04
    beq .A313

    inc.b obj.facing
    bra .A315

.A313:
    stz.b obj.facing
.A315:
    lda $07 : and #$03 : tax
    lda.w _00CF00,X : tay : jsl set_speed_xyg ;todo
    lda #$7F : sta $2D
.A326:
    brk #$00

;----- A328

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $2D
    bne .A326

    jml _0281A8_81B5
}

namespace off
