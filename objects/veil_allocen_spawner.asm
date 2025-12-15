namespace veil_allocen_spawner

{
create:
    ldy #$90 : lda.b #_01FF00_5C : ldx #$1C : jsl _01A6FE
.E16A:
    brk #$00

;----- E16C

    lda $00DE
    bne .E16A

.E171:
    brk #$00

;----- E173

    lda.w open_object_slots
    cmp #$06
    bcc .E171

    lda #$03 : jsl _0195B2
    jsl get_object_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_veil_allocen : sta.w obj.type,X
    stx $1EB7
    ldy #$0000 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_veil_allocen_part : sta.w obj.type,X
    stx $1EB9
    ldy #$0004 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_veil_allocen_claw1 : sta.w obj.type,X
    stx $1EBB
    ldy #$0008 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_veil_allocen_claw2 : sta.w obj.type,X
    stx $1EBD
    ldy #$000C : jsr .E1E2
    !AX8
    jml _0281A8_81B5

.E1E2:
    !A16
    lda.w veil_allocen_data_D608+0,Y : sta.w obj.pos_x+1,X
    lda.w veil_allocen_data_D608+2,Y : sta.w obj.pos_y+1,X
    !A8
    rts
}

namespace off
