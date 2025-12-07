namespace bat_spawner

{
create:
    inc.w obj_type_count+!id_bat_spawner
    stz.w bat_count
.EA89:
    brk #$00

;----- EA8B

    lda $07 : asl : tax
    !A16
    lda.w bat_spawner_data_x_pos_threshold,X : sta $31
    lda.w !obj_arthur.pos_x+1
    sbc $31
    bcs .EAB9

    !A8
    ldx $07
    lda.w bat_spawner_data_spawn_limit,X : sta $2F
    lda.w bat_count
    cmp $2F
    bcs .EA89

    lda #!id_bat : jsl prepare_object
if !version == 0 || !version == 1
    lda #$7F : cop #$00
elseif !version == 2
    lda #$C0 : cop #$00
endif

;----- EAB7

    bra .EA89

.EAB9:
    !A8
    jmp _0281A8_81B5

;-----

thing: ;unused?
    rts

;-----

destroy: ;unused?
    jmp _0281A8_81B5
}

namespace off
