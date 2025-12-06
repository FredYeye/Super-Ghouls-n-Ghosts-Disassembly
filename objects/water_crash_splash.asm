namespace water_crash_splash

{
create:
    ldy #$74 : ldx #$22 : jsl set_sprite
.923C:
    brk #$00

;----- 923E

    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
    !A8
    jsl update_animation_normal
    bra .923C
}

namespace off
