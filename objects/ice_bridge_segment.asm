namespace ice_bridge_segment

{
create:
    lda #$03 : sta $08
    lda $07
    bne .CBDF

    ldy #$B8 : ldx #$21 : jsl set_sprite
    bra .CBE7

.CBDF:
    ldy #$BC : ldx #$21 : jsl set_sprite
.CBE7:
    lda $09 : ora #$80 : sta $09
    lda $07 : asl : tax
    !A16
    lda.w ice_bridge_segment_data_D36D,X : sta $2F
.CBF8:
    brk #$00

;----- CBFA

    lda.w !obj_arthur.pos_x+1
    sec
    sbc $2F
    bcc .CBF8

    !A8
    ldy #$3A : jsl set_speed_xyg
    lda #$10 : cop #$00

;----- CC0E

    lda $0F : asl #2 : inc : cop #$00

;----- CC15

    lda #$43 : jsl _018049_8053
    lda $09 : and #$7F : sta $09
    lda #$16 : sta $35
.CC25:
    brk #$00

;----- CC27

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $35
    bne .CC25

    bra destroy

;-----

thing:
    lda.w jump_counter
    beq .CC3F

    lda.w !obj_arthur.speed_y+2
    bmi .CC5C

.CC3F:
    jsl arthur_overlap_check_FED8_8bit
    bcs .CC5C

    lda #$01 : sta $35
    stz.w !obj_arthur.speed_y+2
    !A16
    lda.b obj.pos_y+1 : sec : sbc #$0018 : sta.w !obj_arthur.pos_y+1
    !A8
    inc $14C3
.CC5C:
    rtl

;-----

destroy:
    jml _0281A8_81B5
}

namespace off
