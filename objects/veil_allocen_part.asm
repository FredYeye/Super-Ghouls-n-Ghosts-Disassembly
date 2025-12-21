namespace veil_allocen_part

{
create:
    lda #$80 : sta $09
    lda #$01 : sta $08
    ldy #$2A : ldx #$22 : jsl set_sprite
.E500:
    brk #$00

;----- E502

    ldy #$30 : jsl arthur_range_check
    bcs .E500

    lda #$0D : jsl _018049_8053
    brk #$00

;----- E512

    inc $0F
    ldy #$2C : ldx #$22 : jsl set_sprite
    lda #$3F : sta $2D
.E520:
    brk #$00

;----- E522

    jsl update_animation_normal
    dec $2D
    bne .E520

    !A16
    lda #$0140 : sta $29
    lda.w _00ED00+$6E : sta $27
    !A8
    lda #$00 : jsl _018E32_8E81
    inc $1EC7
    jml _0281A8_81B5

;-----

thing:
    lda $0F
    bne .E54D

    jsl _02F9C2
.E54D:
    rtl
}

namespace off
