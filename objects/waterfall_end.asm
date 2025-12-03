namespace waterfall_end

{
create:
    ldy #$CE : ldx #$21 : jsl set_sprite
.C357:
    brk #$00

;----- C359

    sec : lda $00CE : sbc #$DC : sta.b obj.pos_y+1
    jsl update_animation_normal
    bra .C357
}

namespace off
