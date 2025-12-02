namespace bracelet_item_sparkle

{
create:
    ldy #$38 : ldx #$20 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    !A16
if !version == 0 || !version == 1
    lda.w _00ED00+$0C : sta $27
    lda #$0100 : sta $29
elseif !version == 2
    lda.w _00ED00+$6A : sta $27
    lda #$011D : sta $29
endif
    !A8
    lda #$FF : sta $26
    lda #$10 : sta $35
.C086:
    brk #$00

;----- C088

    dec $35
    bne .C086

    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

namespace off
