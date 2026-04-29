namespace armor_upgrade_vfx

{
create:
    lda #$10 : ora $09 : sta $09
    ldy #$10 : ldx #$21 : jsl set_sprite
    lda #$16 : sta $2D
    !A16
    lda.w _00ED00+$36 : sta $27
    lda #$0050 : sta $29
    !A8
    lda #$FF : sta $26
.E9B1:
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- E9BB

    dec $2D
    bne .E9B1

    stz $00
    jml object_handling_827A
}

namespace off
