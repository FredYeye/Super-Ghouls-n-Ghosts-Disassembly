namespace princess

{
create: ;a8 x8
    lda $0292
    bmi .EDEB

    jml _0281A8_81B5

.EDEB:
    lda #$19 : sta $031E
    brk #$00

;----- EDF2

    !AX16
    lda #$0010 : jsl _019136_9153
    brk #$00

;----- EDFD

    ldy #$E2 : ldx #$21 : jsl set_sprite
    ldy #$00 : jsl set_speed_x
    lda #$01 : sta.b obj.facing : sta.b obj.direction
.EE11:
    brk #$00

;----- EE13

    jsl update_pos_x
    jsl update_animation_normal
    bra .EE11
}

namespace off
