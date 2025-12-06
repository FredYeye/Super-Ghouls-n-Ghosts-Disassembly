namespace boss_explosion_spawner

{
create:
    ldx.w stage
    lda.w boss_explosion_spawner_data_CB4E,X : sta $2D
    !AX16
    lda.w stage : asl : tax
    lda.w boss_explosion_spawner_data_CB56,X : sta $2F
    lda.w boss_explosion_spawner_data_CB66,X : sta $31
.E212:
    !AX8
    jsl get_object_slot
    bmi .E25D

    lda #!id_boss_explosion : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda.b obj.direction : sta.w obj.direction,X
    lda.b obj.facing : sta.w obj.facing,X
    lda $07 : sta $0007,X
    stz.w obj.speed_x,X
    stz.w obj.speed_y,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    ldy $2F
    lda.w boss_explosion_spawner_data_offset_x,Y : sta.w obj.speed_x+1,X
    inc $2F : inc $2F
    ldy $31
    lda.w boss_explosion_spawner_data_offset_y,Y : sta.w obj.speed_y+1,X
    inc $31 : inc $31
.E25D:
    !AX8
    lda #$08 : cop #$00

;----- E263

    lda #$34 : jsl _018049_8053
    dec $2D
    bne .E212

    jmp _0281A8_81B5

.E270: ;unused?
    brk #$00

;----- E272

    bra .E270

;-----

thing: ;unused?
    rts

;-----

destroy: ;unused?
    jmp _0281A8_81B5
}

namespace off
