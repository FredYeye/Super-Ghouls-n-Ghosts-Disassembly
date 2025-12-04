namespace ice_bridge_spawner

{
create:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc.b obj.pos_x+1
    bcc .CC70

    !A8
    jmp destroy

.CC70:
    !A8
.CC72:
    brk #$00

;----- CC74

    lda $1FAF
    beq .CC72

.CC79:
    brk #$00

;----- CC7B

    lda $1AEF
    bne .CC79

    lda #$AE : sta $1D
    lda $07
    and #$02
    beq .CC92

    lda #$04 : sta $31 : sta $35 ;half bridge (unused)
    bra .CC98

.CC92:
    lda #$08 : sta $31 : sta $35 ;full bridge
.CC98:
    jsl get_object_slot
    bmi destroy

    !X16
    lda $31 : sec : sbc $35 : sta $000F,X
    lda #!id_ice_bridge_segment : jsl prepare_object_8C37
    lda $1D : clc : adc #$02 : sta $1D
    dec $35
    bne .CC98

    jml _0281A8_81B5

;-----

thing: ;unused
    jsl update_animation_normal
    jsl _02F9B2
    rtl

;-----

destroy: ;unused?
    jml _0281A8_81B5
}

namespace off
