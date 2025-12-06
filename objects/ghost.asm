namespace ghost

{
create:
    jsl set_hp
    stz $31
    stz $3A
    jsl get_arthur_relative_side : sta.b obj.facing
    asl #3 : sta.b obj.direction
    lda #$10 : sta $08
    ldy #$C4 : ldx #$21 : jsl set_sprite
    jsr _E929
    ldx.w difficulty
    lda.w ghost_data_wait_timer_forming,X : sta $37
.E725:
    brk #$00

;----- E727

    jsr _E919
    jsl update_animation_normal
    dec $37
    bne .E725

    stz $08
    ldy #$C6 : ldx #$21 : jsl set_sprite
    lda.w stage
    dec
    bne .E745 ;skip pot creation if not stage 2

    jsr pot_creation_local
.E745:
    brk #$00

;----- E747

    jsr _E919
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .E745

    jsl _02F9DA_F9E0
    ldx.w difficulty
    lda.w ghost_data_wait_timer_begin,X
    jmp .E838

.E761:
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.direction
    jsl get_arthur_relative_side
    cmp.b obj.facing
    beq .E78D

    inc $31
    ldy #$C0 : ldx #$21 : jsl set_sprite
.E77D:
    brk #$00

;----- E77F

    lda $24
    cmp #$70
    bne .E77D

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    bra .E761

.E78D:
    sta.b obj.facing
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.speed_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.speed_y+1
    !A8
    stz $31
    ldy #$BE : ldx #$21 : jsl set_sprite
    lda #!sfx_ghost_spawn : jsl _018049_8053
    stz $37
.E7AF:
    brk #$00

;----- E7B1

    ldx #$10 : jsl update_pos_xy_2
    jsr .E873
    !X8
    lda $37
    beq .E7AF

    lda #$01 : sta $35
    lda #$3C : sta $37
    lda #$06 : sta $38
    jsl get_rng_bool : tax
    lda.w ghost_data_CD60,X : sta $36
.E7D6:
    brk #$00

;----- E7D8

    ldx #$10 : jsl update_pos_xy_2
    dec $38
    bne .E803

    lda #$06 : sta $38
    inc $35
    lda.b obj.direction
    cmp #$0C
    beq .E803

    lda.b obj.facing
    asl #4
    adc $35
    adc $36
    tax
    lda.w ghost_data_CD62,X
    clc
    adc.b obj.direction
    and #$0F
    sta.b obj.direction
.E803:
    lda $35
    ldx #$12 : jsl _0189D9
    dec $37
    bne .E7D6

    inc $0F
    lda $0F
    cmp #$04
    beq .E861

.E817:
    brk #$00

;----- E819

    ldx #$10 : jsl update_pos_xy_2
    lda $35
    ldx #$12 : jsl _0189D9
    lda $02C3
    and #$03
    bne .E817

    dec $35
    bne .E817

    ldx.w difficulty
    lda.w ghost_data_wait_timer_next,X
.E838:
    sta $37
    lda #$00
    bra .E848

.E83E:
    brk #$00

;----- E840

    dec $38
    bne .E856

    lda $33
    eor #$03
.E848:
    sta $33 ;0 or 3
    clc
    adc #$2A
    tay
    jsl set_speed_y
    lda #$10 : sta $38
.E856:
    jsl update_pos_y
    dec $37
    bne .E83E

    jmp .E761

.E861:
    brk #$00

;----- E863

    ldx #$10 : jsl update_pos_xy_2
    lda $35
    ldx #$12 : jsl _0189D9
    bra .E861

;-----

.E873:
    lda.b obj.direction
    and #$0E
    tax
    !X16
    jmp (+,X) : +: dw .E88D, .E896, .E899, .E8A2, .E8A5, .E8AE, .E8B1, .E8BA

;-----

.E88D:
    ldx.b obj.pos_x+1
    cpx.b obj.speed_x+1
    bcc .E895

    inc $37
.E895:
    rts

;-----

.E896:
    jsr .E88D
.E899:
    ldx.b obj.pos_y+1
    cpx.b obj.speed_y+1
    bcc .E8A1

    inc $37
.E8A1:
    rts

;-----

.E8A2:
    jsr .E899
.E8A5:
    ldx.b obj.pos_x+1
    cpx.b obj.speed_x+1
    bcs .E8AD

    inc $37
.E8AD:
    rts

;-----

.E8AE:
    jsr .E8A5
.E8B1:
    ldx.b obj.pos_y+1
    cpx.b obj.speed_y+1
    bcs .E8B9

    inc $37
.E8B9:
    rts

;-----

.E8BA:
    jsr .E88D
    jmp .E8B1

;-----

destroy:
    ldy #$0F : jsl update_score
.E8C6
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda #!sfx_ghost_destroy : jsl _018049_8053
.E8D4:
    brk #$00

;----- E8D6

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .E8D4

    jsr drop_pot_local
    jmp _0281A8_81B5

;-----

thing:
    bit $09
    bvc .E903

    lda.w stage
    dec
    beq .E8F5

    lda $1AD4
    bne .E909

.E8F5:
    ldy #$82 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsl _0296FE
    rts

.E903:
    jsr _028D09_local
    jmp _0281BB

.E909:
    !A16
    lda #destroy_E8C6 : sta.b obj.state+1
    !A8
    lda $09 : and #$7F : sta $09
.E918:
    rts

;-----

_E919: ;also used by ghost_unformed
    lda.w stage
    dec
    beq ghost_thing_E918

    lda $1AD4
    beq ghost_thing_E918

    pla : pla
    jmp _0281A8_81B5

;-----

_E929: ;also used by ghost_unformed
    !A16
    lda #$0170
    ldx.w stage
    dex
    beq .E937

    lda #$0120
.E937:
    sta $29
    !A8
    rts
}

namespace off
