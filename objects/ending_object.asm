namespace ending_object

{
create:
    lda $07
    beq .FC54

    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    bra .FC62

.FC54:
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$00 : sta $08
.FC62:
    brk #$00

;----- FC64

    jsl update_animation_normal
    lda $1EC5
if !version == 0
    cmp #$03
elseif !version == 1 || !version == 2
    cmp #$02
endif
    bne .FC62

.FC6F:
    brk #$00

;----- FC71

    jsl update_animation_normal
    !A16
    lda.b obj.pos_x : sec : sbc #$0040 : sta.b obj.pos_x
    !A8
    bra .FC6F

    jml _0281A8_81B5 ;unreachable

    rtl ;unreachable
}

namespace off
